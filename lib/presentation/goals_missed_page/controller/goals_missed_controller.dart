import 'package:expandable/expandable.dart';
import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/app_constant.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '../../../widgets/animatedButton.dart';
import '../models/goal_response_model.dart';
import '/core/app_export.dart';

class GoalsMissedController extends GetxController {
  ExpandableController expandableController = ExpandableController();
  Rx<GoalResponseModel>? goalResponseModel = GoalResponseModel().obs;
  AppPreferences _appPreferences = AppPreferences();
  final animatedButtonController = AnimatedButtonController();
  RxBool isInternetAvailable = true.obs;
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  RxList<GoalData> arrOfWeekly = List<GoalData>.empty().obs;
  RxList<GoalData> arrOfMonthly = List<GoalData>.empty().obs;
  RxList<GoalData> arrOfAnnual = List<GoalData>.empty().obs;
  RxList<GoalData> arrOfCustom = List<GoalData>.empty().obs;
  RxList<GoalData> totalRecords = List<GoalData>.empty().obs;

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
              Constants.goals,
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                goalResponseModel!.value = GoalResponseModel.fromJson(response.data);

                for(var item in goalResponseModel!.value.data!){
                  if(item.type == AppConstant.WEEKLY){
                    arrOfWeekly.add(item);
                    totalRecords.add(item);
                  }else if(item.type == AppConstant.MONTHLY){
                    arrOfMonthly.add(item);
                    totalRecords.add(item);
                  }else if(item.type == AppConstant.ANNUALLY){
                    arrOfAnnual.add(item);
                    totalRecords.add(item);
                  }else if(item.type == AppConstant.CUSTOM){
                    arrOfCustom.add(item);
                    totalRecords.add(item);
                  }
                }
                arrOfWeekly.refresh();
                arrOfMonthly.refresh();
                arrOfAnnual.refresh();
                arrOfCustom.refresh();
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
                'user_id': userID,
                'salon_id': salonID,
                'viewed_user_id':userID,
                'viewed_status':AppConstant.MISSED,
                'order-column': 'end_date',
                'order':'asc',
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