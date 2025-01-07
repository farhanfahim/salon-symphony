
import 'package:get/get.dart';

import '../controller/task_overDue_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskOverDueController());
  }
}
