import 'package:salon_symphony/Shared_prefrences/app_prefrences.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import 'package:salon_symphony/data/models/addScheduleModel.dart';
import 'package:salon_symphony/data/services/api_call_status.dart';
import 'package:salon_symphony/data/services/api_exceptions.dart';
import 'package:salon_symphony/data/services/base_client.dart';
import '../../schedule_requests_change_shifts_screen/models/schedule_requests_change_shifts_model.dart';

class AddScheduleController extends GetxController {
  Rx<ScheduleRequestsChangeShiftsModel> scheduleRequestsChangeShiftsModelObj =
      ScheduleRequestsChangeShiftsModel().obs;

  RxList<int> switchValue = <int>[].obs;
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  RxList<bool> switchValues = <bool>[].obs;
  Rx<bool> enableButton = false.obs;

  void initializeSwitchValues(int itemCount) {
    switchValues.value = List.generate(itemCount, (index) => false);
  }

  void updateSwitchValue(int index, bool value) {
    switchValues[index] = value;
  }

  Rx<String> timeOutAPi = "06:00 PM".obs;
  Rx<String> timeInAPi = "09:00 AM".obs;
  Rx<String> startTime = ''.obs;
  Rx<String> endTime = ''.obs;

  Rx<AddScheduleListModel> addScheduleListModel = AddScheduleListModel().obs;
  AppPreferences _appPreferences = AppPreferences();
  RxList<Data> addScheduleData = List<Data>.empty().obs;

  Future<dynamic> addScheduleList() async {
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
            addScheduleListModel.value =
                AddScheduleListModel.fromJson(response.data['data']);
            apiCallStatus.value = ApiCallStatus.success;
            print('response.data ===== > ${response.data}');
            addScheduleData.value = addScheduleListModel.value.data!;
            addScheduleData.value.forEach((element) {
              element.localAvailability!.value = element.availability!;
              print('element.startTime ===== > ${element.startTime}');
              print('element.endTime ===== > ${element.endTime}');
              startTime.value = element.startTime!;
              endTime.value = element.endTime!;
              if (element.localAvailability!.value == 20) {
                enableButton.value = true;
              } else {
                enableButton.value = false;
              }
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
      {required int index,
      required String startTime,
      required String endTime,
      required int day,
      required int dayId}) async {
    await _appPreferences.isPreferenceReady;
    var userId;
    _appPreferences.getUserId().then((value1) {
      userId = value1;
      print('userId====>${userId}');
    });
    Utils.check().then((value) async {
      print('INTERNET AVAILABLE $value');
      if (value) {
        apiCallStatus.value = ApiCallStatus.loading;
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((token) async {
          await BaseClient.put(Constants.GetUserSchedules + "/$dayId",
              headers: {
                'Authorization': 'Bearer $token',
                'Accept': 'application/json',
              }, onSuccess: (response) async {
            apiCallStatus.value = ApiCallStatus.success;
            if (switchValue.value.length > 0) {
              enableButton.value = true;
            } else {
              enableButton.value = false;
            }
          }, onError: (error) {
            print(error);
            // show error message to user
            BaseClient.handleApiError(error);
            apiCallStatus.value = ApiCallStatus.error;
            Utils.showToast(error.toString(), true);
          }, data: {
            "day": day,
            "start_time": addScheduleData[index].startTime,
            "end_time": addScheduleData[index].endTime,
            "user_id": userId,
            "availability":
                addScheduleData.value[index].localAvailability!.value,
          });
        });
      } else {
        // isInternetAvailable.value = false;
        Utils.showToast('No internet connection', true);
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    addScheduleList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
