import 'package:salon_symphony/baseviews/baseview_process_screen.dart';

import '../../core/utils/helper_functions.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/utils.dart';
import '../../widgets/animatedButton.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textfield_new.dart';
import '../../widgets/textfieldclientFeedback.dart';
import 'controller/add_new_rererral_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/core/utils/validation_functions.dart';
import 'package:salon_symphony/widgets/custom_button.dart';
import 'package:salon_symphony/widgets/custom_floating_edit_text.dart';
import 'package:salon_symphony/widgets/custom_text_form_field.dart';

class AddNewRererralScreen extends GetWidget<AddNewRererralController> {
  final RegExp phoneNumberRegExp = RegExp(
    r'^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9][0-8][0-9])\s*\)|([2-9][0-8][0-9]))\s*(?:[.-]\s*)?)?([2-9][0-9]{2})\s*(?:[.-]\s*)?([0-9]{4})$',
  );

  @override
  Widget build(BuildContext context) {
    return BaseviewScreen(
      basicAppBar: true,
      screenName: "Refer A Candidate",
      showBottomBar: false,
      mainTopHeight: 0,
      sidePadding: false,
      isResizeToAvoidBottomInset: true,
      backgroundColor: ColorConstant.whiteA700,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Form(
              key: controller.formKey,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTextField3(
                      fieldText: "Candidate Name",
                      controller: controller.candidatenameController,
                      isFinal: false,
                      focusNode: controller.candidatenameNode,
                      nextFocusNode: controller.phoneNumberNode,
                      keyboardType: TextInputType.text,
                      limit: HelperFunction.EMAIL_VALIDATION,
                      validator: (value) {
                        return HelperFunction.stringValidate(value!);
                      },
                      onTap: () {}),
                  SizedBox(
                    height: 18,
                  ),
                  CustomTextField3(
                      fieldText: "Candidate Phone",
                      controller: controller.phoneNumberController,
                      isFinal: false,
                      prefixText: "+1 ",
                      focusNode: controller.phoneNumberNode,
                      inputFormatters: [
                        controller.maskFormatter,
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return null;
                        } else if (!phoneNumberRegExp.hasMatch(value)) {
                          return '';
                        }
                        return null;
                      },
                      nextFocusNode: controller.instaNode,
                      keyboardType: TextInputType.number,
                      limit: HelperFunction.EMAIL_VALIDATION,
                      onTap: () {}),
                  SizedBox(
                    height: 18,
                  ),
                  CustomTextField3(
                      fieldText: "@Candidate_insta",
                      controller: controller.instaController,
                      isFinal: true,
                      focusNode: controller.instaNode,
                      nextFocusNode: controller.positionNode,
                      // keyboardType: TextInputType.none,
                      limit: HelperFunction.EMAIL_VALIDATION,
                      onChanged: (value) {
                        controller.checkForm();
                      },
                      validator: (value) {
                        return HelperFunction.stringValidate(value!);
                      },
                      onTap: () {}),
                  SizedBox(
                    height: 18,
                  ),
                  CustomTextField3(
                    fieldText: "lbl_position3".tr,
                    controller: controller.positionController,
                    isFinal: false,
                    enabled: false,
                    focusNode: controller.positionNode,
                    nextFocusNode: controller.experienceNode,
                    keyboardType: TextInputType.text,
                    limit: HelperFunction.EMAIL_VALIDATION,
                    iconColorChange: true,
                    validator: (value) {
                      return HelperFunction.stringValidate(value!);
                    },
                    iconData: Icons.keyboard_arrow_down,
                    sufixIconOnTap: () {
                      selectPosition(context);
                    },
                    onChanged: (value) {
                      controller.checkForm();
                    },
                    onTap: () {
                      selectPosition(context);
                      Utils.hideKeyBoard(context);
                    },
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  CustomTextField3(
                    fieldText: "Experience",
                    controller: controller.experienceController,
                    isFinal: false,
                    enabled: false,
                    focusNode: controller.experienceNode,
                    nextFocusNode: controller.relationNode,
                    keyboardType: TextInputType.text,
                    limit: HelperFunction.EMAIL_VALIDATION,
                    validator: (value) {
                      return HelperFunction.stringValidate(value!);
                    },
                    iconData: Icons.keyboard_arrow_down,
                    iconColorChange: true,

                    sufixIconOnTap: () {
                      selectExperience(context);
                    },
                    onChanged: (value) {
                      controller.checkForm();
                    },
                    onTap: () {
                      selectExperience(context);
                      Utils.hideKeyBoard(context);
                      // controller.updateItem(index);
                    },
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  CustomTextField3(
                    fieldText: "Relationship",
                    controller: controller.relationController,
                    isFinal: false,
                    enabled: false,
                    focusNode: controller.relationNode,
                    iconColorChange: true,

                    nextFocusNode: controller.descNode,
                    keyboardType: TextInputType.text,
                    limit: HelperFunction.EMAIL_VALIDATION,
                    validator: (value) {
                      return HelperFunction.stringValidate(value!);
                    },
                    iconData: Icons.keyboard_arrow_down,
                    sufixIconOnTap: () {
                      selectRelation(context);
                    },
                    onChanged: (value) {
                      controller.checkForm();
                    },
                    onTap: () {
                      selectRelation(context);
                      Utils.hideKeyBoard(context);
                      // updateItem(int index)
                    },
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  CustomTextField3(
                    fieldText: "Why is this candidate a great fit?",
                    controller: controller.descController,
                    isFinal: true,
                    enabled: true,
                    maxLines: 5,
                    focusNode: controller.descNode,
                    keyboardType: TextInputType.text,
                    limit: HelperFunction.EMAIL_VALIDATION,
                    onChanged: (value) {
                      controller.checkForm();
                    },
                    validator: (value) {
                      return HelperFunction.stringValidate(value!);
                    },
                    onTap: () {
                      // updateItem(int index)
                    },
                  ),
                  Obx(() => controller.isFormCompleted.value
                      ? AnimatedButton(
                    // semanticsLabel: SemanticsLabel.LAB_SIGNIN_BTN_LINK,
                    text: "Save Changes",
                    width: double.maxFinite,
                    margin: getMargin(left: 15, top: 44, right: 15),
                    padding: ButtonPaddingOfButton.PaddingAll18,
                    fontStyle: ButtonFontStyleOfButton.PoppinsSemiBold16,
                    alignment: Alignment.center,
                    onPressed: () async {
                      print('controller.maskFormatter.getUnmaskedText() ----> ${controller.maskFormatter.getUnmaskedText()}');
                      controller.validate(context);

                    }, controller: controller.animatedButtonController,)
                      : CustomButton(
                          width: 343,
                          text: "lbl_submit".tr,
                          margin: getMargin(
                            left: 16,
                            top: 16,
                            right: 16,
                            bottom: 20,
                          ),
                          variant: ButtonVariant.FillIndigo50,
                          padding: ButtonPadding.PaddingAll18,
                          fontStyle: ButtonFontStyle.PoppinsSemiBold16,
                        ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  void selectPosition(context) {
    Responsive responsive = Responsive();
    responsive.setContext(context);
    HelperFunction.showBottomSheet(
      context,
      spaceBetween: responsive.setHeight(4),
      screenTitle: 'Select Position',
      isScrollControlled: true,
      redclrEndTask: false,
      screenEndTask: "Done",
      widget: ListView.builder(
        itemCount: controller.arrOfOptionsPosition.length,
        itemBuilder: (BuildContext context, int index) {
          var data = controller.arrOfOptionsPosition[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  controller.positionController.value.text = data.name.toString();
                  controller.saveInfo(context);
                  controller.updatePosition(index);
                  Get.back();
                },
                child: Padding(
                  padding: EdgeInsets.only(bottom: responsive.setHeight(2),right: 20),
                  child: InkWell(
                      onTap: () {
                        controller.positionController.value.text = data.name.toString();
                        controller.saveInfo(context);
                        controller.updatePosition(index);
                        Get.back();
                      },
                      child: Row(
                        children: [
                          MyText(title: '${data.name}'),
                          Spacer(),
                          data.selected!.value == true
                              ? Container(
                            margin: getMargin(
                              // top: 15,
                              right: 5,
                              // bottom: 15,
                            ),
                            decoration:
                            AppDecoration.outlineBluegray100.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10,
                              border: Border.all(
                                color: ColorConstant.primaryColor,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: getSize(
                                    15.00,
                                  ),
                                  width: getSize(
                                    15.00,
                                  ),
                                  margin: getMargin(
                                    all: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.primaryColor,
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        50,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                              : Container(
                            margin: getMargin(
                              // top: 15,
                              right: 5,
                              // bottom: 15,
                            ),
                            decoration:
                            AppDecoration.outlineBluegray100.copyWith(
                              borderRadius:
                              BorderRadiusStyle.roundedBorder10,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: getSize(
                                    15.00,
                                  ),
                                  width: getSize(
                                    15.00,
                                  ),
                                  margin: getMargin(
                                    all: 1,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.whiteA700,
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        50,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ),
             index == controller.arrOfOptionsPosition.length -1 ? Offstage():
              Divider()
            ],
          );
        },
      ),
    );
  }

  void selectExperience(context) {
    Responsive responsive = Responsive();
    responsive.setContext(context);
    HelperFunction.showBottomSheet(
      context,
      bottomSheetHeight: responsive.setHeight(80),
      spaceBetween: responsive.setHeight(4),
      isScrollControlled: true,
      screenTitle: 'Years of Experience',
      screenEndTask: 'Done',
      widget: Obx(() => ListView.builder(
        itemCount: controller.arrOfOptions.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var data = controller.arrOfOptions[index];
          // print('count ${arrOfOptions[1].selected!.value}');
          return Column(
            children: [
              SizedBox(
                height: 12,
              ),
              InkWell(
                onTap: () {
                  controller.experienceController.value.text = data.name.toString();
                  controller.saveInfo(context);
                  controller.updateItem(index);
                  Get.back();
                },
                child: Padding(
                  padding: EdgeInsets.only(bottom: responsive.setHeight(2),right: 20),
                  child: Row(
                    children: [
                      MyText(title: '${data.name}'),
                      Spacer(),
                      controller. arrOfOptions[index].selected!.value == true
                          ? Container(
                        margin: getMargin(
                          // top: 15,
                          right: 5,
                          // bottom: 15,
                        ),
                        decoration:
                        AppDecoration.outlineBluegray100.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10,
                          border: Border.all(
                            color: ColorConstant.primaryColor,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: getSize(
                                15.00,
                              ),
                              width: getSize(
                                15.00,
                              ),
                              margin: getMargin(
                                all: 2,
                              ),
                              decoration: BoxDecoration(
                                color: ColorConstant.primaryColor,
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    50,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                          : Container(
                        margin: getMargin(
                          // top: 15,
                          right: 5,
                          // bottom: 15,
                        ),
                        decoration:
                        AppDecoration.outlineBluegray100.copyWith(
                          borderRadius:
                          BorderRadiusStyle.roundedBorder10,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: getSize(
                                15.00,
                              ),
                              width: getSize(
                                15.00,
                              ),
                              margin: getMargin(
                                all: 1,
                              ),
                              decoration: BoxDecoration(
                                color: ColorConstant.whiteA700,
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    50,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              index == 8? Offstage():
              Divider()
            ],
          );
        },
      )),
    );
  }

  void selectRelation(context) {
    Responsive responsive = Responsive();
    responsive.setContext(context);
    HelperFunction.showBottomSheet(
      context,
      bottomSheetHeight: responsive.setHeight(40),
      spaceBetween: responsive.setHeight(4),
      screenTitle: 'Relation to Candidate',
      screenEndTask: 'Done',
      widget: ListView.builder(
        itemCount: controller.arrOfOptionsReleation.length,
        itemBuilder: (BuildContext context, int index) {
          var data = controller.arrOfOptionsReleation[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  controller.relationController.value.text = data.name.toString();
                  controller.saveInfo(context);
                  controller. updateRelation(index);
                  Get.back();
                },
                child: Padding(
                  padding: EdgeInsets.only(bottom: responsive.setHeight(1),right: 20),
                  child: InkWell(
                      onTap: () {
                        controller.relationController.value.text = data.name.toString();
                        controller.saveInfo(context);
                        controller.updateRelation(index);
                        Get.back();
                      },
                      child: Row(
                        children: [

                          MyText(title: '${data.name}'),
                          Spacer(),
                          data.selected!.value == true
                              ? Container(
                            margin: getMargin(
                              // top: 15,
                              right: 5,
                              // bottom: 15,
                            ),
                            decoration:
                            AppDecoration.outlineBluegray100.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10,
                              border: Border.all(
                                color: ColorConstant.primaryColor,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: getSize(
                                    15.00,
                                  ),
                                  width: getSize(
                                    15.00,
                                  ),
                                  margin: getMargin(
                                    all: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.primaryColor,
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        50,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                              : Container(
                            margin: getMargin(
                              // top: 15,
                              right: 5,
                              // bottom: 15,
                            ),
                            decoration:
                            AppDecoration.outlineBluegray100.copyWith(
                              borderRadius:
                              BorderRadiusStyle.roundedBorder10,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: getSize(
                                    15.00,
                                  ),
                                  width: getSize(
                                    15.00,
                                  ),
                                  margin: getMargin(
                                    all: 1,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.whiteA700,
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        50,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              index == 3? Offstage():
              Divider()
            ],
          );
        },
      ),
    );
  }


}
