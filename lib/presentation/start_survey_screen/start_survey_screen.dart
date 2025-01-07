import 'dart:io';
import 'package:salon_symphony/core/utils/app_constant.dart';
import 'package:salon_symphony/core/utils/helper_functions.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import 'package:salon_symphony/presentation/start_survey_screen/start_survey_controller.dart';
import 'package:salon_symphony/widgets/widgetSkeleton.dart';

import '../../baseviews/baseview_process_screen.dart';
import '../../core/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_button.dart';

import '../../data/services/api_call_status.dart';

class StartSurveyScreen extends StatelessWidget {
  Responsive responsive = Responsive();
  StartSurveyController controller = Get.put(StartSurveyController());
  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return Obx(() => BaseviewScreen(
        screenName: controller.surveyDetails.value!.category!=null?"${controller.surveyDetails.value!.category!.name} Survey":"Survey",
        basicAppBar: true,
        showBottomBar: false,
        bottomSafeArea: true,
        sidePadding: false,
        backgroundColor: ColorConstant.whiteA700,
        basicAppTrailingIcon: ImageConstant.imgMenuIcon,
        basicAppTrailingIconOnTap: () {
          HelperFunction.showBottomSheet(context,
              screenTitle: 'Survey Options',
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
                      Get.back();
                      String deepLink = '${AppConstant.shareBaseUrl}/surveys/details/${controller.surveyDetails.value!.id}';
                      // String deepLink = '${AppConstant.shareBaseUrl}?surveyId=${controller.surveyDetails.value!.id}';
                      // deepLink = Uri.encodeFull(deepLink);
                      // await Clipboard.setData(ClipboardData(text: deepLink));
                      Utils.share(deepLink);
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
                        Text('Share survey',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                16,
                              ),
                              letterSpacing: 0.5,
                              fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
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
                              fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                  ),
                ],
              ));
        },
        child:

        controller.apiCallStatus.value == ApiCallStatus.loading?Container(
          child:  QuizSurveyShimmer(context),
        ):
        Container(
            color: ColorConstant.whiteA700,
            width: responsive.setWidth(100),
            child: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Container(
                          margin: getPadding(left: 16,right: 16),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorConstant.gray400.withOpacity(0.5),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                          ),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        child: CommonImageView(
                                            url: controller.surveyDetails.value!.image == null ? "" : controller.surveyDetails.value!.image,
                                            height: getVerticalSize(160.00),
                                            width: double.maxFinite,
                                            radius: BorderRadius.only(
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12)),
                                            fit: BoxFit.cover))),
                                Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                        padding:
                                        getPadding(left: 15, top: 8, right: 15),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(controller.surveyDetails.value!.surveyQuestions == null ? "0" : controller.surveyDetails.value!.surveyQuestions!.length.toString() + " ${controller.surveyDetails.value!.surveyQuestions!.length == 1 ? "Question" : "Questions"}",
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtPoppinsRegular14Gray600.copyWith(
                                                    fontSize: 13,
                                                    color: ColorConstant.hintTextColor.withOpacity(0.8),
                                                  )),
                                              Padding(
                                                  padding:
                                                  getPadding(top: 1, bottom: 1),
                                                  child: Text( controller.surveyDetails.value!.updatedAt == null ? "0" : Utils.formatDate(controller.surveyDetails.value!.updatedAt.toString()),
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtPoppinsRegular14Gray600.copyWith(
                                                        fontSize: 13,
                                                        color: ColorConstant.hintTextColor.withOpacity(0.8),
                                                      )))
                                            ]))),
                                Padding(
                                    padding:
                                    getPadding(left: 15, top: 21, right: 15),
                                    child: Text( controller.surveyDetails.value!.name == null ? " " : controller.surveyDetails.value!.name.toString(),
                                        // overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsMedium16
                                            .copyWith(fontWeight: FontWeight.w800,fontSize: 19))),
                                Container(
                                    width: getHorizontalSize(299.00),
                                    margin: getMargin(left: 15, top: 12, right: 15),
                                    child:
                                    Text( controller.surveyDetails.value!.description == null ? " " : controller.surveyDetails.value!.description.toString(),
                                        // overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: ColorConstant.gray600.withOpacity(0.8),
                                            fontSize: getFontSize(15),
                                            height: 1.4,
                                            fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                            fontWeight: FontWeight.w400))),
                                SizedBox(height: 50,),
                              ])),
                      SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                          margin: getMargin(left: 16,right: 16),
                          width: responsive.setWidth(100),
                          text: "Start Survey",
                          padding: ButtonPadding.PaddingAll18,
                          fontStyle: ButtonFontStyle.PoppinsSemiBold16,
                          onTap: (){
                            Get.toNamed(AppRoutes.surveyDetailsScreen, arguments: {
                              'id': controller.surveyDetails.value!.id,
                              'name': controller.surveyDetails.value!.category!.name,
                            });
                            // controller.onTapNext();
                          })
                    ])))));
  }


}
