import '../controller/home_search_controller.dart';
import 'package:get/get.dart';

class HomeSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeSearchController());
  }
}
