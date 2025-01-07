import '../controller/more_settings_terms_conditions_controller.dart';
import 'package:get/get.dart';

class MoreSettingsTermsConditionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MoreSettingsTermsConditionsController());
  }
}
