import 'package:get/get.dart';

import '../controller/create_group_chat_controller.dart';

class CreateGroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateGroupChatController());
  }
}
