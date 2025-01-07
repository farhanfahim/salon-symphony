  import 'package:flutter/services.dart';
import 'package:salon_symphony/baseviews/baseview_auth_screen.dart';
import 'package:salon_symphony/core/utils/responsive.dart';
import 'package:salon_symphony/core/utils/semantics.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import 'package:salon_symphony/widgets/custom_text.dart';
import '../../widgets/animatedButton.dart';
import '../../widgets/custom_textfield_new.dart';
import 'controller/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_button.dart';

class ForgotPasswordScreen extends GetWidget<ForgotPasswordController> {

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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, right: 15.0),
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
                    label: SemanticsLabel.LAB_FORGET_LOGO,
                    child: MyText(
                      title: "Reset Password",
                      letterSpacing: 0.5,
                      fontSize: responsive.setTextScale(30),
                      weight: 'Semi Bold',
                    ),
                  ),
                ),
                SizedBox(
                  height: responsive.setHeight(1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: MyText(
                    title: "To reset your password, please enter your phone number in the field below.",
                    center: true,
                    letterSpacing: 0.5,
                    clr: ColorConstant.black900,
                  ),
                ),
                SizedBox(
                  height: responsive.setHeight(7),
                ),
                CustomTextField3(
                    semanticsLabel: SemanticsLabel.LAB_EMAIL_FIELD,
                    fieldText: "Phone Number",
                    controller: controller.mobileNoController,
                    isFinal: false,
                    prefixText: "+1 ",
                    focusNode: controller.mobileNoNode,
                    keyboardType: TextInputType.phone,
                    limit: 25,
                    inputFormatters: [
                      controller.maskFormatter,
                      // LengthLimitingTextInputFormatter(25),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        Future.delayed(const Duration(milliseconds: 500), () {
                          controller.animatedButtonController.reset();

                        });
                        return '';
                      } else if (!Utils.phoneNumberRegExp.hasMatch(value)) {
                        Future.delayed(const Duration(milliseconds: 500), () {
                          controller.animatedButtonController.reset();

                        });
                        return '';
                      }
                      return null;
                    },
                    onChanged: (value){
                      controller.checkForm();
                    },

                      onTap: () {}),
                  SizedBox(
                    height: responsive.setHeight(4),
                  ),
                Obx(() => controller.isFormCompleted.value ?
                    AnimatedButton(
                      semanticsLabel: SemanticsLabel.LAB_SUBMIT_BTN,
                  text: "lbl_send_code".tr,
                  width: double.maxFinite,
                  margin: getMargin(left: 15, top: 44, right: 15),
                  padding: ButtonPaddingOfButton.PaddingAll18,
                  fontStyle: ButtonFontStyleOfButton.PoppinsSemiBold16,
                  alignment: Alignment.center,
                  onPressed: () async {
                    controller.forgetPassword(context);

                  }, controller: controller.animatedButtonController,):
                    CustomButton(
                        semanticsLabel: SemanticsLabel.LAB_SUBMIT_BTN,
                        text: "lbl_send_code".tr,
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
