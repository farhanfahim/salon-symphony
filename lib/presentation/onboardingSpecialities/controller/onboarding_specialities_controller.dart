import 'dart:convert';

import 'package:get/get.dart';
import 'package:salon_symphony/data/models/myProfileResponseModel.dart';
import 'package:salon_symphony/presentation/profile_specialities/model/specialites_response_model.dart';
import 'package:salon_symphony/routes/app_routes.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/constants/constants.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '../../../widgets/animatedButton.dart';
import '../../edit_profile_screen/controller/edit_profile_controller.dart';

class OnboardingSpecialitiesController extends GetxController {
  Rx<SpecialitiesResponseModel> specialitiesResponseModel = SpecialitiesResponseModel().obs;
  RxList<SpecialitiesResponseData>? arrOfSpecialitiesList = List<SpecialitiesResponseData>.empty().obs;
  RxBool isInternetAvailable = true.obs;
  // api call status
  var map = Get.arguments;
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  RxBool isloading = false.obs;
  AppPreferences _appPreferences = AppPreferences();
  RxList<int> selectedInterestId = List<int>.empty().obs;
  final animatedButtonController = AnimatedButtonController();

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


  Future<dynamic> UpdateInt() async {
    // make a get call
    print('map ${map}');
    await _appPreferences.isPreferenceReady;
    var userId;
    _appPreferences.getUserId().then((value1) {
      userId = value1;
    });

    Utils.check().then((value) async {
      if (value) {
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.put(Constants.updateProfile + "/$userId",
              onSuccess: (response) async {
                animatedButtonController.reset();
                MyProfileResponseModel loginResponseModel = MyProfileResponseModel.fromJson(response.data);
                print(
                    '[ PROFILE UPDATE RESPONSE ===> ${loginResponseModel.toJson()}]');

                await _appPreferences.isPreferenceReady;
                _appPreferences.setUserDetails(
                    data: jsonEncode(loginResponseModel.data));
                Get.toNamed(AppRoutes.dashboardRoute);
              }, onError: (error) {
                print(error);
                animatedButtonController.reset();
                BaseClient.handleApiError(error);
                apiCallStatus.value = ApiCallStatus.error;
              }, headers: {
                'Authorization': 'Bearer $value',
                'Accept': 'application/json',
              }, data: {
                'phone': map['phone'],
                'name': map['name'],
                'specialities': selectedInterestId,
              });
        });
      } else {
        Utils.showToast('No internet connection', true);
      }
    });
  }

}
