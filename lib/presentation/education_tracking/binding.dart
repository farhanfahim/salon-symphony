
import 'package:get/get.dart';

import 'controller/education_tracking_controller.dart';

class EducationTrackingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EducationTrackingController());
  }
}
