import '../controller/event_option_controller.dart';
import 'package:get/get.dart';

class EventOptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventOptionController());
  }
}
