
import 'package:get/get.dart';

import '../controller/add_schedule_controller.dart';

class AddScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddScheduleController());
  }
}
