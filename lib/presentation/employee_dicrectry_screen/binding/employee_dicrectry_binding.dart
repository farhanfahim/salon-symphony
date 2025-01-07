import '../controller/employee_dicrectry_controller.dart';
import 'package:get/get.dart';

class EmployeeDicrectryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmployeeDicrectryController());
  }
}
