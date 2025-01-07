import 'dart:io';

import 'package:flutter/services.dart';
import 'package:salon_symphony/baseviews/baseview_auth_screen.dart';
import 'package:salon_symphony/core/utils/responsive.dart';
import 'package:salon_symphony/core/utils/semantics.dart';
import 'package:salon_symphony/widgets/animatedButton.dart';
import 'package:salon_symphony/widgets/custom_text.dart';

import '../../core/utils/helper_functions.dart';
import '../../core/utils/utils.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield_new.dart';
import 'controller/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

// ignore_for_file: must_be_immutable
class SignInScreen extends GetWidget<SignInController> {

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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: responsive.setHeight(2),
                ),
                Semantics(
                  label: SemanticsLabel.LAB_SIGNIN_LOGO,
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
                MyText(
                  title: "Welcome Back!",
                  weight: 'Semi Bold',
                  fontSize: responsive.setTextScale(32),
                ),
                SizedBox(
                  height: responsive.setHeight(1.5),
                ),
                MyText(
                  title: "To access Salon Symphony, please sign in or\n request an invitation from your manager.",
                  fontSize: responsive.setTextScale(16),
                  height: 1.5,
                  center: true,
                  // weight: 'Semi Bold',
                ),
                SizedBox(
                  height: responsive.setHeight(3),
                ),
               CustomTextField3(
                 semanticsLabel: SemanticsLabel.LAB_PHONE_FIELD,
                      fieldText: "Phone Number",
                      controller: controller.mobileNoController,
                      nextFocusNode: controller.passwordNode,
                      prefixText: "+1 ",
                      isFinal: false,
                      focusNode: controller.mobileNoNode,
                      keyboardType: TextInputType.phone,
                      limit: 25,
                          inputFormatters: [
                            controller.maskFormatter,
                            // LengthLimitingTextInputFormatter(25),
                          ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '';
                        } else if (!Utils.phoneNumberRegExp.hasMatch(value)) {
                          return '';
                        }
                        return null;
                      },
                   onChanged: (value){
                      controller.checkForm();
                   },
                          onFieldSubmitted: (val) {
                            FocusScope.of(context)
                                .requestFocus(controller.passwordNode);
                            print(controller.mobileNoController.value.text);
                            controller.checkForm();
                          },

                      onTap: () {}),

                SizedBox(
                  height: responsive.setHeight(2),
                ),
                Obx(
                      () => CustomTextField3(
                        semanticsLabel: SemanticsLabel.LAB_PASSWORD_FIELD,
                      fieldText: "lbl_password".tr,
                      controller: controller.passwordController,
                      isFinal: true,
                      focusNode: controller.passwordNode,
                      keyboardType: TextInputType.visiblePassword,
                      limit: 25,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(25),
                          ],
                      validator: (value) {
                        return HelperFunction.passwordValidate(value!);
                      },
                          onChanged: (value){
                            controller.checkForm();
                          },
                      isPassword: controller.showPassword.value,
                      sufixIconOnTap: () {
                        controller.showPassword.value =
                            HelperFunction.showPassword(
                                controller.showPassword.value);
                      },
                      icon: controller.showPassword.value == true
                          ? ImageConstant.imgEye
                          : ImageConstant.imgCheckmark15X16,
                      onTap: () {}),
                ),
                SizedBox(
                  height: 15
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Semantics(
                    label: SemanticsLabel.LAB_FORGET_PASSWORD,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.forgotPasswordScreen);
                      },
                      child: Padding(
                        padding: getPadding(left: 16, right: 16),
                        child: MyText(title: "msg_forgot_password".tr,fontSize: responsive.setTextScale(13),clr: ColorConstant.primaryColor,

                        ),
                      ),
                    ),
                  ),
                ),
                // controller.formKey.currentState != null &&
                // controller.formKey.currentState!.validate()
                Obx(() =>       controller.isFormCompleted.value ?
            AnimatedButton(
              semanticsLabel: SemanticsLabel.LAB_SIGNIN_BTN_LINK,
              text: "lbl_sign_in".tr,
              width: double.maxFinite,
              margin: getMargin(left: 15, top: 44, right: 15),
              padding: ButtonPaddingOfButton.PaddingAll18,
              fontStyle: ButtonFontStyleOfButton.PoppinsSemiBold16,
              alignment: Alignment.center,
              onPressed: () async {

                controller.signIn(context);
                // await Future.delayed(Duration(seconds: 2));
                // controller.animatedButtonController.reset();


              }, controller: controller.animatedButtonController,)
                    :
                CustomButton(
                    semanticsLabel: SemanticsLabel.LAB_SIGNIN_BTN_LINK,
                    text: "lbl_sign_in".tr,
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

                Align(
                  alignment: Alignment.center,
                  child: Semantics(
                    label: SemanticsLabel.LAB_SIGNUP_BTN_LINK,
                    child: GestureDetector(
                      onTap: () {
                        controller.onTapTxtDonthaveana();
                      },
                      child: Container(
                        margin:
                            getMargin(left: 16, top: 20, right: 16, bottom: 20),
                        child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "msg_don_t_have_an_a2".tr,
                                  style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(15),
                                       fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.5,
                                      height: 1.00),
                                ),
                                TextSpan(
                                  text: " ",
                                  style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(12),
                                       fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.5,
                                      height: 1.00),
                                ),
                                TextSpan(
                                  text: "lbl_sign_up".tr,
                                  style: TextStyle(
                                      color: ColorConstant.deepPurpleA201,
                                      fontSize: getFontSize(15),
                                       fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.5,
                                      height: 1.00),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left),
                      ),
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
