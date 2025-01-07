import '../controller/create_annual_goal_controller.dart';
import 'package:get/get.dart';

class CreateAnnualGoalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateAnnualGoalController());
  }
}
