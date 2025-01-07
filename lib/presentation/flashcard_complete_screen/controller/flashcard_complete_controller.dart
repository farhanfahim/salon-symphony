import 'package:salon_symphony/core/app_export.dart';
import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '../models/result_response_model.dart';

class FlashcardCompleteController extends GetxController {

  Map<String, dynamic> map = Get.arguments;
  AppPreferences _appPreferences = AppPreferences();
  RxBool isInternetAvailable = true.obs;
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  Rx<ResultResponseModel> resultResponseModel = ResultResponseModel().obs;

  @override
  void onReady() {
    super.onReady();
    getFlashCardResult();
  }

  Future <dynamic> getFlashCardResult() async{

    await _appPreferences.isPreferenceReady;

    var userID;
    _appPreferences.getUserId().then((value) {
      userID = value;
    });
    Utils.check().then((value) async {
      if (value) {

        apiCallStatus.value = ApiCallStatus.loading;
        _appPreferences.getAccessToken(prefName: AppPreferences.prefAccessToken).then((value) async {

          await BaseClient.get(
              Constants.flashcardResult+"/${map['id']}",
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                resultResponseModel.value = ResultResponseModel.fromJson(response.data);
                return true;
              },

              onError: (error) {
                ApiException apiException = error;

                print(apiException.message);

                BaseClient.handleApiError(error);

                apiCallStatus.value = ApiCallStatus.error;

                return false;
              },
              headers: {
                'Authorization':
                'Bearer $value',
                'Accept': 'application/json',
              },
              queryParameters : {
                'user_id':userID
              }

          );
        });

      } else {
        Utils.showToast('No internet connection',true);
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
