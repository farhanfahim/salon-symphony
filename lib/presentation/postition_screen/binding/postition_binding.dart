import '../controller/postition_controller.dart';
import 'package:get/get.dart';

class PostitionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostitionController());
  }
}
