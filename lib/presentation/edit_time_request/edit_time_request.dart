import 'dart:io';
import 'package:flutter/material.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_text.dart';
import '../../core/utils/helper_functions.dart';
import '../../core/utils/responsive.dart';
import '../../widgets/animatedButton.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield_new.dart';
import '../coverage_team_list/models/user_list_response_model.dart';
import 'controller/edit_time_request_controller.dart';

class EditTimeRequest extends StatelessWidget {
  Responsive responsive = Responsive();
  EditTimeRequestController controller = Get.put(EditTimeRequestController());

  @override
  Widget build(BuildContext context) {

    return BaseviewScreen(
        screenName: "Edit Time Off Request",
        basicAppBar: true,
        showBottomBar: false,
        mainTopHeight: 0,
        sidePadding: false,
        backgroundColor: ColorConstant.whiteA700,
        child:  SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: MyText(
                      title: 'Request Time Off',
                      clr: ColorConstant.black900,
                      weight: 'Semi Bold',
                      fontSize: 23,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    margin: getMargin(left: 15, top: 5, right: 15, bottom: 20),
                    child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  "All requests must be approved by management. ",
                              style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(14),
                                  fontFamily: Platform.isIOS
                                      ? 'SF Pro Display'
                                      : 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.5,
                                  height: 1.00),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left),
                  ),

                  // SizedBox(
                  //   height: 15,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: CustomTextField3(
                          fieldText: "Leave Date",
                          controller: controller.laveDateController,
                          isFinal: false,
                          enabled: false,
                          focusNode: controller.laveDateNode,
                          inRowPaddindRight: 6.5,
                          nextFocusNode: controller.returnDateNode,
                          keyboardType: TextInputType.text,
                          limit: HelperFunction.EMAIL_VALIDATION,
                          validator: (value) {
                            return HelperFunction.stringValidate(value!);
                          },
                          icon: ImageConstant.calender_icon1,
                          iconHinColor: false,
                          sufixIconOnTap: () {
                            controller.selectAge(context, false);
                          },
                          onTap: () {
                            controller.selectAge(context, false);
                          },
                        ),
                      ),
                      Flexible(
                        child: CustomTextField3(
                          fieldText: "Return Date",
                          controller: controller.returnDateController,
                          isFinal: true,
                          enabled: false,
                          inRowPaddindLeft: 6.5,
                          focusNode: controller.returnDateNode,
                          nextFocusNode: controller.coverageNode,
                          keyboardType: TextInputType.text,
                          limit: HelperFunction.EMAIL_VALIDATION,
                          validator: (value) {
                            return HelperFunction.stringValidate(value!);
                          },
                          sufixIconOnTap: () {
                            controller.selectAge2(context, true);
                          },
                          icon: ImageConstant.calender_icon1,
                          iconHinColor: false,
                          onTap: () {
                            controller.selectAge2(context, true);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField3(
                      fieldText: 'Reason',
                      controller: controller.lvlTypeController,
                      isFinal: false,
                      enabled: false,
                      focusNode: controller.lvlTypeNode,
                      nextFocusNode: controller.laveDateNode,
                      keyboardType: TextInputType.text,
                      iconColorChange: true,
                      iconData: Icons.keyboard_arrow_down_sharp,
                      limit: HelperFunction.EMAIL_VALIDATION,
                      validator: (value) {
                        return HelperFunction.stringValidate(value!);
                      },
                      onTap: () {
                        controller.selectReason(context);
                      }),

                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField3(
                      fieldText: 'Coverage',
                      controller: controller.coverageController,
                      isFinal: false,
                      enabled: false,
                      focusNode: controller.coverageNode,
                      nextFocusNode: controller.commentsNode,
                      icon: ImageConstant.coverage_group_icon,
                      keyboardType: TextInputType.text,
                      limit: HelperFunction.EMAIL_VALIDATION,
                      validator: (value) {
                        return HelperFunction.stringValidate(value!);
                      },
                      onTap: () {
                        Get.toNamed(AppRoutes.coverageTimeList,arguments: {'id':controller.selectedCoverageUserId.value})!.then((value)  {
                          if(value!=null) {
                            Rx<UserData> userData = value;
                            controller.selectedCoverageUserId.value = userData.value.id!;
                            controller.coverageController.value.text = userData.value.name!;
                            controller.checkInfo(context);
                          }
                        });

                      }),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0, top: 10.0),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: MyText(
                          title: 'Select member if applicable.',
                          clr: ColorConstant.hintTextColor.withOpacity(0.5),
                          fontSize: 12,
                          letterSpacing: 0.5,
                        )),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField3(
                      fieldText: 'Comments',
                      controller: controller.commentsController,
                      isFinal: true,
                      maxLines: 13,
                      focusNode: controller.commentsNode,
                      keyboardType: TextInputType.multiline,
                      limit: HelperFunction.EMAIL_VALIDATION,
                      onChanged: (v){
                        controller.checkInfo(context);
                      },
                      validator: (value) {
                        return HelperFunction.stringValidate(value!);
                      },
                      onTap: () {}),
                  SizedBox(
                    height: 15,
                  ),
                  Obx(() => controller.formSubmitted.value ? AnimatedButton(
                    // semanticsLabel: SemanticsLabel.LAB_SIGNIN_BTN_LINK,
                    text: "Save Changes",
                    width: double.maxFinite,
                    margin: getMargin(left: 15, top: 44, right: 15),
                    padding: ButtonPaddingOfButton.PaddingAll18,
                    fontStyle: ButtonFontStyleOfButton.PoppinsSemiBold16,
                    alignment: Alignment.center,
                    onPressed: () async {
                      controller.saveInfo(context);

                    }, controller: controller.animatedButtonController,):CustomButton(
                      width: double.maxFinite,
                      text: "lbl_submit".tr,
                      margin: getMargin(left: 15, top: 44, right: 15),
                      variant: ButtonVariant.FillIndigo50,
                      padding: ButtonPadding.PaddingAll18,
                      fontStyle: ButtonFontStyle.PoppinsSemiBold16,
                      onTap: () {},
                      alignment: Alignment.center),)
                ],
              ),
            ),
          ),
         );
  }
}
