import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../baseviews/baseview_process_screen.dart';
import '../../core/utils/app_constant.dart';
import '../../core/utils/utils.dart';
import '../../data/services/api_call_status.dart';
import '../../widgets/widgetSkeleton.dart';
import 'controller/settings_onboarding_checklist_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'models/settings_onboarding_checklist_model.dart';

class SettingsOnboardingChecklistScreen
    extends GetWidget<SettingsOnboardingChecklistController> {
  @override
  Widget build(BuildContext context) {
    return BaseviewScreen(
        basicAppBar: true,
        screenName: "New Hire Checklist",
        showBottomBar: false,
        stickyHeader: true,
        mainTopHeight: 0,
        sidePadding: false,
        backgroundColor: ColorConstant.whiteA700,
        child: CustomRefreshIndicator(
          onRefresh: () async {
            controller.currentPage = 1;
             controller.pagingController1.refresh();
          },
          child: Container(
              color: Colors.transparent,
              child:Column(mainAxisSize: MainAxisSize.min, children: [
                Expanded(
                  child:
                  PagedListView<int, OnboardingChecklistData>(
                    physics:  const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    pagingController: controller.pagingController1,
                    // shrinkWrap: true,
                    builderDelegate: PagedChildBuilderDelegate<
                        OnboardingChecklistData>(
                      itemBuilder: (context, item, index) {
                        return GestureDetector(
                          onTap: () async {
                            print("link");
                            print(item.link);
                            print("item.name");
                            print(item.name);
                            print("item.linkType");
                            print(item.linkType);
                            print("item.linkCategory");
                            print(item.linkCategory);
                            print("item.linkId");
                            print(item.linkId);
                            print("item.categoryId");
                            print(item.categoryId);

                            if (item.linkType == AppConstant.NOLINK) {
                               Get.toNamed(AppRoutes.settingsOnboardingChecklistDetailsScreen, arguments: {"id": item.id});
                               controller.currentPage = 1;
                               controller.pagingController1.refresh();
                            } else if (item.linkType == AppConstant.EXTERNALLINK) {
                              Utils.launchUrls(item.link);
                            } else {
                              Utils.navigateToScreens(item.linkCategory,item.linkId );
                            }
                          },
                          child: Container(
                              margin: getMargin(
                                  left: 16, top: 20, right: 16),
                              decoration: AppDecoration.simpleOutline
                                  .copyWith(
                                  color: Color(0xffF1F3F6),
                                  borderRadius: BorderRadiusStyle
                                      .roundedBorder10),
                              child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        item.LocaluserStatus!.value =
                                        item.LocaluserStatus!
                                            .value ==
                                            20
                                            ? 10
                                            : 20;
                                        controller
                                            .updateHireCheckListStatus(
                                            index,
                                            item.userStatus!
                                                .value ==
                                                20
                                                ? 10
                                                : 20,
                                            item.id!);
                                      },
                                      child: Obx(() => item
                                          .LocaluserStatus!
                                          .value ==
                                          20
                                          ? Container(
                                          padding: getPadding(
                                              left: 6,
                                              top: 7,
                                              right: 6,
                                              bottom: 7),
                                          margin: getMargin(
                                              top: 15,
                                              right: 10,
                                              bottom: 15),
                                          height: getSize(
                                            22.00,
                                          ),
                                          width: getSize(
                                            22.00,
                                          ),
                                          decoration:
                                          BoxDecoration(
                                            color: ColorConstant
                                                .deepPurpleA201,
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                              getHorizontalSize(
                                                50,
                                              ),
                                            ),
                                          ),
                                          child: CommonImageView(
                                            svgPath: ImageConstant
                                                .imgCheckmark20X20,
                                          ))
                                          : Container(
                                        margin: getMargin(
                                            top: 15,
                                            right: 5,
                                            bottom: 15),
                                        decoration: AppDecoration
                                            .outlineBluegray100
                                            .copyWith(
                                          borderRadius:
                                          BorderRadius
                                              .circular(
                                            getHorizontalSize(
                                              50,
                                            ),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize:
                                          MainAxisSize.min,
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .center,
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .start,
                                          children: [
                                            Container(
                                              height: getSize(
                                                22.00,
                                              ),
                                              width: getSize(
                                                22.00,
                                              ),
                                              margin: getMargin(
                                                all: 1,
                                              ),
                                              decoration:
                                              BoxDecoration(
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
                                      )),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: Obx(
                                              () => Text(
                                            item.name != null
                                                ? item.name!
                                                : "",
                                            overflow:
                                            TextOverflow.ellipsis,
                                            maxLines: 1,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtPoppinsRegular14
                                                .copyWith(
                                              fontWeight: FontWeight.w600,
                                              decoration: item
                                                  .LocaluserStatus
                                                  ?.value ==
                                                  20
                                                  ? TextDecoration
                                                  .lineThrough
                                                  : TextDecoration.none,
                                              height: 1.29,
                                            ),
                                          ),
                                        )),
                                    /* index==0 || index==2?Container():*/
                                    Padding(
                                        padding: getPadding(
                                            top: 18,
                                            right: 10,
                                            bottom: 18),
                                        child: CommonImageView(
                                            svgPath: ImageConstant
                                                .imgArrowright,
                                            color: ColorConstant
                                                .hintTextColor
                                                .withOpacity(0.6),
                                            height: getSize(22.00),
                                            width: getSize(22.00))),
                                  ])),
                        );
                      },
                      firstPageProgressIndicatorBuilder: (context)=>Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: taskShimmer(context),
                                    ),
                      newPageProgressIndicatorBuilder: (context) =>
                          Padding(
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
                      noItemsFoundIndicatorBuilder: (context) =>
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("You're all caught up!",
                                  style: AppStyle.txtPoppinsSemiBold16
                                      .copyWith(
                                    height: 1.50,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  )),
                              Text(
                                  'Onboarding tasks will appear here.',
                                  style: AppStyle.txtPoppinsSemiBold16
                                      .copyWith(
                                    height: 1.50,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                  )),
                            ],
                          ),
                    ),
                  ),
                ),
              ])

                  // Container(
                  //   width: size.width,
                  //   child: controller.apiCallStatus.value == ApiCallStatus.success
                  //       ? Column(mainAxisSize: MainAxisSize.min, children: [
                  //           Expanded(
                  //             child:
                  //             PagedListView<int, OnboardingChecklistData>(
                  //               physics: BouncingScrollPhysics(),
                  //               pagingController: controller.pagingController1,
                  //               // shrinkWrap: true,
                  //               builderDelegate: PagedChildBuilderDelegate<
                  //                   OnboardingChecklistData>(
                  //                 itemBuilder: (context, item, index) {
                  //                   return GestureDetector(
                  //                     onTap: () async {
                  //                       print("salman");
                  //                       print("item");
                  //                       print(item.link);
                  //                       print(item.name);
                  //                       print(item.linkType);
                  //                       if (item.linkType == AppConstant.NOLINK) {
                  //                         var result = await Get.toNamed(
                  //                             AppRoutes
                  //                                 .settingsOnboardingChecklistDetailsScreen,
                  //                             arguments: {"id": item.id});
                  //                         controller.pagingController1.refresh();
                  //                       } else if (item.linkType ==
                  //                           AppConstant.EXTERNALLINK) {
                  //                         Utils.launchInWebViewWithJavaScript(
                  //                             item.link);
                  //                       } else {
                  //                         controller.navigateScreens(item.category,item.categoryId);
                  //                       }
                  //                     },
                  //                     child: Container(
                  //                         margin: getMargin(
                  //                             left: 16, top: 20, right: 16),
                  //                         decoration: AppDecoration.simpleOutline
                  //                             .copyWith(
                  //                                 color: Color(0xffF1F3F6),
                  //                                 borderRadius: BorderRadiusStyle
                  //                                     .roundedBorder10),
                  //                         child: Row(
                  //                             mainAxisAlignment:
                  //                                 MainAxisAlignment.spaceBetween,
                  //                             crossAxisAlignment:
                  //                                 CrossAxisAlignment.center,
                  //                             mainAxisSize: MainAxisSize.max,
                  //                             children: [
                  //                               SizedBox(
                  //                                 width: 10,
                  //                               ),
                  //                               GestureDetector(
                  //                                 onTap: () {
                  //                                   item.LocaluserStatus!.value =
                  //                                       item.LocaluserStatus!
                  //                                                   .value ==
                  //                                               20
                  //                                           ? 10
                  //                                           : 20;
                  //                                   controller
                  //                                       .updateHireCheckListStatus(
                  //                                           index,
                  //                                           item.userStatus!
                  //                                                       .value ==
                  //                                                   20
                  //                                               ? 10
                  //                                               : 20,
                  //                                           item.id!);
                  //                                 },
                  //                                 child: Obx(() => item
                  //                                             .LocaluserStatus!
                  //                                             .value ==
                  //                                         20
                  //                                     ? Container(
                  //                                         padding: getPadding(
                  //                                             left: 6,
                  //                                             top: 7,
                  //                                             right: 6,
                  //                                             bottom: 7),
                  //                                         margin: getMargin(
                  //                                             top: 15,
                  //                                             right: 10,
                  //                                             bottom: 15),
                  //                                         height: getSize(
                  //                                           22.00,
                  //                                         ),
                  //                                         width: getSize(
                  //                                           22.00,
                  //                                         ),
                  //                                         decoration:
                  //                                             BoxDecoration(
                  //                                           color: ColorConstant
                  //                                               .deepPurpleA201,
                  //                                           borderRadius:
                  //                                               BorderRadius
                  //                                                   .circular(
                  //                                             getHorizontalSize(
                  //                                               50,
                  //                                             ),
                  //                                           ),
                  //                                         ),
                  //                                         child: CommonImageView(
                  //                                           svgPath: ImageConstant
                  //                                               .imgCheckmark20X20,
                  //                                         ))
                  //                                     : Container(
                  //                                         margin: getMargin(
                  //                                             top: 15,
                  //                                             right: 5,
                  //                                             bottom: 15),
                  //                                         decoration: AppDecoration
                  //                                             .outlineBluegray100
                  //                                             .copyWith(
                  //                                           borderRadius:
                  //                                               BorderRadius
                  //                                                   .circular(
                  //                                             getHorizontalSize(
                  //                                               50,
                  //                                             ),
                  //                                           ),
                  //                                         ),
                  //                                         child: Column(
                  //                                           mainAxisSize:
                  //                                               MainAxisSize.min,
                  //                                           crossAxisAlignment:
                  //                                               CrossAxisAlignment
                  //                                                   .center,
                  //                                           mainAxisAlignment:
                  //                                               MainAxisAlignment
                  //                                                   .start,
                  //                                           children: [
                  //                                             Container(
                  //                                               height: getSize(
                  //                                                 22.00,
                  //                                               ),
                  //                                               width: getSize(
                  //                                                 22.00,
                  //                                               ),
                  //                                               margin: getMargin(
                  //                                                 all: 1,
                  //                                               ),
                  //                                               decoration:
                  //                                                   BoxDecoration(
                  //                                                 color: ColorConstant
                  //                                                     .whiteA700,
                  //                                                 borderRadius:
                  //                                                     BorderRadius
                  //                                                         .circular(
                  //                                                   getHorizontalSize(
                  //                                                     50,
                  //                                                   ),
                  //                                                 ),
                  //                                               ),
                  //                                             ),
                  //                                           ],
                  //                                         ),
                  //                                       )),
                  //                               ),
                  //                               SizedBox(
                  //                                 width: 10,
                  //                               ),
                  //                               Expanded(
                  //                                   child: Obx(
                  //                                 () => Text(
                  //                                   item.name != null
                  //                                       ? item.name!
                  //                                       : "",
                  //                                   overflow:
                  //                                       TextOverflow.ellipsis,
                  //                                   maxLines: 1,
                  //                                   textAlign: TextAlign.left,
                  //                                   style: AppStyle
                  //                                       .txtPoppinsRegular14
                  //                                       .copyWith(
                  //                                     fontWeight: FontWeight.w600,
                  //                                     decoration: item
                  //                                                 .LocaluserStatus
                  //                                                 ?.value ==
                  //                                             20
                  //                                         ? TextDecoration
                  //                                             .lineThrough
                  //                                         : TextDecoration.none,
                  //                                     height: 1.29,
                  //                                   ),
                  //                                 ),
                  //                               )),
                  //                               /* index==0 || index==2?Container():*/
                  //                               Padding(
                  //                                   padding: getPadding(
                  //                                       top: 18,
                  //                                       right: 10,
                  //                                       bottom: 18),
                  //                                   child: CommonImageView(
                  //                                       svgPath: ImageConstant
                  //                                           .imgArrowright,
                  //                                       color: ColorConstant
                  //                                           .hintTextColor
                  //                                           .withOpacity(0.6),
                  //                                       height: getSize(22.00),
                  //                                       width: getSize(22.00))),
                  //                             ])),
                  //                   );
                  //                 },
                  //                 newPageProgressIndicatorBuilder: (context) =>
                  //                     Padding(
                  //                   padding: const EdgeInsets.all(5),
                  //                   child: Center(
                  //                     child: Container(
                  //                       width: 15.0,
                  //                       height: 15.0,
                  //                       child: CircularProgressIndicator(
                  //                         strokeWidth: 2.0,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 noItemsFoundIndicatorBuilder: (context) =>
                  //                     Column(
                  //                   mainAxisAlignment: MainAxisAlignment.center,
                  //                   children: [
                  //                     Text('No quiz found.',
                  //                         style: AppStyle.txtPoppinsSemiBold16
                  //                             .copyWith(
                  //                           height: 1.50,
                  //                           fontWeight: FontWeight.w600,
                  //                           letterSpacing: 1,
                  //                         )),
                  //                     Text(
                  //                         'Quiz added to this category will appear here.',
                  //                         style: AppStyle.txtPoppinsSemiBold16
                  //                             .copyWith(
                  //                           height: 1.50,
                  //                           fontSize: 13,
                  //                           fontWeight: FontWeight.w500,
                  //                           letterSpacing: 0.5,
                  //                         )),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ])
                  //       : controller.apiCallStatus.value == ApiCallStatus.loading
                  //           ? Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: taskShimmer(context),
                  //             )
                  //           : Container(
                  //     child: Text("no record found"),
                  //   ),
                  // )


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
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Image.asset(
                        ImageConstant.spinnerImage, // Replace with the actual path to your image
                        width: 24, // Adjust the width as needed
                        height: 24, // Adjust the height as needed
                        // You can apply color to the image if needed
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

  onTapImgArrowleft() {
    Get.back();
  }

  onTapRowwatchorientati() {
    Get.toNamed(AppRoutes.settingsOnboardingChecklistDetailsScreen);
  }
}
