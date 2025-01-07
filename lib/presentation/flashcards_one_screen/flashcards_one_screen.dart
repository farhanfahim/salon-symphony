import 'dart:io';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flip_card/flip_card.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/core/utils/helper_functions.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import 'package:salon_symphony/widgets/error_widget.dart';
import 'package:swipe_cards/swipe_cards.dart';
import '../../core/utils/app_constant.dart';
import '../../widgets/custom_flash_modal_sheet.dart';
import '../../widgets/response_binding_widget.dart';
import '../../widgets/skeleton.dart';
import 'controller/flashcards_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

class FlashcardsOneScreen extends GetWidget<FlashcardsOneController> {
  Map<String, dynamic> map = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return BaseviewScreen(
      basicAppBar: true,
      screenName: "Flashcards",
      showBottomBar: false,
      sidePadding: false,
      stickyHeader: true,
      backgroundColor: Color(0XFFF1F3F6),
      basicAppTrailingIcon: ImageConstant.imgMenuIcon,
      basicAppTrailingIconOnTap: () {
        HelperFunction.showBottomSheet(context,
            screenTitle: 'Flashcards Options',
            redclrEndTask: false,
            screenEndTask: 'Done',
            bottomSheetHeight: 200,
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    String deepLink = '${AppConstant.shareBaseUrl}/flashcards/details/${controller.flashCardResponseModel!.value.id!}';
                    // String deepLink = '${AppConstant.shareBaseUrl}?flashCardsId=${controller.flashCardResponseModel!.value.id!}';
                    Utils.share(deepLink);
                    Get.back();
                  },
                  child: Row(
                    children: [
                      CommonImageView(
                        imagePath: ImageConstant.share_icon,
                        height: 17,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Share flashcards',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: getFontSize(
                              16,
                            ),
                            letterSpacing: 0.5,
                            fontFamily:
                                Platform.isIOS ? 'SF Pro Display' : 'Roboto',
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () async {
                    try {
                      Utils.reportProblem();
                    } catch (e) {
                      Utils.showToast(e.toString(), true);
                    }
                  },
                  child: Row(
                    children: [
                      CommonImageView(
                        imagePath: ImageConstant.report_problem_icon,
                        height: 17,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Report a Problem',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: getFontSize(
                              16,
                            ),
                            letterSpacing: 0.5,
                            fontFamily:
                                Platform.isIOS ? 'SF Pro Display' : 'Roboto',
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                ),
              ],
            ));
      },
      child: Obx(() => ResponseBindingWidget(
          apiCallStatus: controller.apiCallStatus.value,
          errorWidget: () {
            return RecordDeletedWidget();
          },
          loadingWidget: () {
            return SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Container(
                      decoration: AppDecoration.outlineBlack9000a1.copyWith(),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                    getPadding(left: 59, top: 18, right: 58),
                                child: Container(
                                    width: 100,
                                    height: 15.0,
                                    child: Skeleton(
                                      switcholor: true,
                                    ))),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: getPadding(
                                        top: 14,
                                        bottom: 15,
                                        left: 15,
                                        right: 15),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: ColorConstant.bluegray10090,
                                            width: 1),
                                      ),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 65,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10)),
                                                color: ColorConstant.pink500,
                                              ),
                                              child: Center(
                                                  child: Container(
                                                      width: 15,
                                                      height: 15.0,
                                                      child: Skeleton(
                                                        switcholor: true,
                                                      ))),
                                            ),
                                            Padding(
                                                padding: getPadding(
                                                    top: 24, bottom: 22),
                                                child: Container(
                                                    width: 100,
                                                    height: 15.0,
                                                    child: Skeleton(
                                                      switcholor: true,
                                                    ))),
                                            Container(
                                                height: getVerticalSize(40.00),
                                                width: getHorizontalSize(1.00),
                                                decoration: BoxDecoration(
                                                    color: ColorConstant
                                                        .bluegray10090)),
                                            Padding(
                                                padding: getPadding(
                                                    top: 25, bottom: 22),
                                                child: Container(
                                                    width: 100,
                                                    height: 15.0,
                                                    child: Skeleton(
                                                      switcholor: true,
                                                    ))),
                                            Container(
                                              width: 65,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10)),
                                                color: ColorConstant.green600,
                                              ),
                                              child: Center(
                                                  child: Container(
                                                      width: 100,
                                                      height: 15.0,
                                                      child: Skeleton(
                                                        switcholor: true,
                                                      ))),
                                            )
                                          ]),
                                    )))
                          ])),
                  Container(
                    height: 500,
                    child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 450,
                          decoration: AppDecoration.outlineBlack9000a1.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      top: 10, right: 10, left: 10),
                                  width: double.infinity,
                                  height: 230.0,
                                  child: Skeleton(
                                    switcholor: true,
                                  )),
                              Container(
                                  margin:
                                      getMargin(top: 30, left: 25, right: 25),
                                  child: Container(
                                      width: 200,
                                      height: 15.0,
                                      child: Skeleton(
                                        switcholor: true,
                                      ))),
                              Container(
                                  margin:
                                      getMargin(top: 10, left: 25, right: 25),
                                  child: Container(
                                      width: 200,
                                      height: 15.0,
                                      child: Skeleton(
                                        switcholor: true,
                                      ))),
                              Container(
                                  margin:
                                      getMargin(top: 10, left: 25, right: 25),
                                  child: Container(
                                      width: 100,
                                      height: 15.0,
                                      child: Skeleton(
                                        switcholor: true,
                                      ))),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ]));
          },
          emptyWidget: () {
            return SizedBox(
              width: double.maxFinite,
              height: 500,
              child: Center(
                child: Text(
                    "You're all caught up!"
                ),
              ),
            );
          },
          successWidget: () {
            return Container(
                width: size.width,
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Container(
                          decoration:
                              AppDecoration.outlineBlack9000a1.copyWith(),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: getPadding(
                                        left: 59, top: 18, right: 58),
                                    child: Text(
                                        controller.flashCardResponseModel!.value
                                            .name!,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsMedium16)),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: getPadding(
                                            top: 14,
                                            bottom: 15,
                                            left: 15,
                                            right: 15),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color:
                                                    ColorConstant.bluegray10090,
                                                width: 1),
                                          ),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Obx(() => Container(
                                                      width: 65,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        10)),
                                                        color: ColorConstant
                                                            .pink500,
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "${controller.learningCount.value.toString()}",
                                                          style: AppStyle
                                                              .txtPoppinsRegular12Gray600
                                                              .copyWith(
                                                                  color: ColorConstant
                                                                      .whiteA700),
                                                        ),
                                                      ),
                                                    )),
                                                Padding(
                                                    padding: getPadding(
                                                        top: 24, bottom: 22),
                                                    child: Text(
                                                        "lbl_still_learning".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtPoppinsRegular12Gray600)),
                                                Container(
                                                    height:
                                                        getVerticalSize(40.00),
                                                    width:
                                                        getHorizontalSize(1.00),
                                                    decoration: BoxDecoration(
                                                        color: ColorConstant
                                                            .bluegray10090)),
                                                Padding(
                                                    padding: getPadding(
                                                        top: 25, bottom: 22),
                                                    child: Text(
                                                        "lbl_totally_know".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtPoppinsRegular12Gray600)),
                                                Obx(() => Container(
                                                      width: 65,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        10)),
                                                        color: ColorConstant
                                                            .green600,
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "${controller.knowCount.value.toString()}",
                                                          style: AppStyle
                                                              .txtPoppinsRegular12Gray600
                                                              .copyWith(
                                                                  color: ColorConstant
                                                                      .whiteA700),
                                                        ),
                                                      ),
                                                    ))
                                              ]),
                                        )))
                              ])),
                      Container(
                        height: 500,
                        child: AppinioSwiper(
                          cardsCount: controller.swipeItems.length,
                          swipeOptions: AppinioSwipeOptions.horizontal,
                          allowUnswipe: true,
                          // loop: true,
                          controller: controller.appinioSwiperController,
                          onSwipe: (int index, AppinioSwiperDirection direction) {
                            controller.currentIndex.value = index;
                            controller.direction.value = direction;
                            print(index);
                            print(controller.swipeItems.length);

                            // if (direction == AppinioSwiperDirection.right) {
                            if (true) {
                              if (index != controller.swipeItems.length) {
                                Get.dialog(
                                  CustomFlashModelSheet(
                                    msg: direction.name == "left"
                                        ? "lbl_still_learning".tr
                                        : "lbl_totally_know".tr,
                                    secondStyle:
                                        direction.name == "left" ? true : false,
                                    onUndo: () {
                                      controller.appinioSwiperController.unswipe();
                                      Get.back();
                                    },
                                    onNext: () {
                                      index--;
                                      print(index);
                                      if (direction.name == "left") {
                                        // controller.updateFlashcardScore(AppConstant.LEARNING, index, controller.swipeItems[index].content.id);
                                        controller.indicatorCount.value++;
                                        controller.learningCount.value++;
                                      } else {
                                        controller.updateFlashcardScore(AppConstant.KNOWN, index, controller.swipeItems[index].content.id, false);
                                        controller.indicatorCount.value++;
                                        controller.knowCount.value++;
                                      }

                                      print(direction.name);
                                      Get.back();
                                    },
                                  ),
                                );
                              } else {
                                return;
                              }
                            } else {
                              // if( index == controller.cardsLength.value){
                              //   controller.indicatorCount.value = 0;
                              // }else {
                              //   controller.indicatorCount.value++;
                              // }
                              controller.swipeItems.add(controller.swipeItems[index -1]);
                            }
                          },
                          cardsBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: FlipCard(
                                flipOnTouch: true,
                                front: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        height: 450,
                                        decoration: AppDecoration
                                            .outlineBlack9000a1
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder10),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    controller
                                                                    .swipeItems[
                                                                        index]
                                                                    .content
                                                                    .frontImage !=
                                                                null ||
                                                            controller
                                                                .swipeItems[
                                                                    index]
                                                                .content
                                                                .frontImage
                                                                .isNotEmpty
                                                        ? CommonImageView(
                                                            margin: getMargin(
                                                                top: 10,
                                                                left: 10,
                                                                right: 10),
                                                            url: controller
                                                                .swipeItems[
                                                                    index]
                                                                .content
                                                                .frontImage,
                                                            radius: BorderRadius
                                                                .only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight: Radius
                                                                  .circular(10),
                                                            ),
                                                            height:
                                                                getVerticalSize(
                                                              230.00,
                                                            ),
                                                            width:
                                                                double.infinity,
                                                            fit: BoxFit.cover,
                                                          )
                                                        : Offstage(),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: controller
                                                                  .swipeItems[
                                                                      index]
                                                                  .content
                                                                  .frontImage
                                                                  .isNotEmpty
                                                              ? 25.0
                                                              : 125,
                                                          left: 20,
                                                          right: 20),
                                                      child: Text(
                                                          controller
                                                                      .swipeItems[
                                                                          index]
                                                                      .content
                                                                      .frontPrompt !=
                                                                  null
                                                              ? controller
                                                                  .swipeItems[
                                                                      index]
                                                                  .content
                                                                  .frontPrompt
                                                              : "-",
                                                          maxLines: 4,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            color: ColorConstant
                                                                .black900,
                                                            fontSize: 18,
                                                            fontFamily: Platform
                                                                    .isIOS
                                                                ? 'SF Pro Display'
                                                                : 'Roboto',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ).copyWith(
                                                              letterSpacing:
                                                                  0.09)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                  padding: getPadding(
                                                      left: 20,
                                                      top: 14,
                                                      right: 20,
                                                      bottom: 14),
                                                  decoration: AppDecoration
                                                      .outlineBlack9000a3
                                                      .copyWith(
                                                          borderRadius:
                                                              BorderRadiusStyle
                                                                  .customBorderBL14),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        CommonImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .imgTicket,
                                                            height: 24.00,
                                                            width: 24.00),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 3),
                                                            child: Text(
                                                                "tap_tp_flip"
                                                                    .tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtPoppinsMedium14
                                                                    .copyWith(
                                                                        color: ColorConstant
                                                                            .whiteA700,
                                                                        fontSize:
                                                                            14))),
                                                        CommonImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .imgTicket_2,
                                                            height: 24.00,
                                                            width: 24.00)
                                                      ]))
                                            ]))),
                                back: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        height: 450,
                                        decoration: AppDecoration
                                            .outlineBlack9000a1
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder10),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              controller.swipeItems[index]
                                                          .content.backImage !=
                                                      null
                                                  ? controller
                                                          .swipeItems[index]
                                                          .content
                                                          .backImage
                                                          .isNotEmpty
                                                      ? CommonImageView(
                                                          margin: getMargin(
                                                              top: 10,
                                                              left: 10,
                                                              right: 10),
                                                          url: controller
                                                              .swipeItems[index]
                                                              .content
                                                              .backImage,
                                                          radius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    10),
                                                            topRight:
                                                                Radius.circular(
                                                                    10),
                                                          ),
                                                          height:
                                                              getVerticalSize(
                                                            230.00,
                                                          ),
                                                          width:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        )
                                                      : CommonImageView(
                                                          margin: getMargin(
                                                              top: 10,
                                                              left: 10,
                                                              right: 10),
                                                          url: controller
                                                              .swipeItems[index]
                                                              .content
                                                              .backImage,
                                                          radius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    10),
                                                            topRight:
                                                                Radius.circular(
                                                                    10),
                                                          ),
                                                          height:
                                                              getVerticalSize(
                                                            230.00,
                                                          ),
                                                          width:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        )
                                                  : Container(),
                                              Expanded(
                                                  child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: controller
                                                            .swipeItems[index]
                                                            .content
                                                            .backImage
                                                            .isNotEmpty
                                                        ? 25.0
                                                        : 125,
                                                    left: 20,
                                                    right: 20),
                                                child: Text(
                                                    controller
                                                                .swipeItems[
                                                                    index]
                                                                .content
                                                                .backPrompt !=
                                                            null
                                                        ? controller
                                                            .swipeItems[index]
                                                            .content
                                                            .backPrompt
                                                        : "-",
                                                    maxLines: 4,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center,
                                                    style: AppStyle
                                                        .txtPoppinsSemiBold24
                                                        .copyWith(
                                                            letterSpacing: 0.10)
                                                        .copyWith(
                                                            fontSize: 18)),
                                              )),
                                              Container(
                                                  padding: getPadding(
                                                      left: 20,
                                                      top: 14,
                                                      right: 20,
                                                      bottom: 14),
                                                  decoration: AppDecoration
                                                      .outlineBlack9000a2
                                                      .copyWith(
                                                          color: ColorConstant
                                                              .primaryColor,
                                                          borderRadius:
                                                              BorderRadiusStyle
                                                                  .customBorderBL14),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        CommonImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .imgTicket,
                                                            height:
                                                                getSize(24.00),
                                                            width:
                                                                getSize(24.00)),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 3),
                                                            child: Text(
                                                                "tap_tp_flip"
                                                                    .tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtPoppinsMedium14
                                                                    .copyWith(
                                                                        color: ColorConstant
                                                                            .whiteA700,
                                                                        fontSize:
                                                                            14))),
                                                        CommonImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .imgTicket_2,
                                                            height:
                                                                getSize(24.00),
                                                            width:
                                                                getSize(24.00))
                                                      ]))
                                            ]))),
                              ),
                            );
                          },
                          onEnd: () {
                            // if (controller.direction.value == AppinioSwiperDirection.right) {
                            if (true) {
                              Get.dialog(CustomFlashModelSheet(
                                  msg: controller.direction.value.name == "left"
                                      ? "lbl_still_learning".tr
                                      : "lbl_totally_know".tr,
                                  secondStyle:
                                      controller.direction.value.name == "left"
                                          ? true
                                          : false,
                                  onUndo: () {
                                    controller.appinioSwiperController
                                        .unswipe();
                                    Get.back();
                                  },
                                  onNext: () {

                                    controller.currentIndex.value--;
                                    if (controller.direction.value.name == "left") {
                                      controller.getFlashcard();

                                      // controller.updateFlashcardScore(
                                      //     AppConstant.LEARNING,
                                      //     controller.currentIndex.value,
                                      //     controller.swipeItems[controller.currentIndex.value].content.id);
                                      // controller.indicatorCount.value++;
                                      // controller.learningCount.value++;
                                      Get.back();
                                    } else {
                                      // controller.getFlashcard();
                                      controller.updateFlashcardScore(AppConstant.KNOWN, controller.currentIndex.value, controller.swipeItems[controller.currentIndex.value].content.id, true);
                                      controller.indicatorCount.value++;
                                      controller.knowCount.value++;

                                      Get.back();
                                    }

                                  },
                                ),);
                            }
                            else {
                              controller.indicatorCount.value = 0;
                              controller.swipeItems.add(controller.swipeItems[controller.cardsLength.value - 1]);
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: [
                          Obx(() => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${controller.indicatorCount.value.toString()}',
                                    style: TextStyle(
                                      color: ColorConstant.hintTextColor,
                                      fontSize: getFontSize(
                                        12,
                                      ),
                                      fontFamily: Platform.isIOS
                                          ? 'SF Pro Display'
                                          : 'Roboto',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    ' / ',
                                    style: TextStyle(
                                      color: ColorConstant.hintTextColor,
                                      fontSize: getFontSize(
                                        12,
                                      ),
                                      fontFamily: Platform.isIOS
                                          ? 'SF Pro Display'
                                          : 'Roboto',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    controller.swipeItems.length.toString(),
                                    style: TextStyle(color: ColorConstant.hintTextColor,
                                      fontSize: getFontSize(12,),
                                      fontFamily: Platform.isIOS
                                          ? 'SF Pro Display'
                                          : 'Roboto',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      )
                    ])));
          })),
    );
  }
}
