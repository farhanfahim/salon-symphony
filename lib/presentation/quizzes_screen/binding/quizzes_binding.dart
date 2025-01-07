import '../controller/quizzes_controller.dart';
import 'package:get/get.dart';

class QuizzesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizzesController());
  }
}
