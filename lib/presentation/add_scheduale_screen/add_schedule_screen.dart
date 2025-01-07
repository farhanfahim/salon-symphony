import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salon_symphony/baseviews/baseview_auth_screen.dart';
import 'package:salon_symphony/core/utils/app_constant.dart';
import 'package:salon_symphony/core/utils/responsive.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import 'package:salon_symphony/widgets/response_binding_widget.dart';
import 'package:salon_symphony/widgets/widgetSkeleton.dart';
import '../../core/utils/helper_functions.dart';
import '../../widgets/custom_switch.dart';
import '../../widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_button.dart';
import '../../widgets/time_picker.dart';
import 'controller/add_schedule_controller.dart';

class AddScheduleScreen extends GetWidget<AddScheduleController> {
  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return GestureDetector(
      onTap: () {
        Utils.hideKeyboard(context);
      },
      child: BaseviewAuthScreen(
        child: Obx(() => ResponseBindingWidget(
            apiCallStatus: controller.apiCallStatus.value,
            errorWidget: () {
              return Container();
            },
            loadingWidget: () {
              return Column(
                children: [
                  scheduleShimmer(),
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
                    style:
                        AppStyle.txtPoppinsBold16.copyWith(fontSize: 20.0.sp),
                  ),
                ),
              );
            },
            successWidget: () {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: ColorConstant.backgroundColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 18.0,
                          left: 15,
                          right: 15,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: CommonImageView(
                                    svgPath: ImageConstant.imgArrowleft,
                                    color: ColorConstant.hintTextColor,
                                  ),
                                ),
                                SizedBox(
                                  width: responsive.setWidth(23),
                                ),
                                Center(
                                  child: MyText(
                                    title: '${'Create Account'}',
                                    weight: 'Semi Bold',
                                    fontSize: responsive.setTextScale(16),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: responsive.setHeight(2),
                    ),
                    Center(
                      child: MyText(
                        title: "Add Schedule",
                        fontSize: responsive.setTextScale(30),
                        weight: 'Semi Bold',
                      ),
                    ),
                    SizedBox(
                      height: responsive.setHeight(1),
                    ),
                    Center(
                      child: MyText(
                        title: "And lastly, toggle on the days you work.",
                        clr: ColorConstant.black900,
                      ),
                    ),
                    Padding(
                        padding: getPadding(left: 10, top: 10, right: 10),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ListView.builder(
                                  itemCount:
                                      controller.addScheduleData.value.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  reverse: true,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        openBottomSheet(
                                            context, "lbl_monday".tr, index);
                                      },
                                      child: Container(
                                          margin: getMargin(
                                              left: 16, top: 10, right: 16),
                                          decoration: AppDecoration
                                              .simpleOutline
                                              .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder15),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Obx(
                                                  () => Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 20,
                                                              top: 10),
                                                          child: Text(
                                                              controller
                                                                  .addScheduleData
                                                                  .value[index]
                                                                  .dayName
                                                                  .toString(),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtPoppinsRegular14Black901
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          15))),
                                                      controller
                                                                  .addScheduleData
                                                                  .value[index]
                                                                  .localAvailability!.value == AppConstant.YES
                                                          ? Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 20,
                                                                      bottom:
                                                                          10,
                                                                      top: 5),
                                                              child: Text(
                                                                  '${controller.addScheduleData.value[index].startTime} - ${controller.addScheduleData.value[index].endTime}',
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      TextStyle(
                                                                    color: ColorConstant
                                                                        .primaryColor,
                                                                    fontSize:
                                                                        getFontSize(
                                                                      14,
                                                                    ),
                                                                    fontFamily: Platform
                                                                            .isIOS
                                                                        ? 'SF Pro Display'
                                                                        : 'Roboto',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  )))
                                                          : Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 20,
                                                                      bottom:
                                                                          10,
                                                                      top: 5),
                                                              child: Text('OFF',
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtPoppinsRegular14Black901
                                                                      .copyWith(
                                                                    color: ColorConstant
                                                                        .hintTextColor,
                                                                  ))),
                                                    ],
                                                  ),
                                                ),
                                                Obx(() => CustomSwitch(
                                                    margin: getMargin(
                                                        top: 10,
                                                        right: 15,
                                                        bottom: 10),
                                                    value: controller
                                                                .addScheduleData[
                                                                    index]
                                                        .localAvailability!.value == AppConstant.NO
                                                        ? false
                                                        : true,
                                                    onChanged: (value) {
                                                      controller
                                                              .addScheduleData[
                                                                  index]
                                                              .localAvailability!
                                                              .value =
                                                          value ? AppConstant.YES : AppConstant.NO;
                                                      print(controller
                                                          .addScheduleData[
                                                              index]
                                                          .localAvailability!
                                                          .value);

                                                      if (controller
                                                              .addScheduleData[
                                                                  index]
                                                          .localAvailability!.value == AppConstant.YES) {
                                                        controller.enableButton
                                                            .value = true;
                                                        controller
                                                            .switchValue.value
                                                            .add(index);
                                                        openBottomSheet(
                                                                context,
                                                                "lbl_monday".tr,
                                                                index);
                                                      } else if (controller
                                                              .addScheduleData[
                                                                  index]
                                                          .localAvailability!.value == AppConstant.NO) {
                                                        controller.enableButton
                                                            .value = false;
                                                        if (controller
                                                                .switchValue
                                                                .value
                                                                .length >
                                                            0) {
                                                          controller
                                                              .switchValue.value
                                                              .remove(index);
                                                        }
                                                        ;
                                                      }
                                                      controller.updateDays(
                                                        index: index,
                                                        startTime: controller
                                                            .addScheduleData[
                                                                index]
                                                            .startTime!,
                                                        endTime: controller
                                                            .addScheduleData[
                                                                index]
                                                            .endTime!,
                                                        day: controller
                                                            .addScheduleData[
                                                                index]
                                                            .day!,
                                                        dayId: controller
                                                            .addScheduleData[
                                                                index]
                                                            .id!,
                                                      );
                                                      // controller.addScheduleList();
                                                    }))
                                              ])),
                                    );
                                  }),
                              Obx(
                                () => controller.enableButton.value == true
                                    ? CustomButton(
                                        width:double.maxFinite,
                                        text: "Finish",
                                        margin: getMargin(
                                            left: 16, top: 20, right: 16),
                                        padding: ButtonPadding.PaddingAll18,
                                        fontStyle:
                                            ButtonFontStyle.PoppinsSemiBold16,
                                        alignment: Alignment.center,
                                        onTap: () {
                                          Get.offAllNamed(AppRoutes.dashboardRoute);
                                        },
                                      )
                                    : CustomButton(
                                        width: double.maxFinite,
                                        margin: getMargin(
                                            left: 16, top: 20, right: 16),
                                        text: "Finish",
                                        padding: ButtonPadding.PaddingAll18,
                                        fontStyle:
                                            ButtonFontStyle.PoppinsSemiBold16,
                                        variant: ButtonVariant.FillIndigo50,
                                        alignment: Alignment.center,
                                      ),
                              ),
                              SizedBox(
                                height: getSize(20),
                              ),
                            ])),
                  ],
                ),
              );
            })),
      ),
    );
  }
  Future<dynamic> openBottomSheet(context, String day, int index) async {
    Responsive responsive = Responsive();
    responsive.setContext(context);
    HelperFunction.showBottomSheet(
      context,
      bottomSheetHeight: responsive.setHeight(85),
      isScrollControlled: true,
      spaceBetween: responsive.setHeight(4),
      screenTitle: "Add Shift",
      redclrEndTask: false,
      screenEndTask: "Done",
      onTap: () {
        controller.updateDays(
          index: index,
          day: controller.addScheduleData[index].day!,
          startTime: controller.addScheduleData[index].startTime!,
          endTime: controller.addScheduleData[index].endTime!,
          dayId: controller.addScheduleData[index].id!,
        );
        Get.back();
      },
      widget: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: getMargin(
                left: 1,
                top: 15,
                right: 20,
              ),
              decoration: AppDecoration.outlineBluegray100.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: getPadding(
                      left: 20,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          day,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsRegular14Black901,
                        ),
                        Padding(
                          padding: getPadding(
                            top: 0,
                          ),
                          child: Text(
                            "You work this day.",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsRegular12Gray600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(() => CustomSwitch(
                      margin: getMargin(top: 10, right: 15, bottom: 10),
                      value:
                      controller.addScheduleData[index].localAvailability!.value == AppConstant.NO
                          ? false
                          : true,
                      onChanged: (value) {
                        controller.addScheduleData[index].localAvailability!.value =
                        value ? AppConstant.YES : AppConstant.NO;
                        if (controller.addScheduleData[index].localAvailability!.value == AppConstant.YES) {
                          controller.enableButton.value = true;
                          controller.switchValue.value.add(index);
                        } else if (controller.addScheduleData[index]
                            .localAvailability!.value == AppConstant.NO) {
                          controller.enableButton.value = false;
                          if (controller.switchValue.value.length > 0) {
                            controller.switchValue.value.remove(index);
                          }
                          ;
                        }
                        controller.updateDays(
                          index: index,
                          day: controller.addScheduleData[index].day!,
                          startTime: controller.addScheduleData[index].startTime!,
                          endTime: controller.addScheduleData[index].endTime!,
                          dayId: controller.addScheduleData[index].id!,
                        );
                      }))
                ],
              ),
            ),
            SizedBox(
              height: responsive.setHeight(3),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Container(
                    height: 50,
                    decoration: AppDecoration.simpleOutline.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder5,
                      color: Color(0xffF7F8FA),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 18.0, top: 20, bottom: 10, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "lbl_clock_in".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsSemiBold14.copyWith(
                            height: 1.00,
                            color: ColorConstant.black900,
                            fontSize: 16),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Expanded(
                        child: TimePicker(
                          onSelectTime: (time) {
                            controller.timeInAPi.value = time;
                            controller.addScheduleData[index].startTime = time;
                          },
                          initialTimeStr: controller.addScheduleData[index].startTime!,
                          intialHours: Utils.convertTime(
                              controller.addScheduleData[index].startTime!, 9).hour,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: responsive.setHeight(2),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: ColorConstant.gray100,
            ),
            SizedBox(
              height: responsive.setHeight(2),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Container(
                    height: 50,
                    decoration: AppDecoration.simpleOutline.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder5,
                      color: Color(0xffF7F8FA),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 18.0, top: 10, bottom: 10, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "lbl_clock_out".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsSemiBold14.copyWith(
                            height: 1.00,
                            color: ColorConstant.black900,
                            fontSize: 16),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Expanded(
                          child: TimePicker(
                            onSelectTime: (time) {
                              Future<dynamic> openBottomSheet(context, String day, int index) async {
                                Responsive responsive = Responsive();
                                responsive.setContext(context);
                                HelperFunction.showBottomSheet(
                                  context,
                                  bottomSheetHeight: responsive.setHeight(85),
                                  isScrollControlled: true,
                                  spaceBetween: responsive.setHeight(4),
                                  screenTitle: "Add Shift",
                                  redclrEndTask: false,
                                  screenEndTask: "Done",
                                  onTap: () {
                                    controller.updateDays(
                                      index: index,
                                      day: controller.addScheduleData[index].day!,
                                      startTime: controller.addScheduleData[index].startTime!,
                                      endTime: controller.addScheduleData[index].endTime!,
                                      dayId: controller.addScheduleData[index].id!,
                                    );
                                    Get.back();
                                  },
                                  widget: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: getMargin(
                                            left: 1,
                                            top: 15,
                                            right: 20,
                                          ),
                                          decoration: AppDecoration.outlineBluegray100.copyWith(
                                            borderRadius: BorderRadiusStyle.roundedBorder5,
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: getPadding(
                                                  left: 20,
                                                ),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      day,
                                                      overflow: TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle.txtPoppinsRegular14Black901,
                                                    ),
                                                    Padding(
                                                      padding: getPadding(
                                                        top: 0,
                                                      ),
                                                      child: Text(
                                                        "You work this day.",
                                                        overflow: TextOverflow.ellipsis,
                                                        textAlign: TextAlign.left,
                                                        style: AppStyle.txtPoppinsRegular12Gray600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Obx(() => CustomSwitch(
                                                  margin: getMargin(top: 10, right: 15, bottom: 10),
                                                  value:
                                                  controller.addScheduleData[index].localAvailability!.value == 10
                                                      ? false
                                                      : true,
                                                  onChanged: (value) {
                                                    controller.addScheduleData[index].localAvailability!.value =
                                                    value ? 20 : 10;
                                                    if (controller.addScheduleData[index].localAvailability!.value ==
                                                        20) {
                                                      controller.enableButton.value = true;
                                                      controller.switchValue.value.add(index);
                                                    } else if (controller.addScheduleData[index]
                                                        .localAvailability!
                                                        .value ==
                                                        10) {
                                                      controller.enableButton.value = false;
                                                      if (controller.switchValue.value.length > 0) {
                                                        controller.switchValue.value.remove(index);
                                                      }
                                                      ;
                                                    }
                                                    controller.updateDays(
                                                      index: index,
                                                      day: controller.addScheduleData[index].day!,
                                                      startTime: controller.addScheduleData[index].startTime!,
                                                      endTime: controller.addScheduleData[index].endTime!,
                                                      dayId: controller.addScheduleData[index].id!,
                                                    );
                                                  }))
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: responsive.setHeight(3),
                                        ),
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 20.0),
                                              child: Container(
                                                height: 50,
                                                decoration: AppDecoration.simpleOutline.copyWith(
                                                  borderRadius: BorderRadiusStyle.roundedBorder5,
                                                  color: Color(0xffF7F8FA),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18.0, top: 20, bottom: 10, right: 20),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "lbl_clock_in".tr,
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle.txtPoppinsSemiBold14.copyWith(
                                                        height: 1.00,
                                                        color: ColorConstant.black900,
                                                        fontSize: 16),
                                                  ),
                                                  SizedBox(
                                                    width: 50,
                                                  ),
                                                  Expanded(
                                                    child: TimePicker(
                                                      onSelectTime: (time) {
                                                        controller.timeInAPi.value = time;
                                                        controller.addScheduleData[index].startTime = time;
                                                      },
                                                      initialTimeStr: controller.addScheduleData[index].startTime!,
                                                      intialHours: Utils.convertTime(
                                                          controller.addScheduleData[index].startTime!, 9).hour,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: responsive.setHeight(2),
                                        ),
                                        Divider(
                                          height: 1,
                                          thickness: 1,
                                          color: ColorConstant.gray100,
                                        ),
                                        SizedBox(
                                          height: responsive.setHeight(2),
                                        ),
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 20.0),
                                              child: Container(
                                                height: 50,
                                                decoration: AppDecoration.simpleOutline.copyWith(
                                                  borderRadius: BorderRadiusStyle.roundedBorder5,
                                                  color: Color(0xffF7F8FA),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18.0, top: 10, bottom: 10, right: 20),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "lbl_clock_out".tr,
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle.txtPoppinsSemiBold14.copyWith(
                                                        height: 1.00,
                                                        color: ColorConstant.black900,
                                                        fontSize: 16),
                                                  ),
                                                  SizedBox(
                                                    width: 50,
                                                  ),
                                                  Expanded(
                                                      child: TimePicker(
                                                        onSelectTime: (time) {
                                                          controller.timeOutAPi.value = time;
                                                          controller.addScheduleData[index].endTime = time;
                                                        },
                                                        initialTimeStr: controller.addScheduleData[index].endTime!,
                                                        intialHours: Utils.convertTime(
                                                            controller.addScheduleData[index].endTime!, 17).hour,
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: responsive.setHeight(3),
                                        ),
                                        CustomButton(
                                            width: double.maxFinite,
                                            text: 'Save Hours',
                                            margin: getMargin(left: 0, top: 40, right: 20, bottom: 20),
                                            onTap: () {
                                              controller.updateDays(
                                                index: index,
                                                day: controller.addScheduleData[index].day!,
                                                startTime: controller.addScheduleData[index].startTime!,
                                                endTime: controller.addScheduleData[index].endTime!,
                                                dayId: controller.addScheduleData[index].id!,
                                              );
                                              Get.back();
                                              //
                                            },
                                            padding: ButtonPadding.PaddingAll18,
                                            fontStyle: ButtonFontStyle.PoppinsSemiBold16)
                                      ],
                                    ),
                                  ),
                                );
                              }
                              controller.timeOutAPi.value = time;
                              controller.addScheduleData[index].endTime = time;
                            },
                            initialTimeStr: controller.addScheduleData[index].endTime!,
                            intialHours: Utils.convertTime(
                                controller.addScheduleData[index].endTime!, 17).hour,
                          )),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: responsive.setHeight(3),
            ),
            CustomButton(
                width: double.maxFinite,
                text: 'Save Hours',
                margin: getMargin(left: 0, top: 40, right: 20, bottom: 20),
                onTap: () {
                  controller.updateDays(
                    index: index,
                    day: controller.addScheduleData[index].day!,
                    startTime: controller.addScheduleData[index].startTime!,
                    endTime: controller.addScheduleData[index].endTime!,
                    dayId: controller.addScheduleData[index].id!,
                  );
                  Get.back();
                  //
                },
                padding: ButtonPadding.PaddingAll18,
                fontStyle: ButtonFontStyle.PoppinsSemiBold16)
          ],
        ),
      ),
    );
  }

}

