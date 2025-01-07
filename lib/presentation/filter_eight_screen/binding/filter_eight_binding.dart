import '../controller/filter_eight_controller.dart';
import 'package:get/get.dart';

class FilterEightBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilterEightController());
  }
}
