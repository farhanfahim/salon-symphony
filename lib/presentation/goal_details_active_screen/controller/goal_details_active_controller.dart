
import 'package:confetti/confetti.dart';
import 'package:salon_symphony/core/utils/app_constant.dart';
import '../../../Shared_prefrences/app_prefrences.dart' ;
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '../../../widgets/animatedButton.dart';
import '../../goals_achieved_page/controller/goals_achieved_controller.dart';
import '../../goals_active_page/controller/goals_active_controller.dart';
import '../../goals_missed_page/controller/goals_missed_controller.dart';
import '../../goals_missed_page/models/goal_response_model.dart';
import '/core/app_export.dart';
import 'package:flutter/material.dart';

class GoalDetailsActiveController extends GetxController {
  TextEditingController languageController = TextEditingController();
  RxBool active = true.obs;
  RxBool achived = true.obs;
  RxBool missed = true.obs;
  RxBool showCon = false.obs;
  RxInt selectedId = 0.obs;
  Map<String, dynamic> map = Get.arguments;
  ConfettiController confettiController = ConfettiController();

  Rx<GoalData>? goalData = GoalData().obs;
  AppPreferences _appPreferences = AppPreferences();
  final animatedButtonController = AnimatedButtonController();
  RxBool isInternetAvailable = true.obs;
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  RxList<UpdateStatusModel>? task = List<UpdateStatusModel>.empty().obs;
  GoalsActiveController goalsActiveController = Get.put(GoalsActiveController());
  GoalsAchievedController goalsAchievedController = Get.put(GoalsAchievedController());
  GoalsMissedController goalsMissedController = Get.put(GoalsMissedController());
  var userID;
  Rx<String>? assignee = 'You'.obs;
  @override
  void onReady()  {
    super.onReady();

    task!.refresh();
    getCurrentUserid();
    getGoals();
  }


  getCurrentUserid() async {
    await _appPreferences.isPreferenceReady;
    _appPreferences.getUserId().then((value1) {
      userID = value1;
      print("user id is $userID");
    });
  }

  void updateTaskStatus(status){

    if(selectedId.value != AppConstant.ACHIEVED){
      if(status==AppConstant.ACHIEVED){
        showCon.value=true;
        confettiController.play();
      }
      Future.delayed(const Duration(seconds: 3), () {

        showCon.value = false;
        confettiController.stop();


      });
    }

    task!.forEach((element) {
      if(element.id == status){
        element.selected!.value = true;
        selectedId.value = status;
      }else{
        element.selected!.value = false;
      }
    });
    updateGoalStatus(status);
    task!.refresh();
  }


  Future <dynamic> getGoals() async{

    // await _appPreferences.isPreferenceReady;
    // var userID;
    // _appPreferences.getUserId().then((value1) {
    //   userID = value1;
    // });
    var salonID;
    _appPreferences.getSalonId().then((value1) {
      salonID = value1;
    });
    Utils.check().then((value) async {
      if (value) {

        apiCallStatus.value = ApiCallStatus.loading;
        _appPreferences.getAccessToken(prefName: AppPreferences.prefAccessToken).then((value) async {

          await BaseClient.get(
              Constants.goals+"/${map['requestId']}",
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                goalData!.value = GoalData.fromJson(response.data['data']);
                print('id =====> ${goalData!.value.user!.id}');
                print('type =====> ${goalData!.value.userStatus!.id}');
                if(goalData!.value.userStatus!.status == AppConstant.ACTIVE){
                  task!.add(UpdateStatusModel(id: 10,selected: true.obs),);
                  task!.add(UpdateStatusModel(id: 20,selected: false.obs),);
                  task!.add(UpdateStatusModel(id: 30,selected: false.obs),);
                  selectedId.value = AppConstant.ACTIVE;}
                else if(goalData!.value.userStatus!.status == AppConstant.ACHIEVED){
                  task!.add(UpdateStatusModel(id: 10,selected: false.obs),);
                  task!.add(UpdateStatusModel(id: 20,selected: true.obs),);
                  task!.add(UpdateStatusModel(id: 30,selected: false.obs),);
                  selectedId.value = AppConstant.ACHIEVED;}
                else if(goalData!.value.userStatus!.status == AppConstant.MISSED){
                  task!.add(UpdateStatusModel(id: 10,selected: false.obs),);
                  task!.add(UpdateStatusModel(id: 20,selected: false.obs),);
                  task!.add(UpdateStatusModel(id: 30,selected: true.obs),);
                  selectedId.value = AppConstant.MISSED;
                }else {
                  task!.add(UpdateStatusModel(id: 10,selected: true.obs),);
                  task!.add(UpdateStatusModel(id: 20,selected: false.obs),);
                  task!.add(UpdateStatusModel(id: 30,selected: false.obs),);
                }
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

                'user_id': userID,
                'salon_id': salonID,
              }

          );
        });

      } else {
        Utils.showToast('No internet connection',true);
      }
    });
  }

  Future <dynamic> cancelGoals() async{

    await _appPreferences.isPreferenceReady;

    Utils.check().then((value) async {
      if (value) {

        apiCallStatus.value = ApiCallStatus.loading;
        _appPreferences.getAccessToken(prefName: AppPreferences.prefAccessToken).then((value) async {

          await BaseClient.delete(
              Constants.goals+"/${map['requestId']}",
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;

                refreshAllScreens();

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

  Future<dynamic> updateGoalStatus(int status) async {
    await _appPreferences.isPreferenceReady;
    var userID;
    _appPreferences.getUserId().then((value1) {
      userID = value1;
    });
    var salonID;
    _appPreferences.getSalonId().then((value1) {
      salonID = value1;
    });
    Utils.check().then((value) async {
      if (value) {
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((token) async {
          await BaseClient.put(
              Constants.userGoals + "/${map['requestId']}",
              headers: {
                'Authorization': 'Bearer $token',
                'Accept': 'application/json',
              }, onSuccess: (response) async {
            refreshAllScreens();

          }, onError: (error) {
            print(error);
            BaseClient.handleApiError(error);
            apiCallStatus.value = ApiCallStatus.error;
            Utils.showToast(error.toString(), true);
          }, data: {

            'user_id': userID,
            'salon_id': salonID,
            'goal_id': map['requestId'],
            'status': status
          });
        });
      } else {
        Utils.showToast('No internet connection', true);
      }
    });
  }

  refreshAllScreens(){
    if(goalsActiveController.arrOfWeekly.isNotEmpty){
      goalsActiveController.arrOfWeekly.clear();
    }
    if(goalsActiveController.arrOfMonthly.isNotEmpty){
      goalsActiveController.arrOfMonthly.clear();
    }
    if(goalsActiveController.arrOfAnnual.isNotEmpty){
      goalsActiveController.arrOfAnnual.clear();
    }
    if(goalsActiveController.arrOfCustom.isNotEmpty){
      goalsActiveController.arrOfCustom.clear();
    }
    if(goalsAchievedController.arrOfWeekly.isNotEmpty){
      goalsAchievedController.arrOfWeekly.clear();
    }
    if(goalsAchievedController.arrOfMonthly.isNotEmpty){
      goalsAchievedController.arrOfMonthly.clear();
    }
    if(goalsAchievedController.arrOfAnnual.isNotEmpty){
      goalsAchievedController.arrOfAnnual.clear();
    }
    if(goalsAchievedController.arrOfCustom.isNotEmpty){
      goalsAchievedController.arrOfCustom.clear();
    }
    if(goalsMissedController.arrOfWeekly.isNotEmpty){
      goalsMissedController.arrOfWeekly.clear();
    }
    if(goalsMissedController.arrOfMonthly.isNotEmpty){
      goalsMissedController.arrOfMonthly.clear();
    }
    if(goalsMissedController.arrOfAnnual.isNotEmpty){
      goalsMissedController.arrOfAnnual.clear();
    }
    if(goalsMissedController.arrOfCustom.isNotEmpty){
      goalsMissedController.arrOfCustom.clear();
    }
    goalsActiveController.getRequest();
    goalsAchievedController.getRequest();
    goalsMissedController.getRequest();
  }


  @override
  void onClose() {
    super.onClose();
  }
}

class UpdateStatusModel {
  int? id;
  RxBool? selected = false.obs;

  UpdateStatusModel({this.id, this.selected});
}
