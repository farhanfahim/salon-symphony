
import 'package:get/get.dart';

import '../controller/notification_nolink_controller.dart';

class NotificationNoLinkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationNoLinkController());
  }
}
