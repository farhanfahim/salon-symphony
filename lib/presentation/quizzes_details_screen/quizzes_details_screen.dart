import 'dart:io';

import 'package:salon_symphony/core/utils/helper_functions.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import 'package:salon_symphony/widgets/custom_text.dart';

import '../../baseviews/baseview_process_screen.dart';
import '../../core/utils/app_constant.dart';
import '../../core/utils/responsive.dart';
import '../../data/models/getQuizListModel.dart';
import '../../data/services/api_call_status.dart';
import '../../widgets/error_widget.dart';
import '../../widgets/widgetSkeleton.dart';
import 'controller/quizzes_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_button.dart';
import 'package:salon_symphony/widgets/custom_icon_button.dart';

class QuizzesDetailsScreen extends GetWidget<QuizzesDetailsController> {
  Responsive responsive = Responsive();
  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return Obx(() => BaseviewScreen(
        screenName: controller.quizDetails.value!.category!=null?"${controller.quizDetails.value!.category!.name} Quiz":"Quiz",
        basicAppBar: true,
        showBottomBar: false,
        bottomSafeArea: true,
        sidePadding: false,
        backgroundColor: ColorConstant.whiteA700,
        basicAppTrailingIcon: ImageConstant.imgMenuIcon,
        basicAppTrailingIconOnTap: () {
          HelperFunction.showBottomSheet(context,
              screenTitle: 'Quiz Options',
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
                      String deepLink = '${AppConstant.shareBaseUrl}/quizzes/details/${controller.quizDetails.value!.id}';
                      // String deepLink = '${AppConstant.shareBaseUrl}?quizId=${controller.quizDetails.value!.id}';
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
                        Text('Share quiz',
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
        child: controller.apiCallStatus.value==ApiCallStatus.loading?Container(
          child:  taskShimmer(context),
        ):controller.apiCallStatus.value==ApiCallStatus.success?
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
                                            url: controller.quizDetails.value!.image,
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
                                        getPadding(left: 16, top: 8, right: 16),
                                        child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              // controller.quizDetails.value!.tags!=null?Wrap(
                                              //   children: controller.quizDetails.value!.tags!.map((item) =>  Text(
                                              //     '${item.name!} ', // Add a comma after item.name!
                                              //     maxLines: null,
                                              //     textAlign: TextAlign.left,
                                              //     overflow: TextOverflow.ellipsis,
                                              //     style: AppStyle.txtPoppinsRegular14Gray600.copyWith(
                                              //       height: 1.30,
                                              //       color:  ColorConstant.hintTextColor.withOpacity(0.8),
                                              //       fontSize: 14,
                                              //
                                              //     ),
                                              //   )).toList().cast<Widget>(),
                                              // ):Container(),
                                              Text(
                                                '${controller.quizDetails.value!.quizQuestions!.length.toString()} ${controller.quizDetails.value!.quizQuestions!.length==1?'Question':'Questions'}',
                                                maxLines: null,
                                                textAlign: TextAlign.left,
                                                overflow: TextOverflow.ellipsis,
                                                style: AppStyle.txtPoppinsRegular14Gray600.copyWith(
                                                  height: 1.30,
                                                  color:  ColorConstant.hintTextColor.withOpacity(0.8),
                                                  fontSize: 14,

                                                ),
                                              ),

                                              Padding(
                                                  padding:
                                                  getPadding(top: 1, bottom: 1),
                                                  child: Text(controller.quizDetails.value!.createdAt!=null?Utils.getFormatedDate(controller.quizDetails.value!.createdAt!):"",
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtPoppinsRegular14Gray600.copyWith(
                                                        fontSize: 14,
                                                        color: ColorConstant.hintTextColor.withOpacity(0.8),
                                                      )))
                                            ]))),
                                Padding(
                                    padding:
                                    getPadding(left: 16, top: 21, right: 16),
                                    child: Text(controller.quizDetails.value!.name!=null?controller.quizDetails.value!.name!:"",
                                        // overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsMedium16
                                            .copyWith(fontWeight: FontWeight.w800,fontSize: 19))),
                                Container(
                                    width: getHorizontalSize(299.00),
                                    margin: getMargin(left: 16, top: 12, right: 16,bottom: 50),
                                    child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: controller.quizDetails.value!.description,
                                              style: TextStyle(
                                                  color: ColorConstant.gray600,
                                                  fontSize: getFontSize(15),
                                                  letterSpacing: 0.5,
                                                  fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                                  height: 1.3,
                                                  fontWeight: FontWeight.w400)),
                                          TextSpan(
                                              text: "",
                                              style: TextStyle(
                                                  color: ColorConstant.gray600,
                                                  fontSize: getFontSize(15),
                                                  fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                                  height: 1.3,
                                                  fontWeight: FontWeight.w400))
                                        ]),
                                        textAlign: TextAlign.left)),
                                SizedBox(height: 50),
                              ])),
                      SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                          margin: getMargin(left: 16,right: 16),
                          width: responsive.setWidth(100),
                          text: "lbl_start_quiz".tr,
                          padding: ButtonPadding.PaddingAll18,
                          fontStyle: ButtonFontStyle.PoppinsSemiBold16,
                          onTap: (){
                            controller.onTapNext(controller.quizDetails.value!.id!);
                          })
                    ]))) : RecordDeletedWidget()
    ));
  }


}
