import '../controller/filter_two_controller.dart';
import 'package:get/get.dart';

class FilterTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilterTwoController());
  }
}
