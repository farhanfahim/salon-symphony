import '../controller/task_details_controller.dart';
import 'package:get/get.dart';

class TaskDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskDetailsController());
  }
}
