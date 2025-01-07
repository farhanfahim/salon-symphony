import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:salon_symphony/baseviews/baseview_auth_screen.dart';
import 'package:salon_symphony/core/utils/responsive.dart';
import 'package:salon_symphony/core/utils/semantics.dart';
import 'package:salon_symphony/widgets/animatedButton.dart';
import 'package:salon_symphony/widgets/custom_text.dart';
import 'dart:io';

import '../../core/utils/helper_functions.dart';
import '../../core/utils/utils.dart';
import '../../widgets/custom_textfield_new.dart';
import '../../widgets/cutom_dialog.dart';
import '../../widgets/cutom_dialog2.dart';
import '../../widgets/textfieldclientFeedback.dart';
import 'controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_button.dart';
import 'package:salon_symphony/widgets/custom_text_form_field.dart';

class SignUpScreen extends GetWidget<SignUpController> {
  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return BaseviewAuthScreen(
      child: Container(
        width: size.width,
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: responsive.setHeight(2),
                ),
                Semantics(
                  label: SemanticsLabel.LAB_SIGNUP_LOGO,
                  child: Container(
                    height: getSize(70.00),
                    width: getSize(70.00),
                    child: CommonImageView(
                      imagePath: ImageConstant.imgLogo,
                    ),
                  ),
                ),
                SizedBox(
                  height: responsive.setHeight(1.5),
                ),
                Padding(
                    padding: getPadding(left: 16, top: 0, right: 16),
                    child:  MyText(
                      title: "Create Account",
                      weight: 'Semi Bold',
                      fontSize: responsive.setTextScale(32),
                    ),
                ),
                SizedBox(
                  height: responsive.setHeight(1.5),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: MyText(
                    title:  "To join your team on Salon Symphony, enter your number and the passcode sent to your device.",
                    fontSize: responsive.setTextScale(16),
                    height: 1.5,
                    center: true,
                  ),
                ),
                SizedBox(
                  height: responsive.setHeight(3),
                ),
                CustomTextField3(
                    semanticsLabel: SemanticsLabel.LAB_PHONE_FIELD,
                    fieldText: "Phone Number",
                    controller: controller.mobileNoController,
                    isFinal: true,
                    focusNode: controller.mobileNoNode,
                    prefixText: "+1 ",
                    keyboardType: TextInputType.phone,
                    limit: 25,
                    inputFormatters: [
                     controller.maskFormatter
                    ],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '';
                      } else if (!Utils.phoneNumberRegExp.hasMatch(value)) {
                        return '';
                      }
                      return null;
                    },
                    onChanged: (val){
                      controller.checkForm(context);
                    },
                    onFieldSubmitted: (val) {
                      // FocusScope.of(context)
                      //     .requestFocus(controller.passwordNode);
                      print(controller.mobileNoController.value.text);
                    },

                    onTap: () {}),
                SizedBox(
                  height: responsive.setHeight(2),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: PinCodeTextField(
                    ///Maitain units +-3 in pin box width
                    pinBoxWidth: (MediaQuery.of(context).size.width/4) - 20,
                    pinBoxHeight: getHorizontalSize(50),
                    pinBoxOuterPadding: EdgeInsets.symmetric(horizontal: 8),
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
                SizedBox(
                    height: 15
                ),
                GestureDetector(
                  onTap: () {
                    controller.needHelpBottomSheet(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: MyText(
                            title: "Need help?",
                            fontSize: 13,
                            customWeight: FontWeight.w200,
                            clr: ColorConstant.primaryColor,


                        ))
                  ),
                ),
                Obx(() => controller.isFormCompleted.value == true
                    ? AnimatedButton(
                  semanticsLabel: SemanticsLabel.LAB_SIGNUP_BTN_LINK,
                  text: 'Continue',
                  width: double.maxFinite,
                  margin: getMargin(left: 15, top: 44, right: 15),
                  padding: ButtonPaddingOfButton.PaddingAll18,
                  fontStyle: ButtonFontStyleOfButton.PoppinsSemiBold16,
                  alignment: Alignment.center,
                  onPressed: () {
                    // controller.signUp();
                   controller.singUpForm(context);
                   // controller.validateOtp(context);

                  }, controller: controller.animatedButtonController,)
                    :
                CustomButton(
                    semanticsLabel: SemanticsLabel.LAB_SIGNUP_BTN_LINK,
                    text: 'Continue',
                    width: double.maxFinite,
                    margin: getMargin(left: 15, top: 44, right: 15),
                    padding: ButtonPadding.PaddingAll18,
                    variant: ButtonVariant.FillIndigo50,
                    fontStyle: ButtonFontStyle.PoppinsSemiBold16,
                    onTap:(){
                    },
                    alignment: Alignment.center)
                ),
                SizedBox(
                  height:20,
                ),


                Semantics(
                  label: SemanticsLabel.LAB_SIGNIN_BTN_LINK,
                  child: GestureDetector(
                      onTap: () {
                        Get.offAllNamed(AppRoutes.signInScreen);
                      },
                      child: Container(
                          margin:
                              getMargin(left: 16, top: 20, right: 16, bottom: 20),
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "msg_already_have_an2".tr,
                                    style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(14),
                                         fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.5,
                                        height: 1.00)),
                                TextSpan(
                                    text: " ",
                                    style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(14),
                                         fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.5,
                                        height: 1.00)),
                                TextSpan(
                                    text: "lbl_sign_in".tr,
                                    style: TextStyle(
                                        color: ColorConstant.deepPurpleA201,
                                        fontSize: getFontSize(14),
                                         fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.5,
                                        height: 1.00))
                              ]),
                              textAlign: TextAlign.left))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
