import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_symphony/presentation/chat_module/chat_strings.dart';
import 'package:salon_symphony/presentation/chat_module/firestore_controller.dart';
import 'package:salon_symphony/presentation/coverage_team_list/models/user_list_response_model.dart';
import 'package:uuid/uuid.dart';
import '../../../../Shared_prefrences/app_prefrences.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/utils.dart';
import '../../../../data/services/api_call_status.dart';
import '../../../../data/services/api_exceptions.dart';
import '../../../../data/services/base_client.dart';
import '../../../../widgets/animatedButton.dart';
import '../../chat_constants.dart';
import '../../chatting_view/models/chat_detail.dart';

class AddMemberController extends GetxController {
  Map<String,dynamic> map = Get.arguments;
  TextEditingController searchController = TextEditingController();

  RxBool isAdding = false.obs;
  Rx<UserListResponseModel>? userListResponseModel = UserListResponseModel().obs;
  AppPreferences _appPreferences = AppPreferences();
  final animatedButtonController = AnimatedButtonController();
  RxBool isInternetAvailable = true.obs;
  RxBool isAllMembersSelected = false.obs;
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  RxList<UserData> arrOfUsers = List<UserData>.empty().obs;
  RxList<UserData> oldUsers = List<UserData>.empty().obs;
  RxList<UserData> arrOfTempUsers = List<UserData>.empty().obs;

  final _uuid = const Uuid();

  final List<int> oldMember = [];
  RxList<int> newMember = List<int>.empty().obs;

  RxString documentId = "".obs;

  updateQuizItem(int index) {

    if(arrOfUsers[index].isSelected!.value){
      arrOfUsers[index].isSelected!.value = false;
    }else{
      arrOfUsers[index].isSelected!.value = true;
    }

    arrOfUsers.refresh();
    if(newMember.isNotEmpty) {
      newMember.clear();
    }
    for(var item in arrOfUsers){
      if(item.isSelected!.value) {
        newMember.add(item.id!);
      }
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


                  for (var id in oldMember) {
                    arrOfUsers.removeWhere((item) => item.id == id);
                  }

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

  void addMemberToGroup(List<int> selectedMembers) {
    Utils.check().then((value) async {
      if (value) {

        isAdding.value = true;

        String myUserId = await _appPreferences.getUserId();

        ///Creating and adding user ids in deletedStatuses list
        List<Map<String, dynamic>> deletedStatuses = [];
        for (var userId in selectedMembers) {
          deletedStatuses.add(
            {
              ChatStrings.id: userId,
              ChatStrings.isDeleted: false,
            },
          );
        }

        ///Creating and adding user ids in deletedMessagesIds list
        List<Map<String, dynamic>> deletedMessagesIds = [];
        for (var userId in selectedMembers) {
          deletedMessagesIds.add(
            {
              ChatStrings.id: userId,
              ChatStrings.deletedMessageId: "",
            },
          );
        }

        ///Creating and adding user ids in readStatuses list
        List<Map<String, dynamic>> readStatuses = [];
        for (var userId in selectedMembers) {
          readStatuses.add(
            {
              ChatStrings.id: userId,
              ChatStrings.isRead: true,
            },
          );
        }

        ///Creating and adding user ids in blockedStatuses list
        List<Map<String, dynamic>> blockedStatuses = [];
        for (var userId in selectedMembers) {
          blockedStatuses.add(
            {
              ChatStrings.id: userId,
              ChatStrings.isBlocked: false,
            },
          );
        }

        ///Creating and adding user ids in groupMessageStatuses list
        List<Map<String, dynamic>> groupMessageStatuses = [];
        for (var userId in selectedMembers) {
          groupMessageStatuses.add(
            {
              ChatStrings.id: userId,
              ChatStrings.isGroupMessageDeleted: false,
            },
          );
        }

        await FirebaseFirestore.instance.collection(ChatStrings.chatsCollectionReference).doc(documentId.value).update({
          ChatStrings.userIds: FieldValue.arrayUnion(selectedMembers),
          ChatStrings.deletedStatuses: FieldValue.arrayUnion(deletedStatuses),
          ChatStrings.deletedMessagesIds: FieldValue.arrayUnion(deletedMessagesIds),
          ChatStrings.readStatuses: FieldValue.arrayUnion(readStatuses),
          ChatStrings.blockedStatuses: FieldValue.arrayUnion(blockedStatuses),
          ChatStrings.groupMessageStatuses: FieldValue.arrayUnion(groupMessageStatuses),
          ChatStrings.updatedAt: FieldValue.serverTimestamp(),
          ChatStrings.lastMessage: map[ChatConstants.adminName] + ' added member to the group chat',
        }).then((value) async {
          await FirebaseFirestore.instance.collection(ChatStrings.chatsCollectionReference).doc(documentId.value).collection(ChatStrings.threadsCollectionReference).add({
            ChatStrings.imageUrl: "",
            ChatStrings.videoUrl: "",
            ChatStrings.pdfUrl: "",
            ChatStrings.messageType: ChatStrings.messageTypeMemberAddedLeave,
            ChatStrings.senderId: int.parse(myUserId),
            ChatStrings.text:
            selectedMembers.length == 1 ? "${selectedMembers.length} ${ChatConstants.memberAddedToTheGroup}"
                : "${selectedMembers.length} ${ChatConstants.membersAddedToTheGroup}",
            ChatStrings.createdAt: FieldValue.serverTimestamp(),
            ChatStrings.id: _uuid.v1(),
          }).then((value) => {
            isAdding.value = false,
          });
        });
        FirestoreController.instance.updateGroupMessageDeleted(documentId.value);

        Get.back();
      } else {
        Utils.showToast(ChatConstants.noInternetConnection, true);
      }
    });
  }



  @override
  void onReady() {
    super.onReady();

    if (map[ChatConstants.selectedMembers] != null) {
      oldMember.addAll(map[ChatConstants.selectedMembers]);
    }

    if (map[ChatConstants.documentId] != null) {
      documentId.value = map[ChatConstants.documentId];
    }

    getUsers();
  }


}


