import 'package:expandable/expandable.dart';
import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/app_constant.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '../../../widgets/animatedButton.dart';
import '../../request_pending_page/models/request_response_model.dart';
import '/core/app_export.dart';

class RequestApprovedController extends GetxController {
  RequestApprovedController();
  ExpandableController expandableController = ExpandableController();
  Rx<RequestResponseModel>? userListResponseModel = RequestResponseModel().obs;
  AppPreferences _appPreferences = AppPreferences();
  final animatedButtonController = AnimatedButtonController();
  RxBool isInternetAvailable = true.obs;
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  RxList<RequestData> arrOfTimeRequest = List<RequestData>.empty().obs;
  RxList<RequestData> arrOfEducationRequest = List<RequestData>.empty().obs;
  RxList<RequestData> arrOfScheduleRequest = List<RequestData>.empty().obs;
  RxList<RequestData> totalRecords = List<RequestData>.empty().obs;

  @override
  void onReady() {
    super.onReady();
    expandableController.toggle();
    getRequest();
  }

  Future <dynamic> getRequest() async{

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
              Constants.userRequest,
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                userListResponseModel!.value = RequestResponseModel.fromJson(response.data);
                //
                // if(userListResponseModel!.value.data!.isEmpty){
                //   apiCallStatus.value = ApiCallStatus.empty;
                // }

                for(var item in userListResponseModel!.value.data!){
                  if(item.type == AppConstant.TIME_OFF_REQUEST){
                    arrOfTimeRequest.add(item);
                    totalRecords.add(item);
                  }else if(item.type == AppConstant.EDUCATION_REQUEST || item.type == AppConstant.EDUCATION_REIMBURSEMENT){
                    arrOfEducationRequest.add(item);
                    totalRecords.add(item);
                  }else if(item.type == AppConstant.SCHEDULE_REQUEST){
                    arrOfScheduleRequest.add(item);
                    totalRecords.add(item);
                  }
                }
                arrOfTimeRequest.refresh();
                arrOfEducationRequest.refresh();
                arrOfScheduleRequest.refresh();
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
                'user_id': userID,
                'status': AppConstant.REQUEST_APPROVED
              }

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
