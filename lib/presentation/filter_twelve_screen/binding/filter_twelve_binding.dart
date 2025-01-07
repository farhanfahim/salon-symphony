import '../controller/filter_twelve_controller.dart';
import 'package:get/get.dart';

class FilterTwelveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilterTwelveController());
  }
}
