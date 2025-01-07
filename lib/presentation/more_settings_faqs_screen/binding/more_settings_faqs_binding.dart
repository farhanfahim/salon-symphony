import '../controller/more_settings_faqs_controller.dart';
import 'package:get/get.dart';

class MoreSettingsFaqsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MoreSettingsFaqsController());
  }
}
