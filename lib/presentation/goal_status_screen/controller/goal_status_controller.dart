import '/core/app_export.dart';
import 'package:salon_symphony/presentation/goal_status_screen/models/goal_status_model.dart';

class GoalStatusController extends GetxController {
  Rx<GoalStatusModel> goalStatusModelObj = GoalStatusModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
