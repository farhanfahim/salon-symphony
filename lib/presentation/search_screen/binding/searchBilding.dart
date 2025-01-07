
import 'package:get/get.dart';
import '../controller/search_screen_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchScrenController());
  }
}
