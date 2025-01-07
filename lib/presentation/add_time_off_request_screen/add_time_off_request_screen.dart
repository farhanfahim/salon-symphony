import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_button.dart';
import 'package:salon_symphony/widgets/custom_text_form_field.dart';

import 'controller/add_time_off_request_controller.dart';

class AddTimeOffRequestScreen extends GetWidget<AddTimeOffRequestController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: size.width,
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              width: size.width,
                              margin: getMargin(top: 4),
                              child: Padding(
                                  padding: getPadding(left: 16, right: 119),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              onTapImgArrowleft();
                                            },
                                            child: CommonImageView(
                                                svgPath:
                                                    ImageConstant.imgArrowleft,
                                                height: getSize(24.00),
                                                width: getSize(24.00))),
                                        Padding(
                                            padding: getPadding(
                                                left: 78, top: 5, bottom: 1),
                                            child: Text(
                                                "msg_time_off_reques".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtPoppinsMedium16
                                                    .copyWith(
                                                        letterSpacing: 0.06,
                                                        height: 1.00)))
                                      ])))),
                      Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 0,
                          margin: getMargin(left: 16, top: 42, right: 16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                          child: Container(
                              height: getVerticalSize(57.00),
                              width: getHorizontalSize(343.00),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(5.00))),
                              child: Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Container(
                                            margin: getMargin(top: 10),
                                            decoration: AppDecoration
                                                .outlineDeeppurpleA201
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder5),
                                            child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 16,
                                                          top: 16,
                                                          bottom: 17),
                                                      child: Text(
                                                          "lbl_vacation".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtPoppinsRegular14Black900)),
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 225,
                                                          top: 11,
                                                          right: 14,
                                                          bottom: 12),
                                                      child: CommonImageView(
                                                          svgPath: ImageConstant
                                                              .imgArrowdown,
                                                          height:
                                                              getSize(24.00),
                                                          width:
                                                              getSize(24.00)))
                                                ]))),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                            margin: getMargin(
                                                left: 15,
                                                right: 15,
                                                bottom: 10),
                                            padding: getPadding(
                                                left: 3,
                                                top: 4,
                                                right: 3,
                                                bottom: 1),
                                            decoration:
                                                AppDecoration.txtFillWhiteA701,
                                            child: Text("lbl_leave_type".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtPoppinsRegular12)))
                                  ]))),
                     Obx(() =>  CustomTextFormField(
                         width: 343,
                         focusNode: FocusNode(),
                         controller: controller.textfieldsController.value,
                         hintText: "lbl_leave_date".tr,
                         margin: getMargin(left: 16, top: 19, right: 16),
                         suffix: Container(
                             margin: getMargin(
                                 left: 30, top: 11, right: 14, bottom: 12),
                             child: CommonImageView(
                                 svgPath: ImageConstant.imgComputer24X24)),
                         suffixConstraints: BoxConstraints(
                             minWidth: getHorizontalSize(24.00),
                             minHeight: getVerticalSize(24.00))),),
                      Obx(() => CustomTextFormField(
                          width: 343,
                          focusNode: FocusNode(),
                          controller: controller.textfieldsOneController.value,
                          hintText: "lbl_return_date".tr,
                          margin: getMargin(left: 16, top: 16, right: 16),
                          suffix: Container(
                              margin: getMargin(
                                  left: 30, top: 11, right: 14, bottom: 12),
                              child: CommonImageView(
                                  svgPath: ImageConstant.imgComputer24X24)),
                          suffixConstraints: BoxConstraints(
                              minWidth: getHorizontalSize(24.00),
                              minHeight: getVerticalSize(24.00))),),
                      Obx(() => CustomTextFormField(
                          width: 343,
                          focusNode: FocusNode(),
                          controller: controller.textfieldsTwoController.value,
                          hintText: "msg_coverage_selec".tr,
                          margin: getMargin(left: 16, top: 16, right: 16),
                          suffix: Container(
                              margin: getMargin(
                                  left: 30, top: 11, right: 14, bottom: 12),
                              child: CommonImageView(
                                  svgPath: ImageConstant.imgUser24X24)),
                          suffixConstraints: BoxConstraints(
                              minWidth: getHorizontalSize(24.00),
                              minHeight: getVerticalSize(24.00))),),
                      Obx(() => CustomTextFormField(
                          width: 343,
                          focusNode: FocusNode(),
                          controller: controller.textfieldsThreeController.value,
                          hintText: "lbl_comments".tr,
                          margin: getMargin(left: 16, top: 16, right: 16),
                          textInputAction: TextInputAction.done,
                          maxLines: 6),),
                      CustomButton(
                          width: 343,
                          text: "lbl_save".tr,
                          margin: getMargin(
                              left: 16, top: 40, right: 16, bottom: 20),
                          padding: ButtonPadding.PaddingAll18,
                          fontStyle: ButtonFontStyle.PoppinsSemiBold16)
                    ])))));
  }

  onTapImgArrowleft() {
    Get.back();
  }
}
