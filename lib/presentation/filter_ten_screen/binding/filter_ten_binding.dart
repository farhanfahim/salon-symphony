import '../controller/filter_ten_controller.dart';
import 'package:get/get.dart';

class FilterTenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilterTenController());
  }
}
