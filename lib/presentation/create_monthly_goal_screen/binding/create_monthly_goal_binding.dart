import '../controller/create_monthly_goal_controller.dart';
import 'package:get/get.dart';

class CreateMonthlyGoalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateMonthlyGoalController());
  }
}
