import '../controller/settings_onboarding_checklist_details_controller.dart';
import 'package:get/get.dart';

class SettingsOnboardingChecklistDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsOnboardingChecklistDetailsController());
  }
}
