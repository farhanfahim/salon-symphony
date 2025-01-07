import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../notification_screen/models/notification_model.dart';
import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/constants/constants.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '../../notification_screen/models/notification_model.dart';
import '../../notification_screen/models/notification_response_model.dart';

class Notification_Unread_controller extends GetxController {
  Rx<NotificationModel> notificationModelObj = NotificationModel().obs;
  RxBool markAsRead = false.obs;
  AppPreferences _appPreferences = AppPreferences();
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  Rx<Data> notiDataModel = Data().obs;
  RxList<NotificationData>? notiDataList = List<NotificationData>.empty().obs;
  int currentPage = 1;
  int totalPages = 0;
  final PagingController<int, NotificationData> pagingController = PagingController(firstPageKey: 1);


  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      print(pageKey);
      _fetchPage(pageKey);
    });
  }
  Future<void> _fetchPage(int pageKey) async {
    try {
      getNotifications();
    } catch (error) {
      pagingController.error = error;
    }
  }

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
              Constants.NOTIFICATIONS,
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                notiDataModel.value = Data.fromJson(response.data['data']);
                // print('response.data======>  ${response.data}');
                notiDataList!.value = notiDataModel.value.data!;
                totalPages = notiDataModel.value.meta!.lastPage!;
                notiDataList!.value.forEach((element) {

                  if(element.readAt == null){
                    element.localRead!.value = false;
                  }
                  else{
                    element.localRead!.value = true;
                  }
                });
                print('Last Page: $totalPages');
                print('Current Page: $currentPage');

                final isNotLastPage = currentPage + 1 <= totalPages;

                if (!isNotLastPage) {
                  print('Last Page Reached');
                  pagingController.appendLastPage(notiDataList!.value);
                } else {
                  currentPage = currentPage + 1;
                  print('New Current Page: $currentPage');
                  pagingController.appendPage(notiDataList!.value, currentPage);
                }
                // taskList!.value.forEach((element) {
                //   element.data!.forEach((element2) {
                //     element2.userStatus!.localStatus!.value = element2
                //         .userStatus!.status!;
                //   });
                // });
                print(response.data);
                print('notiDataList!.value.length ===========>');
                print(notiDataList!.value.length);
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
              }, queryParameters: {
            'is_paginated': 1,
            'page': currentPage,
            'status': 20,
            'user_id': userId,
          });
        });
      } else {
        Utils.showToast('Check your internet connection', true);
      }
    });
  }

  Future<dynamic> markSingleRead(int id) async {
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
          await BaseClient.post(Constants.MarkSingleRead +'/${id}',
            onSuccess: (response) async {
              pagingController.refresh();
              currentPage = 1;
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

}