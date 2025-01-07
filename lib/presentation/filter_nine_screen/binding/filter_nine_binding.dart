import '../controller/filter_nine_controller.dart';
import 'package:get/get.dart';

class FilterNineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilterNineController());
  }
}
