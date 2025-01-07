import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';

import '../../widgets/expandable_tile.dart';
import '../../widgets/response_binding_widget.dart';
import '../../widgets/widgetSkeleton.dart';
import '../request_all_page/widgets/request_all_item_widget.dart';
import 'controller/request_approved_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

// ignore_for_file: must_be_immutable
class RequestApprovedPage extends StatelessWidget {
  RequestApprovedController controller = Get.put(RequestApprovedController());

  @override
  Widget build(BuildContext context) {
    return Obx(() =>  ResponseBindingWidget(
        apiCallStatus: controller.apiCallStatus.value,
        errorWidget: () {
          return Container();
        },
        loadingWidget: () {
          return Column(
            children: [
              requestListShimmer(),
            ],
          );
        },
        // emptyWidget: (){
        //   return CustomRefreshIndicator(
        //     //color: ColorConstant.black900,
        //       onRefresh: () async {
        //         if (controller.arrOfTimeRequest.isNotEmpty) {
        //           controller.arrOfTimeRequest.clear();
        //         }
        //         if (controller.arrOfEducationRequest.isNotEmpty) {
        //           controller.arrOfEducationRequest.clear();
        //         }
        //         if (controller.arrOfScheduleRequest.isNotEmpty) {
        //           controller.arrOfScheduleRequest.clear();
        //         }
        //         await controller.getRequest();
        //       },
        //       child: SingleChildScrollView(
        //         physics: AlwaysScrollableScrollPhysics(),
        //         child: SizedBox(
        //           width: double.maxFinite,
        //           height: 650,
        //           child: Center(
        //             child: Text(
        //                 'No Record Found'.tr,
        //                 style: AppStyle.txtPoppinsSemiBold16.copyWith(
        //                   height: 1.50,
        //                   letterSpacing: 0.5,
        //                 )
        //             ),
        //           ),
        //         ),
        //       ),
        //       builder: (
        //           BuildContext context,
        //           Widget child,
        //           IndicatorController controller,
        //           ) {
        //         return Stack(
        //           alignment: Alignment.topCenter,
        //           children: <Widget>[
        //             if (!controller.isIdle)
        //               Positioned(
        //                 top: 25.0 ,
        //                 child: SizedBox(
        //                   height: 30,
        //                   width: 30,
        //                   child:  Image.asset(
        //                     ImageConstant.spinnerImage, // Replace with the actual path to your image
        //                     width: 24, // Adjust the width as needed
        //                     height: 24, // Adjust the height as needed
        //                     // You can apply color to the image if needed
        //                   ),
        //
        //                 ),
        //               ),
        //             Transform.translate(
        //               offset: Offset(0, 10.0 * controller.value),
        //               child: child,
        //             ),
        //           ],
        //         );
        //       }
        //   );
        // },
        successWidget: () {
          return CustomRefreshIndicator(
              onRefresh: () async {
                if (controller.arrOfTimeRequest.isNotEmpty) {
                  controller.arrOfTimeRequest.clear();
                  controller.totalRecords.clear();
                }
                if (controller.arrOfEducationRequest.isNotEmpty) {
                  controller.arrOfEducationRequest.clear();
                  controller.totalRecords.clear();
                }
                if (controller.arrOfScheduleRequest.isNotEmpty) {
                  controller.arrOfScheduleRequest.clear();
                  controller.totalRecords.clear();
                }
                await controller.getRequest();
              },
              child: Container(
                height: double.maxFinite,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  child: Column(
                    children: [
                      Expandable_tile(
                        title: "Time Off (${controller.arrOfTimeRequest.value.length})",
                        collapseChild: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.arrOfTimeRequest.value.length,
                            itemBuilder: (context, index) {

                              return controller.arrOfTimeRequest.value.length>0? RequestAllItemWidget(
                                controller.arrOfTimeRequest[index],
                                onTap: () {
                                  Get.toNamed(AppRoutes.requestDetailsTimeOffScreen,arguments: {'type':"approved",'status':10,"requestId":controller.arrOfTimeRequest[index].id});

                                },
                                index: index,
                                lastIndex: controller.arrOfTimeRequest.length-1,

                              ):Container();
                            }),
                      ),
                    Container(
                        height: 1,
                        width: double.maxFinite,
                        color: ColorConstant.gray200,
                      ),

                      Expandable_tile(
                        title: "Education (${controller.arrOfEducationRequest.value.length})",
                        collapseChild: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.arrOfEducationRequest.value.length,
                            itemBuilder: (context, index) {

                              return  controller.arrOfEducationRequest.value.length>0?RequestAllItemWidget(
                                controller.arrOfEducationRequest[index],
                                onTap: () {
                                  Get.toNamed(AppRoutes.requestDetailsTimeOffScreen,arguments: {'type':"approved",'status':20,"requestId":controller.arrOfEducationRequest[index].id});

                                },
                                index: index,
                                lastIndex: controller.arrOfEducationRequest.length -1,
                              ):Container();
                            }),
                      ),
                      Container(
                        height: 1,
                        width: double.maxFinite,
                        color: ColorConstant.gray200,
                      ),

                     Expandable_tile(
                        title: "Schedule (${controller.arrOfScheduleRequest.value.length})",
                        collapseChild: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.arrOfScheduleRequest.value.length,
                            itemBuilder: (context, index) {

                              return  controller.arrOfScheduleRequest.value.length>0?RequestAllItemWidget(
                                controller.arrOfScheduleRequest[index],
                                onTap: () {
                                  Get.toNamed(AppRoutes.requestDetailsTimeOffScreen,arguments: {'type':"approved",'status':30,"requestId":controller.arrOfScheduleRequest[index].id});

                                },
                                index: index,
                                lastIndex: controller.arrOfScheduleRequest.length -1,

                              ):Container();
                            }),
                      ),
                   Container(
                        height: 1,
                        width: double.maxFinite,
                        color: ColorConstant.gray200,
                      ),


                    ],
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
        }
    ));
  }
}
