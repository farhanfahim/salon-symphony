import 'dart:io';

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:salon_symphony/core/utils/dummy_content.dart';
import 'package:salon_symphony/core/utils/responsive.dart';
import 'package:salon_symphony/widgets/no_internet_found.dart';
import 'package:salon_symphony/widgets/response_binding_widget.dart';
import 'package:salon_symphony/widgets/skeleton.dart';
import 'package:salon_symphony/widgets/widgets_shimmer.dart';

import '../../core/utils/helper_functions.dart';
import '../../core/utils/utils.dart';
import '../../widgets/custom_event_tile.dart';
import '../../widgets/search_text_field.dart';
import '../home_events_all_page/home_events_all_page.dart';
import '../home_events_details_screen/home_events_details_screen.dart';
import '../resource_library_page/widgets/item_widget.dart';
import '../search_screen/search_screen.dart';
import 'controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_icon_button.dart';


class HomeScreen extends StatelessWidget {
  HomeController controller = Get.put(HomeController());

  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return Obx(() => controller.isInternetAvailable.value ?
        ResponseBindingWidget(
        apiCallStatus: controller.apiCallStatus.value,
        loadingWidget: () {
          return homeEventsShimmer(context, controller.getModifiedName(controller.user.value.name!));
        },
        errorWidget: () {
          return Container();
        },
        emptyWidget: () {
          return CustomRefreshIndicator(
              onRefresh: () async {
                controller.getEvents();
              },
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),

                child: Padding(
                  padding: getPadding(left: 15,right: 15,top: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Hi there, ${controller.getModifiedName(controller.user.value.name!)}!",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsSemiBold20
                              .copyWith( height: 1.00,fontSize: 28, fontWeight: FontWeight.w700)),
                      SizedBox(
                        height: responsive.setHeight(1.3),
                      ),
                      Text("Today is ${Utils.getCurrentDay()}, ${Utils.getFormatedDateHome(DateTime.now())}",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsRegular12Black900
                              .copyWith( height: 1.00,fontSize: 14, fontWeight: FontWeight.w400)),

                      SizedBox(
                        height: responsive.setHeight(3),
                      ),

                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: getPadding(
                            left: 14,
                            top: 106,
                            right: 14,
                          ),
                          child: CommonImageView(
                            svgPath: ImageConstant.emptyQuote,
                            height: getSize(
                              110.00,
                            ),
                            width: getSize(
                              140.00,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: getPadding(
                            left: 14,
                            top: 23,
                            right: 14,
                          ),
                          child: Text(
                            "I never dreamed about success. \nI worked for it.",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: AppStyle.txtPoppinsRegular16Bluegray100
                                .copyWith(
                              color: ColorConstant.gray7F7F88,
                              height: 1.50,
                              letterSpacing: 0.06,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: getPadding(
                            left: 14,
                            top: 21,
                            right: 14,
                          ),
                          child: Text(
                            'Estée Lauder',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsMediumItalic14.copyWith(
                              color: ColorConstant.gray7F7F88,
                              fontStyle: FontStyle.italic,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: responsive.setHeight(28),
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
        },
        successWidget:(){
          return Padding(
            padding: getPadding(left: 15,right: 15,top: 5),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: responsive.setHeight(1.5),
                // ),
                Obx(() =>  Text("Hi there, ${controller.getModifiedName(controller.user.value.name!)}!",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsSemiBold20
                        .copyWith( height: 1.00,fontSize: 28, fontWeight: FontWeight.w700)),),
                SizedBox(
                  height: responsive.setHeight(1.3),
                ),
                Text("Today is ${Utils.getCurrentDay()}, ${Utils.getFormatedDateHome(DateTime.now())}",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsRegular12Black900
                        .copyWith( height: 1.00,fontSize: 14, fontWeight: FontWeight.w400)),

                SizedBox(
                  height: responsive.setHeight(3),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("lbl_upcoming_events".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsMedium14
                              .copyWith( height: 1.00,
                              fontSize: 12,
                              fontWeight: FontWeight.w600)),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(AppRoutes.homeAllScreen)!.then((value) => controller.getEvents());

                            },
                            child: Padding(
                                padding: getPadding(top: 1, bottom: 3,right: 2),
                                child: Text("Filters »",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsRegular12.copyWith(
                                        fontSize: 12,color: ColorConstant.black900,fontWeight: FontWeight.w600))),
                          ),
                          // Padding(
                          //     padding: getPadding(top: 1, bottom: 3),
                          //     child:  Icon(
                          //       Icons.arrow_forward_outlined,
                          //       size: 13,
                          //       color: ColorConstant.black900,
                          //     )
                          // )
                        ],
                      ),


                    ]),
                SizedBox(
                  height: responsive.setHeight(0.5),
                ),
                Obx(() => Expanded(
                  child: CustomRefreshIndicator(
                    onRefresh: () async{
                      controller.getEvents();
                    },
                   // color: ColorConstant.deepPurpleA101,
                    child: ListView.builder(
                        itemCount: controller.eventsApiList!.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                        itemBuilder: (BuildContext context,int index){
                          return  GestureDetector(
                            onTap: (){
                              Get.toNamed(AppRoutes.homeEventsDetailsScreen, arguments: {
                                "index": index,
                                "id": controller.eventsApiList![index].id,
                              })!.then((value) => controller.getEvents());
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0, top: 5),
                              child: CustomEventTile(index: index,homeScreen: true, data2: controller.eventsApiList![index],length:controller.eventsApiList!.length),
                            ),
                          );
                        }),
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
                )),
                // SizedBox(
                //   height: responsive.setHeight(3),
                // ),


              ],
            ),
          );
        }) : NoInternetFound(context, (){controller.getEvents();})
    );
  }


  onTapImgNotification() {
    Get.toNamed(AppRoutes.notificationScreen);
  }

}
