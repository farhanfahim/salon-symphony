import 'dart:io';

import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/core/utils/helper_functions.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import 'package:salon_symphony/presentation/rewards_screen/widgets/badge_item_widget.dart';
import 'package:salon_symphony/presentation/rewards_screen/widgets/point_item_widget.dart';
import '../../core/utils/responsive.dart';
import '../../widgets/no_record_found_widget.dart';
import '../../widgets/response_binding_widget.dart';
import '../../widgets/widgets_shimmer.dart';
import 'controller/rewards_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

class RewardsScreen extends GetWidget<RewardsController> {
  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return BaseviewScreen(
        screenName: 'my_rewards'.tr,
        basicAppBar: true,
        showBottomBar: false,
        sidePadding: false,
        backgroundColor: ColorConstant.whiteA700,
        basicAppTrailingIcon: ImageConstant.imgMenuIcon,
        basicAppTrailingIconOnTap: () {
          HelperFunction.showBottomSheet(context,
              screenTitle: 'Rewards Option',
              redclrEndTask: false,
              screenEndTask: 'Done',
              bottomSheetHeight: 150,
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),

                  GestureDetector(
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
              return Container();
            },
            loadingWidget: () {
              return rewardShimmer();
            },
            emptyWidget: () {
              return NoRecordFoundWidget();
            },
            successWidget: () {
              return Container(
                  color: ColorConstant.whiteA700,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                            child: SingleChildScrollView(
                                child: Padding(
                                    padding:
                                        getPadding(left: 16, top: 0, right: 16),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(getHorizontalSize(10.00),
                                                )),
                                                border: Border.all(
                                                  color: ColorConstant.hintTextColor.withOpacity(0.2),
                                                ),
                                              ),
                                              child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                        padding: getPadding(
                                                            left: 10,
                                                            top: 10,
                                                            bottom: 10),
                                                        child: Row(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            mainAxisSize: MainAxisSize.min,
                                                            children: [
                                                              CommonImageView(
                                                                  svgPath: ImageConstant.imgStar,
                                                                  height: getSize(40.00),
                                                                  width: getSize(40.00)),
                                                              Padding(
                                                                  padding: getPadding(
                                                                      left: 15,
                                                                      top: 11,
                                                                      bottom: 12),
                                                                  child: Text("lbl_total_points".tr,
                                                                      overflow: TextOverflow.ellipsis, textAlign: TextAlign.left,
                                                                      style: AppStyle.txtPoppinsBold16.copyWith(fontSize: 16)))
                                                            ])),
                                                    Padding(
                                                        padding: getPadding(
                                                            top: 23,
                                                            right: 20,
                                                            bottom: 20),
                                                        child: Text(
                                                            controller.rewardResponseModel!.value.data!.totalPoints != null
                                                                ? controller.rewardResponseModel!.value.data!.totalPoints!.toString()
                                                                : "0",
                                                            overflow: TextOverflow.ellipsis,
                                                            textAlign: TextAlign.left,
                                                            style: AppStyle.txtPoppinsBold16.copyWith(letterSpacing: 0.36)))
                                                  ])),
                                          // Container(
                                          //     margin: getMargin(top: 16),
                                          //     decoration: BoxDecoration(
                                          //       borderRadius: BorderRadius.all(
                                          //           Radius.circular(
                                          //         getHorizontalSize(10.00),
                                          //       )),
                                          //       border: Border.all(
                                          //         color: ColorConstant.hintTextColor.withOpacity(0.2),
                                          //       ),
                                          //     ),
                                          //     child: Row(
                                          //         mainAxisAlignment: MainAxisAlignment.start,
                                          //         crossAxisAlignment: CrossAxisAlignment.center,
                                          //         mainAxisSize: MainAxisSize.max,
                                          //         children: [
                                          //           Padding(
                                          //               padding: getPadding(
                                          //                   left: 10,
                                          //                   top: 18,
                                          //                   bottom: 18),
                                          //               child: ClipRRect(
                                          //                   child: CommonImageView(
                                          //                       svgPath: ImageConstant.imgGroup37359,
                                          //                       height: getVerticalSize(31.00),
                                          //                       width: getHorizontalSize(32.00),
                                          //                       fit: BoxFit.cover))),
                                          //           Padding(
                                          //               padding: getPadding(
                                          //                   left: 15,
                                          //                   top: 18,
                                          //                   bottom: 18),
                                          //               child: Text(
                                          //                   "lbl_redeem_points".tr,
                                          //                   overflow: TextOverflow.ellipsis,
                                          //                   textAlign: TextAlign.left,
                                          //                   style: AppStyle.txtPoppinsMedium16.copyWith(
                                          //                           height: 1.00,
                                          //                           fontSize: 16))),
                                          //           Spacer(),
                                          //           Padding(
                                          //               padding: getPadding(
                                          //                   left: 15,
                                          //                   top: 18,
                                          //                   right: 15,
                                          //                   bottom: 18),
                                          //               child: Text(
                                          //                   "coming_soon".tr,
                                          //                   overflow: TextOverflow.ellipsis,
                                          //                   textAlign: TextAlign.left,
                                          //                   style: AppStyle.txtPoppinsMedium16.copyWith(
                                          //                     height: 1.00,
                                          //                     color: ColorConstant.hintTextColor.withOpacity(0.5),
                                          //                     fontWeight: FontWeight.w500,
                                          //                     fontSize: 16,
                                          //                   ))),
                                          //         ])),
                                          Container(
                                              width: double.infinity,
                                              margin: getMargin(top: 16),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(getHorizontalSize(10.00),
                                                )),
                                                border: Border.all(
                                                  color: ColorConstant
                                                      .hintTextColor
                                                      .withOpacity(0.2),
                                                ),
                                              ),
                                              child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                        padding: getPadding(
                                                            left: 14,
                                                            top: 13,
                                                            right: 14),
                                                        child: Text("my_badges".tr,
                                                            overflow: TextOverflow.ellipsis,
                                                            textAlign:TextAlign.left,
                                                            style: AppStyle.txtPoppinsBold16
                                                                .copyWith(letterSpacing: 0.36,
                                                                    height: 1.00))),
                                                    controller.rewardResponseModel!.value.data!.badges!=null?controller.rewardResponseModel!.value.data!.badges!.length>0?Container(
                                                      height: 100,

                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left:8.0),
                                                          child: ListView.builder(
                                                              physics: BouncingScrollPhysics(),
                                                              shrinkWrap: true,
                                                              scrollDirection: Axis.horizontal,
                                                              itemCount: controller.rewardResponseModel!.value.data!.badges!.length,
                                                              itemBuilder: (context, index) {
                                                                return Row(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 5.0,top: 20,bottom: 20,right: 5),
                                                                      child: ClipRRect(
                                                                          borderRadius: BorderRadius.circular(
                                                                              getHorizontalSize(10.00)),
                                                                          child: CommonImageView(
                                                                              url: controller.rewardResponseModel!.value.data!.badges![index].badge!,
                                                                              height: getSize(50.00),
                                                                              width: getSize(50.00),
                                                                              fit: BoxFit.cover)),
                                                                    ),
                                                                  ],
                                                                );
                                                              }),
                                                        )):Padding(
                                                              padding: const EdgeInsets.all(15.0),
                                                              child: Text("no_badge_found".tr,
                                                        overflow: TextOverflow.ellipsis,
                                                        textAlign:TextAlign.left,
                                                        style: AppStyle.txtPoppinsMedium14
                                                              .copyWith(letterSpacing: 0.36,
                                                              height: 1.00)),
                                                            ):Padding(
                                                      padding: const EdgeInsets.all( 15.0),
                                                              child: Text("no_badge_found".tr,
                                                        overflow: TextOverflow.ellipsis,
                                                        textAlign:TextAlign.left,
                                                        style: AppStyle.txtPoppinsMedium14
                                                              .copyWith(letterSpacing: 0.36,
                                                              height: 1.00)),
                                                            ),
                                                  ])),
                                          controller.rewardResponseModel!.value.data!.points!=null ?controller.rewardResponseModel!.value.data!.points!.length>0?
                                          ListView.builder(
                                              physics: BouncingScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: controller.rewardResponseModel!.value.data!.points!.length,
                                              itemBuilder: (context, ind) {
                                                return Container(
                                                  width: double.infinity,
                                                  margin: getMargin(top: 15,bottom: 5),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(getHorizontalSize(10.00),
                                                        )),
                                                    border: Border.all(
                                                      color: ColorConstant.hintTextColor.withOpacity(0.2),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(top:0.0),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                            color: ColorConstant.gray100,
                                                            borderRadius: BorderRadius.only(
                                                              topLeft:   Radius.circular(getHorizontalSize(10.00)),
                                                              topRight:   Radius.circular(getHorizontalSize(10.00)),
                                                            ),

                                                          ),

                                                          width: double.infinity,
                                                          padding: getPadding(left: 10, top: 15, right: 10, bottom: 10,),
                                                          child: Text(controller.rewardResponseModel!.value.data!.points![ind].date!=null?Utils.getFormatedDate(controller.rewardResponseModel!.value.data!.points![ind].date!):"-",
                                                              overflow: TextOverflow.ellipsis,
                                                              textAlign: TextAlign.left,
                                                              style: AppStyle.txtPoppinsRegular14Gray500),
                                                        ),
                                                        Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Flexible(
                                                                  child: Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    children: [

                                                                      Padding(
                                                                        padding: getPadding(left: 10, top: 15,right: 10),
                                                                        child: RichText(
                                                                          maxLines: 3,
                                                                          overflow: TextOverflow.ellipsis,
                                                                          text: TextSpan(
                                                                            children: [
                                                                              TextSpan(
                                                                                text: controller.rewardResponseModel!.value.data!.points![ind].name != null
                                                                                    ? controller.rewardResponseModel!.value.data!.points![ind].name!
                                                                                    : "-",
                                                                                style: AppStyle.txtPoppinsBold16,
                                                                              ),
                                                                              TextSpan(
                                                                                text: controller.rewardResponseModel!.value.data!.points![ind].points != null
                                                                                    ? " (+${controller.rewardResponseModel!.value.data!.points![ind].points.toString()} PT)"
                                                                                    : "",
                                                                                style: AppStyle.txtMuliBold16.copyWith(
                                                                                  letterSpacing: 0.06,
                                                                                  color: ColorConstant.green600,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: getPadding(
                                                                            left: 11,
                                                                            top: 5,
                                                                            bottom: 10,
                                                                          right: 10
                                                                        ),
                                                                        child: Text(controller.rewardResponseModel!.value.data!.points![ind].description!=null?controller.rewardResponseModel!.value.data!.points![ind].description!.toString():"-",
                                                                            overflow: TextOverflow.ellipsis,
                                                                            maxLines: 3,
                                                                            style: AppStyle
                                                                                .txtPoppinsRegular14Bluegray400),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                controller.rewardResponseModel!.value.data!.points![ind].badge!=null?
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 0.0,top: 15,bottom: 15,right: 15),
                                                                  child: ClipRRect(
                                                                      borderRadius: BorderRadius.circular(
                                                                          getHorizontalSize(10.00)),
                                                                      child: CommonImageView(
                                                                          url: controller.rewardResponseModel!.value.data!.points![ind].badge,
                                                                          height: getSize(50.00),
                                                                          width: getSize(50.00),
                                                                          fit: BoxFit.fill)),
                                                                ): Offstage(),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              })
                                              :Padding(
                                            padding: const EdgeInsets.all( 15.0),
                                                child: Text("no_points_found".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign:TextAlign.left,
                                                style: AppStyle.txtPoppinsMedium14.copyWith(letterSpacing: 0.36, height: 1.00)),
                                              )
                                              :Padding(
                                            padding: const EdgeInsets.all( 15.0),
                                                child: Text("no_points_found".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign:TextAlign.left,
                                                style: AppStyle.txtPoppinsMedium14.copyWith(letterSpacing: 0.36, height: 1.00)),
                                              )
                                        ]
                                    )
                                )
                            )
                        )
                      ]
                  )
              );
            })
        )
    );
  }
}
