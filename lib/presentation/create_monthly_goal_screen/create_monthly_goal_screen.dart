import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import '../../core/utils/dummy_content.dart';
import '../../core/utils/helper_functions.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/utils.dart';
import '../../widgets/animatedButton.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textfield_new.dart';
import '../../widgets/textfieldclientFeedback.dart';
import 'controller/create_monthly_goal_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_button.dart';

class CreateMonthlyGoalScreen extends GetWidget<CreateMonthlyGoalController> {
  Responsive responsive = Responsive();
  Map<String, dynamic> map = Get.arguments;

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return BaseviewScreen(
        showBottomBar: false,
        screenName: "New Monthly Goal",
        basicAppBar: true,
        mainTopHeight: 0,
        isResizeToAvoidBottomInset: true,

        sidePadding: false,
        backgroundColor: ColorConstant.whiteA700,
        child: GestureDetector(
          onTap: () {
            Utils.hideKeyboard(context);
          },
          child: Container(
              width: size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                      key: controller.formKey,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Monthly Goal: ',
                                      style: TextStyle(
                                        color: ColorConstant.black901,
                                        fontSize: getFontSize(
                                          12,
                                        ),
                                        fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "To simplify tracking, monthly goals start on the 1st of each month and end on the last day. ",
                                      style: TextStyle(
                                        color: ColorConstant.black901,
                                        fontSize: getFontSize(
                                          12,
                                        ),
                                        height: 1.7,
                                        fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " Learn more »",
                                      recognizer: TapGestureRecognizer()..onTap = () => {
                                        Utils().weeklyExample(context,'Monthly Goal Examples'),
                                      },
                                      style: TextStyle(
                                        color: ColorConstant.primaryColor,
                                        fontSize: getFontSize(
                                          12,
                                        ),
                                        fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),

                            SizedBox(
                              height: responsive.setHeight(2),
                            ),
                            CustomTextField3(
                              fieldText: "Goal Name",
                              controller: controller.weeklyGoalsTitleController!,
                              isFinal: true,
                              focusNode: controller.weeklyGoalNode,
                              nextFocusNode: controller.dayNode,
                              // keyboardType: TextInputType.text,
                              iconHinColor: true,
                              // limit: 3,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(30),
                              ],
                              limit: 30,

                              validator: (value) {
                                return HelperFunction.stringValidate(value!);
                              },
                              onTap: () {},
                            ),
                            SizedBox(
                              height: responsive.setHeight(2),
                            ),
                            CustomTextField3(
                              controller: controller.measureController,
                              isFinal: false,
                              enabled: false,
                              focusNode: controller.dayNode,
                              nextFocusNode: controller.weeklyRepeatNode,
                              keyboardType: TextInputType.text,
                              limit: HelperFunction.EMAIL_VALIDATION,
                              validator: (value) {
                                return HelperFunction.stringValidate(value!);
                              },
                              icon: ImageConstant.imgFieldLock,
                              iconTopPadding: 5,
                              iconSize: 31,
                              iconHeight: 38,
                              iconHinColor: true,
                            ),
                            SizedBox(
                              height: responsive.setHeight(2),
                            ),
                            CustomTextField3(
                              fieldText: "Repeat Goal ",
                              controller: controller.weeklyForeverController,
                              isFinal: false,
                              enabled: false,
                              focusNode: controller.weeklyRepeatNode,
                              nextFocusNode: controller.weeklyAmountNode,
                              keyboardType: TextInputType.text,
                              limit: HelperFunction.EMAIL_VALIDATION,
                              validator: (value) {
                                return HelperFunction.stringValidate(value!);
                              },
                              iconData: Icons.keyboard_arrow_down,
                              iconHinColor: true,
                              sufixIconOnTap: () {
                                // if( map["isEditingGoal"]==false){
                                  selectDuration(context);
                                // }
                              },
                              onTap: () {
                                // if( map["isEditingGoal"]==false){
                                  selectDuration(context);
                                // }
                              },
                            ),
                            SizedBox(
                              height: responsive.setHeight(2),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                    width: 220,
                                    child: CustomTextField3(
                                      fieldText: 'Target Type',
                                      controller: controller.amountController,
                                      isFinal: false,
                                      enabled: false,
                                      focusNode: controller.weeklyAmountNode,
                                      // nextFocusNode: controller.locationNode,
                                      keyboardType: TextInputType.text,
                                      inRowPaddindRight: 0,
                                      limit: HelperFunction.EMAIL_VALIDATION,
                                      validator: (value) {
                                        return HelperFunction.stringValidate(value!);
                                      },
                                      iconData: Icons.keyboard_arrow_down,
                                      iconHinColor: true,
                                      sufixIconOnTap: () {
                                        selectTargetType(context);
                                      },

                                      onTap: () {
                                        selectTargetType(context);
                                      },
                                    ),
                                  ),
                                  Obx(() => Flexible(
                                    child: CustomTextField3(
                                      // width: 120,
                                      // fieldText: "Amount",
                                      isFinal: false,
                                      controller:
                                      controller.dollarControllerMonthly,
                                      keyboardType: TextInputType.numberWithOptions(
                                          decimal: true),
                                      nextFocusNode: controller.weeklyDesNode,
                                      inRowPaddindLeft: 10,
                                      limit: 8,
                                      enabled: controller.showLogo.value,
                                      hintText: "",

                                      validator: (value) {
                                        return HelperFunction.stringValidate(value!);
                                      },
                                      showsuffix: true,
                                      icon:   controller.itemNumber ==
                                          1
                                          ?
                                      ImageConstant
                                          .percantage_Icon: null,
                                      prefixWidget: controller.showLogo.value && controller.itemNumber !=
                                          1
                                          ?
                                      Container(
                                          height: 30,
                                          width: 30.00,
                                          margin: getMargin(
                                              left: 2,
                                              // top: 7,
                                              // bottom: 7,
                                              right: 3),
                                          child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: CommonImageView(
                                                        svgPath:
                                                        ImageConstant.imgClose,
                                                        height: getSize(30.00),
                                                        width: getSize(32.00))),
                                                Align(
                                                    alignment: Alignment.center,
                                                    child: Padding(
                                                        padding: getPadding(all: 6),
                                                        child:
                                                        controller
                                                            .itemNumber ==
                                                            0
                                                            ?
                                                        CommonImageView(
                                                            svgPath: ImageConstant
                                                                .imgLock14X14,
                                                            height: getSize(20.00),
                                                            width: getSize(20.00)) :
                                                        controller.itemNumber ==
                                                            1
                                                            ? null :
                                                        CommonImageView(
                                                            imagePath:ImageConstant
                                                                .numner_Icon2,
                                                            height: getSize(20.00),
                                                            width: getSize(20.00))



                                                    ))
                                              ])) :
                                      controller.showLogo.value && controller.itemNumber !=
                                          1
                                          ?
                                      Container(
                                        height: 30,
                                        width: getSize(28.00),
                                        margin: getMargin(
                                            left: 5,
                                            right: 3),
                                      ): null,
                                    ),
                                  ))
                                ]),
                            SizedBox(
                              height: responsive.setHeight(2),
                            ),
                            CustomTextField3(
                                fieldText: "How will you achieved this goal?",
                                controller: controller.weeklyDesController,
                                isFinal: true,
                                focusNode: controller.weeklyDesNode,
                                keyboardType: TextInputType.text,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(500),
                                ],

                                limit: 500,
                                maxLines: 13,
                                // limit: 155,
                                validator: (value) {
                                  return HelperFunction.stringValidate(value!);
                                },
                                onTap: () {}),


                          ]),
                    ),

                    Obx(() => controller.weeklyGoalsTitleController!.value.text.isNotEmpty &&
                        controller.measureController!.value.text.isNotEmpty &&
                        controller.weeklyForeverController!.value.text.isNotEmpty &&
                        controller.amountController!.value.text.isNotEmpty &&
                        controller.dollarControllerMonthly.value.text.isNotEmpty &&
                        controller.weeklyDesController!.value.text.isNotEmpty
                        ? AnimatedButton(
                      // semanticsLabel: SemanticsLabel.LAB_SIGNIN_BTN_LINK,
                      text: "Save Goal",
                      width: double.maxFinite,
                      margin: getMargin(left: 15, top: 25, right: 15),
                      padding: ButtonPaddingOfButton.PaddingAll18,
                      fontStyle: ButtonFontStyleOfButton.PoppinsSemiBold16,
                      alignment: Alignment.center,
                      onPressed: () async {
                        controller.saveInfo(context);

                      }, controller: controller.animatedButtonController,):CustomButton(
                        width: double.maxFinite,
                        text: "Save Goal",
                        margin: getMargin(left: 15, top: 25, right: 15),
                        variant: ButtonVariant.FillIndigo50,
                        padding: ButtonPadding.PaddingAll18,
                        fontStyle: ButtonFontStyle.PoppinsSemiBold16,
                        onTap: () {},
                        alignment: Alignment.center),)
                  ],
                ),
              )),
        ));
  }

  void selectDay(context) {
    Responsive responsive = Responsive();
    responsive.setContext(context);
    HelperFunction.showBottomSheet(
      context,
      bottomSheetHeight: DummyContent.days.length <= 2
          ? responsive.setHeight(20)
          : DummyContent.days.length == 3
          ? responsive.setHeight(25)
          : responsive.setHeight(100),
      spaceBetween: responsive.setHeight(4),
      screenTitle: 'Measure Every',
      screenEndTask: 'Done',
      widget: Obx(() => ListView.builder(
        itemCount: controller.arrOfOptions.length,
        itemBuilder: (BuildContext context, int index) {
          var data = controller.arrOfOptions[index];
          // print('count ${arrOfOptions[1].selected!.value}');
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  controller.measureController!.value.text = data.name.toString();

                  controller.updateItem(index);
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.only(bottom: responsive.setHeight(2),right: 20),
                  child: Row(
                    children: [

                      MyText(title: '${data.name}'),
                      Spacer(),
                      controller.arrOfOptions[index].selected!.value == true
                          ? Container(
                        margin: getMargin(
                          // top: 15,
                          right: 5,
                          // bottom: 15,
                        ),
                        decoration:
                        AppDecoration.outlineBluegray100.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10,
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
                          borderRadius: BorderRadiusStyle.roundedBorder10,
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

              Divider(),
              SizedBox(
                height: 5,
              ),
            ],
          );
        },
      )),
    );
  }
  void selectDuration(context) {
    Responsive responsive = Responsive();
    responsive.setContext(context);
    HelperFunction.showBottomSheet(
      context,
      bottomSheetHeight: DummyContent.forever.length <= 2
          ? responsive.setHeight(40)
          : DummyContent.forever.length == 3
          ? responsive.setHeight(40)
          : responsive.setHeight(100),
      spaceBetween: responsive.setHeight(4),
      screenTitle: 'Repeat Monthly Goal',
      screenEndTask: 'Done',
      widget: Obx(() => ListView.builder(
        itemCount: controller.arrOfOptions2.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var data = controller.arrOfOptions2[index];
          // print('count ${arrOfOptions[1].selected!.value}');
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  controller.weeklyForeverController!.value.text = data.name.toString();

                  controller.updateItem2(index);
                  Get.back();
                },
                child: Padding(
                  padding: EdgeInsets.only(bottom: responsive.setHeight(1),right: 20,top : responsive.setHeight(1)),
                  child: Row(
                    children: [

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(title: '${data.name}'),
                          Text(
                            '${data.des}',
                            textScaleFactor: 1.0,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey

                            ),
                          )

                        ],
                      ),
                      Spacer(),
                      controller.arrOfOptions2[index].selected!.value == true
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
                          top: 15,
                          right: 5,
                          bottom: 15,
                        ),
                        decoration:
                        AppDecoration.outlineBluegray100.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10,
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
              index == 2? Offstage():
              Divider()
            ],
          );
        },
      )),
    );
  }


  void selectTargetType(context) {
    Responsive responsive = Responsive();
    responsive.setContext(context);
    HelperFunction.showBottomSheet(
      context,
      bottomSheetHeight:  responsive.setHeight(42),
      spaceBetween: responsive.setHeight(4),
      screenTitle: 'Select Target Type',
      screenEndTask: 'Done',
      widget: Obx(() => ListView.builder(
        itemCount: controller.bottomSheetOptions.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var data = controller.bottomSheetOptions[index];
          // print('count ${arrOfOptions[1].selected!.value}');
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  controller.amountController!.value.text = data.name.toString();
                  controller.showLogo.value = true;
                  controller.updateItemBottomsSheet(index);
                  Get.back();
                },
                child: Padding(
                  padding: EdgeInsets.only(bottom: responsive.setHeight(1),right: 20,top : responsive.setHeight(1)),
                  child: Row(
                    children: [

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(title: '${data.name}'),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${data.des}',
                            textScaleFactor: 1.0,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey

                            ),
                          )

                        ],
                      ),
                      Spacer(),
                      controller.bottomSheetOptions[index].selected!.value == true
                          ? Container(
                        margin: getMargin(
                          top: 15,
                          right: 5,
                          bottom: 15,
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
                          top: 15,
                          right: 5,
                          bottom: 15,
                        ),
                        decoration:
                        AppDecoration.outlineBluegray100.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10,
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
              index == 2 ? Offstage():
              Divider()
            ],
          );
        },
      )),
    );
  }

}
