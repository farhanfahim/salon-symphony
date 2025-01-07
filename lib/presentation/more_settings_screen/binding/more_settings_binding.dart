import '../controller/more_settings_controller.dart';
import 'package:get/get.dart';

class MoreSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MoreSettingsController());
  }
}
