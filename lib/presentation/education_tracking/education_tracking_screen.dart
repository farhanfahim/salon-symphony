import 'dart:io';

import 'package:blur/blur.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/core/utils/helper_functions.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import '../../core/loader.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/widgets_shimmer.dart';
import 'controller/education_tracking_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

import 'model/education_response_model.dart';

class EducationTrackingScreen extends StatelessWidget {
  EducationTrackingController controller = Get.put(EducationTrackingController());
  @override
  Widget build(BuildContext context) {
    return BaseviewScreen(
      basicAppBar: true,
      screenName: "Education Hours",
      showBottomBar: false,
      bottomSafeArea: true,
      mainTopHeight: 0,
      sidePadding: false,
      backgroundColor: ColorConstant.whiteA700,
      basicAppTrailingIcon: ImageConstant.imgMenuIcon,
      basicAppTrailingIconOnTap: () {
        HelperFunction.showBottomSheet(context,
            screenTitle: 'Education Option',
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
      child:  Column(
        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Container(
                  height: 90,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CommonImageView(
                          imagePath: ImageConstant.education_clock,
                          height: 50,
                          width: 50,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text("Total Hours",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsSemiBold17),
                              Text('All approved education hours.',
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .txtPoppinsRegular12Gray600)
                            ],
                          ),
                        ),
                        Spacer(),
                        Obx(() =>
                        controller.isApiCalling2.value == false ?
                            Text(controller.educationHoursCount.value.data!.totalApprovedHours !=0 ? controller.educationHoursCount.value.data!.totalApprovedHours.toString():'0',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsSemiBold24): Text('0',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsSemiBold24))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(child:  CustomRefreshIndicator(
                   // color: ColorConstant.black900,
                    onRefresh: () async {
                      if (controller.pagingController.itemList!.isNotEmpty) {
                        controller.pagingController.itemList!.clear();
                      }
                      controller.currentPage.value = 1;
                      controller.pagingController.refresh();
                      controller.isApiCalling.value = true;
                      controller.getTotalHours();
                    },
                    child: PagedListView<int, EducationData>(
                      pagingController: controller.pagingController,
                      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      builderDelegate: PagedChildBuilderDelegate<EducationData>(
                        itemBuilder: (context, item, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.educationTrackingDetailsScreen,arguments: {'id':item.id!});
                            },
                            child: Container(
                              margin: getMargin(
                                top: 8.0,
                                bottom: 8.0,
                              ),
                              padding: getPadding(
                                left: 13,
                                top: 12,
                                right: 13,
                                bottom: 12,
                              ),
                              decoration:
                              AppDecoration.outlineGray3012.copyWith(
                                borderRadius:
                                BorderRadiusStyle.roundedBorder10,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: getPadding(
                                      left: 2,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: getPadding(
                                            top: 5,
                                          ),
                                          child: Text(
                                            item.educator!=null? item.educator!:"-",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtPoppinsRegular12Gray600,
                                          ),
                                        ),
                                        CommonImageView(
                                          imagePath:
                                          item.status ==20?ImageConstant.green_chekmark:"",
                                          height: getSize(
                                            19.00,
                                          ),
                                          width: getSize(
                                            19.00,
                                          ),
                                          margin: getMargin(
                                            bottom: 4,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 2,
                                      top: 1,
                                    ),
                                    child: Text(
                                      item.className!=null? item.className!:"-",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsSemiBold14
                                          .copyWith(
                                        height: 1.53,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: getPadding(
                                      left: 2,
                                      top: 9,
                                      right: 79,
                                      bottom: 7,
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.4,
                                          child: Row(
                                            children: [
                                              CommonImageView(
                                                svgPath: ImageConstant
                                                    .imgComputer24X24,
                                                height: getSize(
                                                  18.00,
                                                ),
                                                width: getSize(
                                                  18.00,
                                                ),
                                                margin: getMargin(
                                                  bottom: 1,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 8,
                                                  top: 1,
                                                ),
                                                child: Text(
                                                  item.date!=null? Utils.getFormatedDate(item.date!):"-",
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtPoppinsRegular12Black900
                                                      .copyWith(
                                                    letterSpacing: 0.5,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),


                                        CommonImageView(
                                          svgPath: ImageConstant.imgClock,
                                          height: getSize(
                                            19.00,
                                          ),
                                          width: getSize(
                                            19.00,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 6,
                                          ),
                                          child: Text(
                                            '${item.hour!=null?item.hour!.length>5? item.hour!.substring(0,4):item.hour!:"0"} Hours',
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtPoppinsRegular12Black900
                                                .copyWith(
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        noItemsFoundIndicatorBuilder: (context) =>
                        controller.isApiCalling.value
                            ? educationHours(context)//shimmer
                            : SizedBox(
                          width: double.maxFinite,
                          height: 500,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  "You're all caught up!",
                                  style: AppStyle.txtPoppinsSemiBold16.copyWith(
                                    height: 1.50,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  )
                              ),
                              Text(
                                  'Approved education hours will appear here.',
                                  style: AppStyle.txtPoppinsSemiBold16.copyWith(
                                    height: 1.50,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                  )
                              ),
                            ],
                          ),
                        ), //shimmer
                        firstPageProgressIndicatorBuilder: (context) =>
                            educationHours(context), //shimmer
                        newPageProgressIndicatorBuilder: (context) => Padding(
                          padding: EdgeInsets.all(5),
                          child: Container(
                            height: 30.0,
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Container(
                                height: 30.0,
                                child: Loader(
                                  isLoading: true,
                                  color: ColorConstant.black900,
                                ),
                              ),
                            ), //loader
                          ),
                        ),
                      ),
                    ),
                    builder: (
                        BuildContext context,
                        Widget child,
                        IndicatorController controller,
                        ) {
                      return Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          if (!controller.isIdle)
                            Positioned(
                              top: 25.0 ,
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child:  Image.asset(
                                  ImageConstant.spinnerImage, // Replace with the actual path to your image
                                  width: 24, // Adjust the width as needed
                                  height: 24,
                                 // Adjust the height as needed
                                  // You can apply color to the image if needed
                                ),

                              ),
                            ),
                          Transform.translate(
                            offset: Offset(0, 10.0 * controller.value),
                            child: child,
                          ),
                        ],
                      );
                    }
                ))
              ],
            ),
          ),),
          Stack(
            children: [
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: ColorConstant.whiteA700,
                  border: Border(
                    top: BorderSide(
                      color: ColorConstant.stickyBorderColor.withOpacity(0.3),
                    ),
                  ),
                ),
              ),
              Positioned(
                child: CustomButton(
                  width: 343,
                  text: "Submit Hours",
                  prefixWidget: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.add,
                      color: ColorConstant.whiteA700,
                    ),
                  ),
                  margin: getMargin(left: 16, top: 15, right: 16),
                  padding: ButtonPadding.PaddingAll18,
                  fontStyle: ButtonFontStyle.PoppinsSemiBold16,
                  onTap: () {
                    Get.toNamed(AppRoutes.addAddEducationTrackingScreen ,arguments: {"isEdit":false});
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }


}
