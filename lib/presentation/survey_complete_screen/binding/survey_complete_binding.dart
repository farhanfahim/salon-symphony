import '../controller/survey_complete_controller.dart';
import 'package:get/get.dart';

class SurveyCompleteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SurveyCompleteController());
  }
}
