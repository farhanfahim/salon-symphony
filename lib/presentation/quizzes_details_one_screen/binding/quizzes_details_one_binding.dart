import '../controller/quizzes_details_one_controller.dart';
import 'package:get/get.dart';

class QuizzesDetailsOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizzesDetailsOneController());
  }
}
