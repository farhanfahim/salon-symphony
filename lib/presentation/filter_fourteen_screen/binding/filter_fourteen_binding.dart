import '../controller/filter_fourteen_controller.dart';
import 'package:get/get.dart';

class FilterFourteenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilterFourteenController());
  }
}
