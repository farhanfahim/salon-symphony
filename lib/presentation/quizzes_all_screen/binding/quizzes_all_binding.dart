import '../controller/quizzes_all_controller.dart';
import 'package:get/get.dart';

class QuizzesAllBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizzesAllController());
  }
}
