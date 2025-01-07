import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/utils.dart';
import '../../../data/models/getQuizListModel.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '/core/app_export.dart';
import 'package:salon_symphony/presentation/quizzes_details_screen/models/quizzes_details_model.dart';

class QuizzesDetailsController extends GetxController {
  Rx<QuizzesDetailsModel> quizzesDetailsModelObj = QuizzesDetailsModel().obs;
   Rx<QuizData?> quizDetails=QuizData().obs;
  var map = Get.arguments;
  AppPreferences _appPreferences = AppPreferences();
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  @override
  void onReady() {
    super.onReady();
    getSingleQuiz();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onTapNext(int id){
    Get.toNamed(AppRoutes.quizzesDetailsOneScreen,arguments: {
      "Quiz_id":id,

    });
  }
  Future<dynamic> getSingleQuiz() async {
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
              Constants.Quizzes +'/${map['id']}',
              onSuccess: (response) {
               quizDetails.value = QuizData.fromJson(response.data["data"]);
                apiCallStatus.value = ApiCallStatus.success;
               print(quizDetails.value?.meta?.questionsCount);
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
}
