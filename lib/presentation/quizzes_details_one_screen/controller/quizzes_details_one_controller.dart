import 'dart:convert';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/dummy_content.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '../../../widgets/animatedButton.dart';
import '../models/quizzes_add_answer_model.dart';
import '../models/quizzes_details_one_model.dart';
import '/core/app_export.dart';


class QuizzesDetailsOneController extends GetxController {
  Rx<QuizQuestionAnswersModel> quizzesDetailsOneModelObj = QuizQuestionAnswersModel().obs;
  Rx<QuizAddAnswersModel> quizAddAnswersModelObj = QuizAddAnswersModel().obs;
  RxList<SelectedAnswers> selectedAnswersList=<SelectedAnswers>[].obs;
 var map=Get.arguments;
  final animatedButtonController = AnimatedButtonController();

  RxBool isLoaded = false.obs;
  AppPreferences _appPreferences = AppPreferences();
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  Rx<ApiCallStatus> apiCallStatus2 = ApiCallStatus.holding.obs;
  late Rx<int> currentQuestion = 0.obs;
  @override
  void onReady() {
    super.onReady();
    getQuizQuestions();
  }
  @override
  void onClose() {
    super.onClose();
  }
  onTapAnswer(int index){}
  onTapNext(){}
  onTapBack(){
    if(currentQuestion>0){
      currentQuestion.value--;
    }
  }
  onLoad(){

  }
  Future<dynamic> getQuizQuestions() async {
    print('map====>${map}');
    await _appPreferences.isPreferenceReady;
    var userId;
    _appPreferences.getUserId().then((value1) {
      userId = value1;
      print('userId====>${userId}');
    });
    var salonId;
    _appPreferences.getSalonId().then((value1) {
      salonId = value1;
      print('salonId====>${salonId}');
    });
    Utils.check().then((value) async {
      if (value) {
        apiCallStatus.value = ApiCallStatus.loading;
        _appPreferences.getAccessToken(prefName: AppPreferences.prefAccessToken).then((value) async {
          await BaseClient.get(
              Constants.QuizQuestionAnswers +'/${map["Quiz_id"]}',
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                quizzesDetailsOneModelObj.value = QuizQuestionAnswersModel.fromJson(response.data);
                return true;
              },
              headers: {
                'Authorization': 'Bearer $value',
                'Accept': 'application/json',
              },
              onError: (error) {
                ApiException apiException = error;
                print(apiException.message);
                BaseClient.handleApiError(error);
                apiCallStatus.value = ApiCallStatus.error;
                return false;
              }, queryParameters: {
            'user_id': userId,
          });
        });
      } else {
        Utils.showToast('Check your internet connection', true);
      }
    });
  }
  Future<dynamic> updateStatus(var data) async {
    await _appPreferences.isPreferenceReady;
    var userId;
    _appPreferences.getUserId().then((value1) {
      userId = value1;
    });

    Utils.check().then((value) async {
      if (value) {
        apiCallStatus2.value = ApiCallStatus.loading;
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((token) async {
          await BaseClient.post(
              Constants.QuizAnswers+"/${map["Quiz_id"]}/$userId",
              headers: {
                'Authorization': 'Bearer $token',
                'Accept': 'application/json',
              }, onSuccess: (response) async {
            apiCallStatus2.value=ApiCallStatus.success;
            animatedButtonController.reset();
            quizAddAnswersModelObj.value=QuizAddAnswersModel.fromJson(response.data);
            print("heelooo");
            print(quizAddAnswersModelObj.value.data?.score);
            Get.toNamed(AppRoutes.quizQuizPerfectScoreScreen,arguments: quizAddAnswersModelObj.value.data?.score);
          }, onError: (error) {
            print(error);
            animatedButtonController.reset();
            // show error message to user
            BaseClient.handleApiError(error);

            Utils.showToast(error.toString(), true);
          }, data: data);
        });
      } else {
        Utils.showToast('No internet connection', true);
      }
    });
  }
  changeAnswerStatus(int index,int index2){

    for (int i = 0; i < quizzesDetailsOneModelObj.value.data![index].questionAnswers!.length; i++) {
      if (i == index2) {
        if (quizzesDetailsOneModelObj.value.data![index].questionAnswers![index2].isSelected?.value == true) {
          quizzesDetailsOneModelObj.value.data![index].questionAnswers![i].isSelected?.value = false;
          selectedAnswersList.removeWhere((element) => element.quiz_question_id == quizzesDetailsOneModelObj.value.data![index].id! && element.question_answers.contains(quizzesDetailsOneModelObj.value.data![index].questionAnswers![i].id));
        } else {
          quizzesDetailsOneModelObj.value.data![index].questionAnswers![i].isSelected?.value = true;
          selectedAnswersList.removeWhere((element) => element.quiz_question_id == quizzesDetailsOneModelObj.value.data![index].id!);
          selectedAnswersList.add(SelectedAnswers(quizzesDetailsOneModelObj.value.data![index].id!, [quizzesDetailsOneModelObj.value.data![index].questionAnswers![i].id]));
        }
      } else {
        quizzesDetailsOneModelObj.value.data![index].questionAnswers![i].isSelected?.value = false;
        selectedAnswersList.removeWhere((element) => element.quiz_question_id == quizzesDetailsOneModelObj.value.data![index].id! && element.question_answers.contains(quizzesDetailsOneModelObj.value.data![index].questionAnswers![i].id));
      }
    }

    print(selectedAnswersList);
    print(jsonEncode(selectedAnswersList));
    List<Map<String, dynamic>> jsonList = selectedAnswersList.map((selectedAnswer) => selectedAnswer.toJson()).toList();
    String jsonString = jsonEncode(jsonList);
    print(jsonString);
    print(selectedAnswersList.length);
  }
}


class SelectedAnswers{
  int? quiz_question_id;
  List<int?> question_answers=[];
  SelectedAnswers(this.quiz_question_id,this.question_answers);

  Map<String, dynamic> toJson() {
    return {
      'quiz_question_id': quiz_question_id,
      'question_answers': question_answers,
    };
  }
}