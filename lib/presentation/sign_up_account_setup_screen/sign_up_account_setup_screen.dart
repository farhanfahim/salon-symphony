import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:salon_symphony/baseviews/baseview_auth_screen.dart';
import 'package:salon_symphony/core/utils/responsive.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import 'package:salon_symphony/widgets/animatedButton.dart';

import '../../core/utils/dummy_content.dart';
import '../../core/utils/helper_functions.dart';
import '../../widgets/custom_back_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textfield_new.dart';
import '../../widgets/textfieldclientFeedback.dart';
import 'controller/sign_up_account_setup_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_button.dart';
import 'package:salon_symphony/widgets/custom_checkbox.dart';

// ignore_for_file: must_be_immutable
class SignUpAccountSetupScreen extends GetWidget<SignUpAccountSetupController> {
  Map<String, dynamic> map;

  SignUpAccountSetupScreen({required this.map});

  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return BaseviewAuthScreen(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Utils.hideKeyboard(context);
        },
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ColorConstant.backgroundColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 18.0,
                    left: 15,
                    right: 15,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.signUpScreen);
                            },
                            child: CommonImageView(
                              svgPath: ImageConstant.imgArrowleft,
                              color: ColorConstant.black900,
                            ),
                          ),
                          SizedBox(
                            width: responsive.setWidth(25),
                          ),
                          Center(
                            child: MyText(
                              title: '${'Create Account'}',
                              weight: 'Semi Bold',
                              fontSize: responsive.setTextScale(16),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: size.width,
                  child: SingleChildScrollView(
                    child: Form(
                      key: controller.formKey,
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15.0, right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: responsive.setHeight(4),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: MyText(
                                    title: "Account Details",
                                    fontSize: responsive.setTextScale(30),
                                    weight: 'Semi Bold',
                                  ),
                                ),
                                SizedBox(
                                  height: responsive.setHeight(1),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: MyText(
                                    title:
                                        "Boom! Let’s get you set up for success!",
                                    clr: ColorConstant.black900,
                                  ),
                                ),
                                SizedBox(
                                  height: responsive.setHeight(3),
                                ),
                              ],
                            ),
                          ),
                          CustomTextField3(
                              fieldText: "lbl_full_name".tr,
                              controller: controller.fullnameController,
                              isFinal: false,
                              focusNode: controller.fullnameNode,
                              nextFocusNode: controller.emailNode,
                              keyboardType: TextInputType.name,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(40),
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Z\s]')),
                              ],
                              onChanged: (value) {
                                controller.checkForm();
                              },
                              limit: 40,
                              validator: (value) {
                                return HelperFunction.fullNameValidator(value);
                              },
                              onTap: () {}),
                          SizedBox(
                            height: responsive.setHeight(2),
                          ),
                          CustomTextField3(
                              fieldText: "Email Address",
                              controller: controller.emailController,
                              isFinal: false,
                              focusNode: controller.emailNode,
                              nextFocusNode: controller.passwordNode,
                              keyboardType: TextInputType.emailAddress,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(55),
                              ],
                              onChanged: (value) {
                                controller.checkForm();
                              },
                              limit: 40,
                              validator: (value) {
                                return HelperFunction.emailValidate(value!);
                              },
                              onTap: () {}),
                          SizedBox(
                            height: responsive.setHeight(2),
                          ),
                          Obx(
                            () => CustomTextField3(
                                fieldText: "Create Password",
                                controller: controller.passwordController,
                                isFinal: false,
                                focusNode: controller.passwordNode,
                                nextFocusNode: controller.confPasswordNode,
                                keyboardType: TextInputType.text,
                                limit: 25,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(25),
                                ],
                                validator: (value) {
                                  return HelperFunction.passwordValidate(
                                      value!);
                                },
                                isPassword: controller.showPassword.value,
                                sufixIconOnTap: () {
                                  controller.showPassword.value =
                                      HelperFunction.showPassword(
                                          controller.showPassword.value);
                                },
                                onChanged: (value) {
                                  controller.checkForm();
                                },
                                icon: controller.showPassword.value == false
                                    ? ImageConstant.imgCheckmark15X16
                                    : ImageConstant.imgEye,
                                onTap: () {}),
                          ),
                          SizedBox(
                            height: responsive.setHeight(2),
                          ),
                          Obx(
                            () => CustomTextField3(
                                fieldText: "msg_confirm_passwor".tr,
                                controller: controller.confPasswordController,
                                isFinal: true,
                                focusNode: controller.confPasswordNode,
                                nextFocusNode: controller.positionNode,
                                keyboardType: TextInputType.text,
                                limit: 25,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(25),
                                ],
                                validator: (value) {
                                  return HelperFunction.passwordValidate(
                                      value!);
                                },
                                isPassword: controller.showConfPassword.value,
                                sufixIconOnTap: () {
                                  controller.showConfPassword.value =
                                      HelperFunction.showPassword(
                                          controller.showConfPassword.value);
                                },
                                onChanged: (value) {
                                  controller.checkForm();
                                },
                                icon: controller.showConfPassword.value == false
                                    ? ImageConstant.imgCheckmark15X16
                                    : ImageConstant.imgEye,
                                onTap: () {}),
                          ),
                          SizedBox(
                            height: responsive.setHeight(2),
                          ),
                          CustomTextField3(
                            fieldText: "lbl_position3".tr,
                            controller: controller.positionController,
                            isFinal: false,
                            enabled: false,
                            focusNode: controller.positionNode,
                            nextFocusNode: controller.schoolNode,
                            keyboardType: TextInputType.text,
                            limit: HelperFunction.EMAIL_VALIDATION,
                            iconColorChange: true,
                            validator: (value) {
                              return HelperFunction.stringValidate(value!);
                            },
                            onChanged: (value) {
                              controller.checkForm();
                            },
                            iconData: Icons.keyboard_arrow_down,
                            sufixIconOnTap: () {
                              Utils.hideKeyboard(context);
                              controller.selectPosition(context);
                              if (controller.arrOfOptions.isEmpty) {
                                controller.getPositionListing();
                              }
                            },
                            onTap: () {
                              Utils.hideKeyboard(context);
                              controller.selectPosition(context);
                              if (controller.arrOfOptions.isEmpty) {
                                controller.getPositionListing();
                              }
                            },
                          ),
                          SizedBox(
                            height: responsive.setHeight(2),
                          ),
                          CustomTextField3(
                            fieldText: "lbl_birthday".tr,
                            controller: controller.dobController,
                            isFinal: false,
                            enabled: false,
                            focusNode: controller.dobNode,
                            nextFocusNode: controller.schoolNode,
                            keyboardType: TextInputType.text,
                            limit: HelperFunction.EMAIL_VALIDATION,
                            validator: (value) {
                              return HelperFunction.stringValidate(value!);
                            },
                            sufixIconOnTap: () {
                              controller.selectAge(context, true);
                            },
                            onChanged: (value) {
                              controller.checkForm();
                              Utils.hideKeyboard(context);
                            },
                            icon: ImageConstant.birthdayCake,
                            onTap: () {
                              controller.selectAge(context, true);
                              Utils.hideKeyboard(context);
                            },
                          ),
                          SizedBox(
                            height: responsive.setHeight(2),
                          ),
                          Obx(
                            () => controller.isFormCompleted.value
                                ? AnimatedButton(
                                    text: "lbl_continue".tr,
                                    width: double.maxFinite,
                                    margin:
                                        getMargin(left: 15, top: 10, right: 15),
                                    padding: ButtonPaddingOfButton.PaddingAll18,
                                    fontStyle: ButtonFontStyleOfButton
                                        .PoppinsSemiBold16,
                                    alignment: Alignment.center,
                                    onPressed: () {
                                      // controller.fullNameValidate(context);
                                      Future.delayed(
                                          Duration(milliseconds: 400), () {
                                        controller.animatedButtonController
                                            .reset();
                                      });
                                      controller.createAccount(context, map);
                                    },
                                    controller:
                                        controller.animatedButtonController,
                                  )
                                : CustomButton(
                                    width: 343,
                                    text: "lbl_continue".tr,
                                    margin:
                                        getMargin(left: 15, top: 10, right: 15),
                                    padding: ButtonPadding.PaddingAll18,
                                    variant: ButtonVariant.FillIndigo50,
                                    fontStyle:
                                        ButtonFontStyle.PoppinsSemiBold16,
                                    onTap: () {},
                                    alignment: Alignment.center),
                          ),
                          SizedBox(
                            height: responsive.setHeight(2),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyText(
                                title: "By continuing you agree to the",
                                fontSize: 11,
                                clr: ColorConstant.gray7F7F88,
                              ),
                              GestureDetector(
                                onTap: (){
                                  Utils.launchUrls('https://salonsymphonysoftware.com/terms/');
                                },
                                  child: MyText(
                                title: " Terms",
                                fontSize: 11,
                                clr: ColorConstant.gray7F7F88,
                                weight: 'Semi Bold',
                              )),
                              GestureDetector(
                                  onTap: (){
                                    Utils.launchUrls('https://salonsymphonysoftware.com/terms/eula/');
                                  },
                                  child: MyText(
                                    title: ", EULA,",
                                    fontSize: 11,
                                    clr: ColorConstant.gray7F7F88,
                                    weight: 'Semi Bold',
                                  )),
                              MyText(
                                title: " & ",
                                fontSize: 11,
                                clr: ColorConstant.gray7F7F88,
                              ),
                              GestureDetector(
                                onTap: (){
                                  Utils.launchUrls('https://salonsymphonysoftware.com/privacy-policy/');
                                },
                                child: MyText(
                                  title: "Privacy Policy",
                                  fontSize: 11,
                                  clr: ColorConstant.gray7F7F88,
                                  weight: 'Semi Bold',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: responsive.setHeight(1),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: CommonImageView(
                              imagePath: ImageConstant.fix_logo2,
                              height: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
