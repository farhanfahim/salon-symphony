import '../controller/going_members_controller.dart';
import 'package:get/get.dart';

class GoingMembersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GoingMembersController());
  }
}
