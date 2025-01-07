import 'package:get/get.dart';
import 'package:salon_symphony/presentation/home_events_all_page/controller/home_events_all_controller.dart';
import 'package:salon_symphony/presentation/home_events_all_page/models/home_events_all_model.dart';

class HomeEventsAllBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeEventsAllController());
  }
}
