import '../controller/schedule_requests_change_shifts_controller.dart';
import 'package:get/get.dart';

class ScheduleRequestsChangeShiftsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScheduleRequestsChangeShiftsController());
  }
}
