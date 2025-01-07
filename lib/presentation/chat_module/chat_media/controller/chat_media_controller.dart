import 'package:get/get.dart';
import 'package:salon_symphony/presentation/chat_module/chat_constants.dart';
import '../../../../core/app_export.dart';
import '../../chat_strings.dart';
import '../../chatting_view/controller/chatting_view_controller.dart';
import '../model/group_member_model.dart';

class ChatMediaController extends GetxController {
  RxInt type = 0.obs;
  ChattingViewController chattingViewController = Get.put(ChattingViewController());
  final RxList<ChatMediaModel> chatMediaList = List<ChatMediaModel>.empty().obs;
  @override
  void onReady() {
    super.onReady();
    generateData();

  }

  generateData(){
    if(chatMediaList.isNotEmpty){
      chatMediaList.clear();
    }
    if(type.value == ChatStrings.messageTypeImage){
      for(var item in chattingViewController.chatList){
        if(item.type == ChatStrings.messageTypeImage){
          chatMediaList.add(
            ChatMediaModel(
              thumbnail: item.image,
              media: item.image,
              mediaType: item.type,
            ),
          );
        }
      }

    }else if(type.value == ChatStrings.messageTypeVideo){
      for(var item in chattingViewController.chatList){
        if(item.type == ChatStrings.messageTypeVideo){
          chatMediaList.add(
            ChatMediaModel(
              thumbnail: item.image,
              media: item.video,
              mediaType: item.type,
            ),
          );
        }
      }

    }else if(type.value == ChatStrings.messageTypeDefault){
      for(var item in chattingViewController.chatList){
        if(item.type == ChatStrings.messageTypeImage || item.type == ChatStrings.messageTypeVideo){
          chatMediaList.add(
            ChatMediaModel(
              thumbnail: item.image,
              media: item.type == ChatStrings.messageTypeImage?item.image:item.video,
              mediaType: item.type,
            ),
          );
        }
      }

    }
    chatMediaList.refresh();
    for(var item in chatMediaList){
      print(item.mediaType);
    }

  }

  onTapItem(url,index){
    if (chatMediaList[index].mediaType == ChatStrings.messageTypeImage) {
      Map<String, dynamic> map = {ChatStrings.imageUrl: url};
      Get.toNamed(AppRoutes.imageView,arguments: map);
    } else if (chattingViewController.chatList[index].type == ChatStrings.messageTypeVideo) {
      Map<String, dynamic> map = {ChatStrings.videoUrl: url};
      Get.toNamed(AppRoutes.videoView,arguments: map);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }


}
