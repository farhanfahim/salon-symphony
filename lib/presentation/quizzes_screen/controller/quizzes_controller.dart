import '../models/quizzes_model.dart';
import '/core/app_export.dart';

class QuizzesController extends GetxController{
   Rx<QuizzesModel> quizzesModelObj = QuizzesModel().obs;



  @override
  void onReady() {
    super.onReady();

  }

  @override
  void onClose() {
    super.onClose();
  }
}
