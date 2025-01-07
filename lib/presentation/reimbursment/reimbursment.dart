import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/helper_functions.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/size_utils.dart';
import '../../widgets/animatedButton.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textfield_new.dart';
import 'controller/reimbursment_controller.dart';

class Reimbursment extends GetWidget<ReimbrusmentController> {
  Responsive responsive = Responsive();
  ReimbrusmentController controller = Get.put(ReimbrusmentController());

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return Container(
        width: size.width,
        child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Reimbursement: ",
                                style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: 13,
                                  fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w600,
                                )),
                            TextSpan(
                                text:
                                "Submit and track education expenses.",
                                style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: 13,
                                  fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w200,
                                )),
                          ])),
                    ),
                    SizedBox(
                      height: responsive.setHeight(2),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: CustomTextField3(
                            fieldText: "Date Spent",
                            controller: controller.classDateController2,
                            focusNode: controller.classDateFocusNode2,
                            isFinal: true,
                            enabled: false,
                            inRowPaddindRight: 6,
                            // focusNode: controller.,
                            keyboardType: TextInputType.text,
                            limit: HelperFunction.EMAIL_VALIDATION,
                            validator: (value) {
                              return HelperFunction.stringValidate(value!);
                            },

                            onChanged: (v){
                              controller.classDateController2.refresh();
                            },
                            sufixIconOnTap: (){
                              controller.selectAge(context, true);
                            },
                            icon: ImageConstant.calender_icon1,
                            iconHinColor: false,
                            onTap: () {
                              controller.selectAge(context, true);
                            },
                          ),
                        ),
                        Flexible(
                          child: CustomTextField3(
                            fieldText: "Total Spent",
                            isFinal: true,
                            // enabled: false,
                            controller: controller.totalSpent,
                            inRowPaddindLeft: 6,
                            focusNode: controller.totalSpentNode,
                            // focusNode: controller.,
                            keyboardType: TextInputType.number,
                            limit: HelperFunction.EMAIL_VALIDATION,
                            validator: (value) {
                              return HelperFunction.stringValidate(value!);
                            },
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            onChanged: (v){
                              controller.totalSpent.refresh();
                            },

                            sufixIconOnTap: (){
                              // controller.selectStartTime(context);
                            },
                            icon: ImageConstant.ticket_icon,
                            iconHinColor: false,
                            onTap: () {
                              // controller.selectStartTime(context);
                            },
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: responsive.setHeight(1.7),
                    ),

                    CustomTextField3(
                      //width: 343,
                      focusNode: controller.eventnode,
                      controller: controller.eventController,
                      nextFocusNode:  controller.commentsNode,
                      fieldText: "Purpose",
                      isFinal: true,
                      enabled: false,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(30),
                      ],
                      validator: (value) {
                        return HelperFunction.stringValidate(value);
                      },
                      onChanged: (v){
                        controller.eventController.refresh();
                      },
                      iconData: Icons.keyboard_arrow_down,
                      sufixIconOnTap: (){
                        controller.selectPurpose(context);
                      },
                      iconHinColor: true,
                      onTap: () {
                        controller.selectPurpose(context);
                      },
                      //margin: getMargin( top: 35, bottom: 16),

                    ),
                    SizedBox(
                      height: responsive.setHeight(1.7),
                    ),
                    CustomTextField3(
                      fieldText: "Payment Method",
                      controller: controller.paymentController,
                      focusNode: controller.paymentNote,
                      isFinal: false,
                      enabled: false,
                      keyboardType: TextInputType.text,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(155),
                      ],
                      validator: (value) {
                        return HelperFunction.stringValidate(value!);
                      },
                      iconData: Icons.keyboard_arrow_down_sharp,
                      iconHinColor: true,
                      sufixIconOnTap: (){
                        controller.selectPosition(context);
                      },
                      onChanged: (v){
                        controller.paymentController.refresh();
                      },
                      onTap: () {
                        controller.selectPosition(context);
                      },),
                    SizedBox(
                      height: responsive.setHeight(1.7),
                    ),
                    CustomTextField3(
                      //width: 343,
                      focusNode: controller.commentsNode,
                      controller: controller.commentController,
                      fieldText: "lbl_comments".tr,
                      validator: (value) {
                        return HelperFunction.stringValidate(value);
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(500),
                      ],
                      onChanged: (v){
                        controller.commentController.refresh();
                      },
                      //margin: getMargin( top: 16,),
                      //textInputAction: TextInputAction.done,
                      maxLines: 6,
                      isFinal: true,),
                    SizedBox(
                      height: responsive.setHeight(1.7),
                    ),
                    CustomTextField3(
                      fieldText: "Upload Receipt",
                      controller: controller.uploadController,
                      focusNode: controller.uploadNode,
                      isFinal: true,
                      enabled: false,
                      // focusNode: controller.,
                      keyboardType: TextInputType.text,
                      limit: 15,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(15),
                      ],
                      validator: (value) {
                        return HelperFunction.stringValidate(value!);
                      },

                      sufixIconOnTap: (){
                        FocusScope.of(context).unfocus();
                        // File picker for image
                        controller.selectFile(context);
                      },
                      icon: ImageConstant.upload_icon,
                      iconHinColor: false,
                      onTap: () {
                        controller.selectFile(context);
                      },
                    ),

                    SizedBox(
                      height: responsive.setHeight(1),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: MyText(
                          title: 'Optional, but highly recommended.',
                          fontSize: 12,
                          clr: ColorConstant.hintTextColor,

                        ),
                      ),
                    ),


                    Obx(
                          () =>  controller.isEditing.value || controller.classDateController2.value.text.isNotEmpty &&
                          controller.totalSpent.value.text.isNotEmpty
                          ? AnimatedButton(
                        // semanticsLabel: SemanticsLabel.LAB_SIGNIN_BTN_LINK,
                        text: "lbl_submit".tr,
                        width: double.maxFinite,
                        margin: getMargin(left: 15, top: 44, right: 15),
                        padding: ButtonPaddingOfButton.PaddingAll18,
                        fontStyle: ButtonFontStyleOfButton.PoppinsSemiBold16,
                        alignment: Alignment.center,
                        onPressed: () async {
                          controller.saveInfo(context);
                        },
                        controller: controller.animatedButtonController,
                      )
                          : CustomButton(
                          width: double.maxFinite,
                          text: "lbl_submit".tr,
                          margin: getMargin(left: 15, top: 44, right: 15),
                          variant: ButtonVariant.FillIndigo50,
                          padding: ButtonPadding.PaddingAll18,
                          fontStyle: ButtonFontStyle.PoppinsSemiBold16,
                          onTap: () {},
                          alignment: Alignment.center),)

                  ]),
            )));
  }

}