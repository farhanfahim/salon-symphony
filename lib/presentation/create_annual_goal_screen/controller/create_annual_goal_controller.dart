import 'package:intl/intl.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/app_constant.dart';
import '../../../core/utils/dummy_content.dart';
import '../../../core/utils/helper_functions.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/base_client.dart';
import '../../../widgets/animatedButton.dart';
import '../../../widgets/custom_dialog_toast_message.dart';
import '../../../widgets/custom_text.dart';
import '../../goal_details_active_screen/controller/goal_details_active_controller.dart';
import '../../goals_active_page/controller/goals_active_controller.dart';
import '/core/app_export.dart';
import 'package:flutter/material.dart';

class CreateAnnualGoalController extends GetxController
    with SingleGetTickerProviderMixin {
  Rx<TextEditingController>? measureController = TextEditingController().obs;
  Rx<TextEditingController>? weeklyForeverController =
      TextEditingController().obs;
  Rx<TextEditingController>? amountController = TextEditingController().obs;
  Rx<TextEditingController>? weeklyGoalsTitleController =
      TextEditingController().obs;
  Rx<TextEditingController>? weeklyDesController = TextEditingController().obs;
  Rx<TextEditingController> dollarControllerMonthly =
      TextEditingController().obs;

  RxList<DaysModel> arrOfOptions = DummyContent.days.obs;
  RxList<ForeverModel> arrOfOptions2 = DummyContent.forever.obs;
  RxList<AmountModel> bottomSheetOptions = DummyContent.amount.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool formSubmitted = false;

  FocusNode? weeklyGoalNode = FocusNode();
  FocusNode? dayNode = FocusNode();
  FocusNode? weeklyRepeatNode = FocusNode();
  FocusNode? weeklyAmountNode = FocusNode();
  FocusNode? weeklyDesNode = FocusNode();

  RxString startDate = "".obs;
  RxString endDate = "".obs;
  Rx<int>? selectedDayId = 0.obs;
  Rx<int>? selectedRepeatGoalId = 0.obs;
  Rx<int>? selectedTargetTypeId = 0.obs;
  Rx<String>? symbol = "".obs;
  AppPreferences _appPreferences = AppPreferences();
  final animatedButtonController = AnimatedButtonController();
  RxBool isInternetAvailable = true.obs;
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  GoalsActiveController controller = Get.put(GoalsActiveController());
  late GoalDetailsActiveController controller2;
  RxBool showLogo = false.obs;
  RxInt itemNumber = 0.obs;
  Map<String, dynamic> map = Get.arguments;
  final DateTime currentDate = DateTime.now();

  @override
  void onReady() {
    super.onReady();

    if(map["isEditingGoal"]==true){
      print("salman is working here");
      prePopulateData();
    }else{
      final DateTime currentDate = DateTime.now();
      measureController!.value.text = "Goal ends on Dec 31, ${currentDate.year}";
      weeklyForeverController!.value.text = "Annual goals do not repeat";
      startDate.value = DateFormat('yyyy-MM-dd').format(DateTime.now().add(Duration(days: 1)));
      final DateTime nextMonth = getNextMonth(currentDate);
      endDate.value = DateFormat('yyyy-MM-dd').format(DateTime(
          currentDate.year, 12, getDaysInMonth(nextMonth.year, nextMonth.month)));
    }

  }

  prePopulateData(){
    controller2 = Get.find<GoalDetailsActiveController>();
    if(controller2.goalData!.value.id!=null){

      weeklyGoalsTitleController?.value.text = controller2.goalData!.value.name!;
      weeklyDesController?.value.text = controller2.goalData!.value.description!;

      weeklyForeverController?.value.text = controller2.goalData!.value.durationName!;

      for(int i=0;i<bottomSheetOptions.length;i++){
        if(bottomSheetOptions[i].id==controller2.goalData!.value.targetType){
          amountController?.value.text = bottomSheetOptions[i].name!;
          showLogo.value = true;
          updateItemBottomsSheet(i);
        }
      }

      for(int i=0;i<arrOfOptions2.length;i++){
        if(arrOfOptions2[i].id==controller2.goalData!.value.duration){
          weeklyForeverController?.value.text = arrOfOptions2[i].name!;
          updateItem2(i);
        }
      }
      if (controller2.goalData!.value.targetValue!.contains("%") ||
          controller2.goalData!.value.targetValue!.contains("\$") ||
          controller2.goalData!.value.targetValue!.contains("#")) {
        String modifiedValue = controller2.goalData!.value.targetValue!
            .replaceAll("%", "")
            .replaceAll("\$", "")
            .replaceAll("#", "");
        dollarControllerMonthly.value.text = modifiedValue;
      }else{
        dollarControllerMonthly.value.text=controller2.goalData!.value.targetValue!;
      }
      final DateTime currentDate = DateTime.now();
      measureController!.value.text = "Goal ends on Dec 31, ${currentDate.year}";
      weeklyForeverController!.value.text = "Annual goals do not repeat";
      startDate.value = DateFormat('yyyy-MM-dd').format(DateTime.now());
      final DateTime nextMonth = getNextMonth(currentDate);
      endDate.value = DateFormat('yyyy-MM-dd').format(DateTime(
          currentDate.year, 12, getDaysInMonth(nextMonth.year, nextMonth.month)));

    }

  }

  updateItem(int index) {
    for (var item in arrOfOptions) {
      item.selected = false.obs;
    }
    arrOfOptions[index].selected = true.obs;
    arrOfOptions.refresh();
    selectedDayId!.value = arrOfOptions[index].id!;
  }

  updateItem2(int index) {
    for (var item in arrOfOptions2) {
      item.selected = false.obs;
    }
    arrOfOptions2[index].selected = true.obs;
    arrOfOptions2.refresh();
    selectedRepeatGoalId!.value = arrOfOptions2[index].id!;
  }

  updateItemBottomsSheet(int index) {
    for (var item in bottomSheetOptions) {
      item.selected = false.obs;
    }
    bottomSheetOptions[index].selected = true.obs;
    itemNumber.value = index;
    print(itemNumber);
    bottomSheetOptions.refresh();
    selectedTargetTypeId!.value = bottomSheetOptions[index].id!;
    if (bottomSheetOptions[index].id == AppConstant.DOLLAR) {
      symbol!.value = "\$";
    } else if (bottomSheetOptions[index].id == AppConstant.PERCENTAGE) {
      symbol!.value = "\%";
    } else {
      symbol!.value = "\#";
    }
  }

  void saveInfo(context) {
    final formState = formKey.currentState;
    if (formState!.validate()) {
      formState.save();
      if(map["isEditingGoal"]==true){
        callEditAddWeeklyGoalApi();
      }else{
        callAddWeeklyGoalApi();
      }

    } else {
      animatedButtonController.reset();
    }
  }

  void callAddWeeklyGoalApi() async {
    Utils.check().then((value) async {
      if (value) {
        await _appPreferences.isPreferenceReady;
        RxList<int> users = List<int>.empty().obs;

        var userId;
        _appPreferences.getUserId().then((value1) {
          userId = value1;
          users.value.add(int.parse(userId));
        });
        var salonId;
        _appPreferences.getSalonId().then((value1) {
          salonId = value1;
        });

        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.post(Constants.goals, onSuccess: (response) async {
            if (controller.arrOfWeekly.isNotEmpty) {
              controller.arrOfWeekly.clear();
            }
            if (controller.arrOfMonthly.isNotEmpty) {
              controller.arrOfMonthly.clear();
            }
            if (controller.arrOfAnnual.isNotEmpty) {
              controller.arrOfAnnual.clear();
            }
            if (controller.arrOfCustom.isNotEmpty) {
              controller.arrOfCustom.clear();
            }
            controller.getRequest();
            animatedButtonController.reset();
            Get.dialog(CustomAlertToastDialog(title:"Goal Created!",bodyCenter:true,image:ImageConstant.dialogImageGoal,
                body:"You can update the status of this goal under Goals » Goal Details.",
                ontap: (){
                  Get.back(result: true);
                  Get.back(result: true);
                }));
            // Get.back(result: true);
          }, onError: (error) {
            print(error);
            animatedButtonController.reset();
            BaseClient.handleApiError(error);
            apiCallStatus = ApiCallStatus.error;
          }, headers: {
            'Authorization': 'Bearer $value',
            'Accept': 'application/json',
          }, data: {
            'type': AppConstant.ANNUALLY,
            'target_type': selectedTargetTypeId!.value,
            'salon_id': salonId,
            'user_id': userId,
            'users': users,
            'start_date': startDate.value,
            'end_date': endDate.value,
            'name': weeklyGoalsTitleController!.value.text,
            'target_value': dollarControllerMonthly.value.text,
            'description': weeklyDesController!.value.text,
          });
        });
      } else {
        Utils.showToast('No internet connection', true);
      }
    });
  }

  void callEditAddWeeklyGoalApi() async {
    Utils.check().then((value) async {
      if (value) {
        await _appPreferences.isPreferenceReady;
        RxList<int> users = List<int>.empty().obs;

        var userId;
        _appPreferences.getUserId().then((value1) {
          userId = value1;
          users.value.add(int.parse(userId));
        });
        var salonId;
        _appPreferences.getSalonId().then((value1) {
          salonId = value1;
        });

        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.put(Constants.goals+"/${controller2.goalData!.value.id!}", onSuccess: (response) async {
            if (controller.arrOfWeekly.isNotEmpty) {
              controller.arrOfWeekly.clear();
            }
            if (controller.arrOfMonthly.isNotEmpty) {
              controller.arrOfMonthly.clear();
            }
            if (controller.arrOfAnnual.isNotEmpty) {
              controller.arrOfAnnual.clear();
            }
            if (controller.arrOfCustom.isNotEmpty) {
              controller.arrOfCustom.clear();
            }
            controller.getRequest();
            animatedButtonController.reset();
            print("salman alpi hitted");
            // Get.dialog(CustomAlertToastDialog(title:"Goal Update!",bodyCenter:true,image:ImageConstant.dialogImageGoal,
            //     body:"You can update the status of this goal under Goals » Goal Details.",
            //     ontap: (){
            //       Get.back();
            //     }));
            Get.back(result: true);
          }, onError: (error) {
            print(error.message);
            animatedButtonController.reset();
            BaseClient.handleApiError(error);
            apiCallStatus = ApiCallStatus.error;
          }, headers: {
            'Authorization': 'Bearer $value',
            'Accept': 'application/json',
          }, data: {
            'type': AppConstant.ANNUALLY,
            'target_type': selectedTargetTypeId!.value,
            'salon_id': salonId,
            'user_id': userId,
            'users': users,
            'start_date': startDate.value,
            'end_date': endDate.value,
            'name': weeklyGoalsTitleController!.value.text,
            'target_value': dollarControllerMonthly.value.text ,
            'duration': selectedRepeatGoalId!.value,
            'description': weeklyDesController!.value.text,
          });
        });
      } else {
        Utils.showToast('No internet connection', true);
      }
    });
  }

  DateTime getNextMonth(DateTime date) {
    if (date.month == 12) {
      return DateTime(date.year + 1, 1);
    } else {
      return DateTime(date.year, date.month + 1);
    }
  }

  int getDaysInMonth(int year, int month) {
    if (month == 12) {
      return 31;
    } else {
      return DateTime(year, month + 1, 0).day;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
