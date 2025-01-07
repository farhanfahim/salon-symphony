import '../controller/filter_fifteen_controller.dart';
import 'package:get/get.dart';

class FilterFifteenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilterFifteenController());
  }
}
