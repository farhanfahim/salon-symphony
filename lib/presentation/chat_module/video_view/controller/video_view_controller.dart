import 'package:get/get.dart';
import '../../chat_strings.dart';

class VideoViewController extends GetxController {

  Map<String, dynamic> map = Get.arguments;

  RxString url = "".obs;
  @override
  void onInit() {
    super.onInit();
    if (map[ChatStrings.videoUrl] != null) {
      url.value = map[ChatStrings.videoUrl];
    }
  }

}


