import '../controller/filter_sixteen_controller.dart';
import 'package:get/get.dart';

class FilterSixteenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilterSixteenController());
  }
}
