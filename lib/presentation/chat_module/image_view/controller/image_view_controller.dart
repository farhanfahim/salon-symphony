import 'package:get/get.dart';
import '../../chat_strings.dart';

class ImageViewController extends GetxController {

  RxString imageUrl = "".obs;
  Map<String, dynamic> map = Get.arguments;

  @override
  void onReady() {
    super.onReady();
    if (map[ChatStrings.imageUrl] != null) {
      imageUrl.value = map[ChatStrings.imageUrl];
    }
  }

}


