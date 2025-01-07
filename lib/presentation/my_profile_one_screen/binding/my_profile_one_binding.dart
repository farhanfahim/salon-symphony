import '../controller/my_profile_one_controller.dart';
import 'package:get/get.dart';

class MyProfileOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyProfileOneController());
  }
}
