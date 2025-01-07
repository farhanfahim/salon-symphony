import 'package:get/get.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/constants/constants.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '../../edit_profile_screen/controller/edit_profile_controller.dart';
import '../model/specialites_response_model.dart';

class ProfileSpecialitiesController extends GetxController {
  Rx<SpecialitiesResponseModel> specialitiesResponseModel = SpecialitiesResponseModel().obs;
  RxList<SpecialitiesResponseData>? arrOfSpecialitiesList = List<SpecialitiesResponseData>.empty().obs;
  RxBool isInternetAvailable = true.obs;
  // api call status
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  RxBool isloading = false.obs;
  AppPreferences _appPreferences = AppPreferences();
  EditProfileController editProfileController = Get.find();
  @override
  void onReady() {
    super.onReady();
    getSpecialitiesApi();
  }

  Future<dynamic> getSpecialitiesApi() async {
    Utils.check().then((value) async {
      if (value) {
        isInternetAvailable.value = true;
        apiCallStatus.value = ApiCallStatus.loading;
        _appPreferences.getAccessToken(prefName: AppPreferences.prefAccessToken).then((value) async {
          print('Tokeeeen ====> $value');
          await BaseClient.get(Constants.specialities,
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                specialitiesResponseModel.value = SpecialitiesResponseModel.fromJson(response.data);
                arrOfSpecialitiesList!.value = specialitiesResponseModel.value.data!;

                for(var item1 in arrOfSpecialitiesList!){
                  for(var item2 in editProfileController.selectedInterest){
                    print("matching ids");
                    print(item2);
                    if(item1.name == item2){

                      item1.selected!.value = true;
                    }
                  }
                }
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
                'is_paginated':0
              });});

      } else {
        Utils.showToast('Check your internet connection', true);
      }
    });
  }

}
