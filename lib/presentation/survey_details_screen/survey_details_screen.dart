import 'dart:convert';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/core/utils/app_constant.dart';
import 'package:salon_symphony/widgets/animatedButton.dart';
import 'package:salon_symphony/widgets/custom_text.dart';
import 'package:salon_symphony/widgets/error_widget.dart';
import 'package:salon_symphony/widgets/widgetSkeleton.dart';

import '../../core/utils/helper_functions.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/utils.dart';
import '../../data/services/api_call_status.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/custom_textfield_new.dart';
import '../survey_complete_screen/survey_complete_screen.dart';
import 'controller/survey_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

class SurveyDetailsScreen extends GetWidget<SurveyDetailsController> {
  Responsive responsive = Responsive();
Map<String, dynamic> map = Get.arguments;
  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    // controller.generateData();
    return Obx(() => BaseviewScreen(
        basicAppBar: true,
        screenName: "${map['name']} Survey" ,
        showBottomBar: false,
        sidePadding: false,
        textButtonName: "Quit",
        greyClrEndTask: false,
        isResizeToAvoidBottomInset: true,
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
                                  'Are you sure you want to quit this survey?',
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
        backgroundColor: ColorConstant.seperateColor,
        child: controller.apiCallStatus.value == ApiCallStatus.success
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                    color: ColorConstant.seperateColor,
                    child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                          SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  controller.surveyQuestions.value.data!.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    // elevation:4,
                                    margin: getMargin(top: 15),
                                    // shadowColor: ColorConstant.black900,
                                    decoration: BoxDecoration(
                                      color: ColorConstant.whiteA700,
                                      border: Border.all(
                                        color: ColorConstant.whiteA700,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          controller.surveyQuestions.value.data![index].type == AppConstant.SINGLE_SELECT
                                              ? questionsWidgetSingleSelect(index)
                                              : controller.surveyQuestions.value.data![index].type == AppConstant.IMAGE_SELECT
                                              ? questionsWidgetImageType(index)
                                              : controller.surveyQuestions.value.data![index].type == AppConstant.MULTI_SELECT
                                              ? multiSelect(index)
                                              : controller.surveyQuestions.value.data![index].type == AppConstant.STAR_RATING
                                              ? starRating(index)
                                              : controller.surveyQuestions.value.data![index].type == AppConstant.EMOJI_RAITING
                                              ? emojiRating(index)
                                              : controller.surveyQuestions.value.data![index].type == AppConstant.SHORT_ANSWER
                                              ? shortAnswer(index)
                                              : Container()
                                        ],
                                      ),
                                    ));
                              }),
                          controller.selectedAnswersList.length ==
                                  controller.surveyQuestions.value.data!.length
                              ? AnimatedButton(
                                  text: "lbl_submit2".tr,
                                  width: double.maxFinite,
                                  margin:
                                      getMargin(left: 15, top: 20, right: 15),
                                  padding: ButtonPaddingOfButton.PaddingAll18,
                                  fontStyle:
                                      ButtonFontStyleOfButton.PoppinsSemiBold16,
                                  alignment: Alignment.center,
                                  onPressed: () async {
                                    print("active");
                                    List<Map<String, dynamic>> jsonList =
                                        controller.selectedAnswersList.map((selectedAnswer) => selectedAnswer.toJson()).toList();
                                    String jsonString = jsonEncode(controller.selectedAnswersList);
                                    print(jsonString);
                                    controller.saveAnswers(jsonString);
                                  },
                                  controller:
                                      controller.animatedButtonController,
                                )
                              : CustomButton(
                                  text: "lbl_submit2".tr,
                                  width: double.maxFinite,
                                  margin:
                                      getMargin(left: 15, top: 20, right: 15),
                                  padding: ButtonPadding.PaddingAll18,
                                  variant: ButtonVariant.FillIndigo50,
                                  fontStyle: ButtonFontStyle.PoppinsSemiBold16,
                                  onTap: () {},
                                  alignment: Alignment.center),
                          Padding(
                              padding: getPadding(top: 17),
                              child: Center(
                                child: Text(
                                    "msg_thank_you_for_participating".tr,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        AppStyle.txtPoppinsRegular11Black900),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                        ]))),
              )
            : controller.apiCallStatus.value == ApiCallStatus.loading
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: taskShimmer(context),
                  )
                : RecordDeletedWidget()));
  }

  Widget multiSelect(int index) {
    return Obx(() => Padding(
          padding:
              const EdgeInsets.only(top: 30.0, bottom: 30, left: 8, right: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: getPadding(left: 0, top: 0, right: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: Text(
                              controller.surveyQuestions.value.data![index]
                                          .question !=
                                      null
                                  ? "${controller.surveyQuestions.value.data![index].question!}"
                                  : "",
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsMedium14.copyWith(
                                  height: 1.5,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                        )
                      ])),
              SizedBox(
                height: 10,
              ),
              Obx(() => ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.surveyQuestions.value.data![index]
                      .surveyQuestionOptions!.length,
                  itemBuilder: (context, index2) {
                    return GestureDetector(
                      onTap: () {
                        controller.onTapAnswer(index, index2);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: getPadding(top: 10, right: 20),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Obx(
                                      () => controller
                                              .surveyQuestions
                                              .value
                                              .data![index]
                                              .surveyQuestionOptions![index2]
                                              .isSelected!
                                              .value
                                          ? Container(
                                              padding: EdgeInsets.all(7.0),
                                              // Adjust your padding as needed
                                              width: getSize(23.00),
                                              // Set your desired width
                                              height: getSize(23.00),
                                              // Set your desired height
                                              decoration: BoxDecoration(
                                                color: ColorConstant
                                                    .deepPurpleA201,
                                                borderRadius: BorderRadius.circular(
                                                    5.0), // Set the border radius to 5
                                              ),
                                            )
                                          : Container(
                                              width: getSize(23.00),
                                              // Set your desired width
                                              height: getSize(23.00),
                                              decoration: AppDecoration
                                                  .outlineBluegray100
                                                  .copyWith(
                                                borderRadius: BorderRadius.circular(
                                                    5.0), // Set the border radius to 5
                                              ),
                                            ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                          padding: getPadding(
                                              left: 13, top: 6, bottom: 4),
                                          child: Text(
                                              controller.surveyQuestions.value.data![index].surveyQuestionOptions![index2].answer!,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 20,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPoppinsRegular12Black900
                                                  .copyWith(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 16))),
                                    ),
                                    // SizedBox(
                                    //   height: 15,
                                    // ),
                                  ])),
                          index2 ==
                                  controller.surveyQuestions.value.data![index]
                                          .surveyQuestionOptions!.length -
                                      1
                              ? Offstage()
                              : Container(
                                  height: getVerticalSize(1.00),
                                  width: getHorizontalSize(323.00),
                                  margin: getMargin(left: 0, top: 15, right: 0),
                                  decoration: BoxDecoration(
                                      color: ColorConstant.gray200)),
                        ],
                      ),
                    );
                  })),
            ],
          ),
        ));
  }

  Widget shortAnswer(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 30, left: 8, right: 8),
      child: Column(
        children: [
          Padding(
              padding: getPadding(left: 0, top: 0, right: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Text(
                          controller.surveyQuestions.value.data![index]
                                      .question !=
                                  null
                              ? "${controller.surveyQuestions.value.data![index].question!}"
                              : "",
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsMedium14.copyWith(
                              height: 1.5,
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                    )
                  ])),
          SizedBox(
            height: 10,
          ),
          CustomTextField3(
            fieldText: "Write here...",
            controller: controller.messageControllers[index],
            isFinal: true,
            inRowPaddindLeft: 0,
            inRowPaddindRight: 0,
            focusNode: controller.mesasgeNode[index],
            keyboardType: TextInputType.text,
            isSurveyScreen: true,
            limit: 250,
            maxLines: 5,
            onChanged: (value) {
              controller.shortAnwers(value, index);
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "";
              }
              return null;
            },
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget questionsWidgetSingleSelect(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 30, left: 8, right: 8),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: getPadding(left: 0, top: 0, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Text(
                            controller.surveyQuestions.value.data![index]
                                        .question !=
                                    null
                                ? "${controller.surveyQuestions.value.data![index].question!}"
                                : "",
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsMedium14.copyWith(
                                height: 1.5,
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),
                      )
                    ])),
            //controller.arrOfQuestion[controller.currentQuestion.value]
            ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.surveyQuestions.value.data![index]
                    .surveyQuestionOptions!.length,
                itemBuilder: (context, index2) {
                  return GestureDetector(
                    onTap: () {
                      controller.onTapSingleAnswer(index, index2);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: getPadding(left: 0, top: 19, right: 20),
                            child: Obx(() => Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      controller.surveyQuestions.value.data![index].surveyQuestionOptions![index2].isSelected?.value ==
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
                                                            .surveyQuestions
                                                            .value
                                                            .data![index]
                                                            .surveyQuestionOptions![
                                                                index2]
                                                            .answer !=
                                                        null
                                                    ? controller
                                                        .surveyQuestions
                                                        .value
                                                        .data![index]
                                                        .surveyQuestionOptions![
                                                            index2]
                                                        .answer!
                                                    : "",
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtPoppinsRegular12Black900
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 16))),
                                      ),
                                    ]))),
                        index2 ==
                                controller.surveyQuestions.value.data![index]
                                        .surveyQuestionOptions!.length -
                                    1
                            ? Container(
                                height: getVerticalSize(1.00),
                                width: getHorizontalSize(323.00),
                                margin: getMargin(left: 10, top: 20, right: 10),
                              )
                            : Container(
                                height: getVerticalSize(1.00),
                                width: getHorizontalSize(323.00),
                                margin: getMargin(left: 10, top: 20, right: 10),
                                decoration: BoxDecoration(
                                    color: ColorConstant.gray200)),
                      ],
                    ),
                  );
                })
          ]),
    );
  }

  Widget questionsWidgetImageType(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 30, left: 8, right: 8),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: getPadding(left: 0, top: 0, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Text(
                            controller.surveyQuestions.value.data![index]
                                        .question !=
                                    null
                                ? "${controller.surveyQuestions.value.data![index].question!}"
                                : "",
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsMedium14.copyWith(
                                height: 1.5,
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),
                      )
                    ])),
            SizedBox(
              height: 10,
            ),

            //controller.arrOfQuestion[controller.currentQuestion.value]
            ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.surveyQuestions.value.data![index]
                    .surveyQuestionOptions!.length,
                itemBuilder: (context, index2) {
                  return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      print("asdasd");
                      // controller.changeAnswerStatus(index, index2);
                      controller.onTapSingleAnswer(index, index2);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: getPadding(left: 0, top: 19, right: 20),
                            child: Obx(() => Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      controller
                                                  .surveyQuestions
                                                  .value
                                                  .data![index]
                                                  .surveyQuestionOptions![
                                                      index2]
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
                                              .surveyQuestions
                                              .value
                                              .data![index]
                                              .surveyQuestionOptions![index2]
                                              .image!,
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: getPadding(
                                              left: 13, top: 6, bottom: 4),
                                          child: Text(
                                              controller
                                                          .surveyQuestions
                                                          .value
                                                          .data![index]
                                                          .surveyQuestionOptions![
                                                              index2]
                                                          .answer !=
                                                      null
                                                  ? controller
                                                      .surveyQuestions
                                                      .value
                                                      .data![index]
                                                      .surveyQuestionOptions![
                                                          index2]
                                                      .answer!
                                                  : "",
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPoppinsRegular12Black900
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16)),
                                        ),
                                      ),
                                    ]))),
                        index2 ==
                                controller.surveyQuestions.value.data![index]
                                        .surveyQuestionOptions!.length -
                                    1
                            ? Container(
                                height: getVerticalSize(1.00),
                                width: getHorizontalSize(323.00),
                                margin: getMargin(left: 0, top: 20, right: 0),
                              )
                            : Container(
                                height: getVerticalSize(1.00),
                                width: getHorizontalSize(323.00),
                                margin: getMargin(left: 0, top: 20, right: 0),
                                decoration: BoxDecoration(
                                    color: ColorConstant.gray200)),
                      ],
                    ),
                  );
                })
          ]),
    );
  }

  Widget starRating(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 30, left: 8, right: 8),
      child: Column(
        children: [
          Padding(
              padding: getPadding(left: 0, top: 0, right: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Text(
                          controller.surveyQuestions.value.data![index]
                                      .question !=
                                  null
                              ? "${controller.surveyQuestions.value.data![index].question!}"
                              : "",
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsMedium14.copyWith(
                              height: 1.5,
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                    )
                  ])),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: getMargin(top: 20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: RatingBar(
                initialRating: 0,
                itemSize: 50,
                glow: false,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                ratingWidget: RatingWidget(
                  full: CommonImageView(
                    svgPath: ImageConstant.rating_star_fill,
                    height: 24,
                  ),
                  half: CommonImageView(
                    svgPath: ImageConstant.rating_star_fill,
                    height: 24,
                  ),
                  empty: CommonImageView(
                    svgPath: ImageConstant.rating_star_unfill,
                    height: 24,
                  ),
                ),
                itemPadding: EdgeInsets.symmetric(horizontal: 5.0),
                onRatingUpdate: (rating) {
                  print(rating);
                  int questionId =
                      controller.surveyQuestions.value.data![index].id!;

                  // Remove any existing entry for the same question
                  controller.selectedAnswersList.removeWhere(
                      (element) => element.survey_question_id == questionId);

                  // Add a new entry for the rating if it's not 0.0
                  if (rating != 0.0) {
                    controller.selectedAnswersList.add(SelectedAnswers(
                      survey_question_id: questionId,
                      question_answers: [],
                      stringAnswers: rating.toString(),
                    ));
                  }

                  print(controller.selectedAnswersList);
                  List<Map<String, dynamic>> jsonList = controller
                      .selectedAnswersList
                      .map((selectedAnswer) => selectedAnswer.toJson())
                      .toList();
                  String jsonString = jsonEncode(jsonList);
                  print(jsonString);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget emojiRating(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 30, left: 8, right: 8),
      child: Column(
        children: [
          Padding(
              padding: getPadding(left: 0, top: 0, right: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Text(
                          controller.surveyQuestions.value.data![index]
                                      .question !=
                                  null
                              ? "${controller.surveyQuestions.value.data![index].question!}"
                              : "",
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsMedium14.copyWith(
                              height: 1.5,
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                    )
                  ])),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: Obx(() => Container(
                  height: 50,
                  margin: getMargin(top: 20),
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.surveyQuestions.value.data![index]
                          .surveyQuestionOptions!.length,
                      itemBuilder: (context, index2) {
                        return GestureDetector(
                            onTap: () {
                              controller.onTapEmoji(index, index2);
                            },
                            child: Obx(() => Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  color: controller
                                          .surveyQuestions
                                          .value
                                          .data![index]
                                          .surveyQuestionOptions![index2]
                                          .isSelected!
                                          .value
                                      ? ColorConstant.deepPurpleA20067
                                      : Colors.white,
                                  border: Border.all(
                                      color: controller
                                              .surveyQuestions
                                              .value
                                              .data![index]
                                              .surveyQuestionOptions![index2]
                                              .isSelected!
                                              .value
                                          ? ColorConstant.deepPurple400
                                          : ColorConstant.gray300),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          5.0) //                 <--- border radius here
                                      ),
                                ),
                                child: Center(
                                  child: CommonImageView(
                                    url: controller
                                        .surveyQuestions
                                        .value
                                        .data![index]
                                        .surveyQuestionOptions![index2]
                                        .image!,
                                    height: 30,
                                    width: 30,
                                    // controller.surveyQuestions.value.data![index].surveyQuestionOptions![index2].answer!,
                                    // overflow: TextOverflow.ellipsis,
                                    // textAlign: TextAlign.center,
                                    // style: AppStyle.txtPoppinsSemiBold24
                                  ),
                                ))));
                      }),
                )),
          ),
        ],
      ),
    );
  }
}
