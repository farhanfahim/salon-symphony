import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/core/utils/responsive.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/helper_functions.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../widgets/animatedButton.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textfield_new.dart';
import 'controller/submit_hours_controller.dart';

class SubmitHours extends StatelessWidget {
  SubmitHoursController controller = Get.put(SubmitHoursController());
  Responsive responsive = Responsive();



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
                        text: "Class Hours: ",
                        style: TextStyle(
                          color: ColorConstant.black900,
                          fontSize: 13,
                          fontFamily:
                              Platform.isIOS ? 'SF Pro Display' : 'Roboto',
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w600,
                        )),
                    TextSpan(
                        text: "Submit and track your education hours.",
                        style: TextStyle(
                          color: ColorConstant.black900,
                          fontSize: 13,
                          fontFamily:
                              Platform.isIOS ? 'SF Pro Display' : 'Roboto',
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w200,
                        )),
                  ])),
                ),
                SizedBox(
                  height: responsive.setHeight(3),
                ),
                CustomTextField3(
                  //width: 343,
                  focusNode: controller.classnameNode,
                  controller: controller.classnameController,
                  nextFocusNode: controller.educationNode,
                  fieldText: "Class Name",
                  isFinal: false,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(100),
                  ],

                  validator: (value) {

                    return HelperFunction.stringValidate(value);
                  },
                  // margin: getMargin( top: 35, bottom: 16),
                ),
                SizedBox(
                  height: responsive.setHeight(2),
                ),
                CustomTextField3(
                  // width: 343,
                  focusNode: controller.educationNode,
                  controller: controller.educationController,
                  fieldText: "Educator Name",
                  nextFocusNode: controller.submitDateNode,
                  isFinal: true,

                  inputFormatters: [
                    LengthLimitingTextInputFormatter(100),
                  ],
                  validator: (value) {

                    return HelperFunction.stringValidate(value);
                  },
                  // margin: getMargin( bottom: 16),
                ),
                SizedBox(
                  height: responsive.setHeight(2),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: CustomTextField3(
                        fieldText: "Class Date",
                        controller: controller.classDateController,
                        focusNode: controller.submitDateNode,
                        nextFocusNode: controller.timeNode,
                        isFinal: true,
                        enabled: false,
                        inRowPaddindRight: 6,
                        // focusNode: controller.,
                        keyboardType: TextInputType.text,
                        limit: HelperFunction.EMAIL_VALIDATION,
                        validator: (value) {
                          return HelperFunction.stringValidate(value!);
                        },
                        icon: ImageConstant.calender_icon1,
                        iconHinColor: false,
                        sufixIconOnTap: () {
                          Utils.hideKeyboard(context);
                          controller.selectAge(context, true);
                        },
                        onTap: () {
                          Utils.hideKeyboard(context);
                          controller.selectAge(context, true);
                        },
                      ),
                    ),
                    Flexible(
                      child: CustomTextField3(
                        fieldText: "Class Hours",
                        controller: controller.timeControllerSubmit,
                        focusNode: controller.timeNode,
                        nextFocusNode: controller.notesNode,
                        isFinal: true,
                        enabled: false,
                        inRowPaddindLeft: 6,
                        // focusNode: controller.,
                        keyboardType: TextInputType.text,
                        limit: HelperFunction.EMAIL_VALIDATION,
                        validator: (value) {
                          return HelperFunction.stringValidate(value!);
                        },

                        sufixIconOnTap: () {
                          Utils.hideKeyboard(context);
                          HelperFunction.showBottomSheet(
                              context,
                              bottomSheetHeight:  responsive.setHeight(40),
                              // spaceBetween: responsive.setHeight(4),
                              screenTitle: 'Class Hours',
                              screenEndTask: 'Done',
                              onTap: (){

                                if(controller.hour.value != 0 || controller.min.value != 0){
                                  double fraction = controller.min.value / 60;

                                  double decimal = controller.hour.value + fraction;

                                  controller.startTime.value = decimal.toStringAsFixed(2);

                                  controller.timeControllerSubmit.value.text = decimal.toStringAsFixed(2)+" Hours";


                                }else{
                                  controller.startTime.value = "";
                                  controller.timeControllerSubmit.value.text = "";

                                }
                                Get.back();

                              },
                              widget:Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Spacer(),
                                  SizedBox(width: 20,),
                                  Obx(() => NumberPicker(
                                    minValue: 0,
                                    itemWidth: 40,
                                    value: controller.hour.value,
                                    maxValue: 12,
                                    infiniteLoop: true,
                                    textStyle: TextStyle(fontSize: 25,fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',fontWeight:FontWeight.w600,color:  Colors.grey,),
                                    selectedTextStyle: TextStyle(fontSize: 25,fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',fontWeight:FontWeight.w600,color:  Colors.black,),
                                    onChanged: (v){
                                      controller.hour.value = v;
                                      controller.startTime.value = "";
                                    },
                                  ),),

                                  MyText(title: 'hours',weight: 'Semi Bold',fontSize: 25,),
                                  // Spacer(),
                                  SizedBox(width: 40,),
                                  MyText(title: ':',weight: 'Semi Bold',fontSize: 25,clr: Colors.grey,),
                                  // Spacer(),
                                  SizedBox(width: 40,),

                                  Obx(() => NumberPicker(
                                    minValue: 0,
                                    value: controller.min.value,
                                    maxValue: 59,
                                    infiniteLoop: true,
                                    step: 15,
                                    itemWidth: 40,
                                    zeroPad: true,
                                    textStyle: TextStyle(fontSize: 25,fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',fontWeight:FontWeight.w600,color:  Colors.grey,),
                                    selectedTextStyle: TextStyle(fontSize: 25,fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',fontWeight:FontWeight.w600,color:  Colors.black,),
                                    onChanged: (v){
                                      controller.min.value = v;
                                      controller.startTime.value = "";

                                    },
                                  ),),
                                  MyText(title: 'min',weight: 'Semi Bold',fontSize: 25,),
                                  SizedBox(width: 50,),
                                  // Spacer(),
                                ],
                              )
                          );
                        },
                        icon: ImageConstant.clock_icon,
                        iconHinColor: false,
                        onTap: () {
                          Utils.hideKeyboard(context);
                          HelperFunction.showBottomSheet(
                            context,
                            bottomSheetHeight:  responsive.setHeight(40),
                            spaceBetween: responsive.setHeight(0),
                            screenTitle: 'Class Hours',
                            screenEndTask: 'Done',
                            onTap: (){

                              if(controller.hour.value != 0 || controller.min.value != 0){
                                double fraction = controller.min.value / 60;

                                double decimal = controller.hour.value + fraction;

                                controller.startTime.value = decimal.toStringAsFixed(2);

                                controller.timeControllerSubmit.value.text = decimal.toStringAsFixed(2)+" Hours";


                              }else{
                                controller.startTime.value = "";
                                controller.timeControllerSubmit.value.text = "";

                              }
                              Get.back();

                            },
                            widget: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Spacer(),
                                SizedBox(width: 20,),
                                Obx(() => NumberPicker(
                                  minValue: 0,
                                  itemWidth: 40,
                                  value: controller.hour.value,
                                  maxValue: 12,
                                  infiniteLoop: true,
                                  textStyle: TextStyle(fontSize: 25,fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',fontWeight:FontWeight.w600,color:  Colors.grey,),
                                  selectedTextStyle: TextStyle(fontSize: 25,fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',fontWeight:FontWeight.w600,color:  Colors.black,),
                                  onChanged: (v){
                                    controller.hour.value = v;
                                    controller.startTime.value = "";
                                  },
                                ),),

                                MyText(title: 'hours',weight: 'Semi Bold',fontSize: 25,),
                                // Spacer(),
                                SizedBox(width: 40,),
                                MyText(title: ':',weight: 'Semi Bold',fontSize: 25,clr: Colors.grey,),
                                // Spacer(),
                                SizedBox(width: 40,),

                                Obx(() => NumberPicker(
                                  minValue: 0,
                                  value: controller.min.value,
                                  maxValue: 59,
                                  infiniteLoop: true,
                                  step: 15,
                                  itemWidth: 40,
                                  zeroPad: true,
                                  textStyle: TextStyle(fontSize: 25,fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',fontWeight:FontWeight.w600,color:  Colors.grey,),
                                  selectedTextStyle: TextStyle(fontSize: 25,fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',fontWeight:FontWeight.w600,color:  Colors.black,),
                                  onChanged: (v){
                                    controller.min.value = v;
                                    controller.startTime.value = "";

                                  },
                                ),),
                                MyText(title: 'min',weight: 'Semi Bold',fontSize: 25,),
                                SizedBox(width: 50,),
                                // Spacer(),
                              ],
                            )
                          );

                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: responsive.setHeight(2),
                ),
                CustomTextField3(
                    //width: 343,
                    focusNode: controller.notesNode,
                    controller: controller.classNotesController,
                    fieldText: "Comments",
                    isFinal: true,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(500),
                    ],
                    validator: (value) {

                      return HelperFunction.stringValidate(value);
                    },
                    // margin: getMargin( top: 16,),
                    //textInputAction: TextInputAction.done,
                    maxLines: 6),
                SizedBox(
                  height: responsive.setHeight(2),
                ),
                CustomTextField3(
                  fieldText: "Upload Certificate",
                  controller: controller.uploadCertificates,
                  focusNode: controller.uploadNode,
                  isFinal: true,
                  enabled: false,
                  // focusNode: controller.,
                  keyboardType: TextInputType.text,
                  limit: HelperFunction.EMAIL_VALIDATION,
                  validator: (value) {
                    return HelperFunction.stringValidate(value!);
                  },

                  sufixIconOnTap: () {
                    FocusScope.of(context).unfocus();
                    // File picker for image

                    controller.onTapAddCertificate();
                  },
                  icon: ImageConstant.upload_icon,
                  iconHinColor: false,
                  onTap: () {

                    controller.onTapAddCertificate();
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
                  () => controller.isEditing.value || controller.classnameController.value.text.isNotEmpty &&
                          controller.educationController.value.text.isNotEmpty &&
                          controller.classDateController.value.text.isNotEmpty &&
                          controller.classNotesController.value.text.isNotEmpty &&
                          controller.timeControllerSubmit.value.text.isNotEmpty
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
                          alignment: Alignment.center),
                )
              ]),
        )));
  }


}
