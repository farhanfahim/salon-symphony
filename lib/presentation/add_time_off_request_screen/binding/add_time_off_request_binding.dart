import '../controller/add_time_off_request_controller.dart';
import 'package:get/get.dart';

class AddTimeOffRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddTimeOffRequestController());
  }
}
