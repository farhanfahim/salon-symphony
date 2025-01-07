import 'package:salon_symphony/baseviews/baseview_process_screen.dart';

import '../chang_shift_timing_screen/widgets/listfour_one_item_widget.dart';
import '../chang_shift_timing_screen/widgets/listseven_item_widget.dart';
import 'controller/chang_shift_timing_controller.dart';
import 'models/listfour_one_item_model.dart';
import 'models/listseven_item_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_button.dart';

class ChangShiftTimingScreen extends GetWidget<ChangShiftTimingController> {
  @override
  Widget build(BuildContext context) {
    return BaseviewScreen(
      basicAppBar: true,
      screenName: "Requests",
      showBottomBar: false,
      mainTopHeight: 0,
      textButtonName: "Close",
      textOnTap: (){
        Get.back();
      },
      sidePadding: false,
      child: Scaffold(
        body: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Container(
              height: getVerticalSize(
                702.00,
              ),
              width: size.width,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: getPadding(
                        right: 1,
                      ),
                      child: CommonImageView(
                        imagePath: ImageConstant.imgRectangle18269702X374,
                        height: getVerticalSize(
                          702.00,
                        ),
                        width: getHorizontalSize(
                          374.00,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: getPadding(
                        left: 15,
                        top: 23,
                        right: 15,
                        bottom: 23,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: size.width,
                            child: Padding(
                              padding: getPadding(
                                left: 15,
                                right: 15,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    "msg_request_shift_c".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsMedium16.copyWith(
                                      height: 1.00,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 1,
                                      bottom: 1,
                                    ),
                                    child: Text(
                                      "lbl_close".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsRegular14Pink300
                                          .copyWith(
                                        height: 1.00,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: getVerticalSize(
                              1.00,
                            ),
                            width: getHorizontalSize(
                              343.00,
                            ),
                            margin: getMargin(
                              left: 1,
                              top: 19,
                              right: 1,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.bluegray10090,
                            ),
                          ),
                          Container(
                            margin: getMargin(
                              left: 1,
                              top: 20,
                              right: 1,
                            ),
                            decoration:
                                AppDecoration.outlineBluegray100.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: getPadding(
                                    left: 20,
                                    top: 13,
                                    bottom: 11,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: getPadding(
                                          right: 10,
                                        ),
                                        child: Text(
                                          "lbl_monday".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtPoppinsRegular14Black901,
                                        ),
                                      ),
                                      Padding(
                                        padding: getPadding(
                                          top: 4,
                                        ),
                                        child: Text(
                                          "msg_7_00_am_4_30".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtPoppinsRegular12Gray600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 9,
                                    right: 10,
                                    bottom: 34,
                                  ),
                                  child: Text(
                                    "lbl_current".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .txtPoppinsRegular12Bluegray100
                                        .copyWith(
                                      height: 1.00,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: getPadding(
                                top: 24,
                                right: 10,
                              ),
                              child: Text(
                                "lbl_clock_in".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsSemiBold16Pink300
                                    .copyWith(
                                  height: 1.00,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: getPadding(
                                left: 56,
                                top: 20,
                                right: 56,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: getPadding(
                                      bottom: 1,
                                    ),
                                    child: Text(
                                      "lbl_06".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsRegular20,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 36,
                                      top: 1,
                                    ),
                                    child: Text(
                                      "lbl3".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtPoppinsRegular20Bluegray100,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 35,
                                      top: 1,
                                      bottom: 1,
                                    ),
                                    child: Text(
                                      "lbl_59".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsRegular20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: getVerticalSize(
                              1.00,
                            ),
                            width: getHorizontalSize(
                              343.00,
                            ),
                            margin: getMargin(
                              left: 1,
                              top: 15,
                              right: 1,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.bluegray10090,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 56,
                              top: 17,
                              right: 51,
                            ),
                            child: Obx(
                              () => ListView.separated(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                separatorBuilder: (context, index) {
                                  return Container(
                                    height: getVerticalSize(
                                      1.00,
                                    ),
                                    width: getHorizontalSize(
                                      343.00,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorConstant.bluegray10090,
                                    ),
                                  );
                                },
                                itemCount: controller.changShiftTimingModelObj
                                    .value.listsevenItemList.length,
                                itemBuilder: (context, index) {
                                  ListsevenItemModel model = controller
                                      .changShiftTimingModelObj
                                      .value
                                      .listsevenItemList[index];
                                  return ListsevenItemWidget(
                                    model,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: getPadding(
                        left: 15,
                        top: 53,
                        right: 15,
                        bottom: 53,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: getPadding(
                              right: 10,
                            ),
                            child: Text(
                              "lbl_clock_out".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style:
                                  AppStyle.txtPoppinsSemiBold16Pink300.copyWith(
                                height: 1.00,
                              ),
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 57,
                              top: 20,
                              right: 57,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: getPadding(
                                    top: 1,
                                    bottom: 1,
                                  ),
                                  child: Text(
                                    "lbl_03".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsRegular20,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 36,
                                    top: 1,
                                  ),
                                  child: Text(
                                    "lbl3".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyle.txtPoppinsRegular20Bluegray100,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 35,
                                    bottom: 1,
                                  ),
                                  child: Text(
                                    "lbl_29".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsRegular20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: getVerticalSize(
                              1.00,
                            ),
                            width: getHorizontalSize(
                              343.00,
                            ),
                            margin: getMargin(
                              left: 1,
                              top: 15,
                              right: 1,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.bluegray10090,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: getPadding(
                                left: 56,
                                top: 17,
                                right: 49,
                              ),
                              child: Obx(
                                () => ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) {
                                    return Container(
                                      height: getVerticalSize(
                                        1.00,
                                      ),
                                      width: getHorizontalSize(
                                        343.00,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorConstant.bluegray10090,
                                      ),
                                    );
                                  },
                                  itemCount: controller.changShiftTimingModelObj
                                      .value.listfourOneItemList.length,
                                  itemBuilder: (context, index) {
                                    ListfourOneItemModel model = controller
                                        .changShiftTimingModelObj
                                        .value
                                        .listfourOneItemList[index];
                                    return ListfourOneItemWidget(
                                      model,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          CustomButton(
                            width: 343,
                            text: "lbl_save".tr,
                            margin: getMargin(
                              left: 1,
                              top: 40,
                            ),
                            padding: ButtonPadding.PaddingAll18,
                            fontStyle: ButtonFontStyle.PoppinsSemiBold16,
                            alignment: Alignment.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: getVerticalSize(
                      1.00,
                    ),
                    width: getHorizontalSize(
                      374.00,
                    ),
                    margin: getMargin(
                      top: 40,
                      right: 1,
                      bottom: 40,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstant.bluegray10090,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
