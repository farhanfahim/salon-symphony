import 'package:salon_symphony/presentation/schedule_requests_change_days_screen/controller/schedule_requests_change_days_controller.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/app_constant.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '../../request_pending_page/controller/request_pending_controller.dart';
import '../../schedule_requests_change_days_screen/models/schedule_requests_change_days_model.dart';
import '/core/app_export.dart';

class ScheduleRequestsChangeShiftsController extends GetxController {

  Rx<ScheduleResponseModel>? scheduleResponseModel = ScheduleResponseModel().obs;
  AppPreferences _appPreferences = AppPreferences();
  RxBool isInternetAvailable = true.obs;
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  RxList<ScheduleData> scheduleData = List<ScheduleData>.empty().obs;
  Rx<String> startTime = ''.obs;
  Rx<String> endTime = ''.obs;

  Rx<String> timeOutAPi = "06:00 PM".obs;
  Rx<String> timeInAPi = "09:00 AM".obs;
  RequestPendingController requestPendingController = Get.put(RequestPendingController());
  ScheduleRequestsChangeDaysController scheduleRequestsChangeDaysController = Get.put(ScheduleRequestsChangeDaysController());
  @override
  void onReady() {
    super.onReady();
    getScheduleList();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<dynamic> getScheduleList() async {
    Utils.check().then((value) async {
      await _appPreferences.isPreferenceReady;
      var userId;
      _appPreferences.getUserId().then((value1) {
        userId = value1;
        print('userId====>${userId}');
      });
      if (value) {
        apiCallStatus.value = ApiCallStatus.loading;
        await _appPreferences.isPreferenceReady;
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.get(Constants.GetUserSchedules,
              onSuccess: (response) {
                scheduleResponseModel!.value =
                    ScheduleResponseModel.fromJson(response.data['data']);
                apiCallStatus.value = ApiCallStatus.success;
                print('response.data ===== > ${response.data}');
                scheduleData.value = scheduleResponseModel!.value.data!;
                scheduleData.value.forEach((element) {
                  element.localAvailability!.value = element.availability!;
                  element.localStartTime!.value = element.startTime!;
                  element.localEndTime!.value = element.endTime!;

                });

                return true;
              }, onError: (error) {
                ApiException apiException = error;

                print(apiException.message);

                BaseClient.handleApiError(error);

                apiCallStatus.value = ApiCallStatus.error;

                return false;
              }, headers: {
                'Accept': 'application/json',
                'Authorization': 'Bearer $value',
              }, queryParameters: {
                'user_id': userId,
              });
        });
      } else {
        Utils.showToast('Check your internet connection', true);
      }
    });
  }

  Future<dynamic> updateDays(
      {required int day,
        required String startTime,
        required String endTime,
        required int dayId}) async {
    await _appPreferences.isPreferenceReady;
    var userId;
    _appPreferences.getUserId().then((value1) {
      userId = value1;
      print('userId====>${userId}');
    });
    var salonID;
    _appPreferences.getSalonId().then((value1) {
      salonID = value1;
      print('userId====>${userId}');
    });
    Utils.check().then((value) async {
      print('INTERNET AVAILABLE $value');
      if (value) {

        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((token) async {
          await BaseClient.put(
              Constants.GetUserSchedules + "/$dayId",
              headers: {
                'Authorization': 'Bearer $token',
                'Accept': 'application/json',
              }, onSuccess: (response) async {
            scheduleRequestsChangeDaysController.getScheduleList();

          }, onError: (error) {
            print(error);
            // show error message to user
            BaseClient.handleApiError(error);

            Utils.showToast(error.toString(), true);
          }, data: {
            "day": day,
            "user_id": userId,
            "salon_id": salonID,
            'start_time': startTime,
            'end_time': endTime,
          });
        });
      } else {
        // isInternetAvailable.value = false;
        Utils.showToast('No internet connection', true);
      }
    });
  }

  void callScheduleRequestApi(int day,startTime,endTime,dayId) async {
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
          await BaseClient.post(Constants.userRequest,
              onSuccess: (response) async {
                if(requestPendingController.arrOfTimeRequest.isNotEmpty) {
                  requestPendingController.arrOfTimeRequest.clear();
                }
                if(requestPendingController.arrOfScheduleRequest.isNotEmpty) {
                  requestPendingController.arrOfScheduleRequest.clear();
                }
                if(requestPendingController.arrOfEducationRequest.isNotEmpty) {
                  requestPendingController.arrOfEducationRequest.clear();
                }
                requestPendingController.getRequest();

                var myListFiltered = scheduleRequestsChangeDaysController.scheduleData.where((e) => e.id == dayId);
                if (myListFiltered.length > 0) {
                  // Do stuff with myListFiltered.first
                  myListFiltered.first.startTime = startTime;
                  myListFiltered.first.endTime =  endTime;
                } else {
                  // Element is not found
                }

                Utils.showToast('Schedule request sent.', false);

              }, onError: (error) {
                print(error);

                BaseClient.handleApiError(error);
                apiCallStatus.value = ApiCallStatus.error;
              }, headers: {
                'Authorization': 'Bearer $value',
                'Accept': 'application/json',
              }, data: {
                'type': AppConstant.SCHEDULE_REQUEST,
                'user_schedule_id': dayId,
                'sub_type': AppConstant.CHANGE_SHIFT,
                'user_id': userId,
                'salon_id': salonId,
                'day': day,
                'start_time': startTime,
                'end_time': endTime,
              });
        });
      } else {
        Utils.showToast('No internet connection', true);
      }
    });
  }
}
