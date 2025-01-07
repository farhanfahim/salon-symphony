import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:salon_symphony/data/services/api_exceptions.dart';
import 'package:salon_symphony/presentation/coverage_team_list/models/user_list_response_model.dart';
import 'package:salon_symphony/theme/app_style.dart';
import 'package:salon_symphony/widgets/widgetSkeleton.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/constants/constants.dart';
import '../../../core/utils/app_constant.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/dummy_content.dart';
import '../../../core/utils/helper_functions.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/utils/size_utils.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/base_client.dart';
import '../../../theme/app_decoration.dart';
import '../../../widgets/animatedButton.dart';
import '../../../widgets/common_image_view.dart';
import '../../../widgets/custom_dialog_toast_message.dart';
import '../../../widgets/custom_text.dart';
import '../../request_pending_page/controller/request_pending_controller.dart';

class TimeRequestController extends GetxController {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
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
  Rx<UserListResponseModel>? userListResponseModel = UserListResponseModel().obs;
  Rx<bool> formSubmitted = false.obs;

  String leaveDate = "";
  String returnDate = "";
  Rx<int> selectedCoverageUserId = 0.obs;
  Rx<bool> isLoading = true.obs;
  RxList<UserData> arrOfMembers = List<UserData>.empty().obs;
  Rx<int>? selectedLeaveId = 0.obs;
  AppPreferences _appPreferences = AppPreferences();
  final animatedButtonController = AnimatedButtonController();
  RxBool isInternetAvailable = true.obs;
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  Rx<UserData>? selectedUser = UserData().obs;

  @override
  void onInit(){
    super.onInit();
    getUsers();
  }

  updateItem(int index) {
    for (var item in arrOfOptions) {
      item.selected = false.obs;
    }
    arrOfOptions[index].selected = true.obs;
    selectedLeaveId!.value = arrOfOptions[index].id!;
    arrOfOptions.refresh();
  }
  // updateUser(int index) {
  //   for (var item in arrOfMembers) {
  //     item.isSelected!.value = false;
  //   }
  //   arrOfMembers[index].isSelected!.value = true;
  //   selectedUser!.value = arrOfMembers[index];
  //   arrOfMembers.refresh();
  // }
  updateUser(int selectedIndex) {
    // Iterate through all members
    for (int i = 0; i < arrOfMembers.length; i++) {
      // Determine if the member should be selected
      bool shouldBeSelected = (i == selectedIndex);

      // If the member is selected, update the selectedUser
      if (shouldBeSelected) {
        if (arrOfMembers[i].isSelected!.value) {
          // Member is already selected, unselect it
          arrOfMembers[i].isSelected!.value = false;
          selectedUser!.value.isSelected = false.obs;
          print('selected user1 ======> ${selectedUser!.value.id}');
          coverageController.value.text = "";
          selectedCoverageUserId.value = 0;

        } else {
          // Member is not selected, select it
          arrOfMembers[i].isSelected!.value = true;
          selectedUser!.value = arrOfMembers[i];
          print('selected user2 ======> ${selectedUser!.value.id}');
          coverageController.value.text = selectedUser!.value.name!;
          selectedCoverageUserId.value = selectedUser!.value.id!;
        }
      } else {
        // Unselect other members
        arrOfMembers[i].isSelected!.value = false;
        print('selected user3 ======> ${selectedUser!.value.id}');
      }
    }

    // Refresh the UI or notify listeners as needed
    arrOfMembers.refresh();
  }

  Future <dynamic> getUsers() async{
print('user api ======> ');
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
        isLoading.value = true;
        apiCallStatus = ApiCallStatus.loading;
        _appPreferences.getAccessToken(prefName: AppPreferences.prefAccessToken).then((value) async {

          await BaseClient.get(
              Constants.users,
              onSuccess: (response) {
                isLoading.value = false;
                apiCallStatus = ApiCallStatus.success;
                userListResponseModel!.value = UserListResponseModel.fromJson(response.data);
                arrOfMembers.value = userListResponseModel!.value.data!;


                if(arrOfMembers.isEmpty){
                  apiCallStatus = ApiCallStatus.empty;
                }
                for(var item in arrOfMembers){
                  if(item.id! == selectedCoverageUserId.value){
                    item.isSelected!.value = true;
                    selectedUser!.value = item;
                  }
                }
                return true;
              },

              onError: (error) {
                ApiException apiException = error;

                print(apiException.message);

                BaseClient.handleApiError(error);

                apiCallStatus = ApiCallStatus.error;

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
                'mobile_user_id': userID,
                'order-column': "name",
                'order': "asc",
              }

          );
        });

      } else {
        Utils.showToast('No internet connection',true);
      }
    });
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
        lvlTypeController.value.text.isEmpty ) {
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
        callRequestTimeApi();
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
                                    ?  Container(
                                  margin: getMargin(
                                    // top: 15,
                                    right: 5,
                                    // bottom: 15,
                                  ),
                                  decoration:
                                  AppDecoration.outlineBluegray100.copyWith(
                                    borderRadius: BorderRadiusStyle.roundedBorder10,
                                    border: Border.all(
                                      color: ColorConstant.primaryColor,
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
                                          all: 2,
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
  void selectMembers(context) {
    Responsive responsive = Responsive();
    responsive.setContext(context);
    HelperFunction.showBottomSheet(
      context,
      bottomSheetHeight: responsive.setHeight(85),
      spaceBetween: responsive.setHeight(4),
      isScrollControlled: true,
      isPadding: true,
      screenEndTask: 'Done',
      screenTitle: 'Select Coverage',
      widget: Obx(() =>
      isLoading.value == true? taskShimmer(context):
          ListView.builder(
        itemCount: arrOfMembers.length,
        itemBuilder:
            (BuildContext context, int index) {
          return Column(
            children: [
              InkWell(
                splashFactory: NoSplash.splashFactory,
                onTap: () {
                  print(selectedCoverageUserId);
                  // coverageController.value.text = arrOfMembers[index].name!;
                  // selectedCoverageUserId.value = arrOfMembers[index].id!;
                  updateUser(index);
                  Get.back();
                },
                child: Padding(
                  padding: EdgeInsets.only(top: responsive.setHeight(2),
                      bottom: responsive.setHeight(2)),
                  child: Row(
                    children: [
                      arrOfMembers[index].image != null
                          ? Container(
                        height:
                        getSize(35.00),
                        width: getSize(35.00),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: CommonImageView(
                      url:  arrOfMembers[index].image!.toString(),
                      height:
                      getSize(35.00),
                      width: getSize(35.00),
                      radius: BorderRadius.circular(100),
                    ),
                  )
                          : CommonImageView(
                        svgPath: ImageConstant
                            .imgUser,
                        height:
                        getSize(35.00),
                        width: getSize(35.00),
                      ),
                      SizedBox(
                        width:
                        responsive.setWidth(4),
                      ),
                      MyText(
                        title:
                        '${arrOfMembers[index].name!}',
                      ),
                      Spacer(),
                      arrOfMembers[index].isSelected!.value == true
                          ? Container(
                        margin: getMargin(
                          top: 15,
                          right: 20,
                          bottom: 10,),
                        decoration:
                        BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder10,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: getSize(18.00,),
                              width: getSize(18.00,),
                              margin: getMargin(all: 1,),
                              decoration: BoxDecoration(
                                color: ColorConstant.primaryColor,
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(50,),
                                ),
                              ),
                              child: Icon(Icons.check,
                                size: 10,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                          : Container(
                        margin: getMargin(
                          top: 15,
                          right: 20,
                          bottom: 10,
                        ),
                        decoration: AppDecoration.outlineBluegray100.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10,
                        ),
                        child:
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: getSize(15.50,),
                              width: getSize(15.00,),
                              margin:
                              getMargin(all: 1,),
                              decoration:
                              BoxDecoration(
                                color: ColorConstant.whiteA700,
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(50,),
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
              Container(height: 1,width: double.maxFinite,color: ColorConstant.gray400.withOpacity(0.3),)
            ],
          );
        },
      ),

      ),
    );
  }

  void callRequestTimeApi() async {
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

            Get.dialog(CustomAlertToastDialog(title:"Request Submitted!",
                bodyCenter:true,image: ImageConstant.dialogImage,
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
            'type': AppConstant.TIME_OFF_REQUEST,
            'sub_type': selectedLeaveId!.value,
            'salon_id': salonId,
            'user_id': userId,
                'coverage_by': selectedCoverageUserId.value == 0 ? null : selectedCoverageUserId.value,
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
