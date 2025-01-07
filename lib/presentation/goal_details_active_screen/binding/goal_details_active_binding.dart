import '../controller/goal_details_active_controller.dart';
import 'package:get/get.dart';

class GoalDetailsActiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GoalDetailsActiveController());
  }
}
