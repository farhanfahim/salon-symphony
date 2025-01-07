import 'dart:io';
import 'package:salon_symphony/core/utils/utils.dart';
import '../../baseviews/baseview_process_screen.dart';
import '../../widgets/response_binding_widget.dart';
import '../../widgets/skeleton.dart';
import 'controller/education_tracking_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

class EducationTrackingDetailsScreen
    extends GetWidget<EducationTrackingDetailsController> {
  @override
  Widget build(BuildContext context) {
    return BaseviewScreen(
     basicAppBar: true,
     screenName: "Class Details",
     showBottomBar: false,
     mainTopHeight: 0,
     isMenuTab: true,
     sidePadding: false,
     backgroundColor: ColorConstant.whiteA700,
     child: Obx(() =>  ResponseBindingWidget(
        apiCallStatus: controller.apiCallStatus.value,
        errorWidget: () {
          return Container();
        },
        loadingWidget: () {
          return Container(
            width: size.width,
            height: size.height,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: double.infinity,
                      decoration: AppDecoration.outlineBlack9000a1.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: Padding(
                                    padding: getPadding(
                                        left: 25, top: 0, right: 20),
                                    child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                              padding: getPadding(
                                                  top: 10, bottom: 2),
                                              child: Text(
                                                  "Educator",
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtPoppinsRegular12Gray600)),

                                        ]))),
                            Padding(
                                padding:
                                getPadding(left: 25, top: 7, right: 16),
                                child: Container(width: 100, height: 15.0, child: Skeleton(switcholor: true,))),
                            Padding(
                                padding: getPadding(
                                    left: 25, top: 31, right: 16),
                                child: Text("Class Name",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .txtPoppinsRegular12Gray600)),
                            Padding(
                                padding:
                                getPadding(left: 25, top: 8, right: 16),
                                child: Container(width: 120, height: 15.0, child: Skeleton(switcholor: true,))),
                            Padding(
                                padding: getPadding(
                                    left: 25, top: 32, right: 16),
                                child: Text('Class Date',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .txtPoppinsRegular12Gray600)),
                            Padding(
                                padding:
                                getPadding(left: 25, top: 9, right: 16),
                                child: Container(width: 100, height: 15.0, child: Skeleton(switcholor: true,))),
                            Container(
                                height: getVerticalSize(12.00),
                                width: double.infinity,
                                margin:
                                getMargin( top: 25),
                                decoration: BoxDecoration(
                                    color: ColorConstant.seperateColor)),
                            Padding(
                                padding: getPadding(
                                    left: 25, top: 24, right: 16),
                                child: Text("Class Notes",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsMedium16
                                        .copyWith(
                                        letterSpacing: 0.5,
                                        height: 1.00,fontSize: 16.5))),
                            Container(
                                width: getHorizontalSize(306.00),
                                margin: getMargin(
                                    left: 25, top: 9, right: 13),
                                child: Container(width: 200, height: 15.0, child: Skeleton(switcholor: true,))),

                            Padding(
                                padding: getPadding(
                                    left: 25,
                                    top: 40,
                                    right: 40,
                                    bottom: 49),
                                child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                          padding: getPadding(
                                              top: 3, bottom: 4),
                                          child: Text(
                                              "Hours Earned",
                                              overflow:
                                              TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPoppinsRegular12Gray600
                                                  .copyWith(
                                                  fontSize: 13,
                                                  height: 1.00))),
                                      Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisSize:
                                          MainAxisSize.min,
                                          children: [
                                            CommonImageView(
                                                svgPath: ImageConstant
                                                    .imgClock,
                                                height: getSize(20.00),
                                                width: getSize(20.00)),
                                            Padding(
                                                padding: getPadding(
                                                    left: 8,
                                                    top:5,
                                                    bottom: 3),
                                                child: Container(width: 40, height: 15.0, child: Skeleton(switcholor: true,)))
                                          ])
                                    ]))
                          ]))
                ]),
          );
        },
        emptyWidget: (){
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
              height: size.height,
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: double.infinity,
                            decoration: AppDecoration.outlineBlack9000a1.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder10),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                          padding: getPadding(
                                              left: 25, top: 0, right: 20),
                                          child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                    padding: getPadding(
                                                        top: 10, bottom: 2),
                                                    child: Text(
                                                        "Educator",
                                                        overflow:
                                                        TextOverflow.ellipsis,
                                                        textAlign: TextAlign.left,
                                                        style: AppStyle
                                                            .txtPoppinsRegular12Gray600)),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 8.0),
                                                  child: CommonImageView(
                                                    imagePath: controller.requestData!.value.status==10?ImageConstant.pending_tab:controller.requestData!.value.status==20?ImageConstant.approved_tab:ImageConstant.decline_tab,
                                                    height: getSize(
                                                      23.00,
                                                    ),
                                                    width: getSize(
                                                      83.00,
                                                    ),
                                                  ),
                                                )
                                              ]))),
                                  Padding(
                                      padding:
                                      getPadding(left: 25, top: 7, right: 16),
                                      child: Text(controller.requestData!.value.educator!=null?controller.requestData!.value.educator!:"-",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsMedium16
                                              .copyWith(height: 1.00,fontSize: 16.5))),
                                  Padding(
                                      padding: getPadding(
                                          left: 25, top: 31, right: 16),
                                      child: Text("Class Name",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtPoppinsRegular12Gray600)),
                                  Padding(
                                      padding:
                                      getPadding(left: 25, top: 8, right: 16),
                                      child: Text(controller.requestData!.value.className!=null?controller.requestData!.value.className!:"-",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsMedium16
                                              .copyWith(height: 1.00,fontSize: 16.5))),
                                  Padding(
                                      padding: getPadding(
                                          left: 25, top: 32, right: 16),
                                      child: Text('Class Date',
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtPoppinsRegular12Gray600)),
                                  Padding(
                                      padding:
                                      getPadding(left: 25, top: 9, right: 16),
                                      child: Text(controller.requestData!.value.date!=null?Utils.getFormatedDate(controller.requestData!.value.date!):"-",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsMedium16
                                              .copyWith(height: 1.00,fontSize: 16.5))),
                                  Container(
                                      height: getVerticalSize(12.00),
                                      width: double.infinity,
                                      margin:
                                      getMargin( top: 25),
                                      decoration: BoxDecoration(
                                          color: ColorConstant.seperateColor)),
                                  Padding(
                                      padding: getPadding(
                                          left: 25, top: 24, right: 16),
                                      child: Text("Class Notes",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsMedium16
                                              .copyWith(
                                              letterSpacing: 0.5,
                                              height: 1.00,fontSize: 16.5))),
                                  Container(
                                      width: getHorizontalSize(306.00),
                                      margin: getMargin(
                                          left: 25, top: 9, right: 13),
                                      child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                controller.requestData!.value.comments!=null?controller.requestData!.value.comments!:"-",
                                                style: TextStyle(
                                                  color: ColorConstant
                                                      .black900,
                                                  fontSize: 13,
                                                  fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                                  letterSpacing: 0.09,)),

                                          ]),
                                          textAlign: TextAlign.left)),

                                  Padding(
                                      padding: getPadding(
                                          left: 25,
                                          top: 40,
                                          right: 40,
                                          bottom: 49),
                                      child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                                padding: getPadding(
                                                    top: 3, bottom: 4),
                                                child: Text(
                                                    "Hours Earned",
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtPoppinsRegular12Gray600
                                                        .copyWith(
                                                        fontSize: 13,
                                                        height: 1.00))),
                                            Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                mainAxisSize:
                                                MainAxisSize.min,
                                                children: [
                                                  CommonImageView(
                                                      svgPath: ImageConstant
                                                          .imgClock,
                                                      height: getSize(20.00),
                                                      width: getSize(20.00)),
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 8,
                                                          top:5,
                                                          bottom: 3),
                                                      child: Text(
                                                          controller.requestData!.value.hour!=null?controller.requestData!.value.hour!:"-",
                                                          overflow:
                                                          TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                          TextAlign.left,
                                                          style: AppStyle
                                                              .txtPoppinsMedium14
                                                              .copyWith(
                                                              fontSize: 14,
                                                              height:
                                                              1.00,
                                                              fontWeight: FontWeight.w700)))
                                                ])
                                          ]))
                                ]))
                      ])));
        }
    )),
    );
  }



}
