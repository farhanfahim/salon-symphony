import 'package:flutter/material.dart';
import 'package:salon_symphony/core/utils/app_constant.dart';
import 'package:salon_symphony/presentation/chat_module/chatting_view/models/report_response_model.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '../../chat_module/chat_constants.dart';
import '/core/app_export.dart';
import 'package:salon_symphony/presentation/employee_dicrectry_details_screen/models/employee_dicrectry_details_model.dart';

class EmployeeDicrectryDetailsController extends GetxController {
  final ScrollController scrollController = ScrollController();
  RxList<String> arrOfOptions = List<String>.empty().obs;
  AppPreferences _appPreferences = AppPreferences();
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  Rx<TeamUsersModel>? userListResponseModel = TeamUsersModel().obs;
  RxList<ReportData>? arrOfReportList = List<ReportData>.empty().obs;
  Map<String, dynamic> map = Get.arguments;
  RxString screenName = "".obs;
  String? memberId = "";
  RxBool isInternetAvailable = true.obs;
  Rx<ReportResponseModel> reportResponseModel = ReportResponseModel().obs;
  RxBool isloading = false.obs;
  @override
  void onReady() {
    super.onReady();
    arrOfOptions.add("Send Message");
    arrOfOptions.add("Share Profile");
    arrOfOptions.refresh();
    getUsers();
    getReportApi();
  }

  Future<dynamic> getReportApi() async {
    Utils.check().then((value) async {
      if (value) {
        isInternetAvailable.value = true;
        isloading.value = true;
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          print('Tokeeeen ====> $value');
          await BaseClient.get(Constants.constants,
              onSuccess: (response) {
                isloading.value = false;
                reportResponseModel.value =
                    ReportResponseModel.fromJson(response.data['data']);
                arrOfReportList!.value = reportResponseModel.value.data!;

                return true;
              },
              headers: {
                'Authorization': 'Bearer $value',
                'Accept': 'application/json',
              },
              onError: (error) {
                ApiException apiException = error;
                isloading.value = false;
                print(apiException.message);

                BaseClient.handleApiError(error);

                apiCallStatus.value = ApiCallStatus.error;

                return false;
              },
              queryParameters: {
                'is_paginated': 1,
                'type': AppConstant.reportType,
                'is_active': 1,
              });
        });
      } else {
        Utils.showToast('Check your internet connection', true);
      }
    });
  }

  Future <dynamic> getUsers() async{

    await _appPreferences.isPreferenceReady;

    var salonID;
    _appPreferences.getSalonId().then((value1) {
      salonID = value1;
    });

    var userID;
    _appPreferences.getUserId().then((value1) {
      userID = value1;
    });

    Utils.check().then((value) async {
      if (value) {

        apiCallStatus.value = ApiCallStatus.loading;
        _appPreferences.getAccessToken(prefName: AppPreferences.prefAccessToken).then((value) async {

          await BaseClient.get(
              Constants.users + '/' + map['id'].toString(),
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                userListResponseModel!.value = TeamUsersModel.fromJson(response.data);
                screenName.value = userListResponseModel!.value.data!.name!;
                memberId = userListResponseModel!.value.data!.id.toString();
                print(response.data);
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
                'is_paginated': 0,
                'salon_id': salonID,
                'mobile_user_id': userID,
                'order-column': "name",
                'order': "asc",
              }

          );
        });

      } else {
        Utils.showToast('No internet connection',true);
      }
    });
  }

  Future<dynamic> reportUserApi(reason) async {
    var userID;
    _appPreferences.getUserId().then((value1) {
      userID = value1;
    });
    Utils.check().then((value) async {
      if (value) {
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.post(Constants.userReports,
              onSuccess: (response) async {
                Utils.showToast("User Reported", false);
              }, onError: (error) {
                print(error);
                BaseClient.handleApiError(error);
              }, headers: {
                'Authorization': 'Bearer $value',
                'Accept': 'application/json',
              }, data: {
                'report_reason': reason,
                'instance_type': AppConstant.instanceType,
                'instance_id': memberId,
                'user_id': userID,
              });
        });
      } else {
        Utils.showToast(ChatConstants.noInternetConnection, true);
      }
    });
  }



  @override
  void onClose() {
    super.onClose();
  }
}
