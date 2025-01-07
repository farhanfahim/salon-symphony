import 'package:salon_symphony/core/utils/utils.dart';
import 'package:salon_symphony/data/models/TermsAndConditionResponseModel.dart';
import 'package:salon_symphony/data/services/api_call_status.dart';
import 'package:salon_symphony/data/services/api_exceptions.dart';
import 'package:salon_symphony/data/services/base_client.dart';

import '/core/app_export.dart';
import 'package:salon_symphony/presentation/more_settings_terms_conditions_screen/models/more_settings_terms_conditions_model.dart';

class MoreSettingsTermsConditionsController extends GetxController {
  Rx<MoreSettingsTermsConditionsModel> moreSettingsTermsConditionsModelObj =
      MoreSettingsTermsConditionsModel().obs;
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  Rx<TermsAndConditionResponseModel> termsAndConditionResponseModel = TermsAndConditionResponseModel().obs;
  RxBool isInternetAvailable = true.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
    getPrivacyPolicy();
  }

  @override
  void onClose() {
    super.onClose();
  }



  Future<dynamic> getPrivacyPolicy() async {

    // get call

    Utils.check().then((value) async {
      if (value) {
        isInternetAvailable.value = true;
        apiCallStatus.value = ApiCallStatus.loading;
        var response1 =  await BaseClient.get(
            Constants.PrivacyPolicyApiUrl,
            onSuccess: (response) {
              termsAndConditionResponseModel.value = TermsAndConditionResponseModel.fromJson(response.data);
              print('response.data ===== > ${response.data}');
              apiCallStatus.value = ApiCallStatus.success;
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
              'Accept': 'application/json',
            },
            queryParameters : null

        );
      } else {
        Utils.showToast('Check your internet connection', true);
      }
    });

  }


}
