import '../controller/filter_one_controller.dart';
import 'package:get/get.dart';

class FilterOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilterOneController());
  }
}
