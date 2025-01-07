import '../controller/add_add_education_tracking_controller.dart';
import 'package:get/get.dart';

class AddAddEducationTrackingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddAddEducationTrackingController());
  }
}
