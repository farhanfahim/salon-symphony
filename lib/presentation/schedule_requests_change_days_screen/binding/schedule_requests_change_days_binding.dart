import '../controller/schedule_requests_change_days_controller.dart';
import 'package:get/get.dart';

class ScheduleRequestsChangeDaysBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScheduleRequestsChangeDaysController());
  }
}
