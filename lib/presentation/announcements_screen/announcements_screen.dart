import 'dart:io';

import 'package:readmore/readmore.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';

import 'controller/announcements_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

class AnnouncementsScreen extends GetWidget<AnnouncementsController> {
  @override
  Widget build(BuildContext context) {
    return BaseviewScreen(
        basicAppBar: true,
        screenName: "lbl_announcements".tr,
        showBottomBar: false,
        mainTopHeight: 0,
        sidePadding: false,
        backgroundColor: ColorConstant.whiteA700,
        child: Container(
            color: ColorConstant.whiteA700,
            child: Container(
                width: size.width,
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                      Container(
                          width: double.infinity,
                          margin: getMargin(left: 16, top: 0, right: 16),
                          decoration: AppDecoration.outlineBlack9000a.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: getPadding(
                                        left: 15, top: 21, right: 15),
                                    child: Text("lbl_technical_task".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsSemiBold14
                                            .copyWith(height: 1.00))),
                               Padding(
                                padding: getPadding(
                                    left: 15, top: 21, right: 15,bottom: 30),
                                 child: ReadMoreText(
                                  "msg_this_is_dummy_c10".tr,
                                  trimLines: 4,
                                  colorClickableText: ColorConstant.pink300,
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText: 'Show more',
                                  trimExpandedText: 'Show less',
                                  moreStyle: TextStyle(
                                      color: ColorConstant.pink300,
                                      fontSize: getFontSize(12),
                                      fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w500),
                                  lessStyle: TextStyle(
                                      color: ColorConstant.pink300,
                                      fontSize: getFontSize(12),
                                      fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w500),
                                  style: TextStyle(
                                      color: ColorConstant.gray600,
                                      fontSize: getFontSize(12),
                                      fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w400)),
                               ),

                              ])),
                      Container(
                          width: double.infinity,
                          margin: getMargin(left: 16, top: 16, right: 16),
                          decoration: AppDecoration.outlineBlack9000a.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: getPadding(
                                        left: 15, top: 24, right: 15),
                                    child: Text("lbl_happy_holiday".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsSemiBold14
                                            .copyWith(height: 1.00))),
                                Container(
                                    width: getHorizontalSize(289.00),
                                    margin: getMargin(
                                        left: 16,
                                        top: 19,
                                        right: 16,
                                        bottom: 33),
                                    child: Text("msg_this_is_dummy_c11".tr,
                                        maxLines: null,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPoppinsRegular12Gray600))
                              ])),
                      Container(
                          width: double.infinity,
                          margin: getMargin(
                              left: 16, top: 20, right: 16, bottom: 20),
                          decoration: AppDecoration.outlineBlack9000a.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: getPadding(
                                        left: 15, top: 24, right: 15),
                                    child: Text("lbl_easter_sale".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsSemiBold14
                                            .copyWith(height: 1.00))),
                                Container(
                                    width: getHorizontalSize(289.00),
                                    margin: getMargin(
                                        left: 16,
                                        top: 20,
                                        right: 16,
                                        bottom: 20),
                                    child: Text("msg_this_is_dummy_c11".tr,
                                        maxLines: null,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPoppinsRegular12Gray600))
                              ]))
                    ])))));
  }

}
