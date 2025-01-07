import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:salon_symphony/widgets/time_picker.dart';

import '../../core/utils/helper_functions.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/utils.dart';
import '../../widgets/response_binding_widget.dart';
import '../../widgets/widgetSkeleton.dart';
import '../schedule_requests_change_shifts_screen/widgets/listweekday_item_widget.dart';
import 'controller/schedule_requests_change_shifts_controller.dart';
import 'models/listweekday_item_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_button.dart';

class ScheduleRequestsChangeShiftsScreen
    extends GetWidget<ScheduleRequestsChangeShiftsController> {
  Responsive responsive = Responsive();
  ScheduleRequestsChangeShiftsController controller =
      Get.put(ScheduleRequestsChangeShiftsController());

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Obx(() => ResponseBindingWidget(
                apiCallStatus: controller.apiCallStatus.value,
                errorWidget: () {
                  return Container();
                },
                loadingWidget: () {
                  return Column(
                    children: [
                      scheduleShimmer2(),
                    ],
                  );
                },
                emptyWidget: () {
                  return SizedBox(
                    width: double.maxFinite,
                    height: 500,
                    child: Center(
                      child: Text(
                        'No Record Found'.tr,
                        style: AppStyle.txtPoppinsBold16
                            .copyWith(fontSize: 20.0.sp),
                      ),
                    ),
                  );
                },
                successWidget: () {
                  return Container(
                      width: size.width,
                      child: SingleChildScrollView(
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    width: getHorizontalSize(339.00),
                                    margin: getMargin(left: 16, top: 10, right: 16),
                                    child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "Change Shift: ",
                                              style: AppStyle.txtPoppinsSemiBold20.copyWith(
                                                  letterSpacing: 0.5,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500)),
                                          TextSpan(
                                              text:
                                              "To request a shift change, tap the day of the week you wish to modify and set your desired shift.",
                                              style: AppStyle.txtPoppinsRegular20.copyWith(
                                                  letterSpacing: 0.5,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: ColorConstant.black900)),
                                        ])),
                                  ),
                                ),

                                Obx(() => ListView.builder(
                                    itemCount: controller.scheduleData.value.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    reverse: true,
                                    itemBuilder: (context, index){
                                      return GestureDetector(
                                        onTap: () {
                                          HelperFunction.showBottomSheet(
                                            context,
                                            bottomSheetHeight:
                                            responsive.setHeight(83),
                                            spaceBetween: responsive.setHeight(4),
                                            redclrEndTask: false,
                                            isLeftPadding: false,
                                            isScrollControlled: true,
                                            screenEndTask: 'Done',
                                            screenTitle: "msg_request_shift_c".tr,
                                            onTap: (){
                                              //controller.updateDays(day:controller.scheduleData[index].day!,startTime:controller.scheduleData[index].localStartTime!.value,endTime:controller.scheduleData[index].localEndTime!.value,dayId:controller.scheduleData[index].id!,);
                                              controller.callScheduleRequestApi(controller.scheduleData[index].day!, controller.scheduleData[index].localStartTime!.value, controller.scheduleData[index].localEndTime!.value,controller.scheduleData[index].id!);
                                              Get.back();
                                            },
                                            widget: SingleChildScrollView(
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: getMargin(
                                                      left: 1,
                                                      top: 0,
                                                      bottom: 5,
                                                      right: 1,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding: getPadding(
                                                            left: 20,
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                            MainAxisSize.min,
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text(
                                                                index == 0
                                                                    ? "lbl_monday".tr
                                                                    : index == 1
                                                                    ? 'Tuesday'
                                                                    : index == 2
                                                                    ? 'Wednesday'
                                                                    : index ==
                                                                    3
                                                                    ? 'Thursday'
                                                                    : index == 4
                                                                    ? 'Friday'
                                                                    : index == 5
                                                                    ? 'Saturday'
                                                                    : 'Sunday',
                                                                overflow: TextOverflow
                                                                    .ellipsis,
                                                                textAlign:
                                                                TextAlign.left,
                                                                style: AppStyle
                                                                    .txtPoppinsRegular14Black901,
                                                              ),
                                                              Padding(
                                                                padding: getPadding(
                                                                  top: 0,
                                                                ),
                                                                child: Text(
                                                                  "msg_7_00_am_4_30"
                                                                      .tr,
                                                                  overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                                  textAlign:
                                                                  TextAlign.left,
                                                                  style: AppStyle
                                                                      .txtPoppinsRegular12Gray600,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),

                                                        GestureDetector(
                                                          onTap: () {
                                                            Get.back();
                                                          },
                                                          child: Padding(
                                                            padding: getPadding(
                                                              top: 30,
                                                              right: 15,
                                                              bottom: 15,
                                                            ),
                                                            child: Text(
                                                              "lbl_current".tr,
                                                              overflow: TextOverflow
                                                                  .ellipsis,
                                                              textAlign:
                                                              TextAlign.left,
                                                              style: AppStyle
                                                                  .txtPoppinsRegular12Bluegray100
                                                                  .copyWith(
                                                                height: 1.00,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(height: 1,width: double.maxFinite,color: ColorConstant.gray400.withOpacity(0.3),),

                                                  Padding(
                                                    padding: getPadding(
                                                        top: 40,
                                                        right: 16,
                                                        left: 20,
                                                        bottom: 10),
                                                    child: Text(
                                                      "New Clock In ",
                                                      overflow: TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtPoppinsSemiBold14
                                                          .copyWith(
                                                          height: 1.00,
                                                          color: ColorConstant
                                                              .deepPurple400),
                                                    ),
                                                  ),
                                                  TimePicker(
                                                    onSelectTime: (time) {
                                                      controller.timeInAPi.value = time;
                                                      controller.scheduleData[index].localStartTime!.value = time;
                                                    },
                                                    initialTimeStr: controller.scheduleData[index].localStartTime!.value,
                                                    intialHours: Utils.convertTime(
                                                        controller.scheduleData[index].localStartTime!.value, 9).hour,
                                                  ),
                                                  Padding(
                                                    padding: getPadding(
                                                        top: 40,
                                                        right: 16,
                                                        left: 20,
                                                        bottom: 10),
                                                    child: Text(
                                                      "New Clock Out ",
                                                      overflow: TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtPoppinsSemiBold14
                                                          .copyWith(
                                                          height: 1.00,
                                                          color: ColorConstant
                                                              .deepPurple400),
                                                    ),
                                                  ),
                                                  TimePicker(
                                                    onSelectTime: (time) {
                                                      controller.timeOutAPi.value = time;
                                                      controller.scheduleData[index].localEndTime!.value = time;
                                                    },
                                                    initialTimeStr: controller.scheduleData[index].localEndTime!.value,
                                                    intialHours: Utils.convertTime(
                                                        controller.scheduleData[index].localEndTime!.value, 17).hour,
                                                  ),

                                                  CustomButton(
                                                      width: 343,
                                                      text: "lbl_submit_change".tr,
                                                      margin: getMargin(
                                                          left: 20,
                                                          top: 40,
                                                          right: 20,
                                                          bottom: 20),
                                                      onTap: () {
                                                        //controller.updateDays(day:controller.scheduleData[index].day!,startTime:controller.scheduleData[index].localStartTime!.value,endTime:controller.scheduleData[index].localEndTime!.value,dayId:controller.scheduleData[index].id!);
                                                        controller.callScheduleRequestApi(controller.scheduleData[index].day!, controller.scheduleData[index].localStartTime!.value, controller.scheduleData[index].localEndTime!.value,controller.scheduleData[index].id!);
                                                        Get.back();
                                                      },
                                                      padding:
                                                      ButtonPadding.PaddingAll18,
                                                      fontStyle: ButtonFontStyle
                                                          .PoppinsSemiBold16)
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          margin: getMargin(
                                            top: 4.875,
                                            bottom: 5.875,
                                          ),
                                          decoration: AppDecoration.simpleOutline
                                              .copyWith(
                                              borderRadius:
                                              BorderRadiusStyle.roundedBorder15),
                                          child: Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: getPadding(
                                                  left: 20,
                                                  top: 13,
                                                  bottom: 11,
                                                ),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: getPadding(
                                                        right: 10,
                                                      ),
                                                      child: Text(
                                                        controller.scheduleData[index].dayName!,
                                                        overflow:
                                                        TextOverflow.ellipsis,
                                                        textAlign: TextAlign.left,
                                                        style: AppStyle
                                                            .txtPoppinsRegular14Black901.copyWith(fontWeight: FontWeight.w600),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: getPadding(
                                                        top: 4,
                                                      ),
                                                      child: Obx(() => Text(
                                                        "${controller.scheduleData[index].localStartTime} - ${controller.scheduleData[index].localEndTime}",
                                                        overflow:
                                                        TextOverflow.ellipsis,
                                                        textAlign: TextAlign.left,
                                                        style: AppStyle
                                                            .txtPoppinsRegular12Gray600
                                                            .copyWith(
                                                            color: ColorConstant
                                                                .deepPurple400),
                                                      ),)
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Spacer(),
                                              Padding(
                                                  padding: getPadding(
                                                    right: 15,
                                                  ),
                                                  child: Icon(Icons.arrow_forward_ios_outlined,
                                                    color: ColorConstant.hintTextColor.withOpacity(0.8),
                                                    size: 20,
                                                  )
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    })),
                              ])));
                }))));

  }

}
