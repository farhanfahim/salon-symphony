import '../../baseviews/baseview_process_screen.dart';
import '../../core/utils/responsive.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/response_binding_widget.dart';
import '../../widgets/skeleton.dart';
import '../flashcards_screen/controller/flashcards_controller.dart';
import 'controller/flashcard_complete_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_button.dart';

class FlashcardCompleteScreen extends GetWidget<FlashcardCompleteController> {
  Responsive responsive = Responsive();
  FlashcardsController flashcardController = Get.put(FlashcardsController());
  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return BaseviewScreen(
      screenName: 'lbl_flashcards'.tr,
      hideAppBar: true,
      showBottomBar: false,
      sidePadding: true,
      backgroundColor: ColorConstant.whiteA700,
      child: Obx(() => ResponseBindingWidget(
          apiCallStatus: controller.apiCallStatus.value,
          errorWidget: () {
            return Container();
          },
          loadingWidget: () {
            return Container(
              color: ColorConstant.whiteA700,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      children: [
                        MyText(
                          title: '',
                          weight: 'Semi Bold',
                          fontSize: responsive.setTextScale(16),
                        ),
                        SizedBox(
                          height: responsive.setHeight(5),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: getMargin(
                              right: 1,
                            ),
                            padding: getPadding(
                              top: 35,
                            ),
                            // decoration: AppDecoration.outlineBlack9000a.copyWith(
                            //   borderRadius: BorderRadiusStyle.roundedBorder10,
                            // ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Skeleton(switcholor: true,width: 70,height: 20,),
                                SizedBox(height: 5,),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    width: getHorizontalSize(
                                      276.00,
                                    ),
                                    child: Skeleton(switcholor: true,width: 100,height: 15,),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    width: getHorizontalSize(
                                      276.00,
                                    ),
                                    child: Skeleton(switcholor: true,width: 80,height: 15,),
                                  ),
                                ),
                                SizedBox(height: 30,),
                                Skeleton(switcholor: true,width: 200,height: 200,),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                ],
              ),
            );
          },
          emptyWidget: () {
            return SizedBox(
              width: double.maxFinite,
              height: 500,
              child: Center(
                child: Text(
                  'No Record Found'.tr,
                ),
              ),
            );
          },
          successWidget: () {
            return Container(
              color: ColorConstant.whiteA700,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      children: [
                        MyText(
                          title: 'Flashcards',
                          weight: 'Semi Bold',
                          fontSize: responsive.setTextScale(16),
                        ),
                        SizedBox(
                          height: responsive.setHeight(5),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: getMargin(
                              right: 1,
                            ),
                            padding: getPadding(
                              top: 35,
                            ),
                            // decoration: AppDecoration.outlineBlack9000a.copyWith(
                            //   borderRadius: BorderRadiusStyle.roundedBorder10,
                            // ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Badge Earned!",
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
                                      "msg_you_earned_a_badge".tr,
                                      maxLines: null,
                                      textAlign: TextAlign.center,
                                      style:
                                          AppStyle.txtPoppinsRegular14.copyWith(
                                        height: 1.71,
                                        fontSize: 16,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30,),
                                controller.resultResponseModel.value.data!
                                            .badge !=
                                        null
                                    ? controller.resultResponseModel.value.data!
                                            .badge!.isNotEmpty
                                        ? CommonImageView(
                                            url: controller.resultResponseModel
                                                .value.data!.badge,
                                            height: getSize(200.00),
                                            width: getSize(200.00),
                                          )
                                        : CommonImageView(
                                            svgPath:"",
                                            height: getSize(65.00),
                                            width: getSize(65.00),
                                          )
                                    : CommonImageView(
                                        svgPath: "",
                                        height: getSize(65.00),
                                        width: getSize(65.00),
                                      ),
                                SizedBox(height: 30,),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    width: 343,
                    text: "All Flashcards",
                    onTap: () {
                      if(controller.map['is_completed']){
                        Get.back();
                        flashcardController.pagingController.refresh();
                      }else{
                        Get.back();
                        flashcardController.pagingController.refresh();
                        // Get.back();
                      }


                    },
                    padding: ButtonPadding.PaddingAll13,
                    fontStyle: ButtonFontStyle.PoppinsSemiBold16,
                  ),
                ],
              ),
            );
          })),
    );
  }
}
