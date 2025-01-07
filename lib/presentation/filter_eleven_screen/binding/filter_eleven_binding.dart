import '../controller/filter_eleven_controller.dart';
import 'package:get/get.dart';

class FilterElevenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilterElevenController());
  }
}
