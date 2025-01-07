import '../controller/chang_shift_timing_controller.dart';
import 'package:get/get.dart';

class ChangShiftTimingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangShiftTimingController());
  }
}
