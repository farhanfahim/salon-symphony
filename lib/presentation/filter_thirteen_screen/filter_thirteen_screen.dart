import 'dart:io';
import 'controller/filter_thirteen_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

class FilterThirteenScreen extends GetWidget<FilterThirteenController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Container(
              height: getVerticalSize(
                610.00,
              ),
              width: size.width,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: getVerticalSize(
                        612.00,
                      ),
                      width: size.width,
                      decoration: BoxDecoration(
                        color: ColorConstant.whiteA701,
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            14.00,
                          ),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: ColorConstant.black90019,
                            spreadRadius: getHorizontalSize(
                              2.00,
                            ),
                            blurRadius: getHorizontalSize(
                              2.00,
                            ),
                            offset: Offset(
                              0,
                              0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: getPadding(
                        left: 15,
                        top: 24,
                        right: 15,
                        bottom: 24,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: size.width,
                            child: Padding(
                              padding: getPadding(
                                left: 16,
                                right: 15,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    "msg_goal_setting_ex".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsMedium16.copyWith(
                                      height: 1.00,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 1,
                                      bottom: 2,
                                    ),
                                    child: Text(
                                      "lbl_close".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsRegular14Pink300
                                          .copyWith(
                                        height: 1.00,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: getVerticalSize(
                              1.00,
                            ),
                            width: getHorizontalSize(
                              343.00,
                            ),
                            margin: getMargin(
                              left: 1,
                              top: 19,
                              right: 1,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.bluegray10090,
                            ),
                          ),
                          Container(
                            width: getHorizontalSize(
                              343.00,
                            ),
                            margin: getMargin(
                              left: 1,
                              top: 23,
                              right: 1,
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "lbl_dollar_target".tr,
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                       fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w600,
                                      height: 1.50,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "msg_assume_your_goa".tr,
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                       fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w400,
                                      height: 1.50,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: getHorizontalSize(
                                272.00,
                              ),
                              margin: getMargin(
                                left: 14,
                                top: 25,
                                right: 14,
                              ),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "lbl_goal_name2".tr,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                         fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w500,
                                        height: 1.86,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " ",
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                         fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w700,
                                        height: 1.86,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "msg_100k_annual_se2".tr,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                         fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w400,
                                        height: 1.86,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "lbl_start_date2".tr,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                         fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w500,
                                        height: 1.86,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "lbl_march_1_2023".tr,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                         fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w400,
                                        height: 1.86,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "lbl_end_date2".tr,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                         fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w500,
                                        height: 1.86,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "msg_december_31_20".tr,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                         fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w400,
                                        height: 1.86,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "lbl_target_type".tr,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                         fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w500,
                                        height: 1.86,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "lbl_dollar".tr,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                         fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w400,
                                        height: 1.86,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "lbl_target_value".tr,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                         fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w500,
                                        height: 1.86,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "lbl_100_000".tr,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                         fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w400,
                                        height: 1.86,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Container(
                            height: getVerticalSize(
                              1.00,
                            ),
                            width: getHorizontalSize(
                              343.00,
                            ),
                            margin: getMargin(
                              top: 24,
                              right: 1,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.bluegray10090,
                            ),
                          ),
                          Container(
                            width: getHorizontalSize(
                              333.00,
                            ),
                            margin: getMargin(
                              left: 1,
                              top: 24,
                              right: 10,
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "lbl_number_target".tr,
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                       fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w600,
                                      height: 1.50,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "msg_assume_your_goa2".tr,
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                       fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w400,
                                      height: 1.50,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: getHorizontalSize(
                                246.00,
                              ),
                              margin: getMargin(
                                left: 14,
                                top: 25,
                                right: 14,
                              ),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "lbl_goal_name2".tr,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                         fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w500,
                                        height: 1.86,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " ",
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                         fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w700,
                                        height: 1.86,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "msg_25_add_on_treat".tr,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                         fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w400,
                                        height: 1.86,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "lbl_start_date2".tr,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                         fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w500,
                                        height: 1.86,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " ",
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                         fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w400,
                                        height: 1.86,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "lbl_june_1_2023".tr,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                         fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w400,
                                        height: 1.86,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "lbl_end_date2".tr,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                         fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w500,
                                        height: 1.86,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " ",
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                         fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w400,
                                        height: 1.86,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "lbl_june_30_2023".tr,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                         fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w400,
                                        height: 1.86,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "lbl_target_type".tr,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                         fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w500,
                                        height: 1.86,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "lbl_number".tr,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                         fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w400,
                                        height: 1.86,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "lbl_target_value".tr,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                         fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w500,
                                        height: 1.86,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "lbl_503".tr,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                         fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w400,
                                        height: 1.86,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
