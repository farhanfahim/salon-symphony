import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/presentation/chat_module/chat_constants.dart';
import 'package:salon_symphony/widgets/custom_text.dart';
import 'package:salon_symphony/widgets/error_widget.dart';
import 'dart:io';
import '../../baseviews/baseview_process_screen.dart';
import '../../core/utils/app_constant.dart';
import '../../core/utils/helper_functions.dart';
import '../../core/utils/utils.dart';
import '../../widgets/response_binding_widget.dart';
import '../../widgets/widgets_shimmer.dart';
import 'controller/request_dtail_time_off_controller.dart';

class RequestDetailsTimeOffScreen extends StatelessWidget {

  RequestDetailsTimeOffController controller = Get.put(
      RequestDetailsTimeOffController());
  Map<String, dynamic> map = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return BaseviewScreen(
      basicAppBar: true,
      screenName: "Request Details",
      showBottomBar: false,
      sidePadding: false,
      mainTopHeight: 0,
      stickyHeader: true,
      backgroundColor: ColorConstant.whiteA700,
      basicAppTrailingIcon: ImageConstant.menu_dots,
      basicAppTrailingIconOnTap: () {
        HelperFunction.showBottomSheet(
            context,
            screenTitle: 'Request Options',
            redclrEndTask: false,
            screenEndTask: 'Done',
            bottomSheetHeight: controller.requestData!.value.status ==
                AppConstant.REQUEST_APPROVED ||
                controller.requestData!.value.status ==
                    AppConstant.REQUEST_DECLINE ? 200 : 270,
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                if(controller.requestData!.value.type !=
                    AppConstant.SCHEDULE_REQUEST)
                  controller.requestData!.value.status ==
                      AppConstant.REQUEST_APPROVED ||
                      controller.requestData!.value.status ==
                          AppConstant.REQUEST_DECLINE
                      ? Container()
                      : GestureDetector(
                    onTap: () {
                      if (controller.requestData!.value.type ==
                          AppConstant.TIME_OFF_REQUEST) {
                        Get.back();
                        Get.toNamed(AppRoutes.editTimeRequest)!.then((value) {
                          controller.getRequest();
                        });
                      }
                      // else if(controller.requestData!.value.type == AppConstant.SCHEDULE_REQUEST){
                      //   Get.back();
                      //   Get.toNamed(AppRoutes.editTimeRequest)!.then((value) {
                      //     controller.getRequest();
                      //   });
                      // }
                      else if (controller.requestData!.value.type ==
                          AppConstant.EDUCATION_REQUEST ||
                          controller.requestData!.value.type ==
                              AppConstant.EDUCATION_REIMBURSEMENT) {
                        Get.back();
                        Get.toNamed(AppRoutes.addAddEducationTrackingScreen,
                            arguments: {
                              "isEditing": true,
                              "Type": controller.requestData!.value.type,
                              "index": controller.requestData!.value.type ==
                                  AppConstant.EDUCATION_REQUEST ? 0 : 1
                            })!.then((value) {
                          controller.getRequest();
                        });
                      }
                    },
                    child: Row(
                      children: [
                        CommonImageView(
                          svgPath: ImageConstant.black_edit,
                          height: 17,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text("Edit Request",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: 15,
                              letterSpacing: 0.5,
                              fontFamily: Platform.isIOS
                                  ? 'SF Pro Display'
                                  : 'Roboto',
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                  ),


                if(controller.requestData!.value.type !=
                    AppConstant.SCHEDULE_REQUEST)

                  controller.requestData!.value.status ==
                      AppConstant.REQUEST_APPROVED ||
                      controller.requestData!.value.status ==
                          AppConstant.REQUEST_DECLINE ? Offstage() : SizedBox(
                    height: 30,
                  ),
                GestureDetector(
                  onTap: () async {
                    String deepLink = '${AppConstant.shareBaseUrl}/requests/details/${controller.requestData!.value.id}';
                    // String deepLink = '${AppConstant.shareBaseUrl}?requestId=${controller.requestData!.value.id}&type=${map['type']}&status=${map['status']}';
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
                        width: 15,
                      ),
                      Text('Share request',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: 15,
                            letterSpacing: 0.5,
                            fontFamily: Platform.isIOS
                                ? 'SF Pro Display'
                                : 'Roboto',
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
                        bottomSheetHeight: 450,
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
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
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
                                        padding: const EdgeInsets.all(15.0),
                                        child: CommonImageView(
                                          imagePath: ImageConstant.cancel_icon,
                                          height: 30,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10),
                                      child: MyText(
                                        title: 'Are you sure you want to cancel this request?',
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
                                  controller.cancelRequest();
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: Container(
                                    height: 50,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    decoration: BoxDecoration(
                                      color: ColorConstant.whiteA700,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: MyText(
                                        title: 'Yes, cancel',
                                        clr: ColorConstant.errorColor,
                                        fontSize: 16,
                                        weight: 'Semi Bold',
                                      ),
                                    )

                                ),
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
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    decoration: BoxDecoration(
                                      color: ColorConstant.whiteA700,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: MyText(
                                        title: 'No, keep',
                                        clr: ColorConstant.hintTextColor,
                                        fontSize: 16,
                                      ),
                                    )

                                ),
                              ),

                            ],
                          ),
                        ));
                  },
                  child: Row(
                    children: [
                      CommonImageView(
                        imagePath: ImageConstant.cancel_icon,
                        height: 17,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Cancel request',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ColorConstant.pink500,
                            fontSize: 15,
                            letterSpacing: 0.5,
                            fontFamily: Platform.isIOS
                                ? 'SF Pro Display'
                                : 'Roboto',
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                ),
              ],
            ));
      },
      child: Obx(() =>
          ResponseBindingWidget(
              apiCallStatus: controller.apiCallStatus.value,
              errorWidget: () {
                return RecordDeletedWidget();
              },
              loadingWidget: () {
                return requestDetailShimmer();
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
                    color: ColorConstant.seperateColor,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            // width: getHorizontalSize(343.00),
                              padding: getPadding(left: 10, top: 5, right: 10),
                              decoration: AppDecoration.outlineBlack9000a1
                                  .copyWith(
                                  borderRadius: BorderRadiusStyle
                                      .roundedBorder10),
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
                                              Obx(() =>
                                                  Text(controller.requestData!
                                                      .value.type == AppConstant
                                                      .TIME_OFF_REQUEST
                                                      ? controller.requestData!
                                                      .value.subTypeName != null
                                                      ? controller.requestData!
                                                      .value.subTypeName!
                                                      : ""
                                                      : controller.requestData!
                                                      .value.type == AppConstant
                                                      .SCHEDULE_REQUEST
                                                      ? controller.requestData!
                                                      .value.subType ==
                                                      AppConstant.CHANGE_DAY ?
                                                  "Change Days" : "Change Shift"
                                                      : controller.requestData!
                                                      .value.type == AppConstant
                                                      .EDUCATION_REIMBURSEMENT
                                                      ? "Reimbursement"
                                                      : controller.requestData!
                                                      .value.type == AppConstant
                                                      .EDUCATION_REQUEST
                                                      ? "Class Hours"
                                                      : "",
                                                      overflow: TextOverflow
                                                          .ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtPoppinsRegular12Gray600
                                                          .copyWith(
                                                          color:
                                                          ColorConstant
                                                              .black900,
                                                          fontSize: getSize(
                                                              22.00),
                                                          fontWeight:
                                                          FontWeight.w700))),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(top: 8.0),
                                                child: CommonImageView(
                                                  imagePath:
                                                  controller.requestData!.value
                                                      .status == AppConstant
                                                      .REQUEST_PENDING
                                                      ? ImageConstant
                                                      .pending_tab
                                                      :
                                                  controller.requestData!.value
                                                      .status == AppConstant
                                                      .REQUEST_APPROVED
                                                      ? ImageConstant
                                                      .approved_tab
                                                      :
                                                  ImageConstant.decline_tab,
                                                  height: getSize(
                                                    23.00,
                                                  ),
                                                  width: getSize(
                                                    83.00,
                                                  ),
                                                ),
                                              )

                                            ])),
                                    controller.requestData!.value.type ==
                                        AppConstant.TIME_OFF_REQUEST ? Padding(
                                        padding: getPadding(left: 5, top: 4),
                                        child: Obx(() =>
                                            Text(controller.requestData!.value
                                                .createdAt != null
                                                ? "Submitted on " +
                                                Utils.formatDate(
                                                    controller.requestData!
                                                        .value.createdAt!)
                                                : "-",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,

                                                style: AppStyle
                                                    .txtPoppinsRegular12Gray600
                                                    .copyWith(
                                                    height: 1.50,
                                                    color: ColorConstant
                                                        .black900)))) :
                                    controller.requestData!.value.type ==
                                        AppConstant.SCHEDULE_REQUEST ? Padding(
                                        padding: getPadding(left: 5, top: 4),
                                        child: Obx(() =>
                                            Text(controller.requestData!.value
                                                .subType ==
                                                AppConstant.CHANGE_SHIFT
                                                ? controller.requestData!.value
                                                .dayName != null ? "Change: " +
                                                controller.requestData!.value
                                                    .dayName!.toString() +
                                                " Shift" : "-"
                                                : "",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtPoppinsRegular12Gray600
                                                    .copyWith(
                                                    height: 1.50,
                                                    color: ColorConstant
                                                        .black900)))) :
                                    controller.requestData!.value.type ==
                                        AppConstant.EDUCATION_REQUEST ? Padding(
                                        padding: getPadding(left: 5, top: 4),
                                        child: Obx(() =>
                                            Text(controller.requestData!.value
                                                .className != null
                                                ? "Class Name: " +
                                                controller.requestData!.value
                                                    .className!.toString()
                                                : "-",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtPoppinsRegular12Gray600
                                                    .copyWith(
                                                    height: 1.50,
                                                    color: ColorConstant
                                                        .black900)))) :
                                    controller.requestData!.value.type ==
                                        AppConstant.EDUCATION_REIMBURSEMENT
                                        ? Padding(
                                        padding: getPadding(left: 5, top: 4),
                                        child: Obx(() =>
                                            Text(controller.requestData!.value
                                                .subTypeName != null
                                                ? "Purpose: " +
                                                controller.requestData!.value
                                                    .subTypeName!.toString()
                                                : "-",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtPoppinsRegular12Gray600
                                                    .copyWith(
                                                    height: 1.50,
                                                    color: ColorConstant
                                                        .black900))))
                                        : Container(),


                                    SizedBox(
                                      height: 20,
                                    )
                                  ])),
                          Container(
                            margin: getMargin(top: 15),
                            padding: getPadding(
                                left: 17, top: 30, right: 17, bottom: 20),
                            decoration: AppDecoration.outlineBlack9000a1
                                .copyWith(
                              // borderRadius: BorderRadiusStyle.roundedBorder10
                            ),
                            child: Column(
                              children: [
                                controller.requestData!.value.type ==
                                    AppConstant.TIME_OFF_REQUEST ? Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      MyText(
                                        title: 'Coverage',
                                        fontSize: 14,
                                        weight: 'Semi Bold',
                                      ),
                                      Spacer(),
                                      Obx(() =>
                                          MyText(
                                            title: controller.requestData!.value
                                                .coverage != null ? controller
                                                .requestData!.value.coverage!
                                                .name! : "-",
                                            fontSize: 14,
                                            weight: 'Semi Bold',
                                          ),)
                                    ]) :
                                Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      MyText(
                                        title: 'Submitted',
                                        fontSize: 14,
                                        weight: 'Semi Bold',
                                      ),
                                      Spacer(),
                                      Obx(() =>
                                          MyText(
                                            title: controller.requestData!.value
                                                .createdAt != null ? Utils
                                                .getFormatedDate(
                                                controller.requestData!.value
                                                    .createdAt!) : "-",
                                            fontSize: 14,
                                            weight: 'Semi Bold',
                                          ),)
                                    ]),
                                SizedBox(
                                  height: 5,
                                ),
                                Divider(),

                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      controller.requestData!.value.type ==
                                          AppConstant.TIME_OFF_REQUEST
                                          ? MyText(
                                        title: 'Leave Date',
                                        fontSize: 14,
                                        weight: 'Semi Bold',
                                      ) : controller.requestData!.value.type ==
                                          AppConstant.SCHEDULE_REQUEST
                                          ? MyText(
                                        title: 'Current',
                                        fontSize: 14,
                                        weight: 'Semi Bold',
                                      ) : controller.requestData!.value.type ==
                                          AppConstant.EDUCATION_REIMBURSEMENT
                                          ? MyText(
                                        title: 'Total Spent',
                                        fontSize: 14,
                                        weight: 'Semi Bold',
                                      ) : controller.requestData!.value.type ==
                                          AppConstant.EDUCATION_REQUEST
                                          ? MyText(
                                        title: 'Total Time',
                                        fontSize: 14,
                                        weight: 'Semi Bold',
                                      ) : Container(),
                                      Spacer(),

                                      controller.requestData!.value.type ==
                                          AppConstant.TIME_OFF_REQUEST
                                          ? MyText(
                                        title: controller.requestData!.value
                                            .date != null
                                            ? Utils.getFormatedDate(
                                            controller.requestData!.value.date!)
                                            : "-",
                                        fontSize: 14,
                                        weight: 'Semi Bold',
                                      ) : controller.requestData!.value.type ==
                                          AppConstant.SCHEDULE_REQUEST
                                          ? MyText(
                                        title: "${controller.requestData!.value
                                            .dayName}, ${controller.requestData!
                                            .value.availability == 20
                                            ? "OFF"
                                            : "ON"}",
                                        fontSize: 14,
                                        weight: 'Semi Bold',
                                      ) : controller.requestData!.value.type ==
                                          AppConstant.EDUCATION_REIMBURSEMENT
                                          ? MyText(
                                        title: controller.requestData!.value
                                            .value != null
                                            ? "\$${controller.requestData!.value
                                            .value!}"
                                            : "\$0",
                                        fontSize: 14,
                                        weight: 'Semi Bold',
                                      ) : controller.requestData!.value.type ==
                                          AppConstant.EDUCATION_REQUEST
                                          ? MyText(
                                        title: controller.requestData!.value
                                            .hour != null
                                            ? "${controller.requestData!.value
                                            .hour!} Hours"
                                            : "0 Hours",
                                        fontSize: 14,
                                        weight: 'Semi Bold',
                                      ) : Container(),

                                    ]),
                                SizedBox(
                                  height: 5,
                                ),
                                Divider(),

                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      controller.requestData!.value.type ==
                                          AppConstant.TIME_OFF_REQUEST
                                          ? MyText(
                                        title: 'Return Date',
                                        fontSize: 14,
                                        weight: 'Semi Bold',
                                      ) : controller.requestData!.value.type ==
                                          AppConstant.SCHEDULE_REQUEST
                                          ? MyText(
                                        title: 'Desired',
                                        fontSize: 14,
                                        weight: 'Semi Bold',
                                      ) : controller.requestData!.value.type ==
                                          AppConstant.EDUCATION_REQUEST
                                          ? MyText(
                                        title: 'Class Date',
                                        fontSize: 14,
                                        weight: 'Semi Bold',
                                      ) : controller.requestData!.value.type ==
                                          AppConstant.EDUCATION_REIMBURSEMENT
                                          ? MyText(
                                        title: 'Date Spent',
                                        fontSize: 14,
                                        weight: 'Semi Bold',
                                      ) : Container(),


                                      Spacer(),

                                      controller.requestData!.value.type ==
                                          AppConstant.TIME_OFF_REQUEST
                                          ? MyText(
                                        title: controller.requestData!.value
                                            .returnDate != null ? Utils
                                            .getFormatedDate(
                                            controller.requestData!.value
                                                .returnDate!) : "-",
                                        fontSize: 14,
                                        weight: 'Semi Bold',
                                      ) : controller.requestData!.value.type ==
                                          AppConstant.SCHEDULE_REQUEST
                                          ? MyText(
                                        title: "${controller.requestData!.value
                                            .dayName}, ${controller.requestData!
                                            .value.availability == 20
                                            ? "ON"
                                            : "OFF"}",
                                        fontSize: 14,
                                        weight: 'Semi Bold',
                                      ) : controller.requestData!.value.type ==
                                          AppConstant.EDUCATION_REQUEST
                                          ? MyText(
                                        title: controller.requestData!.value
                                            .date != null
                                            ? Utils.getFormatedDate(
                                            controller.requestData!.value.date!)
                                            : "-",
                                        fontSize: 14,
                                        weight: 'Semi Bold',
                                      ) : controller.requestData!.value.type ==
                                          AppConstant.EDUCATION_REIMBURSEMENT
                                          ? MyText(
                                        title: controller.requestData!.value
                                            .date != null
                                            ? Utils.getFormatedDate(
                                            controller.requestData!.value.date!)
                                            : "-",
                                        fontSize: 14,
                                        weight: 'Semi Bold',
                                      ) : Container(),

                                    ]),
                                SizedBox(
                                  height: 5,
                                ),
                                Divider(),

                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      MyText(
                                        title: controller.requestData!.value.status ==
                                            AppConstant.REQUEST_APPROVED
                                            ? "Approved" : 'Updated On',
                                        fontSize: 14,
                                        weight: 'Semi Bold',
                                        clr: controller.requestData!.value.status ==
                                            AppConstant.REQUEST_DECLINE
                                            ?
                                        ColorConstant.errorColor
                                            : controller.requestData!.value.status ==
                                            AppConstant.REQUEST_APPROVED ?
                                        ColorConstant.black900 : ColorConstant
                                            .black900,
                                      ),
                                      Spacer(),
                                      controller.requestData!.value.type ==
                                          AppConstant.TIME_OFF_REQUEST ///Time off
                                          ? Obx(() =>
                                          MyText(
                                            title: controller.requestData!.value
                                                .updatedAt != null ?
                                            Utils.getFormatedDate(
                                                controller.requestData!.value
                                                    .updatedAt!) : "---",
                                            fontSize: 14,
                                            weight: 'Semi Bold',
                                          )) :
                                      controller.requestData!.value.type ==
                                          AppConstant.EDUCATION_REQUEST  ///Education
                                          ? Obx(() =>
                                          MyText(
                                            title: controller.requestData!.value
                                                .updatedAt != null ?
                                            Utils.getFormatedDate(
                                                controller.requestData!.value
                                                    .updatedAt!) : "---",
                                            fontSize: 14,
                                            weight: 'Semi Bold',
                                          )) :
                                      MyText(
                                        title: controller.requestData!.value
                                            .updatedAt != null ?
                                        Utils.getFormatedDate(
                                            controller.requestData!.value
                                                .updatedAt!.toString()) : "---",
                                        fontSize: 14,
                                        weight: 'Semi Bold',
                                        clr: controller.requestData!.value.status == AppConstant.REQUEST_DECLINE
                                            ?
                                        ColorConstant.errorColor
                                        //     : controller.requestData!.value.status ==
                                        //     AppConstant.REQUEST_APPROVED ?
                                        // ColorConstant.success
                                            : ColorConstant
                                            .black900,
                                      ),
                                    ]),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: getMargin(top: 15),
                              padding: getPadding(
                                  left: 17, top: 30, right: 17, bottom: 10),
                              decoration: AppDecoration.simpleOutline.copyWith(
                                  borderRadius: BorderRadiusStyle
                                      .roundedBorder10,
                                  color: ColorConstant.whiteA700),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("lbl_comments".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsSemiBold14
                                            .copyWith(height: 1.50)),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Obx(() =>
                                        MyText(
                                          title: controller.requestData!.value
                                              .comments != ''  ? controller
                                              .requestData!.value.comments!
                                              .toString() : "-",
                                          fontSize: 14,
                                          weight: 'Regular',
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Divider(
                                      thickness: 1,
                                    ),

                                    SizedBox(
                                      height: 10,
                                    ),
                                    controller.requestData!.value
                                        .approved != null ?
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Map<String, dynamic> map = {
                                                  ChatConstants.userId: controller
                                                      .requestData!.value.approved!
                                                      .id!,
                                                  ChatConstants
                                                      .threadName: controller
                                                      .requestData!.value.approved!
                                                      .name!,
                                                  ChatConstants.fromCreation: false,
                                                  ChatConstants.fromGroup: false};
                                                Get.toNamed(AppRoutes.chattingView,
                                                    arguments: map);
                                              },
                                              child: controller.requestData!.value
                                                  .approved != null &&
                                                  controller.requestData!.value
                                                      .approved!.image !=
                                                      null
                                                  ? controller
                                                  .requestData!
                                                  .value
                                                  .approved!
                                                  .image
                                                  .isNotEmpty
                                                  ? ClipRRect(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(
                                                    getHorizontalSize(32.50)),
                                                child: CommonImageView(
                                                  url: controller
                                                      .requestData!
                                                      .value
                                                      .approved!
                                                      .image,
                                                  height: getSize(35.00),
                                                  width: getSize(35.00),
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                                  : ClipRRect(
                                                borderRadius: BorderRadius.circular(getHorizontalSize(32.50)),
                                                child:
                                                CommonImageView(
                                                  svgPath:
                                                  ImageConstant
                                                      .imgUser,
                                                  height:
                                                  getSize(35.00),
                                                  width:
                                                  getSize(35.00),
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
                                                  height: getSize(35.00),
                                                  width: getSize(35.00),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            MyText(
                                              title: controller.requestData!.value
                                                  .approved!.name != null ?
                                              controller.requestData!.value
                                                  .approved!.name! : "",
                                              fontSize: 14,
                                              weight: 'Semi Bold',
                                            ) ,
                                            MyText(
                                              title: ' commented',
                                              fontSize: 14,
                                            ) ,
                                            Spacer(),
                                            MyText(
                                              title: controller.requestData!.value.updatedAt != null ?
                                              Utils.taskFormatDate(controller.requestData!.value.updatedAt!) : "---",
                                              fontSize: 14,
                                              clr: ColorConstant.appDescriptionTextColor,
                                              weight: 'Regular',
                                            ),

                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 45.0),
                                          child: MyText(
                                            title: controller.requestData!.value
                                                .note != '' ? controller
                                                .requestData!.value.note!
                                                .toString() : "-",
                                            fontSize: 14,
                                            weight: 'Regular',
                                          ),
                                        ),
                                      ],
                                    ) : Container(),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]));
              }
          )),
    );
  }

}
