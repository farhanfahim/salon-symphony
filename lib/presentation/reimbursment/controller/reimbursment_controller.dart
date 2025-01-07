import 'dart:io';

import 'package:file_picker/file_picker.dart';
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
import '../../add_add_education_tracking_screen/controller/add_add_education_tracking_controller.dart';
import '../../request_detail_time_off_screen/controller/request_dtail_time_off_controller.dart';
import '../../request_pending_page/controller/request_pending_controller.dart';
import '/core/app_export.dart';
import 'package:salon_symphony/presentation/add_add_education_tracking_screen/models/add_add_education_tracking_model.dart';
import 'package:flutter/material.dart';

class ReimbrusmentController extends GetxController
    with SingleGetTickerProviderMixin {
  Rx<TextEditingController> eventController = TextEditingController().obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<TextEditingController> commentController = TextEditingController().obs;
  RxList<PaymentModel> arrOfOptions = DummyContent.payments.obs;
  RxList<createChatModel> arrOfOptions3 = DummyContent.purposeDataList.obs;
  Rx<TextEditingController> paymentController = TextEditingController().obs;
  Rx<TextEditingController> classDateController2 = TextEditingController().obs;
  Rx<TextEditingController> totalSpent = TextEditingController().obs;
  Rx<TextEditingController> uploadController = TextEditingController().obs;

  Rx<AddAddEducationTrackingModel> addAddEducationTrackingModelObj =
      AddAddEducationTrackingModel().obs;

  RequestPendingController requestPendingController = Get.put(RequestPendingController());
  AddAddEducationTrackingController controllerMap = Get.find<AddAddEducationTrackingController>();

  SelectionPopupModel? selectedDropDownValue;
  TabController? tabController;
  late RequestDetailsTimeOffController controller;

  FocusNode? eventnode = FocusNode();
  FocusNode? nodeNode = FocusNode();
  FocusNode? commentsNode = FocusNode();
  FocusNode? paymentNote = FocusNode();
  FocusNode? totalSpentNode = FocusNode();
  FocusNode? classDateFocusNode2 = FocusNode();
  FocusNode? uploadNode = FocusNode();



  AppPreferences _appPreferences = AppPreferences();
  final animatedButtonController = AnimatedButtonController();
  RxBool isInternetAvailable = true.obs;
  RxBool isEditing= false.obs;
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  RxInt purposeId = 0.obs;
  RxInt paymentMethodId = 0.obs;
  String classDate = "";

  @override
  void onReady() {
    super.onReady();

    if(controllerMap.map["isEditing"]==true && controllerMap.map["Type"]==AppConstant.EDUCATION_REIMBURSEMENT){
      isEditing.value=true;
      prePopulateData();
    }
  }

  prePopulateData(){
    controller = Get.find<RequestDetailsTimeOffController>();
    if(controller.requestData!.value!=null){
      totalSpent.value.text = controller.requestData!.value.value!.toString();
      commentController.value.text = controller.requestData!.value.comments!;
      for(int i=0;i<arrOfOptions.length;i++){
        if(arrOfOptions[i].id.toString()==controller.requestData!.value.paymentMethod){
          paymentController.value.text = arrOfOptions[i].name!;
          updateItem(i);
        }
      }
      for(int i=0;i<arrOfOptions3.length;i++){
        if(arrOfOptions3[i].id==controller.requestData!.value.subType){
          eventController.value.text = arrOfOptions3[i].name!;
          updatePurpose(i);
        }
      }
       classDate = controller.requestData!.value.date!;
       classDateController2.value.text = Utils.getFormatedDate(controller.requestData!.value.date!);

    }

  }

  updateItem(int index) {
    for (var item in arrOfOptions) {
      item.selected = false.obs;
    }
    arrOfOptions[index].selected = true.obs;
    paymentMethodId.value = arrOfOptions[index].id!;
    arrOfOptions.refresh();
  }
  updatePurpose(int index) {
    for (var item in arrOfOptions3) {
      item.selected = false.obs;
    }
    arrOfOptions3[index].selected = true.obs;
    purposeId.value = arrOfOptions3[index].id!;
    arrOfOptions3.refresh();
  }

  void selectPosition(context) {
    Responsive responsive = Responsive();
    responsive.setContext(context);
    HelperFunction.showBottomSheet(
      context,
      redclrEndTask: false,
      screenEndTask: "Done",
      bottomSheetHeight:responsive.setHeight(37),
      spaceBetween: responsive.setHeight(4),
      screenTitle: 'Select Payment Method',
      widget: Obx(() => ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: arrOfOptions.length,
        itemBuilder: (BuildContext context, int index) {
          var data = arrOfOptions[index];
          // print('count ${arrOfOptions[1].selected!.value}');
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  paymentController.value.text = data.name.toString();
                  updateItem(index);
                  Get.back();
                },
                child: Padding(
                  padding: EdgeInsets.only(bottom: responsive.setHeight(1),top: responsive.setHeight(1),right: 20),
                  child: Row(
                    children: [

                      MyText(title: '${data.name}'),
                      Spacer(),
                      arrOfOptions[index].selected!.value == true
                          ? Container(
                        margin: getMargin(
                          //   top: 15,
                          right: 5,
                          //   bottom: 15,
                        ),
                        decoration:
                        AppDecoration.outlineBluegray100.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10,
                          border: Border.all(
                            color: ColorConstant
                                .primaryColor,
                            width: getSize(
                              1.00,
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                color: ColorConstant.primaryColor,
                                borderRadius: BorderRadius.circular(
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
                        decoration:
                        AppDecoration.outlineBluegray100.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                borderRadius: BorderRadius.circular(
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
              ),
              index != 3 ?
              Divider():Offstage()

            ],
          );
        },
      )),
    );
  }

  void selectPurpose(context) {
    Responsive responsive = Responsive();
    responsive.setContext(context);
    HelperFunction.showBottomSheet(
      context,
      redclrEndTask: false,
      screenEndTask: "Done",
      bottomSheetHeight: responsive.setHeight(45),
      spaceBetween: responsive.setHeight(4),
      screenTitle: 'Expense Purpose',
      widget: Obx(() => ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: arrOfOptions3.length,
        itemBuilder: (BuildContext context, int index) {
          var data = arrOfOptions3[index];
          // print('count ${arrOfOptions[1].selected!.value}');
          return Column(
            children: [
              // SizedBox(
              //   height: responsive.setHeight(2),
              // ),
              InkWell(
                onTap: () {
                  eventController.value.text = data.name.toString();

                  updatePurpose(index);
                  Get.back();
                },
                child: Padding(
                  padding: EdgeInsets.only(bottom: responsive.setHeight(1),right: 20,top: responsive.setHeight(1)),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(title: '${data.name}'),
                          SizedBox(
                            height: 5,
                          ),
                          MyText(
                            title: '${data.des}',
                            clr: ColorConstant.hintTextColor,
                            fontSize: 12,
                          ),
                        ],
                      ),
                      Spacer(),
                      arrOfOptions3[index].selected!.value == true
                          ? Container(
                        margin: getMargin(
                          //   top: 15,
                          right: 5,
                          //   bottom: 15,
                        ),
                        decoration:
                        AppDecoration.outlineBluegray100.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                color: ColorConstant.primaryColor,
                                borderRadius: BorderRadius.circular(
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
                        decoration:
                        AppDecoration.outlineBluegray100.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                borderRadius: BorderRadius.circular(
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
              ),
              index !=3?
              Divider():Offstage(),
            ],
          );
        },
      )),
    );
  }


  @override
  void onClose() {
    super.onClose();
  }


  selectAge(context,bool isDob) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 8),
      lastDate: DateTime(3000, 8),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
                primary: ColorConstant.primaryColor,
                onSurface: Colors.black
            ),
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
    isAdult(picked,context,isDob);
  }

  void isAdult(birthDateString,context,bool? isDob) {
    if(isDob == true) {
      classDateController2.value.text =
          Utils.getFormatedDate(birthDateString.toString());
      classDate = DateFormat('yyyy-MM-dd').format(birthDateString);
      classDateController2.refresh();
    }}

  void saveInfo(context) {
    final formState = formKey.currentState;
    Utils.hideKeyboard(context);
    if (classDateController2.value.text.isNotEmpty ||
        totalSpent.value.text.isNotEmpty ||
        eventController.value.text.isNotEmpty ||
        paymentController.value.text.isNotEmpty ||
        commentController.value.text.isNotEmpty) {
      if (formState!.validate()) {
        formState.save();
        if(controllerMap.map["isEditing"]!=true){
          callRequestEducationApi();
        }else{
          callEditRequestEducationApi();
        }
      } else {
        animatedButtonController.reset();
      }
    }
  }

  void callRequestEducationApi() async {
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
                animatedButtonController.reset();
                Get.dialog(CustomAlertToastDialog(title:"Request Submitted!",bodyCenter:true,image: ImageConstant.dialogImage,
                    body:"You'll receive a notification as soon as a manager responds to this request.",ontap: (){
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
                'type': AppConstant.EDUCATION_REIMBURSEMENT,
                'sub_type': purposeId.value.toString(),
                'salon_id': salonId,
                'user_id': userId,
                'value': totalSpent.value.text,
                'payment_method': paymentMethodId.value.toString(),
                'comments': commentController.value.text,
                'date': classDate.isNotEmpty ? classDate : "",
              });
        });
      } else {
        Utils.showToast('No internet connection', true);
      }
    });
  }

  void callEditRequestEducationApi() async {
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
          await BaseClient.put(Constants.userRequest+"/${controller.requestData!.value.id}",
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
                'type': AppConstant.EDUCATION_REIMBURSEMENT,
                'sub_type': purposeId.value.toString(),
                'salon_id': salonId,
                'user_id': userId,
                'value': totalSpent.value.text,
                'payment_method': paymentMethodId.value.toString(),
                'comments': commentController.value.text,
                'date': classDate.isNotEmpty ? classDate : "",
              });
        });
      } else {
        Utils.showToast('No internet connection', true);
      }
    });
  }


  var fileName = ''.obs;

  String shortenFileName(String fileName, int maxLength) {
    if (fileName.length <= maxLength) {
      return fileName;
    } else {
      final extension = fileName.substring(fileName.lastIndexOf('.'));
      final basename = fileName.substring(0, fileName.length - extension.length);
      final shortenedName = basename.substring(0, maxLength - 3);
      return '$shortenedName...$extension';
    }
  }

  Future<void> selectFile(context) async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      // Use the selected file
      final file = File(result.files.single.path!);
      // Update the file name variable
      fileName.value = file.path.split('/').last;
      uploadController.value.text = shortenFileName(fileName.value, 20);

    }
  }



}
