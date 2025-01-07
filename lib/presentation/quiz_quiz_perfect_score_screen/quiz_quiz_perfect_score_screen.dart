import 'package:flutter_svg/flutter_svg.dart';

import '../../baseviews/baseview_process_screen.dart';
import '../../widgets/custom_text.dart';
import 'controller/quiz_quiz_perfect_score_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_button.dart';

class QuizQuizPerfectScoreScreen
    extends GetWidget<QuizQuizPerfectScoreController> {
  @override
  Widget build(BuildContext context) {
    return BaseviewScreen(
      screenName: 'lbl_quiz_complete'.tr,
      basicAppBar: true,
      showBottomBar: false,
      sidePadding: true,
      showBackButton: true,
      isBackButtonShow: true,
      onBackTap: (){
        Get.back();
        Get.back();
        Get.back(result: 10);
      },
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
                            controller.score!=null && controller.score! <100?"Quiz Score":"lbl_perfect_score".tr,
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
                                controller.score!=null && controller.score! <100?"View your score below. You can retake this quiz as many times as you’d like":"msg_you_earned_a_new".tr,
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
                                controller.score!=null && controller.score! >=100?CommonImageView(
                                  svgPath: ImageConstant.imgGroup308,
                                  height: getVerticalSize(
                                    344.00,
                                  ),
                                  width: getHorizontalSize(
                                    344.00,
                                  ),
                                ):Container(),
                                controller.score!=null && controller.score! >=100?CommonImageView(
                                  svgPath: ImageConstant.imgReward100,
                                  height: getVerticalSize(
                                    152.00,
                                  ),
                                  width: getHorizontalSize(
                                    156.00,
                                  ),
                                ):Container(),
                                controller.score!=null && controller.score! <100?Container(
                                  height: getVerticalSize(
                                    344.00,
                                  ),
                                  width: getHorizontalSize(
                                    344.00,
                                  ),
                                ):Container(),
                                controller.score!=null && controller.score! <100?CommonImageView(
                                  imagePath: ImageConstant.scoreVector,
                                  height: getVerticalSize(
                                    152.00,
                                  ),
                                  width: getHorizontalSize(
                                    156.00,
                                  ),
                                ):Container(),
                                controller.score!=null && controller.score! <100?
                                MyText(title: controller.score!=null ?controller.score.toString():"0",
                                    weight: "Semi Bold",
                                    fontSize: 40,clr:
                                    ColorConstant.black900):Container(),
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
              text: "Retake Quiz",
              onTap: (){
                Get.back();
                Get.back();
              },
              padding: ButtonPadding.PaddingAll13,
              fontStyle: ButtonFontStyle.PoppinsSemiBold16,
            ),
            SizedBox(height: 20,),
            CustomButton(
              variant: ButtonVariant.OutlineBluegraybg,
              txtcolor:ColorConstant.black900,
              width: 343,
              text: "Return Home",
              onTap: (){
                Get.back();
                Get.back();
                Get.back(result: 10);
                // Get.offAllNamed(AppRoutes.quizzesAllScreen);
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
