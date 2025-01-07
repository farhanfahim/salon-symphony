import '../controller/event_details_controller.dart';
import 'package:get/get.dart';

class EventDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventDetailsController());
  }
}
