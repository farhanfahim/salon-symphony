import '../controller/quiz_quiz_perfect_score_controller.dart';
import 'package:get/get.dart';

class QuizQuizPerfectScoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizQuizPerfectScoreController());
  }
}
