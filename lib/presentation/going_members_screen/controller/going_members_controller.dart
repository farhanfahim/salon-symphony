import '/core/app_export.dart';
import 'package:salon_symphony/presentation/going_members_screen/models/going_members_model.dart';

class GoingMembersController extends GetxController {
  Rx<GoingMembersModel> goingMembersModelObj = GoingMembersModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
