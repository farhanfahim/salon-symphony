import '../controller/filter_six_controller.dart';
import 'package:get/get.dart';

class FilterSixBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilterSixController());
  }
}
