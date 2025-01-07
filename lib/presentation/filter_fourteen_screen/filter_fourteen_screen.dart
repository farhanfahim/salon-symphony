import 'dart:io';
import 'controller/filter_fourteen_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

class FilterFourteenScreen extends GetWidget<FilterFourteenController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA701,
        body: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: size.width,
                    margin: getMargin(
                      top: 24,
                    ),
                    child: Padding(
                      padding: getPadding(
                        left: 16,
                        right: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "msg_percentage_goal".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsMedium16.copyWith(
                              height: 1.00,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 1,
                              bottom: 1,
                            ),
                            child: Text(
                              "lbl_close".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style:
                                  AppStyle.txtPoppinsRegular14Pink300.copyWith(
                                height: 1.00,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                    left: 16,
                    top: 19,
                    right: 16,
                  ),
                  decoration: BoxDecoration(
                    color: ColorConstant.bluegray10090,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: getHorizontalSize(
                      331.00,
                    ),
                    margin: getMargin(
                      left: 16,
                      top: 23,
                      right: 16,
                    ),
                    child: Text(
                      "msg_assume_your_goa3".tr,
                      maxLines: null,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsRegular14Black900.copyWith(
                        height: 1.50,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: getHorizontalSize(
                      291.00,
                    ),
                    margin: getMargin(
                      left: 30,
                      top: 33,
                      right: 30,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "lbl_your".tr,
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
                          TextSpan(
                            text: "lbl_goal_name".tr,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                14,
                              ),
                               fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                              fontWeight: FontWeight.w500,
                              height: 1.50,
                            ),
                          ),
                          TextSpan(
                            text: "msg_would_be_someth".tr,
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
                          TextSpan(
                            text: "lbl_100k".tr,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                14,
                              ),
                               fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                              fontWeight: FontWeight.w500,
                              height: 1.50,
                            ),
                          ),
                          TextSpan(
                            text: "msg_annual_service".tr,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                14,
                              ),
                               fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                              fontWeight: FontWeight.w500,
                              height: 1.50,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: getMargin(
                      left: 30,
                      top: 23,
                      right: 30,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "lbl_your".tr,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                14,
                              ),
                               fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 1.00,
                            ),
                          ),
                          TextSpan(
                            text: "lbl_start_date".tr,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                14,
                              ),
                               fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                              fontWeight: FontWeight.w500,
                              height: 1.00,
                            ),
                          ),
                          TextSpan(
                            text: "lbl_would_be".tr,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                14,
                              ),
                               fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 1.00,
                            ),
                          ),
                          TextSpan(
                            text: "lbl_march_1_20232".tr,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                14,
                              ),
                               fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                              fontWeight: FontWeight.w500,
                              height: 1.00,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: getMargin(
                      left: 16,
                      top: 26,
                      right: 16,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "lbl_your".tr,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                14,
                              ),
                               fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 1.00,
                            ),
                          ),
                          TextSpan(
                            text: "lbl_end_date".tr,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                14,
                              ),
                               fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                              fontWeight: FontWeight.w500,
                              height: 1.00,
                            ),
                          ),
                          TextSpan(
                            text: "lbl_would_be".tr,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                14,
                              ),
                               fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 1.00,
                            ),
                          ),
                          TextSpan(
                            text: "msg_december_31_202".tr,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                14,
                              ),
                               fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                              fontWeight: FontWeight.w500,
                              height: 1.00,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: getMargin(
                      left: 16,
                      top: 26,
                      right: 16,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "lbl_your".tr,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                14,
                              ),
                               fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 1.00,
                            ),
                          ),
                          TextSpan(
                            text: "lbl_target_type2".tr,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                14,
                              ),
                               fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                              fontWeight: FontWeight.w500,
                              height: 1.00,
                            ),
                          ),
                          TextSpan(
                            text: "lbl_would_be_a".tr,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                14,
                              ),
                               fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 1.00,
                            ),
                          ),
                          TextSpan(
                            text: "lbl_dollar_amount2".tr,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                14,
                              ),
                               fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                              fontWeight: FontWeight.w500,
                              height: 1.00,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: getMargin(
                      left: 30,
                      top: 25,
                      right: 30,
                      bottom: 20,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "lbl_your".tr,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                14,
                              ),
                               fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 1.00,
                            ),
                          ),
                          TextSpan(
                            text: "lbl_target_value2".tr,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                14,
                              ),
                               fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                              fontWeight: FontWeight.w500,
                              height: 1.00,
                            ),
                          ),
                          TextSpan(
                            text: "lbl_would_be".tr,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                14,
                              ),
                               fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 1.00,
                            ),
                          ),
                          TextSpan(
                            text: "lbl_100_0002".tr,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                14,
                              ),
                               fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                              fontWeight: FontWeight.w500,
                              height: 1.00,
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
      ),
    );
  }
}
