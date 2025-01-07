import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/presentation/coverage_team_list/controller/coverage_time_controller.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../widgets/response_binding_widget.dart';
import '../../widgets/widgetSkeleton.dart';

class CoverageTeamListScreen extends StatelessWidget {
  CoverageTimeController controller = Get.put(CoverageTimeController());

  @override
  Widget build(BuildContext context) {
    return BaseviewScreen(
      basicAppBar: true,
      // hideAppBar: true,
      screenName: "Select Member",
      showBottomBar: false,
      showBackButton: false,
      backText: '             ',
      mainTopHeight: 0,
      sidePadding: false,
      blueClrEndTask: true,
      textButtonName: 'Done',
      textOnTap: () {
        Get.back(result: controller.selectedUser);
      },
      backgroundColor: ColorConstant.whiteA700,
      child: Obx(() =>  ResponseBindingWidget(
          apiCallStatus: controller.apiCallStatus.value,
          errorWidget: () {
            return Container();
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
              //color: ColorConstant.black900,
              onRefresh: () async {
                if (controller.arrOfMembers.isNotEmpty) {
                  controller.arrOfMembers.clear();
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
          successWidget: () {
            return Container(
                color: ColorConstant.whiteA700,
                width: size.width,
                child: CustomRefreshIndicator(
                  //color: ColorConstant.black900,
                  onRefresh: () async {
                    if (controller.arrOfMembers.isNotEmpty) {
                      controller.arrOfMembers.clear();
                    }
                    await controller.getUsers();
                  },
                  child: Container(
                      color: ColorConstant.whiteA700,
                      width: size.width,
                      child: Obx(() => Stack(
                        children: [
                          ScrollablePositionedList.builder(
                              itemScrollController: controller.itemScrollController,
                              itemPositionsListener: controller.itemPositionsListener,
                              itemCount: controller.arrOfMembers.length,
                              itemBuilder: (context, index) => controller.arrOfMembers[index].id!=-1?
                              GestureDetector(
                                  onTap: (){
                                    controller.updateUser(index);
                                  },child: Column(
                                    children: [
                                      ListTile(
                                      title: Container(
                                          padding: getPadding(
                                              left: 0,
                                              top: 25,
                                              bottom: 16),
                                          child: Text(
                                              controller.arrOfMembers[index].name!,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtPoppinsRegular14Black900)),
                                      leading: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(
                                              getHorizontalSize(
                                                  25.00)),
                                          child: controller
                                              .arrOfMembers[index].image!=null?CommonImageView(
                                              url: controller
                                                  .arrOfMembers[index].image,
                                              height: getSize(50.00),
                                              width: getSize(50.00),
                                              fit: BoxFit.cover):CommonImageView(
                                            svgPath: ImageConstant.imgUser,
                                            height: getSize(50.00),
                                            width: getSize(50.00),
                                          )),
                                      trailing: controller.arrOfMembers[index].isSelected!.value == true
                                          ? Container(
                                        margin: getMargin(
                                          top: 15,
                                          right: 20,
                                          bottom: 10,),
                                        decoration:
                                        BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder10,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: getSize(18.00,),
                                              width: getSize(18.00,),
                                              margin: getMargin(all: 1,),
                                              decoration: BoxDecoration(
                                                color: ColorConstant.primaryColor,
                                                borderRadius: BorderRadius.circular(
                                                  getHorizontalSize(50,),
                                                ),
                                              ),
                                              child: Icon(Icons.check,
                                                size: 10,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                          : Container(
                                        margin: getMargin(
                                          top: 15,
                                          right: 20,
                                          bottom: 10,
                                        ),
                                        decoration: AppDecoration.outlineBluegray100.copyWith(
                                          borderRadius: BorderRadiusStyle.roundedBorder10,
                                        ),
                                        child:
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: getSize(15.00,),
                                              width: getSize(15.00,),
                                              margin:
                                              getMargin(all: 1,),
                                              decoration:
                                              BoxDecoration(
                                                color: ColorConstant.whiteA700,
                                                borderRadius: BorderRadius.circular(
                                                  getHorizontalSize(50,),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                ),
                                      Divider(),
                                    ],
                                  ),
                              ):Container(height: 0,)),
                          Positioned(
                            right: 0,
                            child: Container(
                              color: ColorConstant.whiteA700,
                              alignment: Alignment.center,
                              width: 30,
                              height: size.height,
                              //padding: const EdgeInsets.only(right: 15),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: controller.alphabetList
                                    .map((alphabet) => GestureDetector(
                                  onTap: () {
                                    controller.setSearchIndex(alphabet);
                                  },
                                  child: Container(
                                    color: ColorConstant.whiteA700,
                                    width: 15,
                                    child: Text(
                                      alphabet,
                                        textAlign:TextAlign.center,
                                      style: AppStyle.txtPoppinsMedium10DeeppurpleA201.copyWith(fontSize: 11,height: 2),
                                    ),
                                  ),
                                )).toList(),
                              ),
                            ),
                          )
                        ],
                      ),)),
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
                ));
          }
      ))
    );
  }
}
