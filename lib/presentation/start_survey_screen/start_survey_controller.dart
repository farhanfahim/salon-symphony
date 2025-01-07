import 'package:get/get.dart';
import 'package:salon_symphony/Shared_prefrences/app_prefrences.dart';
import 'package:salon_symphony/core/constants/constants.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import 'package:salon_symphony/data/services/api_call_status.dart';
import 'package:salon_symphony/data/services/api_exceptions.dart';
import 'package:salon_symphony/data/services/base_client.dart';
import 'package:salon_symphony/presentation/start_survey_screen/model/survey_model.dart';

class StartSurveyController extends GetxController{
  Rx<SurveyModel> surveyDetailsModelObj = SurveyModel().obs;
  Rx<SurveyData?> surveyDetails = SurveyData().obs;
  Map<String, dynamic> map = Get.arguments;
  AppPreferences _appPreferences = AppPreferences();
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  @override
  void onReady() {
    super.onReady();
    getSingleSurvey();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<dynamic> getSingleSurvey() async {
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
              Constants.SurveyDetail +'${map['id']}',
              onSuccess: (response) {
                print("api successed");
                surveyDetails.value = SurveyData.fromJson(response.data["data"]);
                apiCallStatus.value = ApiCallStatus.success;
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