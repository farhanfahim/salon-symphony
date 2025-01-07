import '../controller/goal_status_controller.dart';
import 'package:get/get.dart';

class GoalStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GoalStatusController());
  }
}
