import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:salon_symphony/core/utils/responsive.dart';
import 'package:salon_symphony/core/utils/semantics.dart';
import 'package:salon_symphony/core/utils/utils.dart';

import '../../baseviews/baseview_auth_screen.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../widgets/animatedButton.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import 'controller/otp_verification_controller.dart';

class OtpVerificationScreen extends GetWidget<OtpVerificationController> {
  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return BaseviewAuthScreen(
      closeApp: false,
      child: Container(
        width: size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                      onTap: () {
                        Get.offAllNamed(AppRoutes.signInScreen);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: MyText(
                          title: "lbl_cancel".tr,
                          clr: ColorConstant.gray400,
                        ),
                      )),
                ),
                SizedBox(
                  height: responsive.setHeight(5),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Semantics(
                    label: SemanticsLabel.LAB_OTP_LOGO,
                    child: MyText(
                      title: "Verification",
                      fontSize: responsive.setTextScale(30),
                      weight: 'Semi Bold',
                    ),
                  ),
                ),
                SizedBox(
                  height: responsive.setHeight(1),
                ),
                Align(
                  alignment: Alignment.center,
                  child: MyText(
                    title: "Please enter the one-time passcode sent to",
                    center: true,
                    clr: ColorConstant.hintTextColor,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: MyText(
                    title:
                        "${"+1"+controller.forgotPasswordController.mobileNoController.value.text}",
                    center: true,
                    weight: 'Semi Bold',
                  ),
                ),
                SizedBox(
                  height: responsive.setHeight(5),
                ),
                // Semantics(
                //   label: SemanticsLabel.LAB_OTP_FIELD,
                //   child: Container(
                //     width: responsive.setWidth(100),
                //     child: Center(
                //       child: PinCodeTextField(
                //         pinBoxWidth: getHorizontalSize(70),
                //         pinBoxRadius: 5,
                //         autofocus: true,
                //         controller: controller.otp,
                //         hideCharacter: false,
                //         highlight: false,
                //         highlightColor: Colors.blue,
                //         defaultBorderColor:
                //             ColorConstant.hintTextColor.withOpacity(0.5),
                //         hasTextBorderColor: ColorConstant.primaryColor,
                //         maxLength: 4,
                //         onTextChanged: (text) {
                //           // controller.validateOtp(context);
                //           controller.checkForm(context);
                //           if (controller.otp.text.length == 4) {
                //             controller.otpValidation.value = false;
                //           } else {
                //             controller.otpValidation.value = true;
                //           }
                //         },
                //         onDone: (text) {
                //           controller.otpValidation.value = false;
                //           print("DONE $text");
                //           print("DONE CONTROLLER ${controller.otpCode}");
                //         },
                //         wrapAlignment: WrapAlignment.spaceAround,
                //         pinBoxDecoration:
                //             ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                //         pinTextStyle: TextStyle(fontSize: 22.0),
                //         pinTextAnimatedSwitcherTransition:
                //             ProvidedPinBoxTextAnimation.scalingTransition,
                //         pinTextAnimatedSwitcherDuration:
                //             Duration(milliseconds: 100),
                //         highlightAnimation: false,
                //         highlightAnimationBeginColor:
                //             ColorConstant.primaryColor,
                //         highlightAnimationEndColor: ColorConstant.hintTextColor,
                //         keyboardType: TextInputType.number,
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: responsive.setWidth(100),
                    child: Center(
                      child: Semantics(
                        label: SemanticsLabel.LAB_OTP_FIELD,
                        child: PinCodeTextField(
                          pinBoxWidth: getHorizontalSize(70),
                          pinBoxRadius: 5,
                          focusNode: controller.passCodeNode,
                          autofocus: false,
                          controller: controller.otp,
                          // hasError: controller.otpValidation.value,
                          hideCharacter: false,
                          highlight: true,
                          highlightColor: ColorConstant.primaryColor,
                          defaultBorderColor: ColorConstant.hintTextColor.withOpacity(0.5),
                          hasTextBorderColor: ColorConstant.primaryColor,
                          maxLength: 4,
                          onTextChanged: (text) {
                            // controller.validateOtp(context);
                            controller.checkForm(context);
                            if (controller.otp.text.length == 4) {
                              controller.otpValidation.value = false;
                            } else {
                              controller.otpValidation.value = true;
                            }
                          },
                          onDone: (text) {
                            // Get.offAllNamed(AppRoutes.createNewPasswordScreen);
                            controller.otpValidation.value = false;
                            print("DONE $text");
                            print("DONE CONTROLLER ${controller.otpCode}");
                          },
                          hasUnderline: false,
                          wrapAlignment: WrapAlignment.spaceEvenly,
                          pinBoxDecoration:
                          ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                          pinBoxBorderWidth: 1,
                          pinTextStyle: TextStyle(fontSize: 22.0),
                          pinTextAnimatedSwitcherTransition:
                          ProvidedPinBoxTextAnimation.scalingTransition,
                          pinTextAnimatedSwitcherDuration:
                          Duration(milliseconds: 100),
                          highlightAnimation: false,
                          highlightAnimationBeginColor: ColorConstant.primaryColor,
                          highlightAnimationEndColor: ColorConstant.hintTextColor,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    // controller.countDown();
                    // Utils.showToast('will be implement in ', error)
                  },
                  child: Align(
                      alignment: Alignment.center,
                      child: Container(
                          margin: getMargin(
                              left: 15, top: 45, right: 15, bottom: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "msg_didn_t_get_code2".tr,
                                        style: TextStyle(
                                            color: ColorConstant.black900,
                                            fontSize: getFontSize(14),
                                            fontFamily: Platform.isIOS
                                                ? 'SF Pro Display'
                                                : 'Roboto',
                                            fontWeight: FontWeight.w400)),
                                    TextSpan(
                                        text: " ",
                                        style: TextStyle(
                                            color: ColorConstant.black900,
                                            fontSize: getFontSize(14),
                                            fontFamily: Platform.isIOS
                                                ? 'SF Pro Display'
                                                : 'Roboto',
                                            fontWeight: FontWeight.w600)),
                                  ]),
                                  textAlign: TextAlign.left),
                              GestureDetector(
                                onTap: () {
                                  Utils.hideKeyboard(context);
                                  if(controller.showTimer.value == false){
                                    controller.countDown();
                                    controller.resendOtpAPI();
                                  }


                                },
                                child: Obx(
                                  () => Container(
                                    color: Colors.white,
                                    child: Text(
                                        controller.showTimer.value
                                            ? " 00:${controller.sec.toString().length == 1 ? '0${controller.sec}' : controller.sec} "
                                            : "lbl_resend".tr,
                                        style: TextStyle(
                                            color: ColorConstant.deepPurpleA201,
                                            fontSize: getFontSize(14),
                                            fontFamily: Platform.isIOS
                                                ? 'SF Pro Display'
                                                : 'Roboto',
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                              )
                            ],
                          ))),
                ),
                // :Offstage()
                Obx(() => controller.isFormCompleted.value == true
                    ?
                AnimatedButton(
                  semanticsLabel: SemanticsLabel.LAB_VERIFY_BTN,
                  text: 'Submit',
                  width: double.maxFinite,
                  margin: getMargin(left: 15, top: 44, right: 15),
                  padding: ButtonPaddingOfButton.PaddingAll18,
                  fontStyle: ButtonFontStyleOfButton.PoppinsSemiBold16,
                  alignment: Alignment.center,
                  onPressed: () async {
                    controller.verifyOtpAPI();
                    // await Future.delayed(Duration(seconds: 2));
                    // controller.animatedButtonController.reset();
                  },
                  controller: controller.animatedButtonController,
                ): CustomButton(
                    semanticsLabel: SemanticsLabel.LAB_VERIFY_BTN,
                    text: 'Submit',
                    width: double.maxFinite,
                    margin: getMargin(left: 15, top: 44, right: 15),
                    padding: ButtonPadding.PaddingAll18,
                    variant: ButtonVariant.FillIndigo50,
                    fontStyle: ButtonFontStyle.PoppinsSemiBold16,
                    onTap:(){
                    },
                    alignment: Alignment.center))

              ],
            ),
          ),
        ),
      ),
    );
  }
}
