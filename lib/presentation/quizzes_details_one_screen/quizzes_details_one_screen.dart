import 'dart:convert';

import 'package:salon_symphony/core/utils/helper_functions.dart';
import 'package:salon_symphony/presentation/quizzes_details_one_screen/models/quizzes_details_one_model.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../baseviews/baseview_process_screen.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/semantics.dart';
import '../../core/utils/utils.dart';
import '../../data/services/api_call_status.dart';
import '../../widgets/animatedButton.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_toast.dart';
import '../../widgets/widgetSkeleton.dart';
import 'controller/quizzes_details_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_button.dart';

class QuizzesDetailsOneScreen extends GetWidget<QuizzesDetailsOneController> {
  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return Obx(() =>
    BaseviewScreen(
        screenName:controller
            .quizzesDetailsOneModelObj
            .value
            .data?[0].quiz?.category !=null && controller
            .quizzesDetailsOneModelObj
            .value
            .data?[0].quiz?.category?.name!=null?"${controller
            .quizzesDetailsOneModelObj
            .value
            .data?[0].quiz?.category?.name} Quiz":"",
        basicAppBar: true,
        showBottomBar: false,
        bottomSafeArea: true,
        showBackButton: true,
        isBackButtonShow: true,
        onBackTap: (){
          HelperFunction.showBottomSheet(context,
              screenTitle: '',
              screenEndTask: '',
              color: Colors.transparent,
              isScrollControlled: true,
              bottomSheetHeight: 470,
              widget: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: ColorConstant.whiteA700,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: ColorConstant.gray100,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: CommonImageView(
                                imagePath: ImageConstant.cancel_icon,
                                height: 30,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            child: MyText(
                              title:
                              'Are you sure you want to quit this quiz?',
                              clr: ColorConstant.black900,
                              fontSize: 20,
                              letterSpacing: 0.5,
                              weight: 'Bold',
                              center: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async {

                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: ColorConstant.whiteA700,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: MyText(
                              title: 'Yes, Quit',
                              clr: ColorConstant.errorColor,
                              fontSize: 16,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: ColorConstant.whiteA700,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: MyText(
                              title: 'No, Continue',
                              clr: ColorConstant.hintTextColor,
                              fontSize: 16,
                            ),
                          )),
                    ),
                  ],
                ),
              ));
       },
        sidePadding: false,
        textButtonName: "Quit",
        greyClrEndTask: false,
        stickyHeader: true,
        textOnTap: () {
          HelperFunction.showBottomSheet(context,
              screenTitle: '',
              screenEndTask: '',
              color: Colors.transparent,
              isScrollControlled: true,
              bottomSheetHeight: 470,
              widget: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: ColorConstant.whiteA700,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: ColorConstant.gray100,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: CommonImageView(
                                imagePath: ImageConstant.cancel_icon,
                                height: 30,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            child: MyText(
                              title:
                              'Are you sure you want to quit this quiz?',
                              clr: ColorConstant.black900,
                              fontSize: 20,
                              letterSpacing: 0.5,
                              weight: 'Bold',
                              center: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async {

                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: ColorConstant.whiteA700,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: MyText(
                              title: 'Yes, Quit',
                              clr: ColorConstant.errorColor,
                              fontSize: 16,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: ColorConstant.whiteA700,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: MyText(
                              title: 'No, Continue',
                              clr: ColorConstant.hintTextColor,
                              fontSize: 16,
                            ),
                          )),
                    ),
                  ],
                ),
              ));
        },
        backgroundColor: Color(0xFFF5F6F8),
        child: Obx(() => controller.apiCallStatus.value == ApiCallStatus.success
            ? Column(children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              width: double.infinity,
                              margin: getMargin(top: 10),
                              child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: controller
                                      .quizzesDetailsOneModelObj
                                      .value
                                      .data!
                                      .length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return controller.quizzesDetailsOneModelObj
                                                .value.data!.isNotEmpty &&
                                            controller.quizzesDetailsOneModelObj
                                                    .value.data![index].type ==
                                                10
                                        ? questionsWidgetSingleSelect(index)
                                        : controller.quizzesDetailsOneModelObj
                                                    .value.data!.isNotEmpty &&
                                                controller
                                                        .quizzesDetailsOneModelObj
                                                        .value
                                                        .data![index]
                                                        .type ==
                                                    20
                                            ? questionsWidgetImageType(index)
                                            : controller
                                                        .quizzesDetailsOneModelObj
                                                        .value
                                                        .data!
                                                        .isNotEmpty &&
                                                    controller
                                                            .quizzesDetailsOneModelObj
                                                            .value
                                                            .data![index]
                                                            .type ==
                                                        30
                                                ? questionsWidgetTrueFalse(
                                                    index)
                                                : Container();
                                  }),
                            )),
                        controller.selectedAnswersList.length ==
                            controller.quizzesDetailsOneModelObj.value.data!.length
                            ? AnimatedButton(
                          text: "lbl_submit2".tr,
                          width: double.maxFinite,
                          margin: getMargin(left: 15, top: 20, right: 15),
                          padding: ButtonPaddingOfButton.PaddingAll18,
                          fontStyle: ButtonFontStyleOfButton.PoppinsSemiBold16,
                          alignment: Alignment.center,
                          onPressed: () async {
                            print("active");
                            List<Map<String, dynamic>> jsonList = controller
                                .selectedAnswersList
                                .map((selectedAnswer) => selectedAnswer.toJson())
                                .toList();
                            String jsonString =
                            jsonEncode(controller.selectedAnswersList);
                            print(jsonString);
                            controller.updateStatus(jsonString);
                          },
                          controller: controller.animatedButtonController,
                        )
                            : CustomButton(
                            text: "lbl_submit2".tr,
                            width: double.maxFinite,
                            margin: getMargin(left: 15, top: 20, right: 15),
                            padding: ButtonPadding.PaddingAll18,
                            variant: ButtonVariant.FillIndigo50,
                            fontStyle: ButtonFontStyle.PoppinsSemiBold16,
                            onTap: () {},
                            alignment: Alignment.center)
                      ],
                    ),
                  ),
                ),

              ])
            : controller.apiCallStatus.value == ApiCallStatus.loading
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: taskShimmer(context),
                  )
                : Container())));
  }

  Widget questionsWidgetSingleSelect(int index) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0,bottom: 13,left: 8,right: 8),
      child: Container(
          padding: const EdgeInsets.all(8.0),
          width: double.infinity,
          decoration: AppDecoration.outlineBlack9000a1.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: getPadding(left: 20, top: 15, right: 20),
                    child:
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: Text(
                                controller.quizzesDetailsOneModelObj.value
                                    .data![index].question !=
                                    null
                                    ?
                                "${index+1}. ${controller.quizzesDetailsOneModelObj.value
                                    .data![index].question!}"
                                    : "",
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsMedium14
                                    .copyWith(height: 1.5,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                )),
                          )
                        ])
                ),
                //controller.arrOfQuestion[controller.currentQuestion.value]
                ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.quizzesDetailsOneModelObj.value
                        .data![index].questionAnswers!.length,
                    itemBuilder: (context, index2) {
                      return GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          controller.changeAnswerStatus(index, index2);
                          // controller.onTapAnswer(index);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                    getPadding(left: 20, top: 19, right: 20),
                                child: Obx(() => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          controller
                                                      .quizzesDetailsOneModelObj
                                                      .value
                                                      .data![index]
                                                      .questionAnswers![index2]
                                                      .isSelected
                                                      ?.value ==
                                                  true
                                              ? Container(
                                                  padding: getPadding(
                                                      left: 6,
                                                      top: 7,
                                                      right: 6,
                                                      bottom: 7),
                                                  height: getSize(
                                                    23.00,
                                                  ),
                                                  width: getSize(
                                                    23.00,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: ColorConstant
                                                        .deepPurpleA201,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      getHorizontalSize(
                                                        50,
                                                      ),
                                                    ),


                                                  ),
                                                  child: CommonImageView(
                                                    svgPath: ImageConstant
                                                        .imgCheckmark20X20,
                                                  ))
                                              : Container(
                                            padding: getPadding(
                                                left: 6,
                                                top: 7,
                                                right: 6,
                                                bottom: 7),
                                            height: getSize(
                                              23.00,
                                            ),
                                            width: getSize(
                                              23.00,
                                            ),
                                                  decoration: AppDecoration
                                                      .outlineBluegray100
                                                      .copyWith(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      getHorizontalSize(
                                                        50,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                          Flexible(
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 13, top: 6, bottom: 4),
                                                child: Text(
                                                    controller
                                                                .quizzesDetailsOneModelObj
                                                                .value
                                                                .data![index]
                                                                .questionAnswers![
                                                                    index2]
                                                                .answer !=
                                                            null
                                                        ? controller.quizzesDetailsOneModelObj.value.data![index].questionAnswers![index2].answer!
                                                        : "",

                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtPoppinsRegular12Black900.copyWith(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 17
                                                    )
                                                )),
                                          ),
                                        ]))),
                            index2 == controller.quizzesDetailsOneModelObj.value
                                .data![index].questionAnswers!.length-1
                                ? Container(
                                    height: getVerticalSize(1.00),
                                    width: getHorizontalSize(323.00),
                                    margin:
                                        getMargin(left: 10, top: 20, right: 10),
                                  )
                                : Container(
                                    height: getVerticalSize(1.00),
                                    width: getHorizontalSize(323.00),
                                    margin:
                                        getMargin(left: 10, top: 20, right: 10),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.gray200)),
                          ],
                        ),
                      );
                    })
              ])),
    );
  }

  Widget questionsWidgetTrueFalse(int index) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0,bottom: 13,left: 8,right: 8),
      child: Container(
          padding: const EdgeInsets.all(8.0),
          width: double.infinity,
          decoration: AppDecoration.outlineBlack9000a1.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: getPadding(left: 20, top: 15, right: 20),
                    child:
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: Text(
                                controller.quizzesDetailsOneModelObj.value
                                            .data![index].question !=
                                        null
                                    ?
                                "${index+1}. ${controller.quizzesDetailsOneModelObj.value
                                    .data![index].question!}"
                                    : "",
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsMedium14
                                    .copyWith(height: 1.5,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                )),
                          )
                        ])
                ),

                //controller.arrOfQuestion[controller.currentQuestion.value]
                ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.quizzesDetailsOneModelObj.value
                        .data![index].questionAnswers!.length,
                    itemBuilder: (context, index2) {
                      return GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          print("asdasd");
                          controller.changeAnswerStatus(index, index2);
                          // controller.onTapAnswer(index);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                    getPadding(left: 20, top: 19, right: 20),
                                child: Obx(() => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          controller
                                                      .quizzesDetailsOneModelObj
                                                      .value
                                                      .data![index]
                                                      .questionAnswers![index2]
                                                      .isSelected
                                                      ?.value ==
                                                  true
                                              ? Container(
                                                  padding: getPadding(
                                                      left: 6,
                                                      top: 7,
                                                      right: 6,
                                                      bottom: 7),
                                                  height: getSize(
                                                    23.00,
                                                  ),
                                                  width: getSize(
                                                    23.00,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: ColorConstant
                                                        .deepPurpleA201,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      getHorizontalSize(
                                                        50,
                                                      ),
                                                    ),
                                                  ),
                                                  child: CommonImageView(
                                                    svgPath: ImageConstant
                                                        .imgCheckmark20X20,
                                                  ))
                                              : Container(
                                            padding: getPadding(
                                                left: 6,
                                                top: 7,
                                                right: 6,
                                                bottom: 7),
                                            height: getSize(
                                              23.00,
                                            ),
                                            width: getSize(
                                              23.00,
                                            ),
                                                  decoration: AppDecoration
                                                      .outlineBluegray100
                                                      .copyWith(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      getHorizontalSize(
                                                        50,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                          Flexible(
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 13, top: 6, bottom: 4),
                                                child: Text(
                                                    controller
                                                                .quizzesDetailsOneModelObj
                                                                .value
                                                                .data![index]
                                                                .questionAnswers![
                                                                    index2]
                                                                .answer !=
                                                            null
                                                        ? controller
                                                            .quizzesDetailsOneModelObj
                                                            .value
                                                            .data![index]
                                                            .questionAnswers![
                                                                index2]
                                                            .answer!
                                                        : "",
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 5,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtPoppinsRegular12Black900.copyWith(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 17
                                                    )
                                                )
                                            ),
                                          ),
                                        ]))),
                            index2 == controller.quizzesDetailsOneModelObj.value
                                .data![index].questionAnswers!.length-1
                                ? Container(
                                    height: getVerticalSize(1.00),
                                    width: getHorizontalSize(323.00),
                                    margin:
                                        getMargin(left: 10, top: 20, right: 10),
                                  )
                                : Container(
                                    height: getVerticalSize(1.00),
                                    width: getHorizontalSize(323.00),
                                    margin:
                                        getMargin(left: 10, top: 20, right: 10),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.gray200)),
                          ],
                        ),
                      );
                    })
              ])),
    );
  }

  Widget questionsWidgetImageType(int index) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0,bottom: 13,left: 8,right: 8),
      child: Container(
          padding: const EdgeInsets.all(8.0),
          width: double.infinity,
          decoration: AppDecoration.outlineBlack9000a1.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: getPadding(left: 20, top: 15, right: 20),
                    child:
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: Text(
                                controller.quizzesDetailsOneModelObj.value
                                    .data![index].question !=
                                    null
                                    ?
                                "${index+1}. ${controller.quizzesDetailsOneModelObj.value
                                    .data![index].question!}"
                                    : "",
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsMedium14
                                    .copyWith(height: 1.5,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                )),
                          )
                        ])
                ),
                //controller.arrOfQuestion[controller.currentQuestion.value]
                ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.quizzesDetailsOneModelObj.value
                        .data![index].questionAnswers!.length,
                    itemBuilder: (context, index2) {
                      return GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          print("asdasd");
                          controller.changeAnswerStatus(index, index2);
                          // controller.onTapAnswer(index);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                    getPadding(left: 20, top: 19, right: 20),
                                child: Obx(() => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          controller
                                                      .quizzesDetailsOneModelObj
                                                      .value
                                                      .data![index]
                                                      .questionAnswers![index2]
                                                      .isSelected
                                                      ?.value ==
                                                  true
                                              ? Container(
                                                  padding: getPadding(
                                                      left: 6,
                                                      top: 7,
                                                      right: 6,
                                                      bottom: 7),
                                                  height: getSize(
                                                    23.00,
                                                  ),
                                                  width: getSize(
                                                    23.00,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: ColorConstant
                                                        .deepPurpleA201,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      getHorizontalSize(
                                                        50,
                                                      ),
                                                    ),
                                                  ),
                                                  child: CommonImageView(
                                                    svgPath: ImageConstant
                                                        .imgCheckmark20X20,
                                                  ))
                                              : Container(
                                            padding: getPadding(
                                                left: 6,
                                                top: 7,
                                                right: 6,
                                                bottom: 7),
                                            height: getSize(
                                              23.00,
                                            ),
                                            width: getSize(
                                              23.00,
                                            ),
                                                  decoration: AppDecoration
                                                      .outlineBluegray100
                                                      .copyWith(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      getHorizontalSize(
                                                        50,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                getHorizontalSize(10)),
                                            child: CommonImageView(
                                                url: controller
                                                    .quizzesDetailsOneModelObj
                                                    .value
                                                    .data![index]
                                                    .questionAnswers![index2]
                                                    .image!,
                                                height: 100,
                                                width: 100,
                                                fit: BoxFit.cover,
                                              
                                            ),
                                          ),
                                          Flexible(
                                            child: Padding(
                                              padding: getPadding(
                                                    left: 13, top: 6, bottom: 4),
                                              child: Text(
                                                    controller
                                                                .quizzesDetailsOneModelObj
                                                                .value
                                                                .data![index]
                                                                .questionAnswers![
                                                                    index2]
                                                                .answer !=
                                                            null
                                                        ? controller.quizzesDetailsOneModelObj.value.data![index].questionAnswers![index2].answer!
                                                        : "",

                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtPoppinsRegular12Black900.copyWith(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 17
                                                    )
                                                ),
                                            ),
                                          ),
                                        ]))),
                            index2 == controller.quizzesDetailsOneModelObj.value
                                .data![index].questionAnswers!.length-1
                                ? Container(
                                    height: getVerticalSize(1.00),
                                    width: getHorizontalSize(323.00),
                                    margin:
                                        getMargin(left: 10, top: 20, right: 10),
                                  )
                                : Container(
                                    height: getVerticalSize(1.00),
                                    width: getHorizontalSize(323.00),
                                    margin:
                                        getMargin(left: 10, top: 20, right: 10),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.gray200)),
                          ],
                        ),
                      );
                    })
              ])),
    );
  }
}
