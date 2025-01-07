import 'dart:io';
import '../my_profile_one_screen/widgets/listclose_item_widget.dart';
import '../my_profile_one_screen/widgets/listfacebook_item_widget.dart';
import '../my_profile_one_screen/widgets/listlightbulb_item_widget.dart';
import 'controller/my_profile_one_controller.dart';
import 'models/listclose_item_model.dart';
import 'models/listfacebook_item_model.dart';
import 'models/listlightbulb_item_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_button.dart';
import 'package:salon_symphony/widgets/custom_switch.dart';

class MyProfileOneScreen extends GetWidget<MyProfileOneController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      width: size.width,
                      margin: getMargin(top: 4),
                      child: Padding(
                          padding: getPadding(left: 16, right: 16),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                    onTap: () {
                                      onTapImgArrowleft();
                                    },
                                    child: CommonImageView(
                                        svgPath: ImageConstant.imgArrowleft,
                                        height: getSize(24.00),
                                        width: getSize(24.00))),
                                Padding(
                                    padding: getPadding(top: 5, bottom: 1),
                                    child: Text("lbl_my_profile".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsMedium16
                                            .copyWith(
                                                letterSpacing: 0.5,
                                                height: 1.00))),
                                GestureDetector(
                                    onTap: () {
                                      onTapTxtEdit();
                                    },
                                    child: Padding(
                                        padding: getPadding(top: 3, bottom: 4),
                                        child: Text("lbl_edit".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtPoppinsRegular16Pink300
                                                .copyWith(height: 1.00))))
                              ]))),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: getPadding(
                                  left: 16, top: 26, right: 16, bottom: 603),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: getPadding(right: 10),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          getHorizontalSize(
                                                              32.50)),
                                                  child: CommonImageView(
                                                      imagePath: ImageConstant
                                                          .imgEllipse837,
                                                      height: getSize(65.00),
                                                      width: getSize(65.00),
                                                      fit: BoxFit.cover)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 10,
                                                      top: 16,
                                                      bottom: 10),
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
                                                            "msg_siphron_gretche"
                                                                .tr,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtPoppinsMedium16
                                                                .copyWith(
                                                                    height:
                                                                        1.00)),
                                                        Container(
                                                            height:
                                                                getVerticalSize(
                                                                    13.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    116.00),
                                                            margin: getMargin(
                                                                top: 7,
                                                                right: 10),
                                                            child: Stack(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                children: [
                                                                  Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .bottomLeft,
                                                                      child: Text(
                                                                          "msg_stylist_new_y"
                                                                              .tr,
                                                                          overflow: TextOverflow
                                                                              .ellipsis,
                                                                          textAlign: TextAlign
                                                                              .left,
                                                                          style: AppStyle
                                                                              .txtPoppinsRegular14Gray600
                                                                              .copyWith(height: 1.00))),
                                                                  Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      child: Container(
                                                                          height: getSize(
                                                                              2.00),
                                                                          width: getSize(
                                                                              2.00),
                                                                          margin: getMargin(
                                                                              left:
                                                                                  45,
                                                                              top:
                                                                                  5,
                                                                              right:
                                                                                  45,
                                                                              bottom:
                                                                                  6),
                                                                          decoration: BoxDecoration(
                                                                              color: ColorConstant.gray600,
                                                                              borderRadius: BorderRadius.circular(getHorizontalSize(1.00)))))
                                                                ]))
                                                      ]))
                                            ])),
                                    Container(
                                        margin: getMargin(top: 19),
                                        decoration: AppDecoration
                                            .outlineBlack9000a1
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder5),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                  padding: getPadding(
                                                      left: 10,
                                                      top: 11,
                                                      bottom: 9),
                                                  child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        CommonImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .imgStar,
                                                            height:
                                                                getSize(40.00),
                                                            width:
                                                                getSize(40.00)),
                                                        Padding(
                                                            padding: getPadding(
                                                                left: 15,
                                                                top: 11,
                                                                bottom: 12),
                                                            child: Text(
                                                                "lbl_total_points"
                                                                    .tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtPoppinsMedium16
                                                                    .copyWith(
                                                                        letterSpacing:
                                                                            0.5)))
                                                      ])),
                                              Padding(
                                                  padding: getPadding(
                                                      top: 23,
                                                      right: 20,
                                                      bottom: 20),
                                                  child: Text("lbl_2_000".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtPoppinsMedium16
                                                          .copyWith(
                                                              letterSpacing:
                                                                  0.5)))
                                            ])),
                                    Container(
                                        width: double.infinity,
                                        margin: getMargin(top: 14),
                                        decoration: AppDecoration
                                            .outlineBlack9000a1
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder5),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: getPadding(
                                                      left: 10,
                                                      top: 12,
                                                      right: 10),
                                                  child: Text("lbl_bio".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtPoppinsSemiBold16
                                                          .copyWith(
                                                              letterSpacing:
                                                                  0.5))),
                                              Container(
                                                  width:
                                                      getHorizontalSize(304.00),
                                                  margin: getMargin(
                                                      left: 10,
                                                      top: 17,
                                                      right: 10),
                                                  child: RichText(
                                                      text: TextSpan(children: [
                                                        TextSpan(
                                                            text: "lbl_this".tr,
                                                            style: TextStyle(
                                                                color:
                                                                    ColorConstant
                                                                        .black900,
                                                                fontSize:
                                                                    getFontSize(
                                                                        14),
                                                                fontFamily: Platform
                                                                        .isIOS
                                                                    ? 'SF Pro Display'
                                                                    : 'Roboto',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400)),
                                                        TextSpan(
                                                            text:
                                                                "msg_bio_does_not_ne"
                                                                    .tr,
                                                            style: TextStyle(
                                                                color:
                                                                    ColorConstant
                                                                        .black900,
                                                                fontSize:
                                                                    getFontSize(
                                                                        14),
                                                                fontFamily: Platform
                                                                        .isIOS
                                                                    ? 'SF Pro Display'
                                                                    : 'Roboto',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400)),
                                                        TextSpan(
                                                            text:
                                                                "lbl_read_more2"
                                                                    .tr,
                                                            style: TextStyle(
                                                                color:
                                                                    ColorConstant
                                                                        .pink300,
                                                                fontSize:
                                                                    getFontSize(
                                                                        14),
                                                                fontFamily: Platform
                                                                        .isIOS
                                                                    ? 'SF Pro Display'
                                                                    : 'Roboto',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400))
                                                      ]),
                                                      textAlign:
                                                          TextAlign.left)),
                                              Container(
                                                  height: getVerticalSize(1.00),
                                                  width:
                                                      getHorizontalSize(323.00),
                                                  margin: getMargin(
                                                      left: 10,
                                                      top: 21,
                                                      right: 10),
                                                  decoration: BoxDecoration(
                                                      color: ColorConstant
                                                          .gray100)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 10,
                                                      top: 19,
                                                      right: 10),
                                                  child: Text("lbl_info".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtPoppinsSemiBold16
                                                          .copyWith(
                                                              letterSpacing:
                                                                  0.5))),
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                      padding: getPadding(
                                                          left: 10,
                                                          top: 15,
                                                          right: 10),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        bottom:
                                                                            1),
                                                                child: Text(
                                                                    "lbl_position"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtPoppinsRegular14Gray600)),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        top: 1),
                                                                child: Text(
                                                                    "lbl_nail_artist"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtPoppinsRegular14Black900
                                                                        .copyWith(
                                                                            height:
                                                                                1.00)))
                                                          ]))),
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                      padding: getPadding(
                                                          left: 10,
                                                          top: 12,
                                                          right: 10),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        bottom:
                                                                            1),
                                                                child: Text(
                                                                    "lbl_phone_number2"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtPoppinsRegular14Gray600)),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        top: 1),
                                                                child: Text(
                                                                    "lbl_0934787237"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtPoppinsRegular14Black900
                                                                        .copyWith(
                                                                            height:
                                                                                1.00)))
                                                          ]))),
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                      padding: getPadding(
                                                          left: 10,
                                                          top: 11,
                                                          right: 10),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        bottom:
                                                                            1),
                                                                child: Text(
                                                                    "lbl_hire_date"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtPoppinsRegular14Gray600)),
                                                            Padding(
                                                                padding: getPadding(
                                                                    top: 1),
                                                                child: Text(
                                                                    "lbl_2022"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtPoppinsRegular14Black900
                                                                        .copyWith(
                                                                            height:
                                                                                1.00)))
                                                          ]))),
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                      padding: getPadding(
                                                          left: 10,
                                                          top: 12,
                                                          right: 10),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        bottom:
                                                                            2),
                                                                child: Text(
                                                                    "lbl_school"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtPoppinsRegular14Gray600)),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        top: 2),
                                                                child: Text(
                                                                    "lbl_aveda_college"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtPoppinsRegular14Black900
                                                                        .copyWith(
                                                                            height:
                                                                                1.00)))
                                                          ]))),
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                      padding: getPadding(
                                                          left: 10,
                                                          top: 12,
                                                          right: 10,
                                                          bottom: 15),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        bottom:
                                                                            1),
                                                                child: Text(
                                                                    "lbl_relationship"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtPoppinsRegular14Gray600)),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        top: 1),
                                                                child: Text(
                                                                    "lbl_single"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtPoppinsRegular14Black900
                                                                        .copyWith(
                                                                            height:
                                                                                1.00)))
                                                          ])))
                                            ])),
                                    Container(
                                        width: double.infinity,
                                        margin: getMargin(top: 13),
                                        decoration: AppDecoration
                                            .outlineBlack9000a1
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder5),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: getPadding(
                                                      left: 10,
                                                      top: 12,
                                                      right: 10),
                                                  child: Text(
                                                      "lbl_interests".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtPoppinsSemiBold16
                                                          .copyWith(
                                                              letterSpacing:
                                                                  0.5,
                                                              height: 1.00))),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 10,
                                                      top: 19,
                                                      right: 10),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                            padding: getPadding(
                                                                left: 13,
                                                                top: 9,
                                                                right: 13,
                                                                bottom: 7),
                                                            decoration: AppDecoration
                                                                .txtFillDeeppurpleA201
                                                                .copyWith(
                                                                    borderRadius:
                                                                        BorderRadiusStyle
                                                                            .txtRoundedBorder4),
                                                            child: Text(
                                                                "lbl_curly_hair"
                                                                    .tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtPoppinsRegular12WhiteA701)),
                                                        Container(
                                                            margin: getMargin(
                                                                left: 17),
                                                            padding: getPadding(
                                                                left: 13,
                                                                top: 9,
                                                                right: 13,
                                                                bottom: 7),
                                                            decoration: AppDecoration
                                                                .txtFillDeeppurpleA201
                                                                .copyWith(
                                                                    borderRadius:
                                                                        BorderRadiusStyle
                                                                            .txtRoundedBorder4),
                                                            child: Text(
                                                                "lbl_blonding"
                                                                    .tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtPoppinsRegular12WhiteA701)),
                                                        Container(
                                                            margin: getMargin(
                                                                left: 13),
                                                            padding: getPadding(
                                                                left: 13,
                                                                top: 9,
                                                                right: 13,
                                                                bottom: 7),
                                                            decoration: AppDecoration
                                                                .txtFillDeeppurpleA201
                                                                .copyWith(
                                                                    borderRadius:
                                                                        BorderRadiusStyle
                                                                            .txtRoundedBorder4),
                                                            child: Text(
                                                                "lbl_cutting"
                                                                    .tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtPoppinsRegular12WhiteA701))
                                                      ])),
                                              CustomButton(
                                                  width: 74,
                                                  text: "lbl_makeup".tr,
                                                  margin: getMargin(
                                                      left: 10,
                                                      top: 8,
                                                      right: 10,
                                                      bottom: 20),
                                                  fontStyle: ButtonFontStyle
                                                      .PoppinsRegular12)
                                            ])),
                                    Container(
                                        width: double.infinity,
                                        margin: getMargin(top: 16),
                                        decoration: AppDecoration
                                            .outlineBlack9000a1
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder5),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: getPadding(
                                                      left: 10,
                                                      top: 12,
                                                      right: 10),
                                                  child: Text("lbl_links".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtPoppinsSemiBold16
                                                          .copyWith(
                                                              letterSpacing:
                                                                  0.5,
                                                              height: 1.00))),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 10,
                                                      top: 19,
                                                      right: 10,
                                                      bottom: 20),
                                                  child: Obx(() =>
                                                      ListView.separated(
                                                          physics:
                                                              NeverScrollableScrollPhysics(),
                                                          shrinkWrap: true,
                                                          separatorBuilder:
                                                              (context, index) {
                                                            return Container(
                                                                height:
                                                                    getVerticalSize(
                                                                        1.00),
                                                                width:
                                                                    getHorizontalSize(
                                                                        322.00),
                                                                decoration:
                                                                    BoxDecoration(
                                                                        color: ColorConstant
                                                                            .gray100));
                                                          },
                                                          itemCount: controller
                                                              .myProfileOneModelObj
                                                              .value
                                                              .listfacebookItemList
                                                              .length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            ListfacebookItemModel
                                                                model =
                                                                controller
                                                                    .myProfileOneModelObj
                                                                    .value
                                                                    .listfacebookItemList[index];
                                                            return ListfacebookItemWidget(
                                                                model);
                                                          })))
                                            ])),
                                    Container(
                                        width: double.infinity,
                                        margin: getMargin(top: 16),
                                        decoration: AppDecoration
                                            .outlineBlack9000a1
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder5),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: getPadding(
                                                      left: 10,
                                                      top: 14,
                                                      right: 10),
                                                  child: Text(
                                                      "lbl_certificates".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtPoppinsSemiBold16
                                                          .copyWith(
                                                              letterSpacing:
                                                                  0.5))),
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                      padding: getPadding(
                                                          left: 10,
                                                          top: 18,
                                                          right: 10,
                                                          bottom: 20),
                                                      child: Obx(() =>
                                                          ListView.separated(
                                                              physics:
                                                                  NeverScrollableScrollPhysics(),
                                                              shrinkWrap: true,
                                                              separatorBuilder:
                                                                  (context,
                                                                      index) {
                                                                return Container(
                                                                    height:
                                                                        getVerticalSize(
                                                                            1.00),
                                                                    width: getHorizontalSize(
                                                                        323.00),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                            color:
                                                                                ColorConstant.gray100));
                                                              },
                                                              itemCount: controller
                                                                  .myProfileOneModelObj
                                                                  .value
                                                                  .listcloseItemList
                                                                  .length,
                                                              itemBuilder:
                                                                  (context,
                                                                      index) {
                                                                ListcloseItemModel
                                                                    model =
                                                                    controller
                                                                        .myProfileOneModelObj
                                                                        .value
                                                                        .listcloseItemList[index];
                                                                return ListcloseItemWidget(
                                                                    model);
                                                              }))))
                                            ])),
                                    Container(
                                        width: double.infinity,
                                        margin: getMargin(top: 16),
                                        decoration: AppDecoration
                                            .outlineBlack9000a1
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder5),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: getPadding(
                                                      left: 10,
                                                      top: 13,
                                                      right: 10),
                                                  child: Text(
                                                      "lbl_mentorship".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtPoppinsSemiBold16
                                                          .copyWith(
                                                              letterSpacing:
                                                                  0.5,
                                                              height: 1.00))),
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                      margin: getMargin(
                                                          left: 10,
                                                          top: 16,
                                                          right: 10),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  getHorizontalSize(
                                                                      6.00))),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        top: 4,
                                                                        bottom:
                                                                            3),
                                                                child: Text(
                                                                    "lbl_become_a_mentor"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtPoppinsRegular14Black900
                                                                        .copyWith(
                                                                            height:
                                                                                1.00))),
                                                            Obx(() =>
                                                                CustomSwitch(
                                                                    value: controller
                                                                        .isSelectedSwitch
                                                                        .value,
                                                                    onChanged:
                                                                        (value) {
                                                                      controller
                                                                          .isSelectedSwitch
                                                                          .value = value;
                                                                    }))
                                                          ]))),
                                              Container(
                                                  height: getVerticalSize(1.00),
                                                  width:
                                                      getHorizontalSize(323.00),
                                                  margin: getMargin(
                                                      left: 10,
                                                      top: 10,
                                                      right: 10),
                                                  decoration: BoxDecoration(
                                                      color: ColorConstant
                                                          .gray100)),
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                      margin: getMargin(
                                                          left: 10,
                                                          top: 10,
                                                          right: 10,
                                                          bottom: 15),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  getHorizontalSize(
                                                                      6.00))),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        top: 4,
                                                                        bottom:
                                                                            3),
                                                                child: Text(
                                                                    "lbl_become_a_mentee"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtPoppinsRegular14Black900
                                                                        .copyWith(
                                                                            height:
                                                                                1.00))),
                                                            Obx(() =>
                                                                CustomSwitch(
                                                                    value: controller
                                                                        .isSelectedSwitch1
                                                                        .value,
                                                                    onChanged:
                                                                        (value) {
                                                                      controller
                                                                          .isSelectedSwitch1
                                                                          .value = value;
                                                                    }))
                                                          ])))
                                            ])),
                                    Container(
                                        width: double.infinity,
                                        margin: getMargin(top: 16),
                                        decoration: AppDecoration
                                            .outlineBlack9000a1
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder5),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: getPadding(
                                                      left: 10,
                                                      top: 13,
                                                      right: 10),
                                                  child: Text("lbl_badges".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtPoppinsSemiBold14
                                                          .copyWith(
                                                              letterSpacing:
                                                                  0.5,
                                                              height: 1.00))),
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                      padding: getPadding(
                                                          left: 10,
                                                          top: 18,
                                                          right: 10,
                                                          bottom: 22),
                                                      child: Obx(() =>
                                                          ListView.builder(
                                                              physics:
                                                                  NeverScrollableScrollPhysics(),
                                                              shrinkWrap: true,
                                                              itemCount: controller
                                                                  .myProfileOneModelObj
                                                                  .value
                                                                  .listlightbulbItemList
                                                                  .length,
                                                              itemBuilder:
                                                                  (context,
                                                                      index) {
                                                                ListlightbulbItemModel
                                                                    model =
                                                                    controller
                                                                        .myProfileOneModelObj
                                                                        .value
                                                                        .listlightbulbItemList[index];
                                                                return ListlightbulbItemWidget(
                                                                    model);
                                                              }))))
                                            ]))
                                  ]))))
                ])));
  }

  onTapImgArrowleft() {
    Get.back();
  }

  onTapTxtEdit() {
    Get.toNamed(AppRoutes.editProfileScreen);
  }
}
