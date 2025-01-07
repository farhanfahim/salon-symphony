import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '../models/reward_response_model.dart';
import '/core/app_export.dart';

class RewardsController extends GetxController {


  AppPreferences _appPreferences = AppPreferences();
  Rx<RewardResponseModel>? rewardResponseModel = RewardResponseModel().obs;
  RxList<Badges> badges = List<Badges>.empty().obs;

  RxBool isInternetAvailable = true.obs;
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;

  @override
  void onReady() {
    super.onReady();
    getReward();
  }

  Future<dynamic> getReward() async {
    await _appPreferences.isPreferenceReady;

    Utils.check().then((value) async {
      if (value) {
        apiCallStatus.value = ApiCallStatus.loading;
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.get(Constants.rewards,
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                rewardResponseModel!.value = RewardResponseModel.fromJson(response.data);
                badges.value = rewardResponseModel!.value.data!.badges!;

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
              queryParameters: {
                'is_paginated': 0,
              });
        });
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
