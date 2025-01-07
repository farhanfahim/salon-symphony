import '../controller/rewards_controller.dart';
import 'package:get/get.dart';

class RewardsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RewardsController());
  }
}
