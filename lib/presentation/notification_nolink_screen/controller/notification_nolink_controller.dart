import 'package:flutter/material.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import 'package:salon_symphony/data/services/api_call_status.dart';
import 'package:salon_symphony/data/services/api_exceptions.dart';
import 'package:salon_symphony/data/services/base_client.dart';
import 'package:salon_symphony/presentation/notification_nolink_screen/model/no_link_model.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '/core/app_export.dart';
import 'package:salon_symphony/presentation/notification_screen/models/notification_model.dart';

class NotificationNoLinkController extends GetxController {
  Rx<NoLinkNotification> data = NoLinkNotification().obs;
  Map<String, dynamic> map  = Get.arguments;
  AppPreferences _appPreferences = AppPreferences();
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  // @override
  // void onInit() {
  //   getNotifications();
  // }

  @override
  void onReady() {
    super.onReady();
    getNotifications();

  }
  //
  // @override
  // void onClose() {
  //   super.onClose();
  // }


  Future<dynamic> getNotifications() async {
    await _appPreferences.isPreferenceReady;
    var userId;
    _appPreferences.getUserId().then((value1) {
      userId = value1;
      print('userId====>${userId}');
    });
    var salonId;
    _appPreferences.getSalonId().then((value1) {
      salonId = value1;
      print('salonId====>${salonId}');
    });
    Utils.check().then((value) async {
      if (value) {
        apiCallStatus.value = ApiCallStatus.loading;
        _appPreferences.getAccessToken(prefName: AppPreferences.prefAccessToken).then((value) async {
          await BaseClient.get(
              Constants.NOTIFICATIONS+"/${map['id']}",
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                data.value = NoLinkNotification.fromJson(response.data);
                print('response.data======>  ${data.value}');
                print('tittleeeeeeeeeee======>  ${ data.value.data!.title}');

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
              queryParameters: null
          );
        });
      } else {
        Utils.showToast('Check your internet connection', true);
      }
    });
  }





}
