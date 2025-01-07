import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '../../request_detail_time_off_screen/model/request_detail_time_off_model.dart';
import '../../request_pending_page/models/request_response_model.dart';
import '/core/app_export.dart';

class EducationTrackingDetailsController extends GetxController {
  Map<String, dynamic> map = Get.arguments;
  Rx<RequestDetailsTimeOffModel> requestDetailsTimeOffModelObj =
      RequestDetailsTimeOffModel().obs;
  Rx<RequestData>? requestData = RequestData().obs;
  AppPreferences _appPreferences = AppPreferences();
  RxBool isInternetAvailable = true.obs;
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;

  @override
  void onReady() {
    super.onReady();
    getRequest();
  }

  Future<dynamic> getRequest() async {
    await _appPreferences.isPreferenceReady;

    Utils.check().then((value) async {
      if (value) {
        apiCallStatus.value = ApiCallStatus.loading;
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.get(Constants.userRequest + "/${map['id']}",
              onSuccess: (response) {
            apiCallStatus.value = ApiCallStatus.success;
            requestData!.value = RequestData.fromJson(response.data['data']);
            return true;
          }, onError: (error) {
            ApiException apiException = error;

            print(apiException.message);

            BaseClient.handleApiError(error);

            apiCallStatus.value = ApiCallStatus.error;

            return false;
          }, headers: {
            'Authorization': 'Bearer $value',
            'Accept': 'application/json',
          }, queryParameters: null);
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
}
