import 'package:salon_symphony/core/app_export.dart';
import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '../../../widgets/animatedButton.dart';
import '../../request_approved_page/controller/request_approved_controller.dart';
import '../../request_declined_page/controller/request_declined_controller.dart';
import '../../request_pending_page/controller/request_pending_controller.dart';
import '../../request_pending_page/models/request_response_model.dart';
import '../model/request_detail_time_off_model.dart';

class RequestDetailsTimeOffController extends GetxController {
  Map<String, dynamic> map = Get.arguments;

  Rx<RequestDetailsTimeOffModel> requestDetailsTimeOffModelObj = RequestDetailsTimeOffModel().obs;
  Rx<RequestData>? requestData = RequestData().obs;
  AppPreferences _appPreferences = AppPreferences();
  final animatedButtonController = AnimatedButtonController();
  RxBool isInternetAvailable = true.obs;
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  RequestPendingController requestPendingController = Get.put(RequestPendingController());
  RequestApprovedController requestApprovedController = Get.put(RequestApprovedController());
  RequestDeclinedController requestDeclinedController = Get.put(RequestDeclinedController());
  @override
  void onInit() {
    super.onInit();
    getRequest();
  }

  Future <dynamic> getRequest() async{

    await _appPreferences.isPreferenceReady;

    Utils.check().then((value) async {
      if (value) {

        apiCallStatus.value = ApiCallStatus.loading;
        _appPreferences.getAccessToken(prefName: AppPreferences.prefAccessToken).then((value) async {

          await BaseClient.get(
              Constants.userRequest+"/${map['requestId']}",
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                requestData!.value = RequestData.fromJson(response.data['data']);
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
  Future <dynamic> cancelRequest() async{

    await _appPreferences.isPreferenceReady;

    Utils.check().then((value) async {
      if (value) {
        apiCallStatus.value = ApiCallStatus.loading;
        _appPreferences.getAccessToken(prefName: AppPreferences.prefAccessToken).then((value) async {

          await BaseClient.delete(
              Constants.userRequest+"/${map['requestId']}",
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                if(requestPendingController.arrOfTimeRequest.isNotEmpty) {
                  requestPendingController.arrOfTimeRequest.clear();
                }
                if(requestPendingController.arrOfScheduleRequest.isNotEmpty) {
                  requestPendingController.arrOfScheduleRequest.clear();
                }
                if(requestPendingController.arrOfEducationRequest.isNotEmpty) {
                  requestPendingController.arrOfEducationRequest.clear();
                }

                if(requestApprovedController.arrOfTimeRequest.isNotEmpty) {
                  requestApprovedController.arrOfTimeRequest.clear();
                }
                if(requestApprovedController.arrOfScheduleRequest.isNotEmpty) {
                  requestApprovedController.arrOfScheduleRequest.clear();
                }
                if(requestApprovedController.arrOfEducationRequest.isNotEmpty) {
                  requestApprovedController.arrOfEducationRequest.clear();
                }

                if(requestDeclinedController.arrOfTimeRequest.isNotEmpty) {
                  requestDeclinedController.arrOfTimeRequest.clear();
                }
                if(requestDeclinedController.arrOfScheduleRequest.isNotEmpty) {
                  requestDeclinedController.arrOfScheduleRequest.clear();
                }
                if(requestDeclinedController.arrOfEducationRequest.isNotEmpty) {
                  requestDeclinedController.arrOfEducationRequest.clear();
                }
                requestPendingController.getRequest();
                requestApprovedController.getRequest();
                requestDeclinedController.getRequest();
                Get.back();
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

  @override
  void onClose() {
    super.onClose();
  }
}
