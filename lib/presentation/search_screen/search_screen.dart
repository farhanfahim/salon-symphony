import 'dart:io';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/data/models/getQuizListModel.dart';
import 'package:salon_symphony/data/models/paginatedMembersModel.dart';

import '../../core/loader.dart';
import '../../core/utils/app_constant.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/size_utils.dart';
import '../../core/utils/utils.dart';
import '../../data/models/eventsListModel.dart';
import '../../data/models/getSurveyListing.dart';
import '../../data/models/task_data_model.dart';
import '../../data/services/api_call_status.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_style.dart';
import '../../widgets/common_image_view.dart';
import '../../widgets/custom_event_tile.dart';
import '../../widgets/search_text_field.dart';
import '../../widgets/skeleton.dart';
import '../../widgets/widgetSkeleton.dart';
import '../../widgets/widgets_shimmer.dart';
import '../documents_screen/models/documents_model.dart';
import '../documents_screen/widgets/documents_item_widget.dart';
import '../flashcards_screen/controller/flashcards_controller.dart';
import '../flashcards_screen/models/flashcards_response_model.dart';
import '../flashcards_screen/widgets/flashcards_item_widget.dart';
import '../goals_active_page/controller/goals_active_controller.dart';
import '../goals_active_page/widgets/goals_all_item_widget.dart';
import '../home_events_details_screen/home_events_details_screen.dart';
import '../quizzes_screen/widgets/quizzes_item_widget.dart';
import '../resourse_library_allTab/widget.dart';
import '../search_team/search_team.dart';
import '../start_survey_screen/start_survey_screen.dart';
import '../survey_screen/controller/survey_controller.dart';
import '../survey_screen/widgets/survey_item_widget.dart';
import '../task_details_screen/task_details_screen.dart';
import 'controller/search_screen_controller.dart';

class SearchScreen extends StatelessWidget {
  SearchScrenController controller = Get.put(SearchScrenController());
  Responsive responsive = Responsive();
  GoalsActiveController goalsActiveController =
      Get.put(GoalsActiveController());
  SurveyController surveyController = Get.put(SurveyController());
  FlashcardsController flashcardsController = Get.put(FlashcardsController());

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return Obx(() => BaseviewScreen(
          basicAppBar: true,
          mainTopHeight: 0,
          screenName: "lbl_search".tr,
          showBottomBar: false,
          sidePadding: false,
          isMenuTab: false,
          backgroundColor: ColorConstant.backgroundColor,
          child: Container(
            // padding: getPadding(left: 15, right: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(left: 15, right: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: SearchTextField(
                            controller: controller.searchController.value,
                            autoFocus: true,
                            // hintText: 'Search resources,events,task...',
                            height: responsive.setHeight(5),
                            backgroundColor: Color(0xffF5F6F8),
                            prefixWidget: Padding(
                              padding: getPadding(
                                  left: 13, right: 13, top: 12, bottom: 12),
                              child: CommonImageView(
                                svgPath: ImageConstant.search_icon_new,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.showCancel.value = true;
                              } else {
                                controller.showCancel.value = false;
                                if (controller.selectedIndex.value == 0) {
                                  controller.resourcesController.refresh();
                                } else if (controller.selectedIndex.value ==
                                    1) {
                                  controller.eventsPagingController.refresh();
                                } else if (controller.selectedIndex.value ==
                                    2) {
                                  controller.taskPagingController.refresh();
                                } else if (controller.selectedIndex.value ==
                                    3) {
                                  controller.getSearchItems();
                                } else if (controller.selectedIndex.value ==
                                    4) {
                                  controller.docController.refresh();
                                } else if (controller.selectedIndex.value ==
                                    5) {
                                  controller.pagingControllerSurvey.refresh();
                                } else if (controller.selectedIndex.value ==
                                    6) {
                                  controller.pagingFlashcardController
                                      .refresh();
                                } else if (controller.selectedIndex.value ==
                                    7) {
                                  controller.quizPagingController.refresh();
                                } else if (controller.selectedIndex.value ==
                                    8) {
                                  controller.pagingControllerUsers.refresh();
                                }
                              }
                            },
                            onFieldSubmit: (value) {
                              if (controller.selectedIndex.value == 0) {
                                controller.resourcesController.refresh();
                              } else if (controller.selectedIndex.value == 1) {
                                controller.eventsPagingController.refresh();
                              } else if (controller.selectedIndex.value == 2) {
                                controller.taskPagingController.refresh();
                              } else if (controller.selectedIndex.value == 3) {
                                controller.getSearchItems();
                              } else if (controller.selectedIndex.value == 4) {
                                controller.docController.refresh();
                              } else if (controller.selectedIndex.value == 5) {
                                controller.pagingControllerSurvey.refresh();
                              } else if (controller.selectedIndex.value == 6) {
                                controller.pagingFlashcardController.refresh();
                              } else if (controller.selectedIndex.value == 7) {
                                controller.quizPagingController.refresh();
                              } else if (controller.selectedIndex.value == 8) {
                                controller.pagingControllerUsers.refresh();
                              }
                            },
                            readOnly: false,
                            hintTextColor: Color(0xFF7F7F88),
                            prefixIconColor: ColorConstant.hintTextColor,
                            textColor: ColorConstant.blackColor,
                            borderColor:
                                ColorConstant.whiteA700.withOpacity(0.3),
                            cursorColor: ColorConstant.hintTextColor,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Obx(() => controller.showCancel.value
                            ? GestureDetector(
                                onTap: () {
                                  controller.searchController.value.text = "";
                                  if (controller.selectedIndex.value == 0) {
                                    controller.resourcesController.refresh();
                                  } else if (controller.selectedIndex.value ==
                                      1) {
                                    controller.eventsPagingController.refresh();
                                  } else if (controller.selectedIndex.value ==
                                      2) {
                                    controller.taskPagingController.refresh();
                                  } else if (controller.selectedIndex.value ==
                                      3) {
                                    controller.getSearchItems();
                                  } else if (controller.selectedIndex.value ==
                                      4) {
                                    controller.docController.refresh();
                                  } else if (controller.selectedIndex.value ==
                                      5) {
                                    controller.pagingControllerSurvey.refresh();
                                  } else if (controller.selectedIndex.value ==
                                      6) {
                                    controller.pagingFlashcardController
                                        .refresh();
                                  } else if (controller.selectedIndex.value ==
                                      7) {
                                    controller.quizPagingController.refresh();
                                  } else if (controller.selectedIndex.value ==
                                      8) {
                                    controller.pagingControllerUsers.refresh();
                                  }
                                },
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    color: ColorConstant.gray400,
                                    fontSize: getFontSize(
                                      12,
                                    ),
                                    fontFamily: Platform.isIOS
                                        ? 'SF Pro Display'
                                        : 'Roboto',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            : Offstage())
                      ]),
                ),
                SizedBox(
                  height: responsive.setHeight(2),
                ),
                AbsorbPointer(
                  absorbing: controller.isAbsorbing.value,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      children: [
                        ButtonsTabBar(
                          onTap: (index) {
                            print(index);
                            controller.currentPageResources = 1;
                            controller.currentPageEvents = 1;
                            controller.currentPageTask = 1;
                            controller.currentPageDoc = 1;
                            controller.currentPageSurvey = 1;
                            controller.currentPageFlash = 1;
                            controller.currentPageQuiz = 1;
                            controller.currentPageUsers = 1;
                            if (controller.apiCallStatus.value ==
                                ApiCallStatus.loading) {
                              print("loading state ==========>");
                            } else if (controller.apiCallStatus.value ==
                                ApiCallStatus.success) {
                              print("success state ==========>");
                              // controller.changeModuleType(index);
                            }
                            if (controller.apiCallStatus.value !=
                                ApiCallStatus.loading) {
                              controller.selectedIndex.value = index;
                              controller.selectedIndex.value = index;
                              controller.changeModuleType(index);
                              if (index == 0 &&
                                  controller.resourcesApiList!.isEmpty) {
                                controller.resourcesController.refresh();
                              } else if (index == 1 &&
                                  controller.eventsApiList!.isEmpty) {
                                controller.eventsPagingController.refresh();
                              } else if (index == 2 &&
                                  controller.taskDataList!.isEmpty) {
                                controller.taskPagingController.refresh();
                              } else if (index == 3 &&
                                  controller.goalsDataList.isEmpty) {
                                controller.getSearchItems();
                              } else if (index == 4 &&
                                  controller
                                          .documentResponseModel!.value.data ==
                                      null) {
                                controller.docController.refresh();
                              } else if (index == 5 &&
                                  controller.surveyData == null) {
                                controller.pagingControllerSurvey.refresh();
                              } else if (index == 6 &&
                                  controller
                                          .flashCardResponseModel!.value.data ==
                                      null) {
                                controller.pagingFlashcardController.refresh();
                              } else if (index == 7) {
                                // documents
                              } else if (index == 8 &&
                                  controller.arrOfUsers.isEmpty) {
                                controller.pagingControllerUsers.refresh();
                              }
                            }
                          },
                          backgroundColor: ColorConstant.primaryColor,
                          unselectedBackgroundColor: ColorConstant.lightPurple,
                          controller: controller.tabController,
                          labelStyle: AppStyle.txtPoppinsRegular14.copyWith(
                              color: ColorConstant.whiteA700, fontSize: 13),
                          unselectedLabelStyle: AppStyle.txtPoppinsRegular14
                              .copyWith(
                                  color: ColorConstant.deepPurpleA201,
                                  fontSize: 13),
                          unselectedBorderColor: Colors.blue,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          radius: 20,
                          height: 43,
                          tabs: [
                            Tab(
                              text: "Resources",
                            ),
                            Tab(
                              text: "Events",
                            ),
                            Tab(
                              text: "Tasks",
                            ),
                            Tab(
                              text: "Goals",
                            ),
                            Tab(
                              text: "Documents",
                            ),
                            Tab(
                              text: "Surveys",
                            ),
                            Tab(
                              text: "Flashcards",
                            ),
                            Tab(
                              text: "Quizzes",
                            ),
                            Tab(
                              text: "Members",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _buildSearchResults(context),
              ],
            ),
          ),
        ));
  }

  Widget _buildSearchResults(context) {
    return Obx(() {
      if (controller.selectedIndex.value == 0) {
        return Expanded(
            child: Container(
          color: Color(0xffF1F3F6).withOpacity(0.5),
          child: CustomRefreshIndicator(
              onRefresh: () async {
                controller.resourcesController.refresh();
              },
              //  color: ColorConstant.deepPurpleA201,
              child: PagedListView<int, dynamic>(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  physics: BouncingScrollPhysics(
                      parent: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics())),
                  pagingController: controller.resourcesController,
                  // shrinkWrap: true,
                  builderDelegate: PagedChildBuilderDelegate<dynamic>(
                    itemBuilder: (context, item, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Resource_listing_all(data: item),
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
                    firstPageProgressIndicatorBuilder: (context) {
                      return Column(
                        children: [
                          educationResourcesShimmer(),
                        ],
                      );
                    },
                    noItemsFoundIndicatorBuilder: (context) => SizedBox(
                      width: double.maxFinite,
                      height: 500,
                      child: Center(
                        child: Text('No Record Found'.tr,
                            style: AppStyle.txtPoppinsSemiBold16.copyWith(
                              height: 1.50,
                              letterSpacing: 0.5,
                            )),
                      ),
                    ),
                  )),
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
                          child: Image.asset(
                            ImageConstant.spinnerImage,
                            // Replace with the actual path to your image
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
              }),
        ));
      } else if (controller.selectedIndex.value == 1) {
        return Expanded(
            child: Container(
                color: Color(0xffF1F3F6).withOpacity(0.5),
                child: CustomRefreshIndicator(
                    onRefresh: () async {
                      controller.eventsPagingController.refresh();
                    },
                    //color: ColorConstant.deepPurpleA201,
                    child: PagedListView<int, EventsData>(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      physics: BouncingScrollPhysics(),
                      pagingController: controller.eventsPagingController,
                      // shrinkWrap: true,
                      builderDelegate: PagedChildBuilderDelegate<EventsData>(
                        itemBuilder: (context, item, index) {
                          return GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.homeEventsDetailsScreen,
                                    arguments: {
                                      "index": index,
                                      "id": controller.eventsApiList![index].id,
                                    });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: CustomEventTile(
                                  index: index,
                                  data2: item,
                                  length: controller.eventsPagingController
                                          .itemList?.length ??
                                      0,
                                ),
                              ));
                        },
                        firstPageProgressIndicatorBuilder: (context) {
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
                        noItemsFoundIndicatorBuilder: (context) => SizedBox(
                          width: double.maxFinite,
                          height: 500,
                          child: Center(
                            child: Text('No Record Found'.tr,
                                style: AppStyle.txtPoppinsSemiBold16.copyWith(
                                  height: 1.50,
                                  letterSpacing: 0.5,
                                )),
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
                                child: Image.asset(
                                  ImageConstant.spinnerImage,
                                  // Replace with the actual path to your image
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
                    })));
      } else if (controller.selectedIndex.value == 2) {
        return Expanded(
            child: Container(
                color: Color(0xffF1F3F6).withOpacity(0.5),
                child: CustomRefreshIndicator(
                    onRefresh: () async {
                      controller.taskPagingController.refresh();
                    },
                    // color: ColorConstant.deepPurpleA201,
                    child: PagedListView<int, PagedTaskData>(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      physics: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      pagingController: controller.taskPagingController,
                      // shrinkWrap: true,
                      builderDelegate: PagedChildBuilderDelegate<PagedTaskData>(
                        itemBuilder: (context, item, index) {
                          return controller.taskDataList!.length > 0
                              ? InkWell(
                                  onTap: () {
                                    Get.to(() => TaskDetailsScreen(),
                                        arguments: {
                                          'id': item.id,
                                        });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Container(
                                      margin: getMargin(
                                        top: 8.0,
                                        bottom: 8.0,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              CommonImageView(
                                                svgPath: item.userStatus!
                                                            .status ==
                                                        10
                                                    ? ImageConstant
                                                        .todo_icon_new
                                                    : item.userStatus!.status ==
                                                            20
                                                        ? ImageConstant.red_mark
                                                        : ImageConstant
                                                            .green_check,
                                                height: 15,
                                                width: 14,
                                                fit: BoxFit.fill,
                                              ),
                                              SizedBox(
                                                width: responsive.setWidth(2),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  item.name!,
                                                  maxLines: 1,
                                                  style: AppStyle
                                                      .txtInterRegular12
                                                      .copyWith(
                                                    fontSize: 16,
                                                    letterSpacing: 0.5,
                                                    fontFamily: Platform.isIOS
                                                        ? 'SF Pro Display'
                                                        : 'Roboto',
                                                    fontWeight: FontWeight.w700,
                                                    color:
                                                        ColorConstant.black900,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: responsive.setHeight(1),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 22.0,
                                                bottom: index ==
                                                        controller.taskDataList!
                                                                .length -
                                                            1
                                                    ? 2
                                                    : 18.0),
                                            child: Text(
                                              'Due Date:  ${item.end != null ? Utils.formatDate(item.end!) : ""}',
                                              style: AppStyle.txtInterRegular12
                                                  .copyWith(
                                                fontSize: 13,
                                                fontFamily: Platform.isIOS
                                                    ? 'SF Pro Display'
                                                    : 'Roboto',
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    ColorConstant.hintTextColor,
                                              ),
                                            ),
                                          ),
                                          index ==
                                                  controller.taskDataList!
                                                          .length -
                                                      1
                                              ? Offstage()
                                              : Container(
                                                  height: 1,
                                                  width: double.maxFinite,
                                                  color: ColorConstant.gray200,
                                                )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Container();
                        },
                        firstPageProgressIndicatorBuilder: (context) {
                          return Column(
                            children: [
                              taskShimmer(context),
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
                        noItemsFoundIndicatorBuilder: (context) => SizedBox(
                          width: double.maxFinite,
                          height: 500,
                          child: Center(
                            child: Text('No Record Found'.tr,
                                style: AppStyle.txtPoppinsSemiBold16.copyWith(
                                  height: 1.50,
                                  letterSpacing: 0.5,
                                )),
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
                                child: Image.asset(
                                  ImageConstant.spinnerImage,
                                  // Replace with the actual path to your image
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
                    })));
      } else if (controller.selectedIndex.value == 3) {
        return Expanded(
          child: controller.goalsApiCalling.value
              ? Column(
                  children: [
                    taskShimmer(context),
                  ],
                )
              :
          controller.goalsDataList.isEmpty
                      ? SizedBox(
                          width: double.maxFinite,
                          height: 500,
                          child: Center(
                            child: Text('No Record Found'.tr,
                                style: AppStyle.txtPoppinsSemiBold16.copyWith(
                                  height: 1.50,
                                  letterSpacing: 0.5,
                                )),
                          ),
                        )
                  : CustomRefreshIndicator(
                      //  color: ColorConstant.deepPurpleA201,
                      onRefresh: () async {
                        if (controller
                            .goalResponseModel!.value.data!.isNotEmpty) {
                          controller.goalResponseModel!.value.data!.clear();
                        }
                        controller.getSearchItems();
                      },
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              controller.goalResponseModel!.value.data!.length,
                          itemBuilder: (context, index) {
                            var model = controller
                                .goalResponseModel!.value.data![index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: GoalsAllItemWidget(
                                controller
                                    .goalResponseModel!.value.data![index],
                                onTap: () {
                                  Get.toNamed(AppRoutes.goalDetailsActiveScreen,
                                      arguments: {
                                        'type': model.userStatus!.status ==
                                                AppConstant.ACTIVE
                                            ? AppConstant.ACTIVE
                                            : model.userStatus!.status ==
                                                    AppConstant.ACHIEVED
                                                ? AppConstant.ACHIEVED
                                                : AppConstant.MISSED,
                                        "requestId": controller
                                            .goalResponseModel!
                                            .value
                                            .data![index]
                                            .id,
                                        "userStatusId": controller
                                            .goalResponseModel!
                                            .value
                                            .data![index]
                                            .userStatus!
                                            .id,
                                        "route": AppConstant.SEARCHSCREEN
                                      });
                                },
                                index: index,
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
                                  child: Image.asset(
                                    ImageConstant.spinnerImage,
                                    // Replace with the actual path to your image
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
                      }),
        );
      } else if (controller.selectedIndex.value == 4) {
        return Expanded(
            child: CustomRefreshIndicator(
                // color: ColorConstant.deepPurpleA201,
                onRefresh: () async {
                  if (controller.docController.itemList!.isNotEmpty) {
                    controller.docController.itemList!.clear();
                  }
                  controller.docController.refresh();
                  controller.isApiCalling.value = true;
                },
                child: PagedListView<int, DocumentData>(
                  pagingController: controller.docController,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  builderDelegate: PagedChildBuilderDelegate<DocumentData>(
                    itemBuilder: (context, item, index) {
                      return DocumentsItemWidget(item, () {
                        Get.toNamed(AppRoutes.documentDetail,
                                arguments: {'id': item.id})!
                            .then((value) {
                          print(value);
                          if (value != null) {
                            item.localStatus!.value = value;
                          }
                        });
                      });
                    },
                    noItemsFoundIndicatorBuilder: (context) => controller
                            .isApiCalling.value
                        ? documentShimmer(context) //shimmer
                        : SizedBox(
                            width: double.maxFinite,
                            height: 500,
                            child: Center(
                              child: Text("You're all caught up!",
                                  style: AppStyle.txtPoppinsSemiBold16.copyWith(
                                    height: 1.50,
                                    letterSpacing: 0.5,
                                  )),
                            ),
                          ), //shimmer
                    firstPageProgressIndicatorBuilder: (context) =>
                        documentShimmer(context), //shimmer
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
                            child: Image.asset(
                              ImageConstant.spinnerImage,
                              // Replace with the actual path to your image
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
                }));
      } else if (controller.selectedIndex.value == 5) {
        return Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: CustomRefreshIndicator(
              //color: ColorConstant.deepPurpleA201,
              onRefresh: () async {
                controller.pagingControllerSurvey.refresh();
              },
              child: PagedListView<int, GetSurveyListingData>(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                pagingController: controller.pagingControllerSurvey,
                builderDelegate:
                    PagedChildBuilderDelegate<GetSurveyListingData>(
                  itemBuilder: (context, item, index) {
                    return Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: SurveyItemWidget(
                          item,
                          index: index,
                          onTapColumnmindmap: () {
                            Get.to(StartSurveyScreen());
                          },
                        ));
                  },
                  firstPageProgressIndicatorBuilder: (context) {
                    return Column(
                      children: [
                        referralShimmer(context),
                        referralShimmer(context)
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
                  noItemsFoundIndicatorBuilder: (context) => SizedBox(
                    width: double.maxFinite,
                    height: 500,
                    child: Center(
                      child: Text('No Record Found'.tr,
                          style: AppStyle.txtPoppinsSemiBold16.copyWith(
                            height: 1.50,
                            letterSpacing: 0.5,
                          )),
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
                          child: Image.asset(
                            ImageConstant.spinnerImage,
                            // Replace with the actual path to your image
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
              }),
        ));
      } else if (controller.selectedIndex.value == 6) {
        return Expanded(
            child: CustomRefreshIndicator(
                // color: ColorConstant.deepPurpleA201,
                onRefresh: () async {
                  if (controller
                      .pagingFlashcardController.itemList!.isNotEmpty) {
                    controller.pagingFlashcardController.itemList!.clear();
                  }
                  controller.pagingFlashcardController.refresh();
                  // controller.isApiCalling.value = true;
                },
                child: PagedListView<int, FlashCardData>(
                  pagingController: controller.pagingFlashcardController,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  builderDelegate: PagedChildBuilderDelegate<FlashCardData>(
                    itemBuilder: (context, item, index) {
                      return FlashcardsItemWidget(item, () {
                        print(controller
                            .pagingFlashcardController.itemList![index].id!
                            .toString());
                        if (item.userFlashcardStatus == AppConstant.COMPLETED &&
                            item.flashcardElements!.isNotEmpty) {
                          Get.toNamed(AppRoutes.flashcardCompleteScreen,
                              arguments: {
                                'id': item.id!,
                                'is_completed': true
                              });
                        } else if (item.flashcardElements!.isNotEmpty) {
                          Get.toNamed(AppRoutes.flashcardsOneScreen,
                              arguments: {'id': item.id!});
                        } else {
                          Utils.showToast('Flashcard is empty', true);
                        }
                      });
                    },
                    noItemsFoundIndicatorBuilder: (context) => controller
                            .isApiCalling.value
                        ? flashCard(context) //shimmer
                        : SizedBox(
                            width: double.maxFinite,
                            height: 500,
                            child: Center(
                              child: Text('No Record Found'.tr,
                                  style: AppStyle.txtPoppinsSemiBold16.copyWith(
                                    height: 1.50,
                                    letterSpacing: 0.5,
                                  )),
                            ),
                          ), //shimmer
                    firstPageProgressIndicatorBuilder: (context) =>
                        flashCard(context), //shimmer
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
                            child: Image.asset(
                              ImageConstant.spinnerImage,
                              // Replace with the actual path to your image
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
                }));
      } else if (controller.selectedIndex.value == 7) {
        return Expanded(
            child: CustomRefreshIndicator(
                //    color: ColorConstant.deepPurpleA201,
                onRefresh: () async {
                  controller.quizPagingController.refresh();
                },
                child: Container(
                  color: Color(0xffF1F3F6).withOpacity(0.5),
                  child: PagedListView<int, QuizData>(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    pagingController: controller.quizPagingController,
                    // shrinkWrap: true,
                    builderDelegate: PagedChildBuilderDelegate<QuizData>(
                      itemBuilder: (context, item, index) {
                        return QuizzesItemWidget(
                          item,
                          index,
                          onTapColumnrectangleeightyfive: () {
                            Get.toNamed(AppRoutes.quizzesDetailsScreen,
                                    arguments: item.id)!
                                .then((value) {
                              if (value != null && value == 10) {
                                controller.currentPageQuiz = 1;
                                controller.totalPagesQuiz = 0;
                                controller.resourcesController.refresh();
                              }
                            });
                          },
                        );
                      },
                      newPageProgressIndicatorBuilder: (context) => Padding(
                        padding: const EdgeInsets.all(5),
                        child: Center(
                          child: Container(
                            width: 15.0,
                            height: 15.0,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.0,
                            ),
                          ),
                        ),
                      ),
                      noItemsFoundIndicatorBuilder: (context) => SizedBox(
                        width: double.maxFinite,
                        height: 500,
                        child: Center(
                          child: Text('No Record Found'.tr,
                              style: AppStyle.txtPoppinsSemiBold16.copyWith(
                                height: 1.50,
                                letterSpacing: 0.5,
                              )),
                        ),
                      )
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
                            child: Image.asset(
                              ImageConstant.spinnerImage,
                              // Replace with the actual path to your image
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
                }));
      } else {
        return Expanded(
          child: CustomRefreshIndicator(
              //    color: ColorConstant.deepPurpleA201,
              onRefresh: () async {
                controller.pagingControllerUsers.refresh();
              },
              child: PagedListView<int, MembersData>(
                pagingController: controller.pagingControllerUsers,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                builderDelegate: PagedChildBuilderDelegate<MembersData>(
                  itemBuilder: (context, item, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 9.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.toNamed(
                                  AppRoutes.employeeDicrectryDetailsScreen,
                                  arguments: {
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
                                  Get.toNamed(
                                      AppRoutes.employeeDicrectryDetailsScreen,
                                      arguments: {
                                        'id': controller.arrOfUsers[index].id,
                                        'name':
                                            controller.arrOfUsers[index].name,
                                      });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12, bottom: 12),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            getHorizontalSize(25.00),
                                          ),
                                          child: item.image != null
                                              ? CommonImageView(
                                                  url: item.image!,
                                                  height: getSize(50.00),
                                                  width: getSize(50.00),
                                                  fit: BoxFit.cover,
                                                )
                                              : CommonImageView(
                                                  svgPath:
                                                      ImageConstant.imgUser,
                                                  height: getSize(50.00),
                                                  width: getSize(50.00),
                                                )),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 14.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.name ?? "",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPoppinsRegular14Black900
                                                  .copyWith(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${item.position != null ? item.position!.name! : "N/A"} ",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtPoppinsRegular14Black900
                                                      .copyWith(
                                                    color: ColorConstant
                                                        .hintTextColor,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.circle,
                                                  color: ColorConstant
                                                      .hintTextColor
                                                      .withOpacity(0.5),
                                                  size: getSize(
                                                    4.00,
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    " ${item.location != null ? item.location!.name! : "N/A"}",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    maxLines: 1,
                                                    style: AppStyle
                                                        .txtPoppinsRegular14Black900
                                                        .copyWith(
                                                      color: ColorConstant
                                                          .hintTextColor,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
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
                    );
                  },
                  noItemsFoundIndicatorBuilder: (context) => SizedBox(
                    width: double.maxFinite,
                    height: 500,
                    child: Center(
                      child: Text('No Record Found'.tr,
                          style: AppStyle.txtPoppinsSemiBold16.copyWith(
                            height: 1.50,
                            letterSpacing: 0.5,
                          )),
                    ),
                  ), //shimmer
                  firstPageProgressIndicatorBuilder: (context) => Column(
                    children: [
                      listShimmer(),
                    ],
                  ), //shimmer
                  newPageProgressIndicatorBuilder: (context) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Container(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              ColorConstant.deepPurpleA201),
                        ),
                      ),
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
                          child: Image.asset(
                            ImageConstant.spinnerImage,
                            // Replace with the actual path to your image
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
              }),
        );
      }
    });
  }
}
