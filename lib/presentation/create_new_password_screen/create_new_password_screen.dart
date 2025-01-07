import 'package:flutter/services.dart';
import 'package:salon_symphony/core/utils/responsive.dart';
import 'package:salon_symphony/core/utils/semantics.dart';
import 'package:salon_symphony/widgets/custom_text.dart';

import '../../baseviews/baseview_auth_screen.dart';
import '../../core/utils/helper_functions.dart';
import '../../core/utils/utils.dart';
import '../../widgets/animatedButton.dart';
import '../../widgets/custom_textfield_new.dart';
import '../../widgets/textfieldclientFeedback.dart';
import 'controller/create_new_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class CreateNewPasswordScreen extends GetWidget<CreateNewPasswordController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return BaseviewAuthScreen(
      closeApp: false,
      child: Container(
        width: size.width,
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                      onTap: () {
                        Get.offAllNamed(AppRoutes.signInScreen);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0,left: 15,right: 15),
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Semantics(
                      label: SemanticsLabel.LAB_RESET_PASS_LOGO,
                      child: MyText(
                        title: "New Password",
                        fontSize: responsive.setTextScale(30),
                        weight: 'Semi Bold',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: responsive.setHeight(1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: MyText(
                    title: "Please make your new password unique from any previous passwords.",
                    center: true,
                    clr: ColorConstant.hintTextColor,
                  ),
                ),
                SizedBox(
                  height: responsive.setHeight(5),
                ),
                Obx(
                      () => CustomTextField3(
                        semanticsLabel: SemanticsLabel.LAB_PASSWORD_FIELD,
                      fieldText: "New Password",
                      controller: controller.passwordController,
                      isFinal: false,
                      focusNode: controller.passwordNode,
                      nextFocusNode: controller.passwordConfNode,
                      keyboardType: TextInputType.text,
                          limit: 25,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(25),
                          ],
                      validator: (value) {
                        return HelperFunction.passwordValidate(value!);
                      },
                      isPassword: controller.showPassword.value,
                      sufixIconOnTap: () {
                        controller.showPassword.value =
                            HelperFunction.showPassword(
                                controller.showPassword.value);
                      },
                          onChanged: (value){
                            controller.checkForm(context);
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
                        semanticsLabel: SemanticsLabel.LAB_CONF_PASS_FIELD,
                      fieldText: "Confirm Password",
                      controller: controller.passwordConfController,
                      isFinal: true,
                      focusNode: controller.passwordConfNode,
                      keyboardType: TextInputType.text,
                          limit: 25,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(25),
                          ],
                      validator: (value) {
                        return HelperFunction.passwordValidate(value!);
                      },
                          onChanged: (value){
                            controller.checkForm(context);
                          },
                      isPassword: controller.showConfPassword.value,
                      sufixIconOnTap: () {
                        controller.showConfPassword.value =
                            HelperFunction.showPassword(
                                controller.showConfPassword.value);
                      },
                      icon: controller.showConfPassword.value == false
                          ? ImageConstant.imgCheckmark15X16
                          : ImageConstant.imgEye,
                      onTap: () {}),
                ),
                SizedBox(
                  height: responsive.setHeight(6),
                ),

                Obx(() =>
                    controller.isFormCompleted.value?
                    AnimatedButton(
                      semanticsLabel: SemanticsLabel.LAB_RESET_BTN,
                  text: 'Reset Password',
                  width: double.maxFinite,
                  margin: getMargin(left: 15, top: 44, right: 15),
                  padding: ButtonPaddingOfButton.PaddingAll18,
                  fontStyle: ButtonFontStyleOfButton.PoppinsSemiBold16,
                  alignment: Alignment.center,
                  onPressed: () async {
                    controller.changePassword(context);
                    // await Future.delayed(Duration(seconds: 2));
                    // controller.animatedButtonController.reset();
                  },
                  controller: controller.animatedButtonController,
                ):
                    CustomButton(
                        semanticsLabel: SemanticsLabel.LAB_RESET_BTN,
                        text: 'Reset Password',
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



