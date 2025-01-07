import '../controller/filter_seven_controller.dart';
import 'package:get/get.dart';

class FilterSevenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilterSevenController());
  }
}
