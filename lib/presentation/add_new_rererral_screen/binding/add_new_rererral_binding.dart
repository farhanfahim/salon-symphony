import '../controller/add_new_rererral_controller.dart';
import 'package:get/get.dart';

class AddNewRererralBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddNewRererralController());
  }
}
