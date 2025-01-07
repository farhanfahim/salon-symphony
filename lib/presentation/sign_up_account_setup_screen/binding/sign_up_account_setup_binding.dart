import '../controller/sign_up_account_setup_controller.dart';
import 'package:get/get.dart';

class SignUpAccountSetupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpAccountSetupController());
  }
}
