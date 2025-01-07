import '../controller/home_empty_container_controller.dart';
import 'package:get/get.dart';

class HomeEmptyContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeEmptyContainerController());
  }
}
