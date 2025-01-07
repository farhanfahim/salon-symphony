import '../controller/report_one_controller.dart';
import 'package:get/get.dart';

class ReportOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReportOneController());
  }
}
