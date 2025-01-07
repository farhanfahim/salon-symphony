import '../controller/survey_details_controller.dart';
import 'package:get/get.dart';

class SurveyDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SurveyDetailsController());
  }
}
