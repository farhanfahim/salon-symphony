import '../controller/more_settings_terms_conditions_one_controller.dart';
import 'package:get/get.dart';

class MoreSettingsTermsConditionsOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MoreSettingsTermsConditionsOneController());
  }
}
