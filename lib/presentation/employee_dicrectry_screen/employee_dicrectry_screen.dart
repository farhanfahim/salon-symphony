import 'dart:io';

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/core/utils/responsive.dart';
import 'package:salon_symphony/widgets/error_widget.dart';
import 'package:salon_symphony/widgets/response_binding_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../core/utils/helper_functions.dart';
import '../../core/utils/utils.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/search_text_field.dart';
import '../../widgets/widgetSkeleton.dart';
import '../search_screen/search_screen.dart';
import 'controller/employee_dicrectry_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

class EmployeeDicrectryScreen extends GetWidget<EmployeeDicrectryController> {
  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return BaseviewScreen(
        basicAppBar: true,
        screenName: " Team Members",
        showBottomBar: false,
        sidePadding: false,
        backgroundColor: ColorConstant.whiteA700,
        basicAppTrailingIcon: ImageConstant.imgMenuIcon,
        basicAppTrailingIconOnTap: () {
          HelperFunction.showBottomSheet(context,
              screenTitle: 'Members Option',
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
              return RecordDeletedWidget();
            },
            loadingWidget: () {
              return Column(
                children: [
                  listShimmer(),
                ],
              );
            },
            emptyWidget: (){
              return CustomRefreshIndicator(
               // color: ColorConstant.deepPurpleA201,
                onRefresh: () async {
                  if (controller.arrOfUsers.isNotEmpty) {
                    controller.arrOfUsers.clear();
                  }
                  await controller.getUsers();
                },
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  child: SizedBox(
                    width: double.maxFinite,
                    height: 500,
                    child: Center(
                      child: Text(
                          'No Record Found'.tr,
                          style: AppStyle.txtPoppinsSemiBold16.copyWith(
                            height: 1.50,
                            letterSpacing: 0.5,
                          )
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
                                height: 24, // Adjust the height as needed
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
              );
            },
            successWidget: (){
              return Container(
                  color: ColorConstant.whiteA700,
                  width: size.width,
                  child: Container(
                      color: ColorConstant.whiteA700,
                      width: size.width,
                      child: Obx(() => Stack(
                        children: [
                          CustomRefreshIndicator(
                            //color: ColorConstant.deepPurpleA201,
                            onRefresh: () async {
                              if (controller.arrOfUsers.isNotEmpty) {
                                controller.arrOfUsers.clear();
                              }
                              await controller.getUsers();
                            },
                            child: ScrollablePositionedList.builder(
                                itemScrollController: controller.itemScrollController,
                                itemPositionsListener: controller.itemPositionsListener,
                                itemCount: controller.arrOfUsers.length,
                                itemBuilder: (context, index) => /*controller.arrOfUsers[index].id!=-1?*/
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0 ,right: 15.0),
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.toNamed(AppRoutes.employeeDicrectryDetailsScreen,arguments: {
                                            'id': controller.arrOfUsers[index].id,
                                            'name': controller.arrOfUsers[index].name,
                                          });
                                        },
                                        child: Container(
                                          margin: getMargin(right: 10),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              getHorizontalSize(25.00),
                                            ),
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              Get.toNamed(AppRoutes.employeeDicrectryDetailsScreen,arguments: {
                                                'id': controller.arrOfUsers[index].id,
                                                'name': controller.arrOfUsers[index].name,
                                              });
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(top:12,bottom: 12),
                                                  child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(
                                                        getHorizontalSize(25.00),
                                                      ),
                                                      child: controller.arrOfUsers[index].image != null && controller.arrOfUsers[index].image != '' ?
                                                      CommonImageView(
                                                        url: controller.arrOfUsers[index].image!,
                                                        height: getSize(50.00),
                                                        width: getSize(50.00),
                                                        fit: BoxFit.cover,
                                                      ): CommonImageView(
                                                        svgPath: ImageConstant.imgUser,
                                                        height: getSize(50.00),
                                                        width: getSize(50.00),
                                                      )
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: getPadding(
                                                        left: 14,
                                                        // top: 12,
                                                        bottom: 5,
                                                      ),
                                                      child: Text(
                                                        controller.arrOfUsers[index].name!,
                                                        overflow: TextOverflow.ellipsis,
                                                        textAlign: TextAlign.left,
                                                        style: AppStyle.txtPoppinsRegular14Black900.copyWith(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: getPadding(
                                                        left: 14,
                                                        // bottom: 16,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "${controller.arrOfUsers[index].position != null ? controller.arrOfUsers[index].position!.name! : "N/A"} ",
                                                            overflow: TextOverflow.ellipsis,
                                                            textAlign: TextAlign.left,
                                                            style: AppStyle.txtPoppinsRegular14Black900.copyWith(
                                                              color: ColorConstant.hintTextColor,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons.circle,
                                                            color: ColorConstant.hintTextColor.withOpacity(0.5),
                                                            size: getSize(
                                                              4.00,
                                                            ),
                                                          ),
                                                          Text(
                                                            ' ${controller.arrOfUsers[index].location != null ? controller.arrOfUsers[index].location!.name : "N/A"}',
                                                            overflow: TextOverflow.ellipsis,
                                                            textAlign: TextAlign.left,
                                                            style: AppStyle.txtPoppinsRegular14Black900.copyWith(
                                                              color: ColorConstant.hintTextColor,
                                                              fontSize: 12,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: getVerticalSize(1.00),
                                        width: getHorizontalSize(324.00),
                                        // margin: getMargin(top: 10),
                                        decoration: BoxDecoration(
                                          color: ColorConstant.gray100,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              /*:Container(height: 0,)*/),
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
                                            height: 24, // Adjust the height as needed
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
                          ),

                          // Positioned(
                          //   right: 0,
                          //   child: Container(
                          //     color: ColorConstant.whiteA700,
                          //     alignment: Alignment.center,
                          //     width: 30,
                          //     height: size.height,
                          //     //padding: const EdgeInsets.only(right: 15),
                          //     child: Column(
                          //       // mainAxisAlignment: MainAxisAlignment.center,
                          //       children: controller.alphabetList
                          //           .map((alphabet) => GestureDetector(
                          //         onTap: () {
                          //           controller.setSearchIndex(alphabet);
                          //         },
                          //         child: Container(
                          //           color: ColorConstant.whiteA700,
                          //           width: 15,
                          //           child: Text(
                          //             alphabet,
                          //             textAlign:TextAlign.center,
                          //             style: AppStyle.txtPoppinsMedium10DeeppurpleA201.copyWith(fontSize: 11,height: 2),
                          //           ),
                          //         ),
                          //       )).toList(),
                          //     ),
                          //   ),
                          // )
                        ],
                      ),)));
            })));
  }

  onTapImgArrowleft() {
    Get.back();
  }

  onTapRowrectangle1416() {}
}
