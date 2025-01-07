import 'dart:convert';

import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:salon_symphony/Shared_prefrences/app_prefrences.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/core/utils/app_constant.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import 'package:salon_symphony/data/services/api_exceptions.dart';
import 'package:salon_symphony/presentation/survey_details_screen/models/survey_details_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/widgets/animatedButton.dart';

import '../../../core/utils/dummy_content.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/base_client.dart';
import '../models/submit_survey_model.dart';

class SurveyDetailsController extends GetxController {
  RxList<surveyQuestionModel> arrOfQuestion = List<surveyQuestionModel>.empty().obs;
  RxList<quizAnswerModel> arrOfAnswer = List<quizAnswerModel>.empty().obs;
  Rx<SurveySubmitModel> surveyAddAnswersModelObj = SurveySubmitModel().obs;
  RxList<emojiesAnswerModel> arrOfEmojies =
      List<emojiesAnswerModel>.empty().obs;
  List<Rx<TextEditingController>> messageControllers = [];
  // FocusNode? mesasgeNode = FocusNode();
  List<FocusNode?> mesasgeNode = [];
  Rx<SurveyQuestionModel> surveyQuestions = SurveyQuestionModel().obs;
  RxList<SelectedAnswers> selectedAnswersList = <SelectedAnswers>[].obs;
  var map = Get.arguments;
  final animatedButtonController = AnimatedButtonController();
  RxBool isLoaded = false.obs;
  AppPreferences _appPreferences = AppPreferences();
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  Rx<ApiCallStatus> apiCallStatus2 = ApiCallStatus.holding.obs;
 RxList<SurveyQuestionData> yourQuestions = List<SurveyQuestionData>.empty().obs;
  @override
  void onReady() {
    super.onReady();
    getSurveyQuestions();
  }


  void initializeControllers(int numberOfQuestions) {
    messageControllers.clear();
    mesasgeNode.clear();
    for (int i = 0; i < numberOfQuestions; i++) {
      messageControllers.add(TextEditingController().obs);
      mesasgeNode.add(FocusNode());
    }
  }



  Future<dynamic> getSurveyQuestions() async {
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
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.get(
              Constants.SurveyQuestionAnswers + '/${map["id"]}',
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                surveyQuestions.value = SurveyQuestionModel.fromJson(response.data);
                yourQuestions.value = surveyQuestions.value.data!;
                yourQuestions.value.forEach((element) {
                  if(element.type == AppConstant.SHORT_ANSWER){
                    // Initialize controllers when the controller is initialized
                    initializeControllers(yourQuestions.length);
                    print( 'Questions lenth ===> ${yourQuestions.length}' );
                  }
                });
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
              },
              queryParameters: null);
        });
      } else {
        Utils.showToast('Check your internet connection', true);
      }
    });
  }


  Future<dynamic> saveAnswers(var data) async {
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
              Constants.SurveyAnswers+"/${map["id"]}/$userId",
              headers: {
                'Authorization': 'Bearer $token',
                'Accept': 'application/json',
              }, onSuccess: (response) async {
            apiCallStatus2.value=ApiCallStatus.success;
            animatedButtonController.reset();
            surveyAddAnswersModelObj.value = SurveySubmitModel.fromJson(response.data);
            print("heelooo");
            if(surveyAddAnswersModelObj.value.data?.meta!.badge != null){
              print(surveyAddAnswersModelObj.value.data?.meta!.badge);
              Get.toNamed(AppRoutes.surveyCompleteScreen,arguments: {
                "badge":surveyAddAnswersModelObj.value.data?.meta!.badge,
              });
            }else {
              Get.back();
              Get.back();
            }

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



  @override
  void onClose() {
    super.onClose();
  }

  RxBool ansTap = false.obs;


  onTapAnswer(int index1, int index2) {
    int questionId = surveyQuestions.value.data![index1].id!;
    int answerId =
        surveyQuestions.value.data![index1].surveyQuestionOptions![index2].id!;
    bool isSelected = surveyQuestions
        .value.data![index1].surveyQuestionOptions![index2].isSelected!.value;

    // Toggle the isSelected state of the selected option
    surveyQuestions.value.data![index1].surveyQuestionOptions![index2]
        .isSelected!.value = !isSelected;

    // Find the existing entry in selectedAnswersList with the same questionId
    var existingEntry = selectedAnswersList
        .firstWhereOrNull((element) => element.survey_question_id == questionId);

    if (existingEntry != null) {
      // If an entry with the same questionId exists, add or remove the answerId accordingly
      if (isSelected) {
        existingEntry.question_answers.remove(answerId);
        if(existingEntry.question_answers.isEmpty){
          selectedAnswersList.remove(existingEntry);
        }
      } else {
        existingEntry.question_answers.add(answerId);
      }
    } else {
      // If no entry with the same questionId exists, create a new entry
      selectedAnswersList.add(SelectedAnswers(
        survey_question_id: questionId,
        question_answers: [answerId],
        stringAnswers: '',

      ));
    }

    print(selectedAnswersList);
    List<Map<String, dynamic>> jsonList = selectedAnswersList
        .map((selectedAnswer) => selectedAnswer.toJson())
        .toList();
    String jsonString = jsonEncode(jsonList);
    print(jsonString);
    print(selectedAnswersList.length);
  }

  void shortAnwers(String value, int index) {
    int questionId = surveyQuestions.value.data![index].id!;

    // Check if the value is not empty
    if (value.isNotEmpty) {
      // Remove any existing entry for the same question
      selectedAnswersList
          .removeWhere((element) => element.survey_question_id == questionId);

      // Add a new entry for the text input
      selectedAnswersList.add(SelectedAnswers(survey_question_id: questionId, question_answers: [], stringAnswers: value,

      ));
    } else {
      // If the value is empty, remove the entry if it exists
      selectedAnswersList
          .removeWhere((element) => element.survey_question_id == questionId);
    }

    print(selectedAnswersList);
    List<Map<String, dynamic>> jsonList = selectedAnswersList
        .map((selectedAnswer) => selectedAnswer.toJson())
        .toList();
    String jsonString = jsonEncode(jsonList);
    print(jsonString);
  }

  void onTapSingleAnswer(int index, int index2) {
    for (int i = 0;
        i < surveyQuestions.value.data![index].surveyQuestionOptions!.length;
        i++) {
      if (i == index2) {
        if (surveyQuestions.value.data![index].surveyQuestionOptions![index2].isSelected?.value == true) {
          surveyQuestions.value.data![index].surveyQuestionOptions![i].isSelected?.value = false;
          selectedAnswersList.removeWhere((element) => element.survey_question_id == surveyQuestions.value.data![index].id! && element.question_answers.contains(surveyQuestions.value.data![index].surveyQuestionOptions![i].id));
        } else {
          surveyQuestions.value.data![index].surveyQuestionOptions![i].isSelected?.value = true;
          selectedAnswersList.removeWhere((element) => element.survey_question_id ==
              surveyQuestions.value.data![index].id!);
          selectedAnswersList.add(SelectedAnswers(
              survey_question_id: surveyQuestions.value.data![index].id!,
              question_answers: [surveyQuestions.value.data![index].surveyQuestionOptions![i].id],
              stringAnswers: ''));
        }
      } else {
        surveyQuestions.value.data![index].surveyQuestionOptions![i].isSelected
            ?.value = false;
        selectedAnswersList.removeWhere((element) =>
            element.survey_question_id ==
                surveyQuestions.value.data![index].id! &&
            element.question_answers.contains(surveyQuestions
                .value.data![index].surveyQuestionOptions![i].id));
      }
    }

    print(selectedAnswersList);
    List<Map<String, dynamic>> jsonList = selectedAnswersList
        .map((selectedAnswer) => selectedAnswer.toJson())
        .toList();
    String jsonString = jsonEncode(jsonList);
    print(jsonString);
    print(selectedAnswersList.length);
  }

  onTapEmoji(int index, int index2) {
    for (int i = 0;
    i < surveyQuestions.value.data![index].surveyQuestionOptions!.length;
    i++) {
      if (i == index2) {
        if (surveyQuestions.value.data![index].surveyQuestionOptions![index2]
            .isSelected?.value ==
            true) {
          surveyQuestions.value.data![index].surveyQuestionOptions![i]
              .isSelected?.value = false;
          selectedAnswersList.removeWhere((element) =>
          element.survey_question_id ==
              surveyQuestions.value.data![index].id! &&
              element.question_answers.contains(surveyQuestions
                  .value.data![index].surveyQuestionOptions![i].id));
        } else {
          surveyQuestions.value.data![index].surveyQuestionOptions![i]
              .isSelected?.value = true;
          selectedAnswersList.removeWhere((element) =>
          element.survey_question_id ==
              surveyQuestions.value.data![index].id!);
          selectedAnswersList.add(SelectedAnswers(
              survey_question_id: surveyQuestions.value.data![index].id!,
              question_answers: [surveyQuestions.value.data![index].surveyQuestionOptions![i].id],
              stringAnswers:  surveyQuestions.value.data![index].surveyQuestionOptions![i].answer

          ));
        }
      } else {
        surveyQuestions.value.data![index].surveyQuestionOptions![i].isSelected
            ?.value = false;
        selectedAnswersList.removeWhere((element) =>
        element.survey_question_id ==
            surveyQuestions.value.data![index].id! &&
            element.question_answers.contains(surveyQuestions
                .value.data![index].surveyQuestionOptions![i].id));
      }
    }

    print(selectedAnswersList);
    List<Map<String, dynamic>> jsonList = selectedAnswersList
        .map((selectedAnswer) => selectedAnswer.toJson())
        .toList();
    String jsonString = jsonEncode(jsonList);
    print(jsonString);
    print(selectedAnswersList.length);
  }
}

class SelectedAnswers {
  int? survey_question_id;
  String? stringAnswers;
  List<int?> question_answers = [];

  SelectedAnswers({required this.survey_question_id,required this.question_answers,required this.stringAnswers});

  Map<String, dynamic> toJson() {
    return {
      'survey_question_id': survey_question_id,
      'answer': stringAnswers,
      'option_ids': question_answers,
    };
  }
}
