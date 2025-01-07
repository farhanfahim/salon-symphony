import '../controller/quizzes_details_controller.dart';
import 'package:get/get.dart';

class QuizzesDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizzesDetailsController());
  }
}
