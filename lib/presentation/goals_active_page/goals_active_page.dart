import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:salon_symphony/core/utils/app_constant.dart';
import 'package:salon_symphony/presentation/goals_active_page/widgets/goals_all_item_widget.dart';
import '../../widgets/expandable_tile.dart';
import '../../widgets/response_binding_widget.dart';
import '../../widgets/widgetSkeleton.dart';
import 'controller/goals_active_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

// ignore_for_file: must_be_immutable

class GoalsActivePage extends StatelessWidget {
  GoalsActiveController controller = Get.put(GoalsActiveController());
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
        successWidget: () {
          return CustomRefreshIndicator(
            //    color: ColorConstant.black900,
              onRefresh: () async {
                if (controller.arrOfWeekly.isNotEmpty) {
                  controller.arrOfWeekly.clear();
                  controller.totalRecords.clear();
                }
                if (controller.arrOfMonthly.isNotEmpty) {
                  controller.arrOfMonthly.clear();
                  controller.totalRecords.clear();

                }
                if (controller.arrOfAnnual.isNotEmpty) {
                  controller.arrOfAnnual.clear();
                  controller.totalRecords.clear();

                }
                if (controller.arrOfCustom.isNotEmpty) {
                  controller.arrOfCustom.clear();
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
                        title: "Weekly Goals (${controller.arrOfWeekly.value.length})",
                        collapseChild: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.arrOfWeekly.value.length,
                            itemBuilder: (context, index) {
                              return
                                controller.arrOfWeekly.value.length>0?
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: GoalsAllItemWidget(
                                        controller.arrOfWeekly[index],
                                        onTap: () {
                                          Get.toNamed(AppRoutes.goalDetailsActiveScreen,arguments: {'type':AppConstant.ACTIVE,"requestId":controller.arrOfWeekly[index].id,"userStatusId":controller.arrOfWeekly[index].userStatus!.id});
                                        },
                                        index: index,
                                      ),
                                    ),
                                    controller.arrOfWeekly.value.length-1!=index?
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15.0 ,top: 10,bottom: 10),
                                      child: Container(
                                        height: 1,
                                        color: ColorConstant.gray200,
                                      ),
                                    ): Offstage()

                                  ],
                                ):Container();
                            }),
                      ),
                      Container(
                        height: 1,
                        width: double.maxFinite,
                        color: ColorConstant.gray200,
                      ),

                      Expandable_tile(
                        title: "Monthly Goals (${controller.arrOfMonthly.value.length})",
                        collapseChild: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.arrOfMonthly.value.length,
                            itemBuilder: (context, index) {

                              return
                                controller.arrOfMonthly.value.length>0?
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child:
                                      GoalsAllItemWidget(
                                        controller.arrOfMonthly[index],
                                        onTap: () {
                                          Get.toNamed(AppRoutes.goalDetailsActiveScreen,arguments: {'type':AppConstant.ACTIVE,"requestId":controller.arrOfMonthly[index].id,"userStatusId":controller.arrOfMonthly[index].userStatus!.id});
                                        },
                                        index: index,
                                      ),
                                    ),
                                    controller.arrOfMonthly.value.length-1!=index?
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15.0 ,top: 10,bottom: 10),
                                      child: Container(
                                        height: 1,
                                        color: ColorConstant.gray200,
                                      ),
                                    ): Offstage()
                                  ],
                                ):Container();
                            }),
                      ),
                      Container(
                        height: 1,
                        width: double.maxFinite,
                        color: ColorConstant.gray200,
                      ),

                      Expandable_tile(
                        title: "Annual Goals (${controller.arrOfAnnual.value.length})",
                        collapseChild: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.arrOfAnnual.value.length,
                            itemBuilder: (context, index) {

                              return
                                controller.arrOfAnnual.value.length>0?
                                Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child:
                                        GoalsAllItemWidget(
                                          controller.arrOfAnnual[index],
                                          onTap: () {
                                            Get.toNamed(AppRoutes.goalDetailsActiveScreen,arguments: {'type':AppConstant.ACTIVE,"requestId":controller.arrOfAnnual[index].id,"userStatusId":controller.arrOfAnnual[index].userStatus!.id});
                                          },
                                          index: index,
                                        )
                                    ),
                                    controller.arrOfAnnual.value.length-1!=index?
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15.0 ,top: 10,bottom: 10),
                                      child: Container(
                                        height: 1,
                                        color: ColorConstant.gray200,
                                      ),
                                    ): Offstage()
                                  ],
                                ):Container();
                            }),
                      ),
                      Container(
                        height: 1,
                        width: double.maxFinite,
                        color: ColorConstant.gray200,
                      ),

                      Expandable_tile(
                        title: "Custom Goals (${controller.arrOfCustom.value.length})",
                        collapseChild: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.arrOfCustom.value.length,
                            itemBuilder: (context, index) {

                              return
                                controller.arrOfCustom.value.length>0?
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child:GoalsAllItemWidget(
                                        controller.arrOfCustom[index],
                                        onTap: () {
                                          Get.toNamed(AppRoutes.goalDetailsActiveScreen,arguments: {'type':AppConstant.ACTIVE,"requestId":controller.arrOfCustom[index].id,"userStatusId":controller.arrOfCustom[index].userStatus!.id});
                                        },
                                        index: index,
                                      ),
                                    ),
                                    controller.arrOfCustom.value.length-1!=index?
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15.0 ,top: 10,bottom: 10),
                                      child: Container(
                                        height: 1,
                                        color: ColorConstant.gray200,
                                      ),
                                    ): Offstage()
                                  ],
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
                        top: 25.0,
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

