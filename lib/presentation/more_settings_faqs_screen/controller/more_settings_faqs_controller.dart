import '../models/faq_response_model.dart';
import '/core/app_export.dart';
import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';

class MoreSettingsFaqsController extends GetxController {
  Rx<FaqResponseModel> faqResponseModel = FaqResponseModel().obs;
  RxList<FaqResponseData>? arrOfFaqList = List<FaqResponseData>.empty().obs;
  // api call status
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  RxBool isInternetAvailable = true.obs;
  AppPreferences _appPreferences = AppPreferences();

  @override
  void onReady() {
    super.onReady();
    getFaqApi();
  }

  Future<dynamic> getFaqApi() async {
    Utils.check().then((value) async {
      if (value) {
        isInternetAvailable.value = true;
        apiCallStatus.value = ApiCallStatus.loading;
        _appPreferences.getAccessToken(prefName: AppPreferences.prefAccessToken).then((value) async {
          print('Tokeeeen ====> $value');
          await BaseClient.get(Constants.faqApiUrl,
            onSuccess: (response) {
              apiCallStatus.value = ApiCallStatus.success;
              faqResponseModel.value = FaqResponseModel.fromJson(response.data['data']);
              arrOfFaqList!.value = faqResponseModel.value.data!;

              return true;
            },
            headers: {
              'Authorization':
              'Bearer $value',
              'Accept': 'application/json',
            },
            onError: (error) {
              ApiException apiException = error;
              print(apiException.message);

              BaseClient.handleApiError(error);

              apiCallStatus.value = ApiCallStatus.error;

              return false;
            },
            queryParameters: {
              'is_paginated': 1,
              'is_active': 1,
            });});

      } else {
        Utils.showToast('Check your internet connection', true);
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
