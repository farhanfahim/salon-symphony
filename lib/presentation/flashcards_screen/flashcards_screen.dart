import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import '../../core/loader.dart';
import '../../core/utils/app_constant.dart';
import '../../core/utils/helper_functions.dart';
import '../../core/utils/responsive.dart';
import '../../data/services/api_call_status.dart';
import '../../widgets/widgets_shimmer.dart';
import '../flashcards_screen/widgets/flashcards_item_widget.dart';
import 'controller/flashcards_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

import 'models/flashcards_response_model.dart';

class FlashcardsScreen extends GetWidget<FlashcardsController> {
  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return BaseviewScreen(
        basicAppBar: true,
        screenName: "Flashcards",
        showBottomBar: false,
        sidePadding: false,
        stickyHeader: true,
        backgroundColor: ColorConstant.whiteA700,
        basicAppTrailingIcon: ImageConstant.filterAppBar_icon,
        basicAppTrailingIconOnTap: () {
          HelperFunction.showBottomSheet(
            context,
            bottomSheetHeight: responsive.setHeight(43),
            spaceBetween: responsive.setHeight(4),
            screenTitle: "Filter Sets",
            screenEndTask: 'Done',
            widget: Column(
              children: [
                Obx(() =>
                (ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.arrOfOptions.length,
                  itemBuilder: (context, index) {
                    print("length ${controller.arrOfOptions.length}");
                    return GestureDetector(
                      onTap: () {
                        controller.updateQuizItem(index);
                      },
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    controller.arrOfOptions[index].name!,
                                    textScaleFactor: 1.0,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsRegular14
                                        .copyWith(
                                      height: 1.29,
                                    ),
                                  ),
                                  Spacer(),
                                  Obx(
                                        () =>
                                    (controller.arrOfOptions[index]
                                        .selected!.value ==
                                        true
                                        ? Container(
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
                                        borderRadius:
                                        BorderRadiusStyle
                                            .roundedBorder10,
                                      ),
                                      child: Column(
                                        mainAxisSize:
                                        MainAxisSize.min,
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
                                              all: 1,
                                            ),
                                            decoration: BoxDecoration(
                                              color: ColorConstant
                                                  .whiteA700,
                                              borderRadius:
                                              BorderRadius
                                                  .circular(
                                                getHorizontalSize(
                                                  50,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            index != 3 ?
                            Divider() : Offstage()
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
        child: Column(children: [

          AbsorbPointer(
            absorbing: controller.isApiCalling.value,
            child: Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Column(
                children: [
                  AbsorbPointer(
                    absorbing: controller.isApiCalling.value,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Obx(() =>
                      controller.apiCallStatus.value == ApiCallStatus.loading
                          ? tabShimmer()
                          : DefaultTabController(
                          length: controller.tabs.value.length,
                          child: ButtonsTabBar(
                            onTap: (index) {
                              controller.selectedIndex.value = index;
                              // tabController!.addListener(() {
                                if (controller.selectedIndex.value == 0) {
                                  controller.selectedCategoryId = null;
                                  controller.pagingController.refresh();
                                } else {
                                  controller.selectedIndex.value--;
                                  controller.selectedCategoryId = controller.categoryResponseModel!
                                      .value.data![controller.selectedIndex.value].id!.obs;
                                  controller.pagingController.refresh();
                                }
                              // });
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
                          )
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(height: 1,
            width: double.maxFinite,
            color: ColorConstant.gray400.withOpacity(0.3),),

          Expanded(child:
          Container(
            color:  Color(0xfff9f9f9),
            child: CustomRefreshIndicator(
               // color: ColorConstant.black900,
                onRefresh: () async {
                  if (controller.pagingController.itemList!.isNotEmpty) {
                    controller.pagingController.itemList!.clear();
                  }
                  controller.currentPage.value = 1;
                  controller.pagingController.refresh();
                  controller.isApiCalling.value = true;
                },
                child: PagedListView<int, FlashCardData>(
                  pagingController: controller.pagingController,
                  // shrinkWrap: true,
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  builderDelegate: PagedChildBuilderDelegate<FlashCardData>(
                    itemBuilder: (context, item, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 7.0),
                        child: FlashcardsItemWidget(item,
                                () {
                          print(controller.pagingController.itemList![index].id!.toString());
                          if(item.userFlashcardStatus==AppConstant.COMPLETED && item.flashcardElements!.isNotEmpty){
                            Get.toNamed(AppRoutes.flashcardCompleteScreen,arguments: {'id':item.id!,'is_completed':true});
                          }else if (item.flashcardElements!.isNotEmpty){
                            Get.toNamed(AppRoutes.flashcardsOneScreen,arguments: {'id':item.id!})!.then((value) {
                              controller.currentPage.value = 1;
                              controller.pagingController.refresh();
                            });
                          }else{
                            Utils.showToast('FlashCards is empty', true);
                          }
                            }),
                      );
                    },
                    noItemsFoundIndicatorBuilder: (context) =>
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                'No flashcards found.',
                                style: AppStyle.txtPoppinsSemiBold16.copyWith(
                                  height: 1.50,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                )
                            ),
                            Text(
                                'Set added to this category will appear here.',
                                style: AppStyle.txtPoppinsSemiBold16.copyWith(
                                  height: 1.50,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5,
                                )
                            ),
                          ],
                        ), //shimmer
                    firstPageProgressIndicatorBuilder: (context) =>
                        flashCard(context), //shimmer
                    newPageProgressIndicatorBuilder: (context) =>
                        Padding(
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
          ))
        ]));
  }


}

