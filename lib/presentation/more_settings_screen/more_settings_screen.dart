import 'dart:io';

import 'package:flutter/services.dart';
import 'package:salon_symphony/core/utils/helper_functions.dart';
import 'package:salon_symphony/core/utils/semantics.dart';
import 'package:salon_symphony/core/utils/utils.dart';

import '../../baseviews/baseview_process_screen.dart';
import '../../widgets/cutom_dialog.dart';
import 'controller/more_settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_icon_button.dart';
import 'package:salon_symphony/widgets/custom_switch.dart';

class MoreSettingsScreen extends GetWidget<MoreSettingsController> {
  @override
  Widget build(BuildContext context) {
    return BaseviewScreen(
        basicAppBar: true,
        screenName: "lbl_settings".tr,
        showBottomBar: false,
        sidePadding: false,
        backgroundColor: ColorConstant.backgroundColor,
        child: Scaffold(
            backgroundColor: ColorConstant.backgroundColor,
            body: Container(
                width: size.width,
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(left: 16, top: 0, right: 16),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          CustomIconButton(
                                              height: 44,
                                              width: 44,
                                              variant: IconButtonVariant
                                                  .OutlineGray300,
                                              padding:
                                                  IconButtonPadding.PaddingAll8,
                                              child: CommonImageView(
                                                  svgPath: ImageConstant
                                                      .imgLock44X44)),
                                          Padding(
                                              padding: getPadding(
                                                  left: 16,
                                                  top: 14,
                                                  bottom: 15),
                                              child: Text(
                                                  "msg_push_notificati".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtPoppinsRegular14Black900
                                                      .copyWith(height: 1.00)))
                                        ]),
                                    Obx(() => CustomSwitch(
                                        margin: getMargin(top: 11, bottom: 11),
                                        value:
                                            controller.isSelectedSwitch.value,
                                        onChanged: (value) {
                                          controller.callUpdateUserApi();
                                          controller.isSelectedSwitch.value =
                                              value;
                                        }))
                                  ]))),
                      Container(
                          height: getVerticalSize(1.00),
                          width: getHorizontalSize(325.00),
                          margin: getMargin(left: 16, top: 10, right: 16),
                          decoration:
                              BoxDecoration(color: ColorConstant.gray100)),
                      Semantics(
                        label: SemanticsLabel.LAB_CHANGE_PASSWORD_MENU,
                        child: InkWell(
                          onTap: () {
                                onTapRowlockone();
                              },
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                    padding:
                                        getPadding(left: 16, top: 10, right: 16),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CustomIconButton(
                                              height: 44,
                                              width: 44,
                                              variant: IconButtonVariant
                                                  .OutlineGray300,
                                              padding:
                                                  IconButtonPadding.PaddingAll8,
                                              child: CommonImageView(
                                                  svgPath:
                                                      ImageConstant.imgLock1)),
                                          Padding(
                                              padding: getPadding(
                                                  left: 16, top: 14, bottom: 15),
                                              child: Text(
                                                  "lbl_change_password".tr,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtPoppinsRegular14Black900
                                                      .copyWith(height: 1.00)))
                                        ])),
                          ),
                        ),
                      ),
                      Container(
                          height: getVerticalSize(1.00),
                          width: getHorizontalSize(325.00),
                          margin: getMargin(left: 16, top: 10, right: 16),
                          decoration:
                              BoxDecoration(color: ColorConstant.gray100)),
                      Semantics(
                        label: SemanticsLabel.LAB_FAQS_MENU,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                                onTapRowhiconoutline();
                              },
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                    padding:
                                        getPadding(left: 16, top: 10, right: 16),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CustomIconButton(
                                              height: 44,
                                              width: 44,
                                              variant: IconButtonVariant
                                                  .OutlineGray300,
                                              padding:
                                                  IconButtonPadding.PaddingAll8,
                                              child: CommonImageView(
                                                  svgPath: ImageConstant
                                                      .imgHiconoutline)),
                                          Padding(
                                              padding: getPadding(
                                                  left: 16, top: 13, bottom: 16),
                                              child: Text("Provide Feedback",
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtPoppinsRegular14Black900
                                                      .copyWith(height: 1.00)))
                                        ])),
                          ),
                        ),
                      ),
                      Container(
                          height: getVerticalSize(1.00),
                          width: getHorizontalSize(325.00),
                          margin: getMargin(left: 16, top: 10, right: 16),
                          decoration:
                              BoxDecoration(color: ColorConstant.gray100)),
                      Semantics(
                        label: SemanticsLabel.LAB_TERMS_CONDITIONS_MENU,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                                onTapRowmenu();
                              },
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                    padding:
                                        getPadding(left: 16, top: 10, right: 16),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          CustomIconButton(
                                              height: 44,
                                              width: 44,
                                              variant: IconButtonVariant
                                                  .OutlineGray300,
                                              padding:
                                                  IconButtonPadding.PaddingAll8,
                                              child: CommonImageView(
                                                  svgPath: ImageConstant
                                                      .imgMenu44X44)),
                                          Padding(
                                              padding: getPadding(
                                                  left: 16, top: 12, bottom: 17),
                                              child: Text("Terms of Use",
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtPoppinsRegular14Black900
                                                      .copyWith(height: 1.00)))
                                        ])),
                          ),
                        ),
                      ),
                      Container(
                          height: getVerticalSize(1.00),
                          width: getHorizontalSize(325.00),
                          margin: getMargin(left: 16, top: 10, right: 16),
                          decoration:
                              BoxDecoration(color: ColorConstant.gray100)),
                      Semantics(
                        label: SemanticsLabel.LAB_PRIVACY_POLICY_MENU,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                                onTapRowfile();
                              },
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                    padding:
                                        getPadding(left: 16, top: 10, right: 16),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CustomIconButton(
                                              height: 44,
                                              width: 44,
                                              variant: IconButtonVariant
                                                  .OutlineGray300,
                                              padding:
                                                  IconButtonPadding.PaddingAll8,
                                              child: CommonImageView(
                                                  svgPath:
                                                      ImageConstant.imgFile2)),
                                          Padding(
                                              padding: getPadding(
                                                  left: 16, top: 13, bottom: 15),
                                              child: Text("lbl_privacy_policy".tr,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtPoppinsRegular14Black900
                                                      .copyWith(height: 1.00)))
                                        ])),
                          ),
                        ),
                      ),

                       Container(
                           height: getVerticalSize(1.00),
                           width: getHorizontalSize(325.00),
                           margin: getMargin(left: 16, top: 10, right: 16),
                           decoration:
                           BoxDecoration(color: ColorConstant.gray100)),

                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              onTapEula();
                            },
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding:
                                  getPadding(left: 16, top: 10, right: 16),
                                  child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CustomIconButton(
                                            height: 44,
                                            width: 44,
                                            variant: IconButtonVariant
                                                .OutlineGray300,
                                            padding:
                                            IconButtonPadding.PaddingAll8,
                                            child: CommonImageView(
                                                svgPath:
                                                ImageConstant.imgFile2)),
                                        Padding(
                                            padding: getPadding(
                                                left: 16, top: 13, bottom: 15),
                                            child: Text("EULA",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtPoppinsRegular14Black900
                                                    .copyWith(height: 1.00)))
                                      ])),
                            ),
                          ),

                      Container(
                          height: getVerticalSize(1.00),
                          width: getHorizontalSize(325.00),
                          margin: getMargin(left: 16, top: 10, right: 16),
                          decoration:
                              BoxDecoration(color: ColorConstant.gray100)),

                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              Utils.reportProblem();
                            },
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding:
                                  getPadding(left: 16, top: 10, right: 16),
                                  child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CustomIconButton(
                                            height: 44,
                                            width: 44,
                                            variant: IconButtonVariant
                                                .OutlineGray300,
                                            padding:
                                            IconButtonPadding.PaddingAll8,
                                            child: CommonImageView(
                                                imagePath:
                                                ImageConstant.report_problem_icon,
                                              height: 20,
                                              width: 20,
                                            )
                                        ),
                                        Padding(
                                            padding: getPadding(
                                                left: 16, top: 13, bottom: 15),
                                            child: Text("Report a Problem",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtPoppinsRegular14Black900
                                                    .copyWith(height: 1.00)))
                                      ])),
                            ),
                          ),
                          Container(
                              height: getVerticalSize(1.00),
                              width: getHorizontalSize(325.00),
                              margin: getMargin(left: 16, top: 10, right: 16),
                              decoration:
                              BoxDecoration(color: ColorConstant.gray100)),
                      Semantics(
                        label: SemanticsLabel.LAB_DELETE_ACCOUNT_MENU,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap:(){
                            Get.dialog(CustomModelSheet(
                              titleSemantics: SemanticsLabel.LAB_DELETE_ACCOUNT_LOGO,
                                actionSemantics: SemanticsLabel.LAB_DELETE_BTN,
                                title: 'Delete Account?',
                                msg:
                                "Are you sure you want to delete your\n Salon Symphony account? ",
                                showOkButton: false,
                                onTapYes: () {
                                  controller.deleteUser();
                                },
                                onTapNo: () {


                                }));
                          },child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: getPadding(left: 16, top: 10, right: 16),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CustomIconButton(
                                            height: 44,
                                            width: 44,
                                            variant:
                                                IconButtonVariant.OutlineGray300,
                                            padding: IconButtonPadding.PaddingAll8,
                                            child: CommonImageView(
                                                svgPath: ImageConstant.imgUser2)),
                                        Padding(
                                            padding: getPadding(
                                                left: 16, top: 12, bottom: 17),
                                            child: Text("lbl_delete_account".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtPoppinsRegular14Black900
                                                    .copyWith(height: 1.00)))
                                      ]))),
                        ),
                      ),
                      Container(
                          height: getVerticalSize(1.00),
                          width: getHorizontalSize(325.00),
                          margin: getMargin(left: 16, top: 10, right: 16),
                          decoration:
                              BoxDecoration(color: ColorConstant.gray100)),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap:(){
                          Get.dialog(CustomModelSheet(
                            titleSemantics: SemanticsLabel.LAB_LOGOUT_LOGO,
                              actionSemantics: SemanticsLabel.LAB_LOGOUT_BTN,
                              title: 'Logout',
                              msg: "Are you sure you want to log out of\nSalon Symphony? ",
                              showOkButton: false,
                              onTapYes: () {
                              controller.logoutAPI();

                              },
                              onTapNo: () {


                              }));
                        },
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: getPadding(left: 16, top: 11, right: 16),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CustomIconButton(
                                          height: 44,
                                          width: 44,
                                          variant:
                                              IconButtonVariant.OutlineGray300,
                                          padding: IconButtonPadding.PaddingAll8,
                                          child: CommonImageView(
                                              svgPath:
                                                  ImageConstant.imgRefresh44X44)),
                                      Semantics(
                                        label: SemanticsLabel.LAB_LOGOUT_MENU,
                                        child: Padding(
                                            padding: getPadding(
                                                left: 16, top: 15, bottom: 14),
                                            child: Text("lbl_log_out".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtPoppinsRegular14Pink300
                                                    .copyWith(height: 1.00))),
                                      )
                                    ]))),
                      ),
                      Container(
                          height: getVerticalSize(1.00),
                          width: getHorizontalSize(325.00),
                          margin: getMargin(
                              left: 16, top: 9, right: 16, bottom: 20),
                          decoration:
                              BoxDecoration(color: ColorConstant.gray100))
                    ])))));
  }

  onTapImgArrowleft() {
    Get.back();
  }

  onTapRowlockone() {
    Get.toNamed(AppRoutes.moreSettingsChangePasswordScreen);
  }

  onTapRowhiconoutline() {
    // Get.toNamed(AppRoutes.moreSettingsFaqsScreen);
    Utils.launchUrls('https://support.mysalonsymphony.com/hc/en-us/requests/new?ticket_form_id=19041136741019');
  }

  onTapRowmenu() {
    Utils.launchUrls('https://salonsymphonysoftware.com/terms/');
    // Get.toNamed(AppRoutes.moreSettingsTermsConditionsOneScreen);
  }

  onTapRowfile() {
    Utils.launchUrls('https://salonsymphonysoftware.com/privacy-policy/');
    // Get.toNamed(AppRoutes.moreSettingsTermsConditionsScreen);
  }
  onTapEula() {
    Utils.launchUrls('https://salonsymphonysoftware.com/terms/eula/');
    // Get.toNamed(AppRoutes.moreSettingsTermsConditionsScreen);
  }
}
