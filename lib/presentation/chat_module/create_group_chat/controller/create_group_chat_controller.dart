import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:salon_symphony/core/utils/image_list.dart';
import 'package:salon_symphony/core/utils/picker_type.dart';
import '../../../../Shared_prefrences/app_prefrences.dart';
import '../../../../core/app_export.dart';
import '../../../../core/common/media_upload_controller.dart';
import '../../../../core/utils/utils.dart';
import '../../../../data/services/api_call_status.dart';
import '../../../../data/services/api_exceptions.dart';
import '../../../../data/services/base_client.dart';
import '../../../coverage_team_list/models/user_list_response_model.dart';
import '../../chat_constants.dart';
import '../../chat_strings.dart';

class CreateGroupChatController extends GetxController {

  GlobalKey<FormState> formKey = new GlobalKey();
  Rx<TextEditingController> groupNameController = TextEditingController().obs;
  FocusNode groupNameNode = new FocusNode();
  TextEditingController searchController = TextEditingController();
  Rxn<File> pickedImage = Rxn<File>();
  Rx<UserListResponseModel>? userListResponseModel = UserListResponseModel().obs;
  AppPreferences _appPreferences = AppPreferences();
  RxBool isInternetAvailable = true.obs;
  RxBool isUserSelected = false.obs;
  RxBool isText = false.obs;
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  RxList<UserData> arrOfUsers = List<UserData>.empty().obs;
  Rx<String> userId = "".obs;
  MediaUploadController mediaUploadController = Get.put(MediaUploadController());
  RxList<ImageList> listOfImages = RxList<ImageList>();
  RxBool creatingGroup = false.obs;

  updateQuizItem(int index) {

    if(arrOfUsers[index].isSelected!.value){
      arrOfUsers[index].isSelected!.value = false;
    }else{
      arrOfUsers[index].isSelected!.value = true;
    }
    arrOfUsers.refresh();
    var isExist = arrOfUsers.where((element) => element.isSelected!.value == true);
    if (isExist.isNotEmpty){
      isUserSelected.value = true;
    } else {
      isUserSelected.value = false;
    }
  }

  Future <dynamic> getUsers() async{

    await _appPreferences.isPreferenceReady;

    var salonID;
    _appPreferences.getSalonId().then((value1) {
      salonID = value1;
    });

    var userID;
    _appPreferences.getUserId().then((value1) {
      userID = value1;
    });

    Utils.check().then((value) async {
      if (value) {

        apiCallStatus.value = ApiCallStatus.loading;
        _appPreferences.getAccessToken(prefName: AppPreferences.prefAccessToken).then((value) async {

          await BaseClient.get(
              Constants.users,
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                userListResponseModel!.value = UserListResponseModel.fromJson(response.data);
                arrOfUsers.value = userListResponseModel!.value.data!;


                if(arrOfUsers.isEmpty){
                  apiCallStatus.value = ApiCallStatus.empty;
                }
                return true;
              },

              onError: (error) {
                ApiException apiException = error;

                print(apiException.message);

                BaseClient.handleApiError(error);

                apiCallStatus.value = ApiCallStatus.error;

                return false;
              },
              headers: {
                'Authorization':
                'Bearer $value',
                'Accept': 'application/json',
              },
              queryParameters : {
                'is_paginated': 0,
                'salon_id': salonID,
                'mobile_user_id': userID,
                'order-column': "name",
                'order': "asc",
              }

          );
        });

      } else {
        Utils.showToast(ChatConstants.noInternetConnection,true);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    getUsers();


    _appPreferences.getUserId().then((value1) {
      userId.value = value1;
    });
  }

  onTapNext() {
    final formState = formKey.currentState;
      if(isUserSelected.value==true){
        if (formState!.validate()) {
          formState.save();
          List<int> listOfSelectedUser = [];
          for (var item in arrOfUsers) {
            if (item.isSelected!.value) {
              listOfSelectedUser.add(int.parse(item.id.toString()));
            }
          }
          if(creatingGroup.value == false){
            uploadMedia(listOfSelectedUser);
          }
        }
      }else{
        Utils.showToast(ChatConstants.SelectAtLeastOneMember, true);
      }
  }


  // Future<dynamic> onTapCamera() async {
  //   // await PermissionManager.askForPermission(Permission.camera);
  //   // await PermissionManager.askForPermission(Permission.storage);
  //   // List<String?>? imageList = [];
  //   // //TODO: Permission - use imageList for using selected images
  //   // await FileManager().showModelSheetForImage(getImages: (value) async {
  //   //   imageList = value;
  //   //   pickedImage.value = File(imageList![0]!);
  //   //   print(pickedImage.value!.path);
  //   // });
  // }

  void onTapCamera(PickerType pickerType, BuildContext context, GalleryMode mode, int count) async {
    var pickedMediaList = await Utils.mediaPicker(
      context: context,
      pickerType: pickerType,
      galleryMode: mode,
      count: count,
    );

    if (pickedMediaList != null && pickedMediaList.isNotEmpty) {
      for (var media in pickedMediaList) {
        if (media.path != null) {
          if (listOfImages.isNotEmpty) {
            listOfImages.clear();
            print(File(media.path!));
            listOfImages.add(ImageList(image: File(media.path!)));
          } else {
            listOfImages.add(ImageList(image: File(media.path!)));
          }

          // controller.mediaCount.value = controller.mediaCount.value - 1;
        }
      }
    }
  }


  void uploadMedia(List<int> userIds){
    Utils.check().then((value) async {
      if (value) {
        if(listOfImages.isNotEmpty) {
          mediaUploadController.s3SignedUrlAPI(
              filePath: listOfImages[0].image!.path,
              title: ChatConstants.groupImage,
              onDone: (url) async {
                _createGroupChat(userIds,url);

              });
        }
        else {
          _createGroupChat(userIds,"");

        }
      } else {
        Utils.showToast(ChatConstants.noInternetConnection, true);
      }
    });
  }

  void _createGroupChat(List<int> userIds,String groupImage) async {
    creatingGroup.value = true;
    ///Adding my user in user ids list
    userIds.add(int.parse(userId.value));

    ///Creating and adding user ids in deletedStatuses list
    List<Map<String, dynamic>> deletedStatuses = [];
    for (var userId in userIds) {
      deletedStatuses.add(
        {
          ChatStrings.id: userId,
          ChatStrings.isDeleted: false,
        },
      );
    }

    ///Creating and adding user ids in readStatuses list
    List<Map<String, dynamic>> readStatuses = [];
    for (var userId in userIds) {
      readStatuses.add(
        {
          ChatStrings.id: userId,
          ChatStrings.isRead: true,
        },
      );
    }

    ///Creating and adding user ids in blockedStatuses list
    List<Map<String, dynamic>> blockedStatuses = [];
    for (var userId in userIds) {
      blockedStatuses.add(
        {
          ChatStrings.id: userId,
          ChatStrings.isBlocked: false,
        },
      );
    }

    ///Creating and adding user ids in groupMessageStatuses list
    List<Map<String, dynamic>> groupMessageDeleteStatuses = [];
    for (var userId in userIds) {
      groupMessageDeleteStatuses.add(
        {
          ChatStrings.id: userId,
          ChatStrings.isGroupMessageDeleted: false,
        },
      );
    }

    ///Creating and adding user ids in deletedMessagesIds list
    List<Map<String, dynamic>> deletedMessagesIds = [];
    for (var userId in userIds) {
      deletedMessagesIds.add(
        {
          ChatStrings.id: userId,
          ChatStrings.deletedMessageId: "",
        },
      );
    }


    print("userIds $userIds");
    print("deletedStatuses $deletedStatuses");
    print("deletedMessagesIds $deletedMessagesIds");

    var groupChatDocumentResult = await FirebaseFirestore.instance.collection(ChatStrings.chatsCollectionReference).add({
      ChatStrings.userIds: userIds,
      ChatStrings.readStatuses: readStatuses,
      ChatStrings.deletedStatuses: deletedStatuses,
      ChatStrings.blockedStatuses: blockedStatuses,
      ChatStrings.deletedMessagesIds: deletedMessagesIds,
      ChatStrings.groupMessageStatuses: groupMessageDeleteStatuses,
      ChatStrings.createdAt: FieldValue.serverTimestamp(),
      ChatStrings.updatedAt: FieldValue.serverTimestamp(),
      ChatStrings.lastMessage: "Group Created",
      ChatStrings.isGroupChat: true,
      ChatStrings.isMobileGroup: true,
      ChatStrings.name: groupNameController.value.text.trim(),
      ChatStrings.unReadCount: 0,
      ChatStrings.image: groupImage,
      ChatStrings.adminId: int.parse(userId.value)
    });

    print("Group chat doc id: ${groupChatDocumentResult.id}");

    var map = <String, dynamic>{};
    map[ChatConstants.fromGroup] = true;
    map[ChatConstants.threadName] = groupNameController.value.text.trim();
    map[ChatConstants.documentId] = groupChatDocumentResult.id;
    map[ChatConstants.fromCreation] = true;
    Get.toNamed(AppRoutes.chattingView,arguments: map);

  }


  @override
  void onClose() {
    super.onClose();
  }


}
