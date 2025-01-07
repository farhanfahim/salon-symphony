import 'dart:io';
import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/core/utils/app_constant.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import '../../core/utils/helper_functions.dart';
import '../../core/utils/responsive.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/error_widget.dart';
import '../../widgets/response_binding_widget.dart';
import '../../widgets/skeleton.dart';
import '../chat_module/create_chat/create_chat.dart';
import 'controller/goal_details_active_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

class GoalDetailsActiveScreen extends GetWidget<GoalDetailsActiveController> {
  Responsive responsive = Responsive();
  Map<String, dynamic> map = Get.arguments;

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return BaseviewScreen(
      showBottomBar: false,
      basicAppBar: true,
      sidePadding: false,
      screenName: 'Goal Details',
      mainTopHeight: 0,
      isMenuTab: true,
      basicAppTrailingIcon: ImageConstant.imgMenuIcon,
      backgroundColor: ColorConstant.backgroundColor,
      basicAppTrailingIconOnTap: () {
        HelperFunction.showBottomSheet(context,
            screenTitle: 'Goal Options',
            redclrEndTask: false,
            screenEndTask: 'Done',
            bottomSheetHeight:
                controller.selectedId.value == AppConstant.ACHIEVED ||
                        controller.selectedId.value == AppConstant.MISSED ||
            DateTime.parse(controller.goalData!.value.endDate!).isAfter(DateTime.now())
                    ? 250
                    : 200,
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                controller.selectedId.value == AppConstant.ACHIEVED ||
                        controller.selectedId.value == AppConstant.MISSED ||
                DateTime.parse(controller.goalData!.value.endDate!).isAfter(DateTime.now())

            ? GestureDetector(
                        onTap: () {
                          Get.back();
                          if (controller.goalData!.value.type ==
                              AppConstant.WEEKLY) {
                            Get.toNamed(AppRoutes.createWeeklyGoalScreen,
                                    arguments: {"isEditingGoal": true})
                                ?.then((value) {
                              controller.getGoals();
                            });
                          } else if (controller.goalData!.value.type ==
                              AppConstant.MONTHLY) {
                            Get.toNamed(AppRoutes.createMonthlyGoalScreen,
                                    arguments: {"isEditingGoal": true})
                                ?.then((value) {
                              controller.getGoals();
                            });
                          } else if (controller.goalData!.value.type ==
                              AppConstant.ANNUALLY) {
                            Get.toNamed(AppRoutes.createAnnualGoalScreen,
                                    arguments: {"isEditingGoal": true})
                                ?.then((value) {
                              controller.getGoals();
                            });
                          } else {
                            Get.toNamed(AppRoutes.createCustomGoalScreen,
                                    arguments: {"isEditingGoal": true})
                                ?.then((value) {
                              controller.getGoals();
                            });
                          }

                          // Utils.showToast("Will be handle in beta sprint 3", false);
                        },
                        child: Row(
                          children: [
                            CommonImageView(
                              svgPath: ImageConstant.black_edit,
                              height: 17,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Edit goal',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(
                                    16,
                                  ),
                                  letterSpacing: 0.5,
                                  fontFamily: Platform.isIOS
                                      ? 'SF Pro Display'
                                      : 'Roboto',
                                  fontWeight: FontWeight.w400,
                                )),
                          ],
                        ),
                      ):Offstage(),
                controller.selectedId.value == AppConstant.ACHIEVED ||
                        controller.selectedId.value == AppConstant.MISSED
            ||DateTime.parse(controller.goalData!.value.endDate!).isAfter(DateTime.now())
            ?  SizedBox(
                        height: 30,
                      ):Offstage(),
                GestureDetector(
                  onTap: () {
                    String deepLink = '${AppConstant.shareBaseUrl}/goals/details/${controller.goalData!.value.id}';
                    // String deepLink =
                    //     '${AppConstant.shareBaseUrl}?goalsId=${controller.goalData!.value.id}&type=${map['type']}&userStatusId=${map['userStatusId']}';
                    // await Clipboard.setData(ClipboardData(text: deepLink));
                    Utils.share(deepLink);
                    Get.back();
                  },
                  child: Row(
                    children: [
                      CommonImageView(
                        imagePath: ImageConstant.share_icon,
                        height: 17,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Share goal',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: getFontSize(
                              16,
                            ),
                            letterSpacing: 0.5,
                            fontFamily:
                                Platform.isIOS ? 'SF Pro Display' : 'Roboto',
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    HelperFunction.showBottomSheet(context,
                        screenTitle: '',
                        screenEndTask: '',
                        color: Colors.transparent,
                        bottomSheetHeight: 460,
                        widget: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorConstant.whiteA700,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: ColorConstant.gray100,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(50),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: CommonImageView(
                                          svgPath: ImageConstant.img_delete,
                                          height: 30,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10),
                                      child: MyText(
                                        title:
                                            'Are you sure you want to \ndelete this goal?',
                                        clr: ColorConstant.black900,
                                        fontSize: 20,
                                        letterSpacing: 0.5,
                                        weight: 'Bold',
                                        center: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  controller.cancelGoals();
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: ColorConstant.whiteA700,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: MyText(
                                        title: 'Yes, Delete',
                                        clr: ColorConstant.errorColor,
                                        weight: 'Semi Bold',
                                        fontSize: 16,
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: ColorConstant.whiteA700,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: MyText(
                                        title: 'No, Keep',
                                        clr: ColorConstant.hintTextColor,
                                        fontSize: 16,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ));
                  },
                  child: Row(
                    children: [
                      CommonImageView(
                        svgPath: ImageConstant.img_delete,
                        height: 17,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Delete goal',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: ColorConstant.redA200,
                            fontSize: getFontSize(
                              16,
                            ),
                            letterSpacing: 0.5,
                            fontFamily:
                                Platform.isIOS ? 'SF Pro Display' : 'Roboto',
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                ),
              ],
            ));
      },
      child: Obx(() => ResponseBindingWidget(
          apiCallStatus: controller.apiCallStatus.value,
          errorWidget: () {
            return RecordDeletedWidget();
          },
          loadingWidget: () {
            return Column(
              children: [
                Container(
                    // width: getHorizontalSize(343.00),
                    padding: getPadding(left: 10, top: 5, right: 10),
                    decoration: AppDecoration.outlineBlack9000a1.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder10),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: getPadding(left: 5),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 100.0,
                                      height: 15.0,
                                      child: Skeleton(
                                        switcholor: true,
                                      ),
                                    ),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: SizedBox(
                                          width: 100.0,
                                          height: 15.0,
                                          child: Skeleton(
                                            switcholor: true,
                                          ),
                                        ))
                                  ])),
                          Padding(
                              padding: getPadding(left: 5, top: 4),
                              child: SizedBox(
                                width: 100.0,
                                height: 15.0,
                                child: Skeleton(
                                  switcholor: true,
                                ),
                              )),
                          SizedBox(
                            height: 20,
                          )
                        ])),
                Container(
                  margin: getMargin(top: 15),
                  padding: getPadding(left: 17, top: 30, right: 17, bottom: 36),
                  decoration: AppDecoration.outlineBlack9000a1.copyWith(
                      // borderRadius: BorderRadiusStyle.roundedBorder10
                      ),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 100.0,
                              height: 15.0,
                              child: Skeleton(
                                switcholor: true,
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                              width: 100.0,
                              height: 15.0,
                              child: Skeleton(
                                switcholor: true,
                              ),
                            )
                          ]),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 100.0,
                              height: 15.0,
                              child: Skeleton(
                                switcholor: true,
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                              width: 100.0,
                              height: 15.0,
                              child: Skeleton(
                                switcholor: true,
                              ),
                            )
                          ]),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 100.0,
                              height: 15.0,
                              child: Skeleton(
                                switcholor: true,
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                              width: 100.0,
                              height: 15.0,
                              child: Skeleton(
                                switcholor: true,
                              ),
                            )
                          ]),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 100.0,
                              height: 15.0,
                              child: Skeleton(
                                switcholor: true,
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                              width: 100.0,
                              height: 15.0,
                              child: Skeleton(
                                switcholor: true,
                              ),
                            )
                          ]),
                    ],
                  ),
                ),
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
                ),
              ),
            );
          },
          successWidget: () {
            return Container(
                width: size.width,
                child: SingleChildScrollView(
                    child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.topCenter,
                        children: [
                  Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: double.infinity,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Align(
                                  //     alignment: Alignment.center,
                                  //     child: Padding(
                                  //         padding: getPadding(
                                  //             left: 16, top: 0, right: 16),
                                  //         child: Row(
                                  //             mainAxisAlignment:
                                  //             MainAxisAlignment.spaceBetween,
                                  //             crossAxisAlignment:
                                  //             CrossAxisAlignment.end,
                                  //             mainAxisSize: MainAxisSize.max,
                                  //             children: [
                                  //               Padding(
                                  //                   padding: getPadding(
                                  //                       top: 0, bottom: 4),
                                  //                   child: Obx(() => Text(
                                  //                       "STATUS: ${controller.selectedId.value == AppConstant.ACTIVE ? "ACTIVE" : controller.selectedId.value == AppConstant.ACHIEVED ? "ACHIEVED" : "MISSED"}",
                                  //                       overflow:
                                  //                       TextOverflow.ellipsis,
                                  //                       textAlign: TextAlign.left,
                                  //                       style: TextStyle(
                                  //                         color: ColorConstant
                                  //                             .hintTextColor,
                                  //                         fontSize: 12,
                                  //                         fontFamily: Platform
                                  //                             .isIOS
                                  //                             ? 'SF Pro Display'
                                  //                             : 'Roboto',
                                  //                         fontWeight:
                                  //                         FontWeight.w300,
                                  //                       )))),
                                  //               // controller.active == true?
                                  //             ]))),
                                  Padding(
                                      padding: getPadding(left: 15, right: 15),
                                      child: Obx(() => Text(
                                          "${controller.goalData!.value.name != null ? controller.goalData!.value.name! : "-"}",
                                          // overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: ColorConstant.black900,
                                            fontSize: 21,
                                            fontFamily: Platform.isIOS
                                                ? 'SF Pro Display'
                                                : 'Roboto',
                                            fontWeight: FontWeight.w700,
                                          )))),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    height: 15,
                                    width: double.maxFinite,
                                    color: ColorConstant.seperateColor,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                      padding: getPadding(
                                          left: 15,
                                          top: 12,
                                          right: 15,
                                          bottom: 5),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text("Target Value",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: ColorConstant.gray901,
                                                  fontSize: 14,
                                                  fontFamily: Platform.isIOS
                                                      ? 'SF Pro Display'
                                                      : 'Roboto',
                                                  fontWeight: FontWeight.w600,
                                                ).copyWith(height: 1.00)),
                                            Obx(() => Text(
                                                "${controller.goalData!.value.targetType== 10 ? "\$" :controller.goalData!.value.targetType== 20 ? "\%" :'' }${controller.goalData!.value.targetValue != null ? controller.goalData!.value.targetValue! : "-"}",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: ColorConstant.gray901,
                                                  fontSize: 14,
                                                  fontFamily: Platform.isIOS
                                                      ? 'SF Pro Display'
                                                      : 'Roboto',
                                                  fontWeight: FontWeight.w600,
                                                ).copyWith(height: 1.00)))
                                          ])),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    height: 1,
                                    width: double.maxFinite,
                                    color: ColorConstant.gray200,
                                  ),
                                  Padding(
                                      padding: getPadding(
                                          left: 15,
                                          top: 6,
                                          right: 15,
                                          bottom: 4),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text("Target Date",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: ColorConstant.gray901,
                                                  fontSize: 14,
                                                  fontFamily: Platform.isIOS
                                                      ? 'SF Pro Display'
                                                      : 'Roboto',
                                                  fontWeight: FontWeight.w600,
                                                ).copyWith(height: 1.00)),
                                            Obx(() => Text(
                                                controller.goalData!.value
                                                            .endDate !=
                                                        null
                                                    ? Utils.getFormatedDate(
                                                        controller.goalData!
                                                            .value.endDate!)
                                                    : "-",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: ColorConstant.gray901,
                                                  fontSize: 14,
                                                  fontFamily: Platform.isIOS
                                                      ? 'SF Pro Display'
                                                      : 'Roboto',
                                                  fontWeight: FontWeight.w600,
                                                ).copyWith(height: 1.00)))
                                          ])),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    height: 1,
                                    width: double.maxFinite,
                                    color: ColorConstant.gray200,
                                  ),
                                  Padding(
                                      padding: getPadding(
                                          left: 15,
                                          top: 6,
                                          right: 15,
                                          bottom: 4),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text("lbl_repeat_goal".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: ColorConstant.gray901,
                                                  fontSize: 14,
                                                  fontFamily: Platform.isIOS
                                                      ? 'SF Pro Display'
                                                      : 'Roboto',
                                                  fontWeight: FontWeight.w600,
                                                ).copyWith(height: 1.00)),
                                            Obx(() => Text(
                                                controller.goalData!.value
                                                            .duration !=
                                                        null
                                                    ? controller.goalData!.value
                                                        .durationName!
                                                        .toString()
                                                    : "-",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: ColorConstant.gray901,
                                                  fontSize: 14,
                                                  fontFamily: Platform.isIOS
                                                      ? 'SF Pro Display'
                                                      : 'Roboto',
                                                  fontWeight: FontWeight.w600,
                                                ).copyWith(height: 1.00)))
                                          ])),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    height: 1,
                                    width: double.maxFinite,
                                    color: ColorConstant.gray200,
                                  ),
                                  Padding(
                                      padding: getPadding(
                                          left: 15, top: 6, right: 15),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Obx(() => Text("Goal Status",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: controller.selectedId
                                                              .value ==
                                                          AppConstant.ACHIEVED
                                                      ? ColorConstant.gray901
                                                      : controller.selectedId
                                                                  .value ==
                                                              AppConstant.MISSED
                                                          ? ColorConstant
                                                              .pink500
                                                          : ColorConstant
                                                              .gray901,
                                                  fontSize: 14,
                                                  fontFamily: Platform.isIOS
                                                      ? 'SF Pro Display'
                                                      : 'Roboto',
                                                  fontWeight: FontWeight.w600,
                                                ).copyWith(height: 1.00))),
                                            Obx(() => Text(
                                                controller.goalData!.value.userStatus!.updatedAt !=
                                                        null
                                                    ? controller.selectedId.value == AppConstant.ACTIVE
                                                        ? "Active"
                                                        : "${controller.selectedId.value == AppConstant.ACHIEVED ? "Achieved" : "Missed"} (${Utils.getFormatedDate(controller.goalData!.value.userStatus!.updatedAt!)})"
                                                    : controller.selectedId.value ==
                                                            AppConstant.ACTIVE
                                                        ? "Active"
                                                        : "${controller.selectedId.value == AppConstant.ACHIEVED ? "Achieved" : "Missed"} (${Utils.getFormatedDate(controller.goalData!.value.userStatus!.createdAt!)})",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: controller.selectedId
                                                              .value ==
                                                          AppConstant.ACHIEVED
                                                      ? ColorConstant.gray901
                                                      : controller.selectedId
                                                                  .value ==
                                                              AppConstant.MISSED
                                                          ? ColorConstant
                                                              .pink500
                                                          : ColorConstant
                                                              .gray901,
                                                  fontSize: 14,
                                                  fontFamily: Platform.isIOS
                                                      ? 'SF Pro Display'
                                                      : 'Roboto',
                                                  fontWeight: FontWeight.w600,
                                                ).copyWith(height: 1.00)))
                                          ])),
                                  SizedBox(
                                    height: 50,
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Column(
                                      children: [
                                        Obx(
                                          () => GestureDetector(
                                            onTap: () {
                                              HelperFunction.showBottomSheet(
                                                context,
                                                bottomSheetHeight: 320,
                                                spaceBetween:
                                                    responsive.setHeight(4),
                                                screenTitle: 'Goals Status',
                                                screenEndTask: "Done",
                                                onTap: () {
                                                  Get.back();
                                                  // Get.back();
                                                },
                                                widget: ListView(
                                                  children: [
                                                    InkWell(
                                                      splashFactory: NoSplash
                                                          .splashFactory,
                                                      onTap: () {
                                                        controller
                                                            .updateTaskStatus(
                                                                AppConstant
                                                                    .ACTIVE);
                                                        controller.active
                                                            .value = true;
                                                        Get.back();
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          bottom: responsive
                                                              .setHeight(1),
                                                          right: 20.0,
                                                          top: responsive
                                                              .setHeight(1),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      bottom:
                                                                          20.0),
                                                              child:
                                                                  CommonImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .clock_purple,
                                                                height: 15,
                                                                width: 14,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: responsive
                                                                  .setWidth(4),
                                                            ),
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                MyText(
                                                                  title:
                                                                      'ACTIVE',
                                                                  weight:
                                                                      'Semi Bold',
                                                                ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                MyText(
                                                                  title:
                                                                      'This goal is still in progress.',
                                                                  clr: ColorConstant
                                                                      .hintTextColor,
                                                                  fontSize: responsive
                                                                      .setTextScale(
                                                                          13),
                                                                ),
                                                              ],
                                                            ),
                                                            Spacer(),
                                                            Obx(() =>
                                                            controller.selectedId.value == AppConstant.ACTIVE
                                                                ? Container(
                                                              margin:
                                                              getMargin(
                                                                //   top: 15,
                                                                right: 5,
                                                                //   bottom: 15,
                                                              ),
                                                              decoration:
                                                              AppDecoration
                                                                  .outlineBluegray100
                                                                  .copyWith(
                                                                borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder10,
                                                                border: Border
                                                                    .all(
                                                                  color: ColorConstant
                                                                      .primaryColor,
                                                                ),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Container(
                                                                    height:
                                                                    getSize(
                                                                      15.00,
                                                                    ),
                                                                    width:
                                                                    getSize(
                                                                      15.00,
                                                                    ),
                                                                    margin:
                                                                    getMargin(
                                                                      all: 1,
                                                                    ),
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      color: ColorConstant
                                                                          .primaryColor,
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
                                                              margin:
                                                              getMargin(
                                                                // top: 15,
                                                                right: 5,
                                                                // bottom: 15,
                                                              ),
                                                              decoration:
                                                              AppDecoration
                                                                  .outlineBluegray100
                                                                  .copyWith(
                                                                borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder10,
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Container(
                                                                    height:
                                                                    getSize(
                                                                      15.00,
                                                                    ),
                                                                    width:
                                                                    getSize(
                                                                      15.00,
                                                                    ),
                                                                    margin:
                                                                    getMargin(
                                                                      all: 1,
                                                                    ),
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      color: ColorConstant
                                                                          .whiteA700,
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
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(),
                                                    InkWell(
                                                      splashFactory: NoSplash
                                                          .splashFactory,
                                                      onTap: () {
                                                        controller
                                                            .updateTaskStatus(
                                                                AppConstant
                                                                    .ACHIEVED);
                                                        controller.achived
                                                            .value = true;
                                                        Get.back();
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          bottom: responsive
                                                              .setHeight(1),
                                                          right: 20.0,
                                                          top: responsive
                                                              .setHeight(1),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      bottom:
                                                                          20.0),
                                                              child:
                                                                  CommonImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .green_check,
                                                                height: 15,
                                                                width: 14,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: responsive
                                                                  .setWidth(4),
                                                            ),
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                MyText(
                                                                  title:
                                                                      'ACHIEVED',
                                                                  weight:
                                                                      'Semi Bold',
                                                                ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                MyText(
                                                                  title:
                                                                      'You hit your target on time.',
                                                                  clr: ColorConstant
                                                                      .hintTextColor,
                                                                  fontSize: responsive
                                                                      .setTextScale(
                                                                          13),
                                                                ),
                                                              ],
                                                            ),
                                                            Spacer(),
                                                            Obx(() =>
                                                            controller.selectedId.value == AppConstant.ACHIEVED
                                                                ? Container(
                                                              margin:
                                                              getMargin(
                                                                //   top: 15,
                                                                right: 5,
                                                                //   bottom: 15,
                                                              ),
                                                              decoration:
                                                              AppDecoration
                                                                  .outlineBluegray100
                                                                  .copyWith(
                                                                borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder10,
                                                                border: Border
                                                                    .all(
                                                                  color: ColorConstant
                                                                      .primaryColor,
                                                                ),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Container(
                                                                    height:
                                                                    getSize(
                                                                      15.00,
                                                                    ),
                                                                    width:
                                                                    getSize(
                                                                      15.00,
                                                                    ),
                                                                    margin:
                                                                    getMargin(
                                                                      all: 1,
                                                                    ),
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      color: ColorConstant
                                                                          .primaryColor,
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
                                                              margin:
                                                              getMargin(
                                                                // top: 15,
                                                                right: 5,
                                                                // bottom: 15,
                                                              ),
                                                              decoration:
                                                              AppDecoration
                                                                  .outlineBluegray100
                                                                  .copyWith(
                                                                borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder10,
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Container(
                                                                    height:
                                                                    getSize(
                                                                      15.00,
                                                                    ),
                                                                    width:
                                                                    getSize(
                                                                      15.00,
                                                                    ),
                                                                    margin:
                                                                    getMargin(
                                                                      all: 1,
                                                                    ),
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      color: ColorConstant
                                                                          .whiteA700,
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
                                                            ),)
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(),
                                                    InkWell(
                                                      splashFactory: NoSplash
                                                          .splashFactory,
                                                      onTap: () {
                                                        controller
                                                            .updateTaskStatus(
                                                                AppConstant
                                                                    .MISSED);
                                                        controller.missed
                                                            .value = true;
                                                        Get.back();
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          bottom: responsive
                                                              .setHeight(1),
                                                          right: 20.0,
                                                          top: responsive
                                                              .setHeight(1),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      bottom:
                                                                          20.0),
                                                              child:
                                                                  CommonImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .red_cross,
                                                                height: 15,
                                                                width: 14,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: responsive
                                                                  .setWidth(4),
                                                            ),
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                MyText(
                                                                  title:
                                                                      'MISSED',
                                                                  weight:
                                                                      'Semi Bold',
                                                                ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                MyText(
                                                                  title:
                                                                      'You missed your goal.',
                                                                  clr: ColorConstant
                                                                      .hintTextColor,
                                                                  fontSize: responsive
                                                                      .setTextScale(
                                                                          13),
                                                                ),
                                                              ],
                                                            ),
                                                            Spacer(),
                                                            Obx(() =>
                                                            controller.selectedId.value == AppConstant.MISSED
                                                                ? Container(
                                                              margin:
                                                              getMargin(
                                                                //   top: 15,
                                                                right: 5,
                                                                //   bottom: 15,
                                                              ),
                                                              decoration:
                                                              AppDecoration
                                                                  .outlineBluegray100
                                                                  .copyWith(
                                                                borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder10,
                                                                border: Border
                                                                    .all(
                                                                  color: ColorConstant
                                                                      .primaryColor,
                                                                ),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Container(
                                                                    height:
                                                                    getSize(
                                                                      15.00,
                                                                    ),
                                                                    width:
                                                                    getSize(
                                                                      15.00,
                                                                    ),
                                                                    margin:
                                                                    getMargin(
                                                                      all: 1,
                                                                    ),
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      color: ColorConstant
                                                                          .primaryColor,
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
                                                              margin:
                                                              getMargin(
                                                                // top: 15,
                                                                right: 5,
                                                                // bottom: 15,
                                                              ),
                                                              decoration:
                                                              AppDecoration
                                                                  .outlineBluegray100
                                                                  .copyWith(
                                                                borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder10,
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Container(
                                                                    height:
                                                                    getSize(
                                                                      15.00,
                                                                    ),
                                                                    width:
                                                                    getSize(
                                                                      15.00,
                                                                    ),
                                                                    margin:
                                                                    getMargin(
                                                                      all: 1,
                                                                    ),
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      color: ColorConstant
                                                                          .whiteA700,
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
                                                            ))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: responsive.setHeight(6),
                                              width: responsive.setWidth(100),
                                              decoration: BoxDecoration(
                                                  gradient: 10 == 20
                                                      ? LinearGradient(
                                                          colors: [
                                                            ColorConstant
                                                                .primaryColor,
                                                            ColorConstant
                                                                .primaryColor,
                                                            ColorConstant
                                                                .appPinkColor,
                                                          ],
                                                          begin: Alignment
                                                              .centerLeft,
                                                          end: Alignment
                                                              .centerRight,
                                                          stops: const [
                                                            0.05,
                                                            0.3,
                                                            0.95
                                                          ])
                                                      : null,
                                                  color: controller.selectedId
                                                              .value ==
                                                          AppConstant.ACHIEVED
                                                      ? ColorConstant.green800
                                                      : controller.selectedId
                                                                  .value ==
                                                              AppConstant.MISSED
                                                          ? ColorConstant
                                                              .pink500
                                                          : ColorConstant
                                                              .primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        responsive.setWidth(10),
                                                  ),
                                                  MyText(
                                                    title:
                                                        '${controller.selectedId.value == AppConstant.ACTIVE ? "ACTIVE" : controller.selectedId.value == AppConstant.ACHIEVED ? "ACHIEVED" : "MISSED"}',
                                                    clr:
                                                        ColorConstant.whiteA700,
                                                    weight: 'Semi Bold',
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: CommonImageView(
                                                      svgPath: ImageConstant
                                                          .imgVuesaxBoldArrowdown,
                                                      color: ColorConstant
                                                          .whiteA700,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: responsive.setHeight(1),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: 15,
                                    width: double.maxFinite,
                                    color: ColorConstant.seperateColor,
                                  ),
                                  Padding(
                                      padding: getPadding(
                                          left: 12, top: 26, right: 12),
                                      child: Text("lbl_description".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsSemiBold16
                                              .copyWith(
                                                  fontSize: 14, height: 1.00))),
                                  Container(
                                      width: size.width,
                                      margin: getMargin(
                                          left: 15,
                                          top: 10,
                                          right: 12,
                                          bottom: 10),
                                      child: Obx(() => Text(
                                          controller.goalData!.value
                                                      .description !=
                                                  null
                                              ? controller
                                                  .goalData!.value.description!
                                                  .toString()
                                              : "-",
                                          maxLines: null,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtPoppinsRegular12Black900
                                              .copyWith(
                                            fontSize: 13,
                                          )))),
                                  Padding(
                                      padding: getPadding(
                                          left: 15, top: 10, right: 15),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                if(controller.userID == controller.goalData!.value.user!.id.toString()){
                                                  Get.toNamed(
                                                      AppRoutes.myProfileScreen);
                                                }else {
                                                  Get.toNamed(AppRoutes.employeeDicrectryDetailsScreen, arguments: {
                                                    'id': controller.goalData!.value.user!.id.toString(),
                                                    'name': controller.goalData!.value.user!.name.toString(),
                                                  });
                                                }
                                              },
                                              child: controller.goalData!.value
                                                  .user!=null &&  controller.goalData!.value
                                                          .user!.image !=
                                                      null
                                                  ? controller
                                                          .goalData!
                                                          .value
                                                          .user!
                                                          .image
                                                          .isNotEmpty
                                                      ? ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            getHorizontalSize(
                                                                32.50),
                                                          ),
                                                          child:
                                                              CommonImageView(
                                                            url: controller
                                                                .goalData!
                                                                .value
                                                                .user!
                                                                .image,
                                                            height:
                                                                getSize(40.00),
                                                            width:
                                                                getSize(40.00),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        )
                                                      : ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  getHorizontalSize(
                                                                      32.50)),
                                                          child:
                                                              CommonImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .imgUser,
                                                            height:
                                                                getSize(40.00),
                                                            width:
                                                                getSize(40.00),
                                                          ),
                                                        )
                                                  : ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              getHorizontalSize(
                                                                  32.50)),
                                                      child: CommonImageView(
                                                        svgPath: ImageConstant
                                                            .imgUser,
                                                        height: getSize(40.00),
                                                        width: getSize(40.00),
                                                      ),
                                                    ),
                                            ),
                                     Obx(() =>        Padding(
                                         padding: getPadding(
                                             left: 16,
                                             top: 14,
                                             bottom: 12),
                                         child: Text(controller.userID == controller.goalData!.value.user!.id.toString() ? "You" : controller.goalData!.value.user!.name!,
                                             overflow:
                                             TextOverflow.ellipsis,
                                             textAlign: TextAlign.left,
                                             style: TextStyle(
                                               color:
                                               ColorConstant.gray901,
                                               fontSize: getFontSize(
                                                 13,
                                               ),
                                               fontFamily: Platform.isIOS
                                                   ? 'SF Pro Display'
                                                   : 'Roboto',
                                               fontWeight:
                                               FontWeight.w600,
                                             ).copyWith(height: 1.00))),),
                                            Padding(
                                                padding: getPadding(
                                                    top: 14, bottom: 12),
                                                child: Text(
                                                    ' created this goal on ${Utils.getFormatedDate(controller.goalData!.value.userStatus!.createdAt!)}',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtPoppinsRegular12Gray901
                                                        .copyWith(
                                                            height: 1.00,
                                                            fontSize: 13))),
                                          ])),
                                ])),
                        SizedBox(
                          height: responsive.setHeight(25),
                        ),
                      ]),
                      Obx(() =>Visibility(
                        visible: controller.showCon.value,
                        child: Positioned(
                          top: -50,
                          // alignment: Alignment.topCenter,
                          child: ConfettiWidget(
                            confettiController: controller.confettiController,
                            blastDirection:  pi / 2,
                            blastDirectionality: BlastDirectionality.explosive,
                            gravity: 0.5,
                            numberOfParticles: 40,
                            emissionFrequency: 0,

                          ),
                        ),
                      )),
                ])));
          })),
    );
  }
}
