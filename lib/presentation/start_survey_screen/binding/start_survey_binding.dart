import 'package:salon_symphony/presentation/start_survey_screen/start_survey_controller.dart';
import 'package:get/get.dart';

class StartSurveyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StartSurveyController());
  }
}
