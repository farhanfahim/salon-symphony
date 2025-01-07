import 'package:flutter/material.dart';
import 'package:salon_symphony/presentation/notification_screen/models/notificationCount.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/utils.dart';
import '../../notification_all/controller/notification_all_controller.dart';
import '../../notification_unread/controller/notification_unread_controller.dart';
import '/core/app_export.dart';
import 'package:salon_symphony/presentation/notification_screen/models/notification_model.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
class NotificationController extends GetxController with SingleGetTickerProviderMixin {
  Rx<NotificationModel> notificationModelObj = NotificationModel().obs;
  Notification_Unread_controller notification_Unread_controller = Get.put(Notification_Unread_controller());
  Notification_All_Controller notification_All_Controller = Get.put(Notification_All_Controller());


  RxBool markAsRead = false.obs;
  Rx<NotificationCount> notiCountModel = NotificationCount().obs;
  AppPreferences _appPreferences = AppPreferences();
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
 Rx<int> notificationCount = 0.obs;


  TabController? tabController;

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    getNotificationsCount();
  }


  Future<dynamic> getNotificationsCount() async {
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
              Constants.GetUnreadCount,
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                notiCountModel.value = NotificationCount.fromJson(response.data);
                notificationCount.value = notiCountModel.value.data!.unreadCount!;
                print('getNotificationsCount=======>${notificationCount.value}');
                print(notiCountModel.value.data!.unreadCount);
                print(response.data);

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
              }, queryParameters: null
          );
        });


      } else {
        Utils.showToast('Check your internet connection', true);
      }
    });
  }

  Future<dynamic> markAllAsReadApi() async {
    Utils.check().then((value) async {
      if (value) {
        await _appPreferences.isPreferenceReady;

        var salonId;
        _appPreferences.getSalonId().then((value1) {
          salonId = value1;
        });
        var userId;
        _appPreferences.getUserId().then((value1) {
          userId = value1;
        });
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.post(Constants.MarkAllRead,
              onSuccess: (response) async {
                // markAsRead.value = true;
                notification_Unread_controller.pagingController.refresh();
                notification_All_Controller.pagingController.refresh();
                notificationCount.value = 0;
                // notification_All_Controller.notiDataList!.value.forEach((element) {
                //   if(element.readAt == null){
                //     element.localRead!.value = false;
                //   }
                //   else{
                //     element.localRead!.value = true;
                //   }
                // });

              }, onError: (error) {
                print(error);

                BaseClient.handleApiError(error);
                apiCallStatus.value = ApiCallStatus.error;
              }, headers: {
                'Authorization': 'Bearer $value',
                'Accept': 'application/json',
              },
              data: null,
          );
        });
      } else {
        Utils.showToast('No internet connection', true);
      }
    });
  }

  Future<dynamic> clearAllNotifications() async {
    await _appPreferences.isPreferenceReady;

    var userId;
    _appPreferences.getUserId().then((value1) {
      userId = value1;
    });

    Utils.check().then((value) async {
      if (value) {
        // *) perform api call
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.delete(
            Constants.MarkAllClear,
            onSuccess: (response) async {
              print(response.data);
              notification_Unread_controller.pagingController.refresh();
              notification_All_Controller.pagingController.refresh();
              notificationCount.value = 0;
            },
            onError: (error) {
              print(error);
              BaseClient.handleApiError(error);
              apiCallStatus.value = ApiCallStatus.error;
            },
            headers: {
              'Authorization': 'Bearer ${value}',
              'Accept': 'application/json',
            },
          );
        });
      } else {
        Utils.showToast('No internet connection', true);
      }
    });
  }



}
