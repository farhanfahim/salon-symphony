import 'package:salon_symphony/core/utils/utils.dart';
import 'package:salon_symphony/data/models/TermsAndConditionResponseModel.dart';
import 'package:salon_symphony/data/services/api_call_status.dart';
import 'package:salon_symphony/data/services/api_exceptions.dart';
import 'package:salon_symphony/data/services/base_client.dart';

import '/core/app_export.dart';
import 'package:salon_symphony/presentation/more_settings_terms_conditions_one_screen/models/more_settings_terms_conditions_one_model.dart';

class MoreSettingsTermsConditionsOneController extends GetxController {
  Rx<MoreSettingsTermsConditionsOneModel>
      moreSettingsTermsConditionsOneModelObj =
      MoreSettingsTermsConditionsOneModel().obs;


  Rx<TermsAndConditionResponseModel> termsAndConditionResponseModel = TermsAndConditionResponseModel().obs;

  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;

  RxBool isInternetAvailable = true.obs;


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();

    getTerms_And_Condition();
  }

  @override
  void onClose() {
    super.onClose();
  }


  Future<dynamic> getTerms_And_Condition() async {

    // get call

    Utils.check().then((value) async {
      if (value) {
        isInternetAvailable.value = true;
        apiCallStatus.value = ApiCallStatus.loading;
        var response1 =  await BaseClient.get(
            Constants.TermsAndConditionApiUrl,
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
