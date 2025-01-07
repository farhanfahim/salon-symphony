import '../controller/home_events_details_controller.dart';
import 'package:get/get.dart';

class HomeEventsDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeEventsDetailsController());
  }
}
