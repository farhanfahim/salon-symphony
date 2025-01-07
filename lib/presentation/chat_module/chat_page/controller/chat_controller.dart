import '../../../../Shared_prefrences/app_prefrences.dart';
import '/core/app_export.dart';
import 'package:flutter/material.dart';

class ChatController extends GetxController {

  TextEditingController searchFieldController = TextEditingController();
  RxInt? read;
  RxInt? blocked;
  RxInt? groupMessageDelete;
  RxString userId = "".obs;
  AppPreferences appPreferences = AppPreferences();

  @override
  void onReady() {
    super.onReady();
    appPreferences.getUserId().then((userID) {
      userId.value = userID;
    });
  }

  getGroupReadStatus(List<dynamic> readData){

    var value = readData.where((e) => e['id'] == int.parse(userId.value) && e['is_read'] == false);
    if(value.isNotEmpty){
      read = 1.obs;
    }else{
      read = 0.obs;
    }

    print(read);
    return read;
  }

  getBlockedStatus(List<dynamic> blockedData){

    var value = blockedData.where((e) => e['id'] != int.parse(userId.value) && e['is_blocked'] == true);
    if(value.isNotEmpty){
      blocked = 1.obs;
    }else{
      blocked = 0.obs;
    }

    print(blocked);
    return blocked;
  }


  getGroupMessageDeleteStatus(List<dynamic> data){

    var value = data.where((e) => e['id'] == int.parse(userId.value) && e['is_group_message_deleted'] == true);
    if(value.isNotEmpty){
      groupMessageDelete = 1.obs;
    }else{
      groupMessageDelete = 0.obs;
    }

    print(groupMessageDelete);
    return groupMessageDelete;
  }

  @override
  void onClose() {
    super.onClose();
    searchFieldController.dispose();
  }
}
