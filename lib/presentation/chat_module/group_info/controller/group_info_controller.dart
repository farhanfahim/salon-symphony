import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:uuid/uuid.dart';
import '../../../../Shared_prefrences/app_prefrences.dart';
import '../../../../core/app_export.dart';
import '../../../../core/common/media_upload_controller.dart';
import '../../../../core/utils/image_list.dart';
import '../../../../core/utils/picker_type.dart';
import '../../../../core/utils/utils.dart';
import '../../../../data/services/api_call_status.dart';
import '../../chat_constants.dart';
import '../../chat_strings.dart';
import '../../chatting_view/controller/chatting_view_controller.dart';
import '../../firestore_controller.dart';

class GroupInfoController extends GetxController {
  Map<String, dynamic> map = Get.arguments;
  GlobalKey<FormState> formKey = new GlobalKey();
  Rx<TextEditingController> groupNameController = TextEditingController().obs;
  FocusNode groupNameNode = new FocusNode();
  RxString firebaseImage = "".obs;
  Rxn<File> pickedImage = Rxn<File>();
  AppPreferences appPreferences = AppPreferences();
  RxBool isInternetAvailable = true.obs;
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  MediaUploadController mediaUploadController = Get.put(MediaUploadController());
  ChattingViewController chattingViewController = Get.find();
  RxString documentId = "".obs;
  RxString currentUserId = "".obs;
  RxInt adminId = 0.obs;
  RxInt memberCount = 0.obs;
  final List<int> groupMembers = [];
  RxBool isAdmin = false.obs;
  RxBool isUpdating = false.obs;
  final _uuid = const Uuid();
  Rx<String> adminName = "".obs;
  RxList<ImageList> listOfImages = RxList<ImageList>();

  @override
  void onReady() {
    super.onReady();

    if (map[ChatConstants.documentId] != null) {
      documentId.value = map[ChatConstants.documentId];
    }

    getGroupInfo();
    checkIfAdmin();
  }

  void checkIfAdmin() async {
    var userId = await appPreferences.getUserId();
    currentUserId.value = userId;
    var chatDocument = await FirebaseFirestore.instance.collection(ChatStrings.chatsCollectionReference).doc(documentId.value).get();
    adminId.value = chatDocument.get(ChatStrings.adminId);
    if (int.parse(currentUserId.value) == chatDocument.get(ChatStrings.adminId)) {
      print(isAdmin);
      isAdmin.value = true;
    } else {
      print(isAdmin);
      isAdmin.value = false;
    }
  }

  void getGroupInfo() {
    FirebaseFirestore.instance.collection(ChatStrings.chatsCollectionReference).doc(documentId.value).snapshots().listen((snapshot) {
      groupNameController.value.text = snapshot.get(ChatStrings.name);
    });
    FirebaseFirestore.instance.collection(ChatStrings.chatsCollectionReference).doc(documentId.value).snapshots().listen((snapshot) {
      firebaseImage.value = snapshot.get(ChatStrings.image);
    });
  }

  getMembers(chatSnapshot,index){
    return FirebaseFirestore.instance
        .collection(ChatStrings.usersCollectionReference)
        .where(ChatStrings.id,
        isEqualTo: chatSnapshot[index - 1].toString())
        .snapshots();
  }

  onTapAddMember(){
    Map<String, dynamic> map = {
      ChatConstants.selectedMembers: groupMembers,
      ChatConstants.documentId: documentId.value,
      ChatConstants.adminName: adminName.value,
      'myUserId': currentUserId.value,
    };
    Get.toNamed(AppRoutes.addMember,arguments: map);
  }

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


  void uploadMedia(context){
    Utils.hideKeyBoard(context);
    final formState = formKey.currentState;
      if (formState!.validate()) {
        formState.save();
        Utils.check().then((value) async {
          if (value) {
            if(listOfImages.isNotEmpty) {//upload profile image if not empty
              mediaUploadController.s3SignedUrlAPI(
                  filePath: listOfImages[0].image!.path,
                  title: ChatConstants.groupImage,
                  onDone: (url) async {
                    updateGroupDetail(url);
                    Utils.showToast(ChatConstants.groupUpdated, false);
                  });
              // mediaUploadController.s3SignedUrlAPI(
              //     filePath: pickedImage.value!.path,
              //     title: ChatConstants.groupImage,
              //     onDone: (url) async {
              //
              //       //update
              //       updateGroupDetail(url);
              //       firebaseImage.value = "";
              //       pickedImage.value = null;
              //       Utils.showToast(ChatConstants.groupUpdated, false);
              //     });
            }else{
              updateGroupDetail(firebaseImage.value);
              Utils.showToast(ChatConstants.groupUpdated, false);
            }
          } else {
            Utils.showToast(ChatConstants.noInternetConnection, true);
          }
        });
      }
  }

  void updateGroupDetail(imagePath) {

    Utils.check().then((value) async {
      if (value) {

        if(isUpdating.value == false) {
          isUpdating.value = true;
          Map<String, dynamic> map = {};
          map[ChatStrings.image] = imagePath;
          map[ChatStrings.name] = groupNameController.value.text.trim();
          chattingViewController.screenName.value =
              groupNameController.value.text.trim();
          try {
            await FirebaseFirestore.instance.collection(
                ChatStrings.chatsCollectionReference)
                .doc(documentId.value)
                .update(map)
                .then((value) {
              isUpdating.value = false;
              Get.back();
            });
          } catch (e) {
            print(e);
          }
        }
      } else {
        Utils.showToast(ChatConstants.noInternetConnection,true);
      }
    });
  }

  void removeMemberFromGroup(int id,String name) async {


    Utils.check().then((value) async {
      if (value) {

        String myUserId = await appPreferences.getUserId();
        await FirebaseFirestore.instance.collection(ChatStrings.chatsCollectionReference).doc(documentId.value).update({
          ChatStrings.userIds: FieldValue.arrayRemove([id]),
          ChatStrings.deletedStatuses: FieldValue.arrayRemove([{
            ChatStrings.id: id,
            ChatStrings.isDeleted: false,
          }]),
          ChatStrings.updatedAt: FieldValue.serverTimestamp(),
          ChatStrings.lastMessage: "${ChatConstants.adminRemoved} $name",
        });

        await FirebaseFirestore.instance
            .collection(ChatStrings.chatsCollectionReference)
            .doc(documentId.value)
            .collection(ChatStrings.threadsCollectionReference)
            .add({
          ChatStrings.imageUrl: "",
          ChatStrings.videoUrl: "",
          ChatStrings.pdfUrl: "",
          ChatStrings.messageType: ChatStrings.messageTypeMemberAddedLeave,
          ChatStrings.senderId: int.parse(myUserId),
          ChatStrings.text: "${ChatConstants.adminRemoved} $name",
          ChatStrings.createdAt: FieldValue.serverTimestamp(),
          ChatStrings.id: _uuid.v1(),
        });
        print(id);
        print(int.parse(myUserId));

        FirestoreController.instance.updateGroupMessageDeleted(documentId.value);

      } else {
        Utils.showToast(ChatConstants.noInternetConnection, true);
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }


}
