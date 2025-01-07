import '../controller/filter_five_controller.dart';
import 'package:get/get.dart';

class FilterFiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilterFiveController());
  }
}
