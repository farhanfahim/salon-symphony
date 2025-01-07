import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import '../../core/utils/responsive.dart';
import '../../widgets/custom_switch.dart';
import '../../widgets/response_binding_widget.dart';
import '../../widgets/widgetSkeleton.dart';
import '../schedule_requests_change_days_screen/controller/schedule_requests_change_days_controller.dart';
import 'controller/schedule_request_all_controller.dart';
import 'models/request_all_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

// ignore_for_file: must_be_immutable
class ScheduleRequestAllPage extends StatelessWidget {
  Responsive responsive = Responsive();
  ScheduleRequestAllController Reqcontroller =
      Get.put(ScheduleRequestAllController(ScheduleRequestAllModel().obs));
  ScheduleRequestsChangeDaysController controller =
      Get.put(ScheduleRequestsChangeDaysController());

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return BaseviewScreen(
        basicAppBar: true,
        screenName: "Schedule Request",
        showBottomBar: false,
        sidePadding: false,
        backgroundColor: ColorConstant.whiteA700,
        child: SafeArea(
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
                                Text("Schedule Request",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsRegular14Black901
                                        .copyWith(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 25)),
                                GestureDetector(
                                  onTap: () {
                                    // controller.openBottomSheet(context);
                                  },
                                  child: Container(
                                      margin: getMargin(left: 16, top: 15, right: 16),
                                      child: Text(
                                          " To request a schedule change, toggle on or off the days of the week you wish to modify below, then click Submit.",
                                          style: AppStyle.txtPoppinsRegular20
                                              .copyWith(
                                              letterSpacing: 0.5,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: ColorConstant.black900,
                                              height: 1.5),
                                        textAlign: TextAlign.center,
                                      ),

                                  ),
                                  // Container(
                                  //   width: getHorizontalSize(339.00),
                                  //   margin:
                                  //       getMargin(left: 16, top: 15, right: 16),
                                  //   child: RichText(
                                  //       text: TextSpan(children: [
                                  //     TextSpan(
                                  //         text: "",
                                  //         style: AppStyle.txtPoppinsSemiBold20
                                  //             .copyWith(
                                  //                 letterSpacing: 0.5,
                                  //                 fontSize: 12,
                                  //                 fontWeight: FontWeight.w500)),
                                  //     TextSpan(
                                  //         text:
                                  //             "To request a schedule change, toggle on or off the days of the week you wish to modify below.",
                                  //         style: AppStyle.txtPoppinsRegular20
                                  //             .copyWith(
                                  //                 letterSpacing: 0.5,
                                  //                 fontSize: 12,
                                  //                 fontWeight: FontWeight.w500,
                                  //                 color: ColorConstant.black900,
                                  //                 height: 1.5)),
                                  //   ])),
                                  // ),
                                ),
                                ListView.builder(
                                    itemCount:
                                        controller.scheduleData.value.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    // reverse: true,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          // controller.openBottomSheet(
                                          //     context,
                                          //     controller.scheduleData
                                          //         .value[index].dayName!,
                                          //     index);
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
                                                                    .scheduleData
                                                                    .value[
                                                                        index]
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
                                                                    .scheduleData
                                                                    .value[
                                                                        index]
                                                                    .localAvailability ==
                                                                20
                                                            ? Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            20,
                                                                        bottom:
                                                                            10,
                                                                        top: 5),
                                                                child: Text(
                                                                    'ON',
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
                                                                        left:
                                                                            20,
                                                                        bottom:
                                                                            10,
                                                                        top: 5),
                                                                child: Text(
                                                                    'OFF',
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
                                                                  .scheduleData[
                                                                      index]
                                                                  .localAvailability!
                                                                  .value ==
                                                              10
                                                          ? false
                                                          : true,
                                                      onChanged: (value) {
                                                        controller
                                                            .scheduleData[index]
                                                            .localAvailability!
                                                            .value = value ? 20 : 10;

                                                        controller
                                                            .openBottomSheet(
                                                                context,
                                                                controller
                                                                    .scheduleData
                                                                    .value[
                                                                        index]
                                                                    .dayName!,
                                                                index);

                                                        // controller.callScheduleRequestApi(controller.scheduleData[index].day!,controller.scheduleData[index].localAvailability!.value);
                                                      }))
                                                ])),
                                      );
                                    }),
                              ])));
                    })))));
  }
}
