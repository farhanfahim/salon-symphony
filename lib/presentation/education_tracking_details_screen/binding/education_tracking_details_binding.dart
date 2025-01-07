import '../controller/education_tracking_details_controller.dart';
import 'package:get/get.dart';

class EducationTrackingDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EducationTrackingDetailsController());
  }
}
