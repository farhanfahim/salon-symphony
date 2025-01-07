
import 'package:get/get.dart';

import '../controller/request_dtail_time_off_controller.dart';

class RequestDetailsTimeOffBinding extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut(() => RequestDetailsTimeOffController());
  }
}
