import '../controller/employee_dicrectry_details_controller.dart';
import 'package:get/get.dart';

class EmployeeDicrectryDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmployeeDicrectryDetailsController());
  }
}
