import '../controller/filter_thirteen_controller.dart';
import 'package:get/get.dart';

class FilterThirteenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilterThirteenController());
  }
}
