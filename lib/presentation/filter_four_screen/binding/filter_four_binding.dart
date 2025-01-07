import '../controller/filter_four_controller.dart';
import 'package:get/get.dart';

class FilterFourBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilterFourController());
  }
}
