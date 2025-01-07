import '../controller/create_custom_goal_controller.dart';
import 'package:get/get.dart';

class CreateCustomGoalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateCustomGoalController());
  }
}
