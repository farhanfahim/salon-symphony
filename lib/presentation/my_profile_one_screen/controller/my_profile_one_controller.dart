import '/core/app_export.dart';
import 'package:salon_symphony/presentation/my_profile_one_screen/models/my_profile_one_model.dart';

class MyProfileOneController extends GetxController {
  Rx<MyProfileOneModel> myProfileOneModelObj = MyProfileOneModel().obs;

  RxBool isSelectedSwitch = false.obs;

  RxBool isSelectedSwitch1 = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
