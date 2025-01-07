import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/response_binding_widget.dart';

import '../../core/utils/helper_functions.dart';
import '../../core/utils/responsive.dart';
import '../../data/models/eventsListModel.dart';
import '../../data/services/api_call_status.dart';
import '../../widgets/custom_event_tile.dart';
import '../../widgets/skeleton.dart';
import '../../widgets/widgets_shimmer.dart';
import '../home_events_details_screen/home_events_details_screen.dart';
import 'controller/home_events_all_controller.dart';
import 'models/home_events_all_model.dart';

// ignore_for_file: must_be_immutable
class HomeEventsAllPage extends StatelessWidget {
  HomeEventsAllController controller =
  Get.put(HomeEventsAllController());
  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return BaseviewScreen(
      basicAppBar: true,
      screenName: "Events",
      showBottomBar: false,
      sidePadding: false,
      stickyHeader: true,
      mainTopHeight: 0,
      backgroundColor: ColorConstant.backgroundColor,
      isMenuTab: true,
      basicAppTrailingIcon: ImageConstant.filterAppBar_icon,
      basicAppTrailingIconOnTap: () {
        HelperFunction.showBottomSheet(
          context,
          bottomSheetHeight: responsive.setHeight(38),
          spaceBetween: responsive.setHeight(4),
          screenTitle: "Filter Events",
          screenEndTask: 'Done',
          widget: Column(
            children: [
              Obx(() =>
              (ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.arrOfOptions.length,
                itemBuilder: (context, index) {

                  return GestureDetector(
                    onTap: () {
                      controller.updateQuizItem(index);
                      controller.currentPage = 1;
                    },
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  controller.arrOfOptions[index].name!,
                                  overflow: TextOverflow.ellipsis,
                                  textScaleFactor: 1.0,
                                  textAlign: TextAlign.left,
                                  style:
                                  AppStyle.txtPoppinsRegular14.copyWith(
                                    height: 1.29,
                                  ),
                                ),
                                Spacer(),
                                Obx(() =>
                                (controller.arrOfOptions[index]
                                    .selected!.value ==
                                    true
                                    ?  Container(
                                  margin: getMargin(
                                    top: 15,
                                    right: 5,
                                    bottom: 15,
                                  ),
                                  decoration:
                                  AppDecoration.outlineBluegray100.copyWith(
                                    borderRadius: BorderRadiusStyle.roundedBorder10,
                                    border: Border.all(
                                      color: ColorConstant.primaryColor,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: getSize(
                                          15.00,
                                        ),
                                        width: getSize(
                                          15.00,
                                        ),
                                        margin: getMargin(
                                          all: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: ColorConstant.primaryColor,
                                          borderRadius: BorderRadius.circular(
                                            getHorizontalSize(
                                              50,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                    : Container(
                                  margin: getMargin(
                                    top: 15,
                                    right: 5,
                                    bottom: 15,
                                  ),
                                  decoration: AppDecoration
                                      .outlineBluegray100
                                      .copyWith(
                                    borderRadius: BorderRadiusStyle
                                        .roundedBorder10,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: getSize(
                                          15.00,
                                        ),
                                        width: getSize(
                                          15.00,
                                        ),
                                        margin: getMargin(
                                          all: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color:
                                          ColorConstant.whiteA700,
                                          borderRadius:
                                          BorderRadius.circular(
                                            getHorizontalSize(
                                              50,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ))),
                              ],
                            ),
                          ),
                          index == 2 ? Offstage() : Divider(),
                        ],
                      ),
                    ),
                  );
                },
              ))),
            ],
          ),
        );
      },
      child: Obx(() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AbsorbPointer(
            absorbing: controller.isApiCalling.value,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: DefaultTabController(
                length: controller.tabs.value.length,
                child: Column(
                  children: [
                    Obx(() =>
                  controller.apiCallStatus.value == ApiCallStatus.loading
                  ? tabShimmer()
              : ButtonsTabBar(
                    onTap: (index) {
                      controller.selectedIndex.value=index;
                      print("index is ${controller.selectedIndex.value}");
                      if (controller.selectedIndex.value == 0) {
                      // eventsApiList!.clear();
                      controller.selectedCategoryId = null;
                      controller.currentPage=1;
                      controller.pagingController1.refresh();
                      } else {
                      // eventsApiList!.clear();
                      controller.selectedCategoryId = controller.categoryResponseModel
                          .value.data![controller.selectedIndex.value -1].id!;
                      controller.currentPage=1;
                      controller.pagingController1.refresh();

                      }
                    },
                          backgroundColor: ColorConstant.primaryColor,
                          unselectedBackgroundColor: ColorConstant
                              .lightPurple,
                          controller: controller.tabController,
                          height: 43,
                          labelStyle: AppStyle.txtPoppinsRegular14.copyWith(
                            color: ColorConstant.whiteA700,
                          ),
                          unselectedLabelStyle:
                          AppStyle.txtPoppinsRegular14.copyWith(
                            color: ColorConstant.deepPurpleA201,
                          ),
                          unselectedBorderColor: Colors.blue,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20),
                          radius: 20,
                          tabs: controller.tabs.value,
                        )),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 1,
            color: ColorConstant.hintTextColor.withOpacity(0.3),
          ),
          Expanded(
              child: _pageTile()
          ),
        ],
      ),)
    );
  }

  Widget _pageTile(){
    return Container(
        color: Color(0xfff9f9f9),
        child: CustomRefreshIndicator(
          onRefresh: () async {
            controller.pagingController1.refresh();
            controller.currentPage = 1;
          },
          child: PagedListView<int, EventsData>(
            padding: EdgeInsets.symmetric(horizontal: 15),
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            pagingController: controller.pagingController1,
            // shrinkWrap: true,
            builderDelegate: PagedChildBuilderDelegate<EventsData>(
              itemBuilder:(context, item, pos)  {
                return GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.homeEventsDetailsScreen, arguments: {
                        "index": pos,
                        "id": item.id,
                      })!.then((value) {
                        controller.pagingController1.refresh();
                        controller.currentPage = 1;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: CustomEventTile(
                        index: pos,
                        data2: item,
                        length: controller.pagingController1.itemList!.length,
                      ),
                    ));
              },
              firstPageProgressIndicatorBuilder: (context){
                return Column(
                  children: [
                    educationResourcesShimmer(),
                   ],
                );
              },
              newPageProgressIndicatorBuilder: (context) => Padding(
                padding: const EdgeInsets.all(5),
                child: Center(
                  child: Container(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          ColorConstant.deepPurpleA201),
                    ),
                  ),
                ),
              ),
              noItemsFoundIndicatorBuilder: (context) =>  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'No events found.',
                      style: AppStyle.txtPoppinsSemiBold16.copyWith(
                        height: 1.50,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      )
                  ),
                  Text(
                      'Events added to this category will appear here.',
                      style: AppStyle.txtPoppinsSemiBold16.copyWith(
                        height: 1.50,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      )
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
        )
    );
  }


}


// class EventsAll extends StatelessWidget {
//   HomeEventsAllController controller =
//   Get.put(HomeEventsAllController(HomeEventsAllModel().obs));
//   Responsive responsive = Responsive();
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() =>
//         Container(
//           color: Color(0xffF1F3F6).withOpacity(0.5),
//           child: ListView.builder(
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               physics: BouncingScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: controller.eventsApiList!.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                     onTap: () {
//                       Get.to(HomeEventsDetailsScreen(
//                         data: controller.eventList[index],
//                         index: index,
//                       ));
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 15.0),
//                       child: CustomEventTile(
//                         data: controller.eventList[index],
//                         index: index,
//                         data2: controller.eventsApiList![index],
//                       ),
//                     ));
//               }),
//         ));
//   }
// }
