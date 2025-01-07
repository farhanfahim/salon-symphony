import '../controller/create_weekly_goal_controller.dart';
import 'package:get/get.dart';

class CreateWeeklyGoalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateWeeklyGoalController());
  }
}
