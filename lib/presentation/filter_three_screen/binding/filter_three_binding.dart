import '../controller/filter_three_controller.dart';
import 'package:get/get.dart';

class FilterThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilterThreeController());
  }
}
