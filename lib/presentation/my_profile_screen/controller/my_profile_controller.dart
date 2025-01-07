import 'dart:convert';

import 'package:salon_symphony/core/utils/utils.dart';
import 'package:salon_symphony/data/models/myProfileResponseModel.dart';
import 'package:salon_symphony/data/services/api_call_status.dart';
import 'package:salon_symphony/data/services/api_exceptions.dart';
import 'package:salon_symphony/data/services/base_client.dart';
import 'package:salon_symphony/presentation/dashboard/controllers/dashboard_controller.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../data/models/addScheduleModel.dart';
import '/core/app_export.dart';
import 'package:salon_symphony/presentation/my_profile_screen/models/my_profile_model.dart';

class MyProfileController extends GetxController {
  Rx<MyProfileModel> myProfileModelObj = MyProfileModel().obs;

  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;

  Rx<MyProfileResponseModel> myProfileResponseModelObj = MyProfileResponseModel().obs;
  DashboardController dashboardController = Get.find();
  AppPreferences _appPreferences = AppPreferences();
  Rx<User> user = User().obs;

  @override
  void onReady() {
    super.onReady();
    _appPreferences.getUserDetail().then((value) async {
      user.value = User.fromJson(jsonDecode(value!));
      print(value);
    });
    myProfileApi();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future <dynamic> myProfileApi() async{

    await _appPreferences.isPreferenceReady;

    var userId;
    _appPreferences.getUserId().then((value1) {
      userId = value1;
    });

    Utils.check().then((value) async {
      if (value) {

        apiCallStatus.value = ApiCallStatus.loading;
        _appPreferences.getAccessToken(prefName: AppPreferences.prefAccessToken).then((value) async {

          await BaseClient.get(
              Constants.users+"/$userId",
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                myProfileResponseModelObj.value = MyProfileResponseModel.fromJson(response.data);
                print("myProfileResponseModelObj.value ${myProfileResponseModelObj.value.data?.name}");
                // _appPreferences.setUserDetails(data: jsonEncode());
                _appPreferences.setUserDetails(data: jsonEncode(myProfileResponseModelObj.value.data));
                dashboardController.getImage();

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
              queryParameters : null

          );
        });

      } else {
        Utils.showToast('No internet connection',true);
      }
    });
  }

}
