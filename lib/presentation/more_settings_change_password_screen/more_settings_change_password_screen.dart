import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/core/utils/semantics.dart';
import '../../core/utils/helper_functions.dart';
import '../../widgets/animatedButton.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textfield_new.dart';
import 'controller/more_settings_change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class MoreSettingsChangePasswordScreen
    extends GetWidget<MoreSettingsChangePasswordController> {
  @override
  Widget build(BuildContext context) {
    return BaseviewScreen(
        basicAppBar: true,
        screenName: "lbl_change_password".tr,
        showBottomBar: false,
        sidePadding: false,
        backgroundColor: ColorConstant.whiteA700,
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: size.width,
                child: SingleChildScrollView(
                    child: Form(
                        key: controller.formKey,
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Semantics(
                                label: SemanticsLabel.LAB_CHANGE_PASS_LOGO,
                                child: MyText(
                                  title: 'Change Password',
                                  weight: "Bold",
                                  fontSize: 25,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Make this password different from your last.",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: AppStyle.txtPoppinsRegular14Black900
                                    .copyWith(
                                  height: 1.5,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Obx(
                                () => CustomTextField3(
                                    semanticsLabel: SemanticsLabel.LAB_CURRENT_PASS_FIELD,
                                    fieldText: "msg_current_passwor".tr,
                                    controller: controller.passwordController,
                                    isFinal: false,
                                    focusNode: controller.passwordNode,
                                    nextFocusNode: controller.newPasswordNode,
                                    keyboardType: TextInputType.text,
                                    limit: HelperFunction.EMAIL_VALIDATION,
                                    validator: (value) {
                                      return HelperFunction.passwordValidate(
                                          value!);
                                    },
                                    isPassword:
                                        !controller.isShowPassword.value,
                                    sufixIconOnTap: () {
                                      controller.isShowPassword.value =
                                          HelperFunction.showPassword(
                                              controller.isShowPassword.value);
                                    },
                                    onChanged: (value){
                                      controller.checkForm();
                                    },
                                    icon:
                                        controller.isShowPassword.value == true
                                            ? ImageConstant.imgCheckmark15X16
                                            : ImageConstant.imgEye,
                                    onTap: () {}),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Obx(
                                () => CustomTextField3(
                                  semanticsLabel: SemanticsLabel.LAB_NEW_PASS_FIELD,
                                    fieldText: "lbl_new_password".tr,
                                    controller:
                                        controller.newPasswordController,
                                    isFinal: false,
                                    focusNode: controller.newPasswordNode,
                                    nextFocusNode:
                                        controller.confirmPasswordNode,
                                    keyboardType: TextInputType.text,
                                    limit: HelperFunction.EMAIL_VALIDATION,
                                    validator: (value) {
                                      return HelperFunction.passwordValidate(
                                          value!);
                                    },
                                    isPassword:
                                        !controller.isShowPassword1.value,
                                    sufixIconOnTap: () {
                                      controller.isShowPassword1.value =
                                          HelperFunction.showPassword(
                                              controller.isShowPassword1.value);
                                    },
                                    onChanged: (value){
                                      controller.checkForm();
                                    },
                                    icon: controller.isShowPassword1.value ==
                                        true
                                        ? ImageConstant.imgCheckmark15X16
                                        : ImageConstant.imgEye,
                                    onTap: () {}),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Obx(
                                () => CustomTextField3(
                                  semanticsLabel: SemanticsLabel.LAB_CONF_NEW_PASS_FIELD,
                                    fieldText: "msg_confirm_new_pas".tr,
                                    controller:
                                        controller.confirmPasswordController,
                                    isFinal: true,
                                    focusNode: controller.confirmPasswordNode,
                                    keyboardType: TextInputType.text,
                                    limit: HelperFunction.EMAIL_VALIDATION,
                                    validator: (value) {
                                      return HelperFunction.passwordValidate(
                                          value!);
                                    },
                                    isPassword:
                                        !controller.isShowPassword2.value,
                                    sufixIconOnTap: () {
                                      controller.isShowPassword2.value =
                                          HelperFunction.showPassword(
                                              controller.isShowPassword2.value);
                                    },
                                    onChanged: (value){
                                      controller.checkForm();
                                    },
                                    icon: controller.isShowPassword2.value ==
                                        true
                                        ? ImageConstant.imgCheckmark15X16
                                        : ImageConstant.imgEye,
                                    onTap: () {}),
                              ),
                              Obx(() =>  controller.isFormCompleted.value?
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child:AnimatedButton(
                                  text: "lbl_submit".tr,
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
                                ),
                              ): CustomButton(
                                semanticsLabel: SemanticsLabel.LAB_CHANGE_PASS_BTN,
                                  width: 343,
                                  text: "lbl_submit".tr,
                                  margin: getMargin(
                                      left: 5, top: 40, right: 5, bottom: 20),
                                  padding: ButtonPadding.PaddingAll18,
                                  variant: ButtonVariant.FillIndigo50,
                                  fontStyle: ButtonFontStyle.PoppinsSemiBold16,
                                  onTap: () {
                                    // controller.onSubmit(context);
                                  }))

                            ]))))));
  }
}
