import '../controller/settings_onboarding_checklist_controller.dart';
import 'package:get/get.dart';

class SettingsOnboardingChecklistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsOnboardingChecklistController());
  }
}
