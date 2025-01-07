import '../controller/sign_up_account_setup_add_photo_controller.dart';
import 'package:get/get.dart';

class SignUpAccountSetupAddPhotoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpAccountSetupAddPhotoController());
  }
}
