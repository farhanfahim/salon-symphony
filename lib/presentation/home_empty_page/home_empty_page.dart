import 'dart:io';
import 'controller/home_empty_controller.dart';
import 'models/home_empty_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_icon_button.dart';
import 'package:salon_symphony/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class HomeEmptyPage extends StatelessWidget {
  HomeEmptyController controller =
      Get.put(HomeEmptyController(HomeEmptyModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Container(
              decoration: AppDecoration.fillWhiteA700,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: double.infinity,
                          decoration: AppDecoration.fillWhiteA700,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: size.width,
                                  margin: getMargin(
                                    bottom: 7,
                                  ),
                                  child: Padding(
                                    padding: getPadding(
                                      left: 16,
                                      right: 16,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            getHorizontalSize(
                                              17.50,
                                            ),
                                          ),
                                          child: CommonImageView(
                                            imagePath:
                                                ImageConstant.imgEllipse837,
                                            height: getVerticalSize(
                                              33.00,
                                            ),
                                            width: getHorizontalSize(
                                              35.00,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            top: 7,
                                            bottom: 9,
                                          ),
                                          child: Text(
                                            "Home",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtPoppinsMedium16
                                                .copyWith(
                                              letterSpacing: 0.06,
                                              height: 1.00,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            top: 3,
                                            bottom: 6,
                                          ),
                                          child: CommonImageView(
                                            svgPath:
                                                ImageConstant.imgNotification,
                                            height: getSize(
                                              24.00,
                                            ),
                                            width: getSize(
                                              24.00,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: getPadding(
                            left: 14,
                            top: 24,
                            right: 14,
                          ),
                          child: Text(
                            "msg_hi_there_siphr".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsSemiBold20.copyWith(
                              letterSpacing: 0.36,
                              height: 1.00,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: getPadding(
                            left: 16,
                            top: 13,
                            right: 16,
                          ),
                          child: Text(
                            "msg_today_is_wednes".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                AppStyle.txtPoppinsRegular12Black900.copyWith(
                              letterSpacing: 0.35,
                              height: 1.00,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: getPadding(
                            left: 14,
                            top: 22,
                            right: 14,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              CustomSearchView(
                                width: 295,
                                focusNode: FocusNode(),
                                controller: controller.searchFieldController,
                                hintText: "lbl_search".tr,
                                prefix: Container(
                                  margin: getMargin(
                                    left: 8,
                                    top: 10,
                                    right: 6,
                                    bottom: 10,
                                  ),
                                  child: CommonImageView(
                                    svgPath: ImageConstant.imgSearch,
                                  ),
                                ),
                                prefixConstraints: BoxConstraints(
                                  minWidth: getSize(
                                    15.00,
                                  ),
                                  minHeight: getSize(
                                    15.00,
                                  ),
                                ),
                              ),
                              CustomIconButton(
                                height: 36,
                                width: 36,
                                variant: IconButtonVariant.OutlineBlack9000a,
                                child: CommonImageView(
                                  svgPath: ImageConstant.imgMenu,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: getHorizontalSize(
                            320.00,
                          ),
                          margin: getMargin(
                            left: 16,
                            top: 19,
                            right: 16,
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "msg_no_upcoming_eve2".tr,
                                  style: TextStyle(
                                    color: ColorConstant.gray600,
                                    fontSize: getFontSize(
                                      12,
                                    ),
                                     fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.05,
                                  ),
                                ),
                                TextSpan(
                                  text: "lbl_team_chat".tr,
                                  style: TextStyle(
                                    color: ColorConstant.deepPurpleA201,
                                    fontSize: getFontSize(
                                      12,
                                    ),
                                     fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.05,
                                  ),
                                ),
                                TextSpan(
                                  text: "lbl_or_create_a".tr,
                                  style: TextStyle(
                                    color: ColorConstant.gray600,
                                    fontSize: getFontSize(
                                      12,
                                    ),
                                     fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.05,
                                  ),
                                ),
                                TextSpan(
                                  text: "lbl_new_goal".tr,
                                  style: TextStyle(
                                    color: ColorConstant.deepPurpleA201,
                                    fontSize: getFontSize(
                                      12,
                                    ),
                                     fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.05,
                                  ),
                                ),
                                TextSpan(
                                  text: "lbl".tr,
                                  style: TextStyle(
                                    color: ColorConstant.gray600,
                                    fontSize: getFontSize(
                                      12,
                                    ),
                                     fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.05,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: getPadding(
                            left: 14,
                            top: 106,
                            right: 14,
                          ),
                          child: CommonImageView(
                            svgPath: ImageConstant.imgLock,
                            height: getSize(
                              75.00,
                            ),
                            width: getSize(
                              75.00,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: getPadding(
                            left: 14,
                            top: 23,
                            right: 14,
                          ),
                          child: Text(
                            "msg_success_unshare".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsRegular16Bluegray100
                                .copyWith(
                              letterSpacing: 0.06,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: getPadding(
                            left: 14,
                            top: 21,
                            right: 14,
                          ),
                          child: Text(
                            "msg_john_paul_dejor".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsMediumItalic14.copyWith(
                              letterSpacing: 0.05,
                            ),
                          ),
                        ),
                      ),
                    ],
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
