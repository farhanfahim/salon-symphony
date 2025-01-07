import '../controller/more_settings_change_password_controller.dart';
import 'package:get/get.dart';

class MoreSettingsChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MoreSettingsChangePasswordController());
  }
}
