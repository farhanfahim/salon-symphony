import 'package:salon_symphony/core/app_export.dart';

import '../models/quiz_quiz_perfect_score_model.dart';

class QuizQuizPerfectScoreController extends GetxController {
  Rx<QuizQuizPerfectScoreModel> quizQuizPerfectScoreModelObj =
      QuizQuizPerfectScoreModel().obs;

  int? score=Get.arguments;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
