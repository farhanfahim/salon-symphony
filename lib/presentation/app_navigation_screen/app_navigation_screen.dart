import 'controller/app_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
class AppNavigationScreen extends GetWidget<AppNavigationController> {
  @override Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(backgroundColor: ColorConstant.whiteA702,
        body: Column(mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(width: size.width,
                  decoration: AppDecoration.fillWhiteA702,
                  child: Column(mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(alignment: Alignment.centerLeft,
                            child: Padding(padding: getPadding(
                                left: 20, top: 10, right: 20, bottom: 10),
                                child: Text("lbl_app_navigation".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: AppStyle.txtRobotoRegular20))),
                        Align(alignment: Alignment.centerLeft,
                            child: Padding(padding: getPadding(left: 20),
                                child: Text("msg_check_your_app".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: AppStyle.txtRobotoRegular16))),
                        Container(height: getVerticalSize(1.00),
                            width: size.width,
                            margin: getMargin(top: 5),
                            decoration: BoxDecoration(
                                color: ColorConstant.black900))
                      ])),
              Expanded(child: Align(alignment: Alignment.center,
                  child: SingleChildScrollView(child: Container(
                      decoration: AppDecoration.fillWhiteA702,
                      child: Column(mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [GestureDetector(onTap: () {
                            onTapSplashOne();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_splash_one".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black900))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {

                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_splash_two".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black9001))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapSignin();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_sign_in2".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black9002))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapForgotpassword();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text(
                                                "lbl_forgot_password2".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black9003))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapOTPverification();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text(
                                                "msg_otp_verificatio2".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black9004))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapCreatenewpassword();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text(
                                                "msg_create_new_pass2".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black9005))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapSignup();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_sign_up2".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black9006))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapSignupAccountsetup();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_sign_up_accou".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black9007))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapSignupAccountsetupAddPhoto();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_sign_up_accou2".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black9008))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapSignupAccountsetupAddedPhoto();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_sign_up_accou3".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black9009))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapSignupAccountsetupSelectInterests();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_sign_up_accou4".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90010))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapSignupAccountsetupSelectedInterests();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_sign_up_accou5".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90011))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapSignupAccountsetupAddBio();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_sign_up_accou6".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90012))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapPostition();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_postition".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90013))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapEventDetailsGoing();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_event_details".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90014))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapEventDetailsCantGo();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_event_details2".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90015))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapEventDetailsInterested();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_event_details3".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90016))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapNotification();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_notification".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90017))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapHomeSearch();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_home_search".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90018))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapMyProfile();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_my_profile2".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90019))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapEditProfile();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_edit_profile".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90020))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {

                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_edit_profile".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90021))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapMyProfileOne();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_my_profile_one".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90022))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapHomeEmptyContainer();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_home_empty".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90023))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapHome();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_home".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90024))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapHomeEventsDetails();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_home_events_d".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90025))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapResourceDetails();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text(
                                                "msg_resource_detail".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90026))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapGoingmembers();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_going_members".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90027))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {

                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_edit_profile2".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90028))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapEventOptionOne();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text(
                                                "msg_event_option_on".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90029))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapFilter();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_filter".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90030))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {

                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_filter_one".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90031))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapTaskDetails();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_task_details2".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90032))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapTaskDetailsDoing();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_task_details".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90033))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapTaskDetailsDone();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_task_details2".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90034))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {

                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_frame_37342".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90035))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapReport();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_report".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90036))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapEventDetails();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_event_details".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90037))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapEventOption();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_event_option".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90038))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapChatSingle();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_chat_single".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90039))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapChatNewChatTwo();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_chat_new_chat".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90040))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapChatNewChatbyLocation();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_chat_new_chat2".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90041))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapChatNewGroup();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_chat_new_grou".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90042))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapChatGroupChatTwo();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_chat_group_ch".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90043))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapChatGroupChatInfo();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_chat_group_ch2".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90044))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapChatGroupChatMedia();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_chat_group_ch3".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90045))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapChatNewChatOne();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_chat_new_chat3".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90046))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapChatNewChat();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_chat_new_chat".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90047))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapChatNewGroupOne();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_chat_new_grou2".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90048))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapChatGroupChat();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_chat_group_ch4".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90049))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapChatGroupChatOne();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_chat_group_ch5".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90050))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapChatMedia();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_chat_media".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90051))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapChatNewChatThree();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_chat_new_chat4".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90052))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapFilterTwo();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_filter_two".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90053))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapEventOptionTwo();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text(
                                                "msg_event_option_tw".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90054))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapFilterSix();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_filter_six".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90055))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {

                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_frame_37340".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90056))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapQuizzes();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_quizzes".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90057))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapQuizzesDetails();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text(
                                                "lbl_quizzes_details".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90058))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapQuizzesDetailsOne();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text(
                                                "msg_quizzes_details".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90059))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapQuizzesDetailsTwo();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text(
                                                "msg_quizzes_details2".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90060))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapQuizzesDetailsThree();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text(
                                                "msg_quizzes_details3".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90061))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapFilterThree();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_filter_three".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90062))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {

                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_flashcards_tw".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90063))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {

                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_flashcards_se".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90064))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {

                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_flashcards_si".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90065))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {

                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_flashcards_fi".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90066))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {

                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_flashcards_fo".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90067))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {

                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_flashcards_th".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90068))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapFlashcardsOne();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_flashcards_on".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90069))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapFlashcards();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_flashcards".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90070))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {

                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_frame_37341".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90071))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {

                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_frame_37346".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90072))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapRequestDeclined();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_request_decli".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90073))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapAddTimeOffRequest();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_add_time_off".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90074))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapScheduleRequestsChangeDays();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text(
                                                "msg_schedule_reques3".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90075))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapScheduleRequestsChangeShifts();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text(
                                                "msg_schedule_reques4".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90076))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapChangShiftTiming();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text(
                                                "msg_chang_shift_tim".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90077))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapFilterFour();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_filter_four".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90078))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {

                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_frame_37343".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90079))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapFilterFive();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_filter_five".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90080))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapMoreSettings();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_more_settings".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90081))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapMoreSettingsChangePassword();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_more_settings".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90082))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapMoreSettingsFAQs();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_more_settings2".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90083))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapMoreSettingsTermsConditionsOne();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_more_settings3".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90084))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapMoreSettingsTermsConditions();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_more_settings4".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90085))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapSettingsOnboardingChecklist();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_settings_onbo".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90086))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapSettingsOnboardingChecklistDetails();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_settings_onbo2".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90087))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapAddnewRererral();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text(
                                                "msg_add_new_rererra".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90088))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapReportOne();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_report_one".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90089))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapFilterSeven();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_filter_seven".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90090))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapFilterTen();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_filter_ten".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90091))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapFilterEleven();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_filter_eleven".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90092))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapSurvey();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_survey".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90093))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapSurveyDetails();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_survey_details".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90094))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapSurveyDetailsThree();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text(
                                                "msg_survey_details2".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90095))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapSurveyDetails();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_survey_details".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90096))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapSurveyDetailsOne();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text(
                                                "msg_survey_details3".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90097))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapEducationTrackingDetails();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text(
                                                "msg_education_track".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90098))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {

                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_add_add_educa".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black90099))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapAddAddEducationTracking();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_add_add_educa2".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black900100))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapEmployeeDicrectry();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text(
                                                "msg_employee_dicrec".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black900101))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapEmployeeDicrectryDetails();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text(
                                                "msg_employee_dicrec2".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black900102))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapChatGroupChatThree();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_chat_group_ch6".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black900103))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapCreateGroup();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_create_group".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black900104))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapFilterSixteen();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_filter_sixteen".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black900105))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {

                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_filter_fifteen".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black900106))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapAnnouncements();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_announcements".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black900107))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapGoalDetailsDone();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_goal_details".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black900108))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapGoalDetailsmissed();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_goal_details2".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black900109))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapGoalDetailsACTIVE();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_goal_details3".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black900110))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapGoalsCreateGoal();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("msg_goals_create".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black900111))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapDocuments();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_documents".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black900112))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapRewards();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_rewards".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black900113))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapFilterThirteen();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text(
                                                "lbl_filter_thirteen".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black900114))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapFilterFourteen();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text(
                                                "lbl_filter_fourteen".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black900115))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapFilterTwelve();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_filter_twelve".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black900116))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapFilterEight();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_filter_eight".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black900117))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapGoalStatus();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_goal_status".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black900118))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ]))), GestureDetector(onTap: () {
                            onTapFilterNine();
                          }, child: Container(width: size.width,
                              decoration: AppDecoration.fillWhiteA702,
                              child: Column(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerLeft,
                                        child: Padding(padding: getPadding(
                                            left: 20,
                                            top: 10,
                                            right: 20,
                                            bottom: 10),
                                            child: Text("lbl_filter_nine".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle
                                                    .txtRobotoRegular20Black900119))),
                                    Container(height: getVerticalSize(1.00),
                                        width: size.width,
                                        margin: getMargin(top: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.bluegray401))
                                  ])))
                          ])))))
            ])));
  }

  onTapSplashOne() {
    Get.toNamed(AppRoutes.splashOneScreen);
  }

  onTapSignin() {
    Get.toNamed(AppRoutes.signInScreen);
  }

  onTapForgotpassword() {
    Get.toNamed(AppRoutes.forgotPasswordScreen);
  }

  onTapOTPverification() {
    Get.toNamed(AppRoutes.otpVerificationScreen);
  }

  onTapCreatenewpassword() {
    Get.toNamed(AppRoutes.createNewPasswordScreen);
  }

  onTapSignup() {
    Get.toNamed(AppRoutes.signUpScreen);
  }

  onTapSignupAccountsetup() {
    Get.toNamed(AppRoutes.signUpAccountSetupScreen);
  }

  onTapSignupAccountsetupAddPhoto() {
    Get.toNamed(AppRoutes.signUpAccountSetupAddPhotoScreen);
  }

  onTapSignupAccountsetupAddedPhoto() {
    Get.toNamed(AppRoutes.signUpAccountSetupAddedPhotoScreen);
  }

  onTapSignupAccountsetupSelectInterests() {
    Get.toNamed(AppRoutes.signUpAccountSetupSelectInterestsScreen);
  }

  onTapSignupAccountsetupSelectedInterests() {
    Get.toNamed(AppRoutes.signUpAccountSetupSelectedInterestsScreen);
  }

  onTapSignupAccountsetupAddBio() {
    Get.toNamed(AppRoutes.signUpAccountSetupAddBioScreen);
  }

  onTapPostition() {
    Get.toNamed(AppRoutes.postitionScreen);
  }

  onTapEventDetailsGoing() {
    Get.toNamed(AppRoutes.eventDetailsGoingScreen);
  }

  onTapEventDetailsCantGo() {
    Get.toNamed(AppRoutes.eventDetailsCanTGoScreen);
  }

  onTapEventDetailsInterested() {
    Get.toNamed(AppRoutes.eventDetailsInterestedScreen);
  }

  onTapNotification() {
    Get.toNamed(AppRoutes.notificationScreen);
  }

  onTapHomeSearch() {
    Get.toNamed(AppRoutes.homeSearchScreen);
  }

  onTapMyProfile() {
    Get.toNamed(AppRoutes.myProfileScreen);
  }

  onTapEditProfile() {
    Get.toNamed(AppRoutes.editProfileScreen);
  }

  onTapMyProfileOne() {
    Get.toNamed(AppRoutes.myProfileOneScreen);
  }

  onTapHomeEmptyContainer() {
    Get.toNamed(AppRoutes.homeEmptyContainerScreen);
  }

  onTapHome() {
    Get.toNamed(AppRoutes.homeScreen);
  }

  onTapHomeEventsDetails() {
    Get.toNamed(AppRoutes.homeEventsDetailsScreen);
  }

  onTapResourceDetails() {
    Get.toNamed(AppRoutes.resourceDetailsScreen);
  }

  onTapGoingmembers() {
    Get.toNamed(AppRoutes.goingMembersScreen);
  }


  onTapEventOptionOne() {
    Get.toNamed(AppRoutes.eventOptionOneScreen);
  }

  onTapFilter() {
    Get.toNamed(AppRoutes.filterScreen);
  }

  onTapTaskDetails() {
    Get.toNamed(AppRoutes.taskDetailsScreen);
  }

  onTapTaskDetailsDoing() {
    // Get.toNamed(AppRoutes.taskDetailsDoingScreen);
  }

  onTapTaskDetailsDone() {
    // Get.toNamed(AppRoutes.taskDetailsDoneScreen);
  }

  onTapReport() {
    Get.toNamed(AppRoutes.reportScreen);
  }

  onTapEventDetails() {
    Get.toNamed(AppRoutes.eventDetailsScreen);
  }

  onTapEventOption() {
    Get.toNamed(AppRoutes.eventOptionScreen);
  }

  onTapChatSingle() {
    Get.toNamed(AppRoutes.chattingView);
  }

  onTapChatNewChatTwo() {
    Get.toNamed(AppRoutes.chatNewChatTwoScreen);
  }

  onTapChatNewChatbyLocation() {
    Get.toNamed(AppRoutes.chatNewChatByLocationScreen);
  }

  onTapChatNewGroup() {
    Get.toNamed(AppRoutes.chatNewGroupScreen);
  }

  onTapChatGroupChatTwo() {
    Get.toNamed(AppRoutes.chatGroupChatTwoScreen);
  }

  onTapChatGroupChatInfo() {
    Get.toNamed(AppRoutes.chatGroupChatInfoScreen);
  }

  onTapChatGroupChatMedia() {
    Get.toNamed(AppRoutes.chatGroupChatMediaScreen);
  }

  onTapChatNewChatOne() {
    Get.toNamed(AppRoutes.chatNewChatOneScreen);
  }

  onTapChatNewChat() {
    Get.toNamed(AppRoutes.chatNewChatScreen);
  }

  onTapChatNewGroupOne() {
    Get.toNamed(AppRoutes.chatNewGroupOneScreen);
  }

  onTapChatGroupChat() {
    Get.toNamed(AppRoutes.chatGroupChatScreen);
  }

  onTapChatGroupChatOne() {
    Get.toNamed(AppRoutes.chatGroupChatOneScreen);
  }

  onTapChatMedia() {
    Get.toNamed(AppRoutes.chatMediaScreen);
  }

  onTapChatNewChatThree() {
    Get.toNamed(AppRoutes.chatNewChatThreeScreen);
  }

  onTapFilterTwo() {
    Get.toNamed(AppRoutes.filterTwoScreen);
  }

  onTapEventOptionTwo() {
    Get.toNamed(AppRoutes.eventOptionTwoScreen);
  }

  onTapFilterSix() {
    Get.toNamed(AppRoutes.filterSixScreen);
  }
  onTapQuizzes() {
    Get.toNamed(AppRoutes.quizzesAllScreen);
  }

  onTapQuizzesDetails() {
    Get.toNamed(AppRoutes.quizzesDetailsScreen);
  }

  onTapQuizzesDetailsOne() {
    Get.toNamed(AppRoutes.quizzesDetailsOneScreen);
  }

  onTapQuizzesDetailsTwo() {
    Get.toNamed(AppRoutes.quizzesDetailsTwoScreen);
  }

  onTapQuizzesDetailsThree() {
    Get.toNamed(AppRoutes.quizzesDetailsThreeScreen);
  }

  onTapFilterThree() {
    Get.toNamed(AppRoutes.filterThreeScreen);
  }

  onTapFlashcardsOne() {
    Get.toNamed(AppRoutes.flashcardsOneScreen);
  }

  onTapFlashcards() {
    Get.toNamed(AppRoutes.flashcardsScreen);
  }


  onTapRequestDeclined() {
    Get.toNamed(AppRoutes.requestDeclinedScreen);
  }

  onTapAddTimeOffRequest() {
    Get.toNamed(AppRoutes.addTimeOffRequestScreen);
  }

  onTapScheduleRequestsChangeDays() {
    Get.toNamed(AppRoutes.scheduleRequestsChangeDaysScreen);
  }

  onTapScheduleRequestsChangeShifts() {
    Get.toNamed(AppRoutes.scheduleRequestsChangeShiftsScreen);
  }

  onTapChangShiftTiming() {
    Get.toNamed(AppRoutes.changShiftTimingScreen);
  }

  onTapFilterFour() {
    Get.toNamed(AppRoutes.filterFourScreen);
  }

  onTapFilterFive() {
    Get.toNamed(AppRoutes.filterFiveScreen);
  }

  onTapMoreSettings() {
    Get.toNamed(AppRoutes.moreSettingsScreen);
  }

  onTapMoreSettingsChangePassword() {
    Get.toNamed(AppRoutes.moreSettingsChangePasswordScreen);
  }

  onTapMoreSettingsFAQs() {
    Get.toNamed(AppRoutes.moreSettingsFaqsScreen);
  }

  onTapMoreSettingsTermsConditionsOne() {
    Get.toNamed(AppRoutes.moreSettingsTermsConditionsOneScreen);
  }

  onTapMoreSettingsTermsConditions() {
    Get.toNamed(AppRoutes.moreSettingsTermsConditionsScreen);
  }

  onTapSettingsOnboardingChecklist() {
    Get.toNamed(AppRoutes.settingsOnboardingChecklistScreen);
  }

  onTapSettingsOnboardingChecklistDetails() {
    Get.toNamed(AppRoutes.settingsOnboardingChecklistDetailsScreen);
  }

  onTapAddnewRererral() {
    Get.toNamed(AppRoutes.addNewRererralScreen);
  }

  onTapReportOne() {
    Get.toNamed(AppRoutes.reportOneScreen);
  }

  onTapFilterSeven() {
    Get.toNamed(AppRoutes.filterSevenScreen);
  }

  onTapFilterTen() {
    Get.toNamed(AppRoutes.filterTenScreen);
  }

  onTapFilterEleven() {
    Get.toNamed(AppRoutes.filterElevenScreen);
  }

  onTapSurvey() {
    Get.toNamed(AppRoutes.surveyScreen);
  }

  onTapSurveyDetailsThree() {
    Get.toNamed(AppRoutes.surveyDetailsThreeScreen);
  }

  onTapSurveyDetails() {
    Get.toNamed(AppRoutes.surveyDetailsScreen);
  }

  onTapSurveyDetailsOne() {
    Get.toNamed(AppRoutes.surveyDetailsOneScreen);
  }

  onTapEducationTrackingDetails() {
    Get.toNamed(AppRoutes.educationTrackingDetailsScreen);
  }

  onTapAddAddEducationTracking() {
    Get.toNamed(AppRoutes.addAddEducationTrackingScreen);
  }

  onTapEmployeeDicrectry() {
    Get.toNamed(AppRoutes.employeeDicrectryScreen);
  }

  onTapEmployeeDicrectryDetails() {
    Get.toNamed(AppRoutes.employeeDicrectryDetailsScreen);
  }

  onTapChatGroupChatThree() {
    Get.toNamed(AppRoutes.chatGroupChatThreeScreen);
  }

  onTapCreateGroup() {
    Get.toNamed(AppRoutes.createGroupScreen);
  }

  onTapFilterSixteen() {
    Get.toNamed(AppRoutes.filterSixteenScreen);
  }

  onTapAnnouncements() {
    Get.toNamed(AppRoutes.announcementsScreen);
  }

  onTapGoalDetailsDone() {
    Get.toNamed(AppRoutes.goalDetailsDoneScreen);
  }

  onTapGoalDetailsmissed() {
    Get.toNamed(AppRoutes.goalDetailsMissedScreen);
  }

  onTapGoalDetailsACTIVE() {
    Get.toNamed(AppRoutes.goalDetailsActiveScreen);
  }

  onTapGoalsCreateGoal() {
    Get.toNamed(AppRoutes.goalsCreateGoalScreen,arguments: {'index': 0});
  }

  onTapDocuments() {
    Get.toNamed(AppRoutes.documentsScreen);
  }

  onTapRewards() {
    Get.toNamed(AppRoutes.rewardsScreen);
  }

  onTapFilterThirteen() {
    Get.toNamed(AppRoutes.filterThirteenScreen);
  }

  onTapFilterFourteen() {
    Get.toNamed(AppRoutes.filterFourteenScreen);
  }

  onTapFilterTwelve() {
    Get.toNamed(AppRoutes.filterTwelveScreen);
  }

  onTapFilterEight() {
    Get.toNamed(AppRoutes.filterEightScreen);
  }

  onTapGoalStatus() {
    Get.toNamed(AppRoutes.goalStatusScreen);
  }

  onTapFilterNine() {
    Get.toNamed(AppRoutes.filterNineScreen);
  }
}
