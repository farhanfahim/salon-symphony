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

class CreateCustomGoalController extends GetxController
    with SingleGetTickerProviderMixin {
  Rx<TextEditingController>? amountController = TextEditingController().obs;
  Rx<TextEditingController>? weeklyGoalsTitleController =
      TextEditingController().obs;
  Rx<TextEditingController>? weeklyDesController = TextEditingController().obs;
  Rx<TextEditingController> dollarControllerMonthly =
      TextEditingController().obs;
  Rx<TextEditingController>? startDateController = TextEditingController().obs;
  Rx<TextEditingController>? endDateController = TextEditingController().obs;

  RxList<DaysModel> arrOfOptions = DummyContent.days.obs;
  RxList<ForeverModel> arrOfOptions2 = DummyContent.forever.obs;
  RxList<AmountModel> bottomSheetOptions = DummyContent.amount.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool formSubmitted = false;

  FocusNode? weeklyGoalNode = FocusNode();
  FocusNode? dayNode = FocusNode();
  FocusNode? dollarNode = FocusNode();
  FocusNode? startDateNode = FocusNode();
  FocusNode? endDateNode = FocusNode();
  FocusNode? weeklyDesNode = FocusNode();

  RxBool showLogo = false.obs;
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
  RxInt itemNumber = 0.obs;
  Map<String, dynamic> map = Get.arguments;
  late GoalDetailsActiveController controller2;
  @override
  void onReady() {

    if(map["isEditingGoal"]==true){
      print("salman is working here");
      prePopulateData();
    }
    super.onReady();
  }

  prePopulateData(){
    controller2 = Get.find<GoalDetailsActiveController>();
    print("1234");
    print(controller2.goalData!.value.targetType);
    if(controller2.goalData!.value.id!=null){

      weeklyGoalsTitleController?.value.text = controller2.goalData!.value.name!;
      weeklyDesController?.value.text = controller2.goalData!.value.description!;

      for(int i=0;i<bottomSheetOptions.length;i++){
        if(bottomSheetOptions[i].id==controller2.goalData!.value.targetType){
          amountController?.value.text = bottomSheetOptions[i].name!;
          showLogo.value = true;
          updateItemBottomsSheet(i);
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
      startDate.value =  DateFormat('yyyy-MM-dd').format(DateTime.parse(controller2.goalData!.value.startDate!));
      endDate.value = DateFormat('yyyy-MM-dd').format(DateTime.parse(controller2.goalData!.value.endDate!));
startDateController?.value.text=Utils.getFormatedDate(controller2.goalData!.value.startDate!);
endDateController?.value.text=Utils.getFormatedDate(controller2.goalData!.value.endDate!);

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

  selectStartDate(context, bool isDob) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate.isNotEmpty
          ? DateTime.parse(startDate.value)
          : DateTime.now(),
      firstDate: startDate.isNotEmpty
          ? DateTime.parse(startDate.value)
          : DateTime.now(),
      lastDate: DateTime(3000, 8),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
                primary: ColorConstant.primaryColor, onSurface: Colors.black),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: ColorConstant.primaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    isAdult(picked, context, isDob);
  }

  selectEndDate(context, bool isDob) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate.isNotEmpty
          ? DateTime.parse(endDate.value)
          : startDate.isNotEmpty
              ? DateTime.parse(startDate.value)
              : DateTime.now(),
      firstDate: startDate.isNotEmpty
          ? DateTime.parse(startDate.value)
          : DateTime.now(),
      lastDate: DateTime(3000, 8),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
                primary: ColorConstant.primaryColor, onSurface: Colors.black),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: ColorConstant.primaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    isAdult(picked, context, isDob);
  }

  void isAdult(birthDateString, context, bool? isDob) {
    print(birthDateString);
    if (isDob == true) {
      endDateController!.value.text =
          Utils.getFormatedDate(birthDateString.toString());
      endDate.value = DateFormat('yyyy-MM-dd').format(birthDateString);
    } else {
      startDateController!.value.text =
          Utils.getFormatedDate(birthDateString.toString());
      startDate.value = DateFormat('yyyy-MM-dd').format(birthDateString);

      if (endDate.isNotEmpty) {
        DateTime dtl = DateTime.parse(startDate.value);
        DateTime dtr = DateTime.parse(endDate.value);
        if (dtl.isAfter(dtr)) {
          endDateController!.value.text =
              Utils.getFormatedDate(birthDateString.toString());
          endDate.value = DateFormat('yyyy-MM-dd').format(birthDateString);
        }
      }
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
            'type': AppConstant.CUSTOM,
            'salon_id': salonId,
            'target_type': selectedTargetTypeId!.value,
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
            print(error);
            animatedButtonController.reset();
            BaseClient.handleApiError(error);
            apiCallStatus = ApiCallStatus.error;
          }, headers: {
            'Authorization': 'Bearer $value',
            'Accept': 'application/json',
          }, data: {
            'type': AppConstant.CUSTOM,
            'target_type': selectedTargetTypeId!.value,
            'salon_id': salonId,
            'user_id': userId,
            'users': users,
            'start_date': startDate.value,
            'end_date': endDate.value,
            'name': weeklyGoalsTitleController!.value.text,
            'target_value': symbol!.value == "\%"
                ? dollarControllerMonthly.value.text + "${symbol!.value}"
                : "${symbol!.value}" + dollarControllerMonthly.value.text,
            'duration': selectedRepeatGoalId!.value,
            'description': weeklyDesController!.value.text,
          });
        });
      } else {
        Utils.showToast('No internet connection', true);
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
