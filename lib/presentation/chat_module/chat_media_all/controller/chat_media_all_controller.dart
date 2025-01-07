import 'package:flutter/material.dart';
import 'package:salon_symphony/presentation/chat_module/chat_strings.dart';
import '../../chat_media/controller/chat_media_controller.dart';
import '/core/app_export.dart';

class ChatMediaAllController extends GetxController with SingleGetTickerProviderMixin {
  ChatMediaController chatMediaController = Get.put(ChatMediaController());
  Map<String,dynamic> map = Get.arguments;
  TabController? tabController;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    tabController!.addListener(() {
      if(tabController!.index == 0){
        chatMediaController.type.value = ChatStrings.messageTypeDefault;
      }
      if(tabController!.index == 1){
        chatMediaController.type.value = ChatStrings.messageTypeImage;
      }
      if(tabController!.index == 2){
        chatMediaController.type.value = ChatStrings.messageTypeVideo;
      }
      chatMediaController.generateData();
    });
  }

  @override
  void onClose() {
    super.onClose();
  }


}
