import '../controller/resource_details_controller.dart';
import 'package:get/get.dart';

class ResourceDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResourceDetailsController());
  }
}
