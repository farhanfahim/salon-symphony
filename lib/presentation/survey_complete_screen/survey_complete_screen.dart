import 'package:flutter_svg/flutter_svg.dart';

import '../../baseviews/baseview_process_screen.dart';
import 'controller/survey_complete_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_button.dart';

class SurveyComplete extends GetWidget<SurveyCompleteController> {
  var map = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return BaseviewScreen(
      screenName: 'lbl_survey_complete'.tr,
      basicAppBar: true,
      showBottomBar: false,
      sidePadding: true,
      backgroundColor: ColorConstant.whiteA700,
      child: Container(
        color: ColorConstant.whiteA700,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Container(

              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: getMargin(
                        right: 1,
                      ),
                      padding: getPadding(

                        top: 40,
                      ),
                      decoration: AppDecoration.outlineBlack9000a.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder10,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "lbl_badge".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsSemiBold28.copyWith(
                              height: 1.50,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: getHorizontalSize(
                                276.00,
                              ),

                              child: Text(
                                "msg_you_r_feedback".tr,
                                maxLines: null,
                                textAlign: TextAlign.center,
                                style: AppStyle.txtPoppinsRegular14.copyWith(
                                  height: 1.71,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CommonImageView(
                                  svgPath: ImageConstant.imgGroup308,
                                  height: getVerticalSize(
                                    344.00,
                                  ),
                                  width: getHorizontalSize(
                                    344.00,
                                  ),

                                ),
                                CommonImageView(
                                  url: map['badge'],
                                  height: getVerticalSize(
                                    150.00,
                                  ),
                                  width: getHorizontalSize(
                                    150.00,
                                  ),

                                ),


                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),


                ],
              ),
            ),
            SizedBox(height: 20,),
            CustomButton(
              width: 343,
              text: "lbl_claim_return".tr,
              onTap: (){
                Get.back();
                Get.back();
                Get.back();
              },
              padding: ButtonPadding.PaddingAll13,
              fontStyle: ButtonFontStyle.PoppinsSemiBold16,
            ),
          ],
        ),

      ),
    );
  }
}
