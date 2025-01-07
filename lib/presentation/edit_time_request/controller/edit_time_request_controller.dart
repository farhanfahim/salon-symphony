import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/constants/constants.dart';
import '../../../core/utils/app_constant.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/dummy_content.dart';
import '../../../core/utils/helper_functions.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/utils/size_utils.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/base_client.dart';
import '../../../theme/app_decoration.dart';
import '../../../widgets/animatedButton.dart';
import '../../../widgets/custom_text.dart';
import '../../request_detail_time_off_screen/controller/request_dtail_time_off_controller.dart';
import '../../request_pending_page/controller/request_pending_controller.dart';

class EditTimeRequestController extends GetxController {
  Rx<TextEditingController> lvlTypeController = TextEditingController().obs;
  Rx<TextEditingController> laveDateController = TextEditingController().obs;
  Rx<TextEditingController> returnDateController = TextEditingController().obs;
  Rx<TextEditingController> coverageController = TextEditingController().obs;
  Rx<TextEditingController> commentsController = TextEditingController().obs;
  FocusNode? lvlTypeNode = FocusNode();
  FocusNode? laveDateNode = FocusNode();
  FocusNode? returnDateNode = FocusNode();
  FocusNode? coverageNode = FocusNode();
  FocusNode? commentsNode = FocusNode();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxList<LeaveModel> arrOfOptions = DummyContent.leaves.obs;
  RequestPendingController requestPendingController = Get.put(RequestPendingController());
  Rx<bool> formSubmitted = false.obs;
  String leaveDate = "";
  String returnDate = "";
  Rx<int> selectedCoverageUserId = 0.obs;
  Rx<int>? selectedLeaveId = 0.obs;
  AppPreferences _appPreferences = AppPreferences();
  final animatedButtonController = AnimatedButtonController();
  RxBool isInternetAvailable = true.obs;
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  RequestDetailsTimeOffController requestDetailsTimeOffController = Get.find();

  @override
  void onReady() {
    super.onReady();
    prePopulateData();
  }

  prePopulateData(){

    lvlTypeController.value.text = requestDetailsTimeOffController.requestData!.value.subTypeName!;
    laveDateController.value.text = Utils.getFormatedDate(requestDetailsTimeOffController.requestData!.value.date!);
    returnDateController.value.text = Utils.getFormatedDate(requestDetailsTimeOffController.requestData!.value.returnDate!);
    coverageController.value.text = requestDetailsTimeOffController.requestData!.value.coverage!=null?requestDetailsTimeOffController.requestData!.value.coverage!.name!:"";
    commentsController.value.text = requestDetailsTimeOffController.requestData!.value.comments!;
    selectedCoverageUserId.value = requestDetailsTimeOffController.requestData!.value.coverageBy!;
    selectedLeaveId!.value = requestDetailsTimeOffController.requestData!.value.subType!;
    leaveDate = Utils.getFormatedShortDateForApi(requestDetailsTimeOffController.requestData!.value.date!);
    returnDate = Utils.getFormatedShortDateForApi(requestDetailsTimeOffController.requestData!.value.returnDate!);
    formSubmitted.value = true;
  }

  updateItem(int index) {
    for (var item in arrOfOptions) {
      item.selected = false.obs;
    }
    arrOfOptions[index].selected = true.obs;
    selectedLeaveId!.value = arrOfOptions[index].id!;
    arrOfOptions.refresh();
  }

  selectAge(context, bool isDob) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: leaveDate.isNotEmpty?DateTime.parse(leaveDate):DateTime.now(),
      firstDate: leaveDate.isNotEmpty?DateTime.parse(leaveDate):DateTime.now(),
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

  selectAge2(context, bool isDob) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: returnDate.isNotEmpty && returnDate != null?DateTime.parse(returnDate):leaveDate.isNotEmpty && leaveDate != null?DateTime.parse(leaveDate):DateTime.now(),
      firstDate: leaveDate.isNotEmpty?DateTime.parse(leaveDate):DateTime.now(),
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

      returnDateController.value.text =
          Utils.getFormatedDate(birthDateString.toString());
      returnDate = DateFormat('yyyy-MM-dd').format(birthDateString);

    } else {

      laveDateController.value.text =
          Utils.getFormatedDate(birthDateString.toString());
      leaveDate = DateFormat('yyyy-MM-dd').format(birthDateString);

      if(returnDate.isNotEmpty){
        DateTime dtl = DateTime.parse(leaveDate);
        DateTime dtr = DateTime.parse(returnDate);
        if(dtl.isAfter(dtr)){
          returnDateController.value.text =
              Utils.getFormatedDate(birthDateString.toString());
          returnDate = DateFormat('yyyy-MM-dd').format(birthDateString);

        }

      }

    }
    checkInfo(context);
  }

  void checkInfo(context) {
    if (laveDateController.value.text.isEmpty ||
        returnDateController.value.text.isEmpty ||
        commentsController.value.text.isEmpty ||
        lvlTypeController.value.text.isEmpty ||
        coverageController.value.text.isEmpty) {
      formSubmitted.value = false;
    } else {
      formSubmitted.value = true;
    }
  }

  void saveInfo(context) {
    final formState = formKey.currentState;

    if (formSubmitted.value == true) {
      if (formState!.validate()) {
        formState.save();
        callEditRequestTimeApi();
      } else {
        animatedButtonController.reset();
      }
    }
  }

  void selectReason(context) {
    Responsive responsive = Responsive();
    responsive.setContext(context);
    HelperFunction.showBottomSheet(
      context,
      bottomSheetHeight: responsive.setHeight(70),
      spaceBetween: responsive.setHeight(4),
      isScrollControlled: true,
      screenEndTask: 'Done',
      screenTitle: 'Select Reason',
      widget: Obx(() => ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: arrOfOptions.length,
            itemBuilder: (BuildContext context, int index) {
              var data = arrOfOptions[index];
              // print('count ${arrOfOptions[1].selected!.value}');
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      lvlTypeController.value.text = data.name.toString();
                      updateItem(index);
                      checkInfo(context);
                      Get.back();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: responsive.setHeight(1.5),
                          top: responsive.setHeight(1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Row(
                              children: [
                                MyText(title: '${data.name}'),
                                Spacer(),
                                arrOfOptions[index].selected!.value == true
                                    ? Container(
                                        margin: getMargin(
                                          // top: 15,
                                          right: 5,
                                          // bottom: 15,
                                        ),
                                        decoration: AppDecoration
                                            .outlineBluegray100
                                            .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder10,
                                          border: Border.all(
                                            color: ColorConstant.primaryColor,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: getSize(
                                                15.00,
                                              ),
                                              width: getSize(
                                                15.00,
                                              ),
                                              margin: getMargin(
                                                all: 1,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    ColorConstant.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  getHorizontalSize(
                                                    50,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(
                                        margin: getMargin(
                                          // top: 15,
                                          right: 5,
                                          // bottom: 15,
                                        ),
                                        decoration: AppDecoration
                                            .outlineBluegray100
                                            .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder10,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: getSize(
                                                15.00,
                                              ),
                                              width: getSize(
                                                15.00,
                                              ),
                                              margin: getMargin(
                                                all: 1,
                                              ),
                                              decoration: BoxDecoration(
                                                color: ColorConstant.whiteA700,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  getHorizontalSize(
                                                    50,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  index == 7 ? Offstage() : Divider()
                ],
              );
            },
          )),
    );
  }

  void callEditRequestTimeApi() async {
    Utils.check().then((value) async {
      if (value) {
        await _appPreferences.isPreferenceReady;

        var userId;
        _appPreferences.getUserId().then((value1) {
          userId = value1;
        });
        var salonId;
        _appPreferences.getSalonId().then((value1) {
          salonId = value1;
        });
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.put(Constants.userRequest+"/${requestDetailsTimeOffController.requestData!.value.id}",
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
            animatedButtonController.reset();
            Get.back();
          }, onError: (error) {
            print(error);
            animatedButtonController.reset();
            BaseClient.handleApiError(error);
            apiCallStatus = ApiCallStatus.error;
          }, headers: {
            'Authorization': 'Bearer $value',
            'Accept': 'application/json',
          }, data: {
            'type': AppConstant.TIME_OFF_REQUEST,
            'sub_type': selectedLeaveId!.value,
            'salon_id': salonId,
            'user_id': userId,
            'coverage_by': selectedCoverageUserId.value,
            'comments': commentsController.value.text,
            'date': leaveDate.isNotEmpty ? leaveDate : "",
            'return_date': returnDate.isNotEmpty ? returnDate : "",
          });
        });
      } else {
        Utils.showToast('No internet connection', true);
      }
    });
  }
}
