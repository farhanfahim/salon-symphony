import 'package:salon_symphony/core/utils/utils.dart';
import 'package:salon_symphony/widgets/response_binding_widget.dart';
import '../../baseviews/baseview_process_screen.dart';
import '../../core/utils/app_constant.dart';
import '../../core/utils/helper_functions.dart';
import '../../core/utils/responsive.dart';
import '../../widgets/cutom_dialog.dart';
import '../../widgets/widgets_shimmer.dart';
import '../chat_module/chat_constants.dart';
import 'controller/employee_dicrectry_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'dart:io';

class EmployeeDicrectryDetailsScreen
    extends GetWidget<EmployeeDicrectryDetailsController> {
  Responsive responsive = Responsive();
  Map<String, dynamic> map;
  EmployeeDicrectryDetailsScreen({required this.map});

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return Obx(() =>
      BaseviewScreen(
        basicAppBar: true,
        screenName: controller.userListResponseModel!.value.data!=null && controller.userListResponseModel!.value.data!.name !=null?controller.userListResponseModel!.value.data!.name.toString():"",
        showBottomBar: false,
        isMenuTab: true,
        sidePadding: false,
        basicAppTrailingIcon: ImageConstant.imgMenuIcon,
        basicAppTrailingIconOnTap: () {
          HelperFunction.showBottomSheet(context,
              screenTitle: 'Members Options',
              redclrEndTask: false,
              screenEndTask: 'Done',
              bottomSheetHeight: 250,
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: (){
                      String deepLink = '${AppConstant.shareBaseUrl}/team/members/${map['id']}';
                      // String deepLink = '${AppConstant.shareBaseUrl}?profileId=${map['id']}&name=${map['name'].replaceAll(' ', '_')}';

                      // await Clipboard.setData(ClipboardData(text: deepLink));
                      Utils.share(deepLink);
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
                        Text('Share profile',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                16,
                              ),
                              letterSpacing: 0.5,
                               fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: (){
                      Map<String, dynamic> map = {
                        ChatConstants.userId: controller.userListResponseModel!.value.data!.id!.toString(),
                        ChatConstants.threadName: controller.userListResponseModel!.value.data!.name!,
                        ChatConstants.fromCreation: false,
                        // ChatConstants.fromGroup: false
                      };
                      Get.toNamed(AppRoutes.chattingView,arguments: map);
                    },
                    child: Row(
                      children: [
                        CommonImageView(
                          imagePath: ImageConstant.chat_message,
                          height: 17,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Send message',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                16,
                              ),
                              letterSpacing: 0.5,
                               fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                              fontWeight: FontWeight.w400,
                            )),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: (){
                      HelperFunction.showBottomSheet(context,
                          screenTitle: ChatConstants.selectAction,
                          redclrEndTask: true,
                          bottomSheetHeight: 500,
                          widget: Obx(() => ListView.builder(
                            controller: controller.scrollController,
                            physics: BouncingScrollPhysics(),
                            itemCount: controller.arrOfReportList!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap:(){
                                  controller.reportUserApi(controller.arrOfReportList![index].id!);
                                  Get.back();

                                },child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15.0),
                                child:  Text(controller.arrOfReportList![index].value!,
                                    overflow: TextOverflow.ellipsis,
                                    textScaleFactor: 1.0,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        16,
                                      ),
                                      letterSpacing: 0.5,
                                      fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w400,
                                    )),
                              ),
                              );
                            },
                          )));
                    },
                    child: Row(
                      children: [
                        CommonImageView(
                          imagePath: ImageConstant.report_problem_icon,
                          height: 17,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Report user',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                16,
                              ),
                              letterSpacing: 0.5,
                               fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                              fontWeight: FontWeight.w400,
                            )),

                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  // InkWell(
                  //   onTap: (){
                  //     Get.dialog(CustomModelSheet(
                  //         title: 'Block User',
                  //         msg: "Are you sure you want to block this user?",
                  //         showOkButton: false,
                  //         onTapYes: () {
                  //           Get.back();
                  //         },
                  //         onTapNo: () {
                  //           Get.back();
                  //         }));
                  //   },
                  //   child: Row(
                  //     children: [
                  //       CommonImageView(
                  //         imagePath: ImageConstant.cancel_icon,
                  //         height: 17,
                  //       ),
                  //       SizedBox(
                  //         width: 10,
                  //       ),
                  //       Text('Block user',
                  //           overflow: TextOverflow.ellipsis,
                  //           textAlign: TextAlign.left,
                  //           textScaleFactor: 1.0,
                  //           style: TextStyle(
                  //             color: ColorConstant.red,
                  //             fontSize: getFontSize(
                  //               16,
                  //             ),
                  //             letterSpacing: 0.5,
                  //             fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                  //             fontWeight: FontWeight.w400,
                  //           )),
                  //
                  //     ],
                  //   ),
                  // ),
                ],
              ));
        },
        backgroundColor: ColorConstant.whiteA700,
        child: Obx(() => ResponseBindingWidget(apiCallStatus: controller.apiCallStatus.value,
            loadingWidget: () {
              return profileShimmer();
            },
            errorWidget: () {
              return Container();
            },
            successWidget: (){
          return Container(
              width: size.width,
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                            padding: getPadding(left: 16, top: 0),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              controller.userListResponseModel!.value.data!.image != null
                                                  ? controller.userListResponseModel!.value.data!.image!.isNotEmpty
                                                  ? ClipRRect(
                                                borderRadius: BorderRadius.circular(getHorizontalSize(32.50)),
                                                child: CommonImageView(
                                                  url: controller.userListResponseModel!.value.data!.image,
                                                  height: getSize(52.00),
                                                  width: getSize(52.00),
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                                  : ClipRRect(
                                                borderRadius: BorderRadius.circular(getHorizontalSize(32.50)),
                                                child: CommonImageView(
                                                  svgPath: ImageConstant.imgUser,
                                                  height: getSize(52.00),
                                                  width: getSize(52.00),
                                                ),
                                              )
                                                  : ClipRRect(
                                                borderRadius: BorderRadius.circular(getHorizontalSize(32.50)),
                                                child: CommonImageView(
                                                  svgPath: ImageConstant.imgUser,
                                                  height: getSize(52.00),
                                                  width: getSize(52.00),
                                                ),
                                              ),
                                              SizedBox(width: 16), // Added spacing between image and name
                                              Flexible(
                                                child: Text(
                                                  controller.userListResponseModel!.value.data!.name!,
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 3,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle.txtPoppinsSemiBold18.copyWith(
                                                    fontSize: 26,
                                                    height: 1.00,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Map<String, dynamic> map = {
                                              ChatConstants.userId: controller.userListResponseModel!.value.data!.id!.toString(),
                                              ChatConstants.threadName: controller.userListResponseModel!.value.data!.name!,
                                              ChatConstants.fromCreation: false,
                                              ChatConstants.fromGroup: false,
                                            };
                                            Get.toNamed(AppRoutes.chattingView, arguments: map);
                                          },
                                          child: CommonImageView(
                                            width: 25,
                                            height: 24,
                                            imagePath: ImageConstant.send_messeage_icon,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Container(
                                      margin: getMargin(top: 19,right: 16),
                                      child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                                padding: getPadding(top: 7),
                                                child: Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    mainAxisSize:
                                                    MainAxisSize.min,
                                                    children: [
                                                      CommonImageView(
                                                          svgPath: ImageConstant
                                                              .imgStar,
                                                          height: getSize(30.00),
                                                          width: getSize(30.00)),
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 15,
                                                              top: 12,
                                                              bottom: 13),
                                                          child: Text(
                                                              "lbl_total_points"
                                                                  .tr,
                                                              overflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                              textAlign:
                                                              TextAlign.left,
                                                              style: AppStyle
                                                                  .txtPoppinsMedium14
                                                                  .copyWith(
                                                                  letterSpacing:
                                                                  0.5)))
                                                    ])),
                                            Padding(
                                                padding: getPadding(
                                                    top: 19,
                                                    // right: 10,
                                                    bottom: 9),
                                                child: Text(controller.userListResponseModel!.value.data!.totalPoints.toString(),
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      color:
                                                      ColorConstant.black901,
                                                      fontSize: getFontSize(
                                                        15,
                                                      ),
                                                      fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                                      fontWeight: FontWeight.w500,
                                                    ).copyWith(
                                                        letterSpacing: 0.5)))
                                          ])),
                                  Container(
                                      width: double.infinity,
                                      margin: getMargin(top: 16),
                                      // decoration: AppDecoration.outlineBlack9000a1
                                      //     .copyWith(
                                      //         borderRadius: BorderRadiusStyle
                                      //             .roundedBorder10),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 16.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      height:
                                                      getVerticalSize(
                                                          1.00),
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant
                                                              .gray100)),
                                                  Align(
                                                      alignment: Alignment.center,
                                                      child: Container(
                                                          width: double.infinity,
                                                          margin: getMargin(
                                                            // left: 10,
                                                              top: 11,
                                                              // right: 10,
                                                              bottom: 39),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  getHorizontalSize(
                                                                      10.00))),
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

                                                                Align(
                                                                    alignment: Alignment
                                                                        .center,
                                                                    child: Padding(
                                                                        padding:
                                                                        getPadding(
                                                                            left: 1,
                                                                            top:
                                                                            18),
                                                                        child: Row(
                                                                            mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .spaceBetween,
                                                                            crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .center,
                                                                            mainAxisSize:
                                                                            MainAxisSize
                                                                                .max,
                                                                            children: [
                                                                              Padding(
                                                                                  padding: getPadding(
                                                                                      bottom:
                                                                                      1),
                                                                                  child: Text(
                                                                                      "lbl_position".tr,
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                      textAlign: TextAlign.left,
                                                                                      style: AppStyle.txtPoppinsRegular14Gray600.copyWith(
                                                                                        color: ColorConstant.black900,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ))),
                                                                              Padding(
                                                                                  padding: getPadding(
                                                                                      top:
                                                                                      1),
                                                                                  child: Text(
                                                                                      controller.userListResponseModel!.value.data!.position != null ? controller.userListResponseModel!.value.data!.position!.name!.toString() : "-",
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                      textAlign: TextAlign.left,
                                                                                      style: AppStyle.txtPoppinsRegular14Black900.copyWith(height: 1.00)))
                                                                            ]))),
                                                                Align(
                                                                    alignment: Alignment
                                                                        .center,
                                                                    child: Padding(
                                                                        padding:
                                                                        getPadding(
                                                                            left: 1,
                                                                            top:
                                                                            10),
                                                                        child: Row(
                                                                            mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .spaceBetween,
                                                                            crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .center,
                                                                            mainAxisSize:
                                                                            MainAxisSize
                                                                                .max,
                                                                            children: [
                                                                              Padding(
                                                                                  padding: getPadding(
                                                                                      bottom:
                                                                                      2),
                                                                                  child: Text(
                                                                                      "Location",
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                      textAlign: TextAlign.left,
                                                                                      style: AppStyle.txtPoppinsRegular14Gray600.copyWith(
                                                                                        color: ColorConstant.black900,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ))),
                                                                              Padding(
                                                                                  padding: getPadding(
                                                                                      top:
                                                                                      2),
                                                                                  child: Text(
                                                                                      controller.userListResponseModel!.value.data!.location != null ? controller.userListResponseModel!.value.data!.location!.name! : "-",
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                      textAlign: TextAlign.left,
                                                                                      style: AppStyle.txtPoppinsRegular14Black900.copyWith(height: 1.00)))
                                                                            ]))),
                                                                Align(
                                                                    alignment: Alignment
                                                                        .center,
                                                                    child: Padding(
                                                                        padding:
                                                                        getPadding(
                                                                            left: 1,
                                                                            top:
                                                                            10),
                                                                        child: Row(
                                                                            mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .spaceBetween,
                                                                            crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .center,
                                                                            mainAxisSize:
                                                                            MainAxisSize
                                                                                .max,
                                                                            children: [
                                                                              Padding(
                                                                                  padding: getPadding(
                                                                                      bottom:
                                                                                      2),
                                                                                  child: Text(
                                                                                      "lbl_hire_date".tr,
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                      textAlign: TextAlign.left,
                                                                                      style: AppStyle.txtPoppinsRegular14Gray600.copyWith(
                                                                                        color: ColorConstant.black900,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ))),
                                                                              Padding(
                                                                                  padding: getPadding(
                                                                                      top:
                                                                                      2),
                                                                                  child: Text(
                                                                                      controller.userListResponseModel!.value.data!.hireDate != null ? Utils.formatDate(controller.userListResponseModel!.value.data!.hireDate!) : "-",
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                      textAlign: TextAlign.left,
                                                                                      style: AppStyle.txtPoppinsRegular14Black900.copyWith(height: 1.00)))
                                                                            ]))),
                                                                Align(
                                                                    alignment: Alignment
                                                                        .center,
                                                                    child: Padding(
                                                                        padding:
                                                                        getPadding(
                                                                            left: 1,
                                                                            top:
                                                                            10),
                                                                        child: Row(
                                                                            mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .spaceBetween,
                                                                            crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .center,
                                                                            mainAxisSize:
                                                                            MainAxisSize
                                                                                .max,
                                                                            children: [
                                                                              Padding(
                                                                                  padding: getPadding(
                                                                                      bottom:
                                                                                      1),
                                                                                  child: Text(
                                                                                      "lbl_school".tr,
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                      textAlign: TextAlign.left,
                                                                                      style: AppStyle.txtPoppinsRegular14Gray600.copyWith(
                                                                                        color: ColorConstant.black900,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ))),
                                                                              Flexible(
                                                                                child: Padding(
                                                                                    padding: getPadding(
                                                                                        top:
                                                                                        1,left: 40),
                                                                                    child: Text(
                                                                                        controller.userListResponseModel!.value.data!.school != null ? controller.userListResponseModel!.value.data!.school! : "-",
                                                                                        overflow: TextOverflow.ellipsis,
                                                                                        textAlign: TextAlign.right,
                                                                                        maxLines: 2,
                                                                                        style: AppStyle.txtPoppinsRegular14Black900.copyWith(height: 1.00))),
                                                                              )
                                                                            ]))),
                                                                Align(
                                                                    alignment: Alignment
                                                                        .center,
                                                                    child: Padding(
                                                                        padding:
                                                                        getPadding(
                                                                            left: 1,
                                                                            top: 13,
                                                                            bottom:
                                                                            1),
                                                                        child: Row(
                                                                            mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .spaceBetween,
                                                                            crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .center,
                                                                            mainAxisSize:
                                                                            MainAxisSize
                                                                                .max,
                                                                            children: [
                                                                              Padding(
                                                                                  padding: getPadding(
                                                                                      bottom:
                                                                                      1),
                                                                                  child: Text(
                                                                                      "Company",
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                      textAlign: TextAlign.left,
                                                                                      style: AppStyle.txtPoppinsRegular14Gray600.copyWith(
                                                                                        color: ColorConstant.black900,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ))),
                                                                              Padding(
                                                                                  padding: getPadding(
                                                                                      top:
                                                                                      1),
                                                                                  child: Text(
                                                                                      controller.userListResponseModel!.value.data!.salon != null ? controller.userListResponseModel!.value.data!.salon!.name! : "-",
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                      textAlign: TextAlign.left,
                                                                                      style: AppStyle.txtPoppinsRegular14Black900.copyWith(height: 1.00)))
                                                                            ])))
                                                              ]))),
                                                  Container(
                                                      height:
                                                      getVerticalSize(
                                                          1.00),
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant
                                                              .gray100)),
                                                  Padding(
                                                      padding: getPadding(
                                                          top: 31,bottom: 10),
                                                      child: Text("Professional Bio",
                                                          overflow:
                                                          TextOverflow.ellipsis,
                                                          textAlign: TextAlign.left,
                                                          style: AppStyle
                                                              .txtPoppinsSemiBold14
                                                              .copyWith(
                                                              letterSpacing:
                                                              0.5))),
                                                  Padding(
                                                      padding: getPadding(bottom: 10),
                                                      child: Text( controller.userListResponseModel!.value.data!.bio != null ? controller.userListResponseModel!.value.data!.bio! : "-",
                                                          overflow:
                                                          TextOverflow.ellipsis,
                                                          textAlign: TextAlign.left,
                                                          maxLines: 10,
                                                          style: AppStyle
                                                              .txtPoppinsMedium14
                                                              .copyWith(
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 13.5

                                                          ))),
                                                  SizedBox(
                                                    height: 30,
                                                  ),
                                                  Container(
                                                      height:
                                                      getVerticalSize(
                                                          1.00),
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant
                                                              .gray100)),
                                                ],
                                              ),
                                            ),

                                            Padding(
                                                padding: getPadding(
                                                  // left: 10,
                                                  top: 18,
                                                  // right: 10
                                                ),
                                                child: Text(
                                                    'Interests',
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtPoppinsSemiBold14
                                                        .copyWith(
                                                        fontSize: 14,
                                                        letterSpacing:
                                                        0.5,
                                                        height: 1.00))),
                                            Container(
                                                width: double.infinity,
                                                height: getVerticalSize(48.00),
                                                padding:
                                                getPadding(top: 19),
                                                child: Obx (() =>controller.userListResponseModel!.value.data!=null?controller.userListResponseModel!.value.data!.specialities!.length>0?
                                                ListView.builder(
                                                    itemCount: controller.userListResponseModel!.value.data!.specialities!.length,
                                                    scrollDirection: Axis.horizontal,
                                                    shrinkWrap: true,
                                                    itemBuilder:
                                                        (BuildContext context, int index) {
                                                      return Container(
                                                          margin: EdgeInsets.only(right: 10),
                                                          padding: getPadding(
                                                              left: 13,
                                                              top: 7.5,
                                                              right: 13,
                                                              bottom: 7),
                                                          decoration: AppDecoration
                                                              .txtFillDeeppurpleA201
                                                              .copyWith(
                                                              borderRadius:
                                                              BorderRadiusStyle
                                                                  .txtRoundedBorder4),
                                                          child: Text(controller.userListResponseModel!.value.data!.specialities![index].name!,
                                                              overflow: TextOverflow.ellipsis,
                                                              textAlign: TextAlign.left,
                                                              style: AppStyle
                                                                  .txtPoppinsRegular12WhiteA701));
                                                    }):Text("-",
                                                  style: AppStyle.txtPoppinsRegular14Black900,):Text("No Specialities",
                                                  style: AppStyle.txtPoppinsRegular14Black900,),)),

                                            SizedBox(
                                              height: 25,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 16.0),
                                              child: Container(
                                                  height:
                                                  getVerticalSize(
                                                      1.00),
                                                  decoration: BoxDecoration(
                                                      color: ColorConstant
                                                          .gray100)),
                                            ),


                                          ])),
                                  Container(
                                      width: double.infinity,
                                      margin: getMargin(top: 13,right: 16),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: getPadding(
                                                  top: 12,),
                                                child: Text('Certificates',
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtPoppinsSemiBold14
                                                        .copyWith(
                                                        letterSpacing: 0.5,
                                                        height: 1.00))),
                                            Container(
                                                width: double.infinity,

                                                padding:
                                                getPadding( top: 19),
                                                child: Obx (() =>controller.userListResponseModel!.value.data!=null?controller.userListResponseModel!.value.data!.certificates!.length>0?ListView.builder(
                                                    itemCount: controller.userListResponseModel!.value.data!.certificates!.length,
                                                    physics: NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    itemBuilder:
                                                        (BuildContext context, int index) {
                                                      return Container(

                                                          padding:
                                                          getPadding(left: 0, top: 19),
                                                          child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.center,
                                                              mainAxisSize: MainAxisSize.max,
                                                              children: [
                                                                CommonImageView(
                                                                  svgPath: ImageConstant.clipper,
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*0.6,
                                                                  child: Text(
                                                                    controller.userListResponseModel!.value.data!.certificates![index].certificate!,
                                                                    maxLines: 2,
                                                                    style: TextStyle(
                                                                      color: ColorConstant.black900,
                                                                      fontSize: getFontSize(
                                                                        14,
                                                                      ),
                                                                      fontWeight: FontWeight.w400,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                  controller.userListResponseModel!.value.data!.certificates![index].size!,
                                                                  style: TextStyle(
                                                                    color: ColorConstant.hintTextColor,
                                                                    fontSize: getFontSize(
                                                                      12,
                                                                    ),
                                                                    fontWeight: FontWeight.w400,
                                                                  ),
                                                                ),
                                                              ]));
                                                    }):Text("-",
                                                  style: AppStyle.txtPoppinsRegular14Black900,):Text("No Certificates",
                                                  style: AppStyle.txtPoppinsRegular14Black900,),)),
                                          ])),

                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: Container(
                                        height:
                                        getVerticalSize(
                                            1.00),
                                        decoration: BoxDecoration(
                                            color: ColorConstant
                                                .gray100)),
                                  ),

                                  Container(
                                      width: double.infinity,
                                      margin: getMargin(top: 16,right: 16),
                                      child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: getPadding(
                                                    top: 13),
                                                child: Text("Badges:",
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtPoppinsMedium14
                                                        .copyWith(
                                                        letterSpacing: 0.5,
                                                        height: 1.00))),
                                            controller.userListResponseModel!.value.data!.badges!.isNotEmpty?
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8.0),
                                              child: Container(
                                                height: 50,
                                                child: ListView.builder(
                                                    itemCount: controller.userListResponseModel!.value.data!.badges!.length,
                                                    scrollDirection: Axis.horizontal,
                                                    shrinkWrap: true,
                                                    itemBuilder:
                                                        (BuildContext context, int index) {
                                                      return Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            ClipRRect(
                                                                borderRadius: BorderRadius.circular(
                                                                    getHorizontalSize(10.00)),
                                                                child: CommonImageView(
                                                                    url: controller.userListResponseModel!.value.data!.badges![index].badge!,
                                                                    height: getSize(40.00),
                                                                    width: getSize(40.00),
                                                                    fit: BoxFit.cover)),
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                              ),
                                            ):Padding(
                                              padding: const EdgeInsets.only(top: 8.0),
                                              child: Text("-",
                                                style: AppStyle.txtPoppinsRegular14Black900,),
                                            ),

                                          ])),
                                  SizedBox(
                                    height: 20,
                                  )
                                ])),
                      ])));
        }))));
  }
}
