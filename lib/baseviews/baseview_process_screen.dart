
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:salon_symphony/core/utils/semantics.dart';
import '../core/utils/color_constant.dart';
import '../core/utils/helper_functions.dart';
import '../core/utils/image_constant.dart';
import '../core/utils/responsive.dart';
import '../core/utils/size_utils.dart';
import '../presentation/dashboard/controllers/dashboard_controller.dart';
import '../presentation/notification_all/controller/notification_all_controller.dart';
import '../presentation/notification_screen/controller/notification_controller.dart';
import '../presentation/notification_unread/controller/notification_unread_controller.dart';
import '../presentation/resource_library_page/controller/resource_library_controller.dart';
import '../routes/app_routes.dart';
import '../theme/app_decoration.dart';
import '../widgets/common_image_view.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/custom_bottom_bar.dart';
import '../widgets/custom_text.dart';

class BaseviewScreen extends StatelessWidget {
  BaseviewScreen({this.showBottomBar,
    this.sidePadding,
    this.isMenuTab,
    this.mainTopHeight,
    this.showBackButton = true,
    this.child,
    this.basicIconHeight,
    this.basicIconWidth,
    this.screenName,
    this.bottomSafeArea = false,
    this.screenNameRx,
    this.backText,
    this.textButtonName,
    this.basicAppBar,
    this.backgroundColor,
    this.hideAppBar,
    this.blueClrEndTask = false,
    this.greyClrEndTask = false,
    this.stickyHeader = false,
    this.stickyFooter = true,
    this.chatScreen = false,
    this.learnScreen = false,
    this.menuScreen = false,
    this.isBackButtonShow = false,
    this.isResizeToAvoidBottomInset,
    this.basicAppTrailingIcon,
    this.profileWidget,
    this.textOnTap,
    this.screenNameOnTap,
    this.onBackTap,
    this.basicAppTrailingIconOnTap, this.trailngSemantics,
    this.searchField});

  bool? showBottomBar;
  bool? basicAppBar;
  bool? showBackButton;

  bool? sidePadding;
  bool? chatScreen;
  bool? learnScreen;
  bool? menuScreen;
  bool? blueClrEndTask;
  bool? greyClrEndTask;
  bool? stickyHeader;
  bool? stickyFooter;
  bool? bottomSafeArea = false;
  bool? isMenuTab;
  bool isBackButtonShow = false;
  bool? isResizeToAvoidBottomInset;
  double? mainTopHeight;
  double? basicIconHeight;
  double? basicIconWidth;

  String? screenName;
  RxString? screenNameRx;
  String? backText;
  String? textButtonName;
  Color? backgroundColor;
  bool? hideAppBar;
  Widget? child;
  String? basicAppTrailingIcon;
  Function? basicAppTrailingIconOnTap;
  Function()? textOnTap;
  Function()? screenNameOnTap;
  Function()? onBackTap;
  Widget? searchField;
  Widget? profileWidget;
  String? trailngSemantics;

  Responsive responsive = Responsive();

  // ColorConfig colors = ColorConfig();
  DashboardController controller = Get.put(DashboardController());
  ResourceLibraryController resourceLibraryController = Get.put(ResourceLibraryController());
  NotificationController notiController = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Color(0xffFFFFFF),
          systemNavigationBarColor: Color(0xffFFFFFF),
          statusBarBrightness: Platform.isIOS ? Brightness.light : Brightness
              .dark,
          statusBarIconBrightness: Platform.isIOS
              ? Brightness.light
              : Brightness.dark),
    );
    responsive.setContext(context);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1.0, boldText: false),
      child: Scaffold(
        // backgroundColor: backgroundColor ?? ColorConstant.backgroundColor,
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: isResizeToAvoidBottomInset ?? false,
        bottomNavigationBar: showBottomBar != false
            ? SafeArea(
          bottom: false,
          child: Container(
              height: responsive.setHeight(10), child: CustomBottomBar()),
        )
            : null,
        body: SafeArea(
          bottom: bottomSafeArea ?? true ,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Container(
                height: responsive.setHeight(HelperFunction.FULL_SCREEN_SIZE),
                width: responsive.setWidth(HelperFunction.FULL_SCREEN_SIZE),
                color: backgroundColor ?? ColorConstant.whiteA700,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: sidePadding == false
                          ? 0
                          : HelperFunction.SCREENS_SIDE_PADDING),
                  child: Column(
                    children: [
                      if (hideAppBar != true)
                        Column(
                          children: [
                            if (basicAppBar != true)
                              Container(
                                decoration: BoxDecoration(
                                  color: backgroundColor ??
                                      ColorConstant.whiteA702,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 10),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: size.width,
                                        decoration: BoxDecoration(
                                          color: ColorConstant.backgroundColor,
                                          borderRadius: BorderRadius.circular(
                                            getHorizontalSize(
                                              12.00,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            profileWidget!,
                                            Padding(
                                              padding: getPadding(
                                                top: 4,
                                                bottom: 4,
                                              ),
                                              child: MyText(
                                                title:
                                                '${screenName ??
                                                    'Screen Name'}',
                                                weight: 'Semi Bold',
                                                center: true,
                                                fontSize:
                                                responsive.setTextScale(16),
                                              ),
                                            ),
                                            chatScreen == true ?
                                            GestureDetector(
                                              onTap: () {
                                                Get.toNamed(
                                                    AppRoutes.createChat);
                                              },
                                              child: Container(
                                                height: getSize(
                                                  24.00,
                                                ),
                                                width: getSize(
                                                  24.00,
                                                ),
                                                margin: getMargin(
                                                  top: 3,
                                                  bottom: 3,
                                                ),
                                                child: Stack(
                                                  alignment: Alignment.topRight,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                      Alignment.centerLeft,
                                                      child: CommonImageView(
                                                        svgPath: ImageConstant
                                                            .blueEdit,
                                                        height: getSize(
                                                          20.00,
                                                        ),
                                                        width: getSize(
                                                          20.00,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ) :
                                            learnScreen == true ?
                                            GestureDetector(
                                              onTap: () {
                                                HelperFunction.showBottomSheet(
                                                  context,
                                                  bottomSheetHeight: 320,
                                                  spaceBetween: responsive
                                                      .setHeight(4),
                                                  screenEndTask: 'Done',
                                                  screenTitle:
                                                  'Filter Resources',
                                                  widget: ListView(
                                                    physics: NeverScrollableScrollPhysics(),
                                                    children: [
                                                      InkWell(
                                                        splashFactory: NoSplash
                                                            .splashFactory,
                                                        onTap: () {
                                                          controller.updateTaskStatus(1);
                                                          resourceLibraryController.currentPage = 1;
                                                          print(
                                                              'resourceLibraryController .resourcesApiList.length ===> ${resourceLibraryController
                                                                  .resourcesApiList!
                                                                  .length}');
                                                          resourceLibraryController
                                                              .selectedFilter =
                                                          null;
                                                          resourceLibraryController
                                                              .resourcesApiList!
                                                              .clear();
                                                          resourceLibraryController
                                                              .pagingController1
                                                              .refresh();
                                                          Get.back();
                                                          // resourceLibraryController.selectedFilter =
                                                        },
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .only(
                                                            bottom: responsive
                                                                .setHeight(1),
                                                            right: 20,
                                                            top: responsive
                                                                .setHeight(1),),
                                                          child: Row(
                                                            children: [
                                                              MyText(
                                                                title: 'All',
                                                              ),
                                                              Spacer(),
                                                              Obx(
                                                                    () =>
                                                                    controller.task[0].selected == true ?
                                                                    Container(
                                                                      margin: getMargin(
                                                                        // top: 15,
                                                                        right: 5,
                                                                        // bottom: 15,
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
                                                                        // top: 15,
                                                                        right: 5,
                                                                        // bottom: 15,
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
                                                                              all: 1,
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
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Divider(),
                                                      InkWell(
                                                        splashFactory: NoSplash
                                                            .splashFactory,
                                                        onTap: () {

                                                          controller
                                                              .updateTaskStatus(
                                                              2);
                                                          resourceLibraryController.currentPage = 1;

                                                          print(
                                                              'resourceLibraryController .resourcesApiList.length ===> ${resourceLibraryController
                                                                  .resourcesApiList!
                                                                  .length}');
                                                          resourceLibraryController
                                                              .selectedFilter =
                                                          30;
                                                          resourceLibraryController
                                                              .resourcesApiList!
                                                              .clear();
                                                          resourceLibraryController
                                                              .pagingController1
                                                              .refresh();
                                                          Get.back();
                                                        },
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .only(
                                                              bottom: responsive
                                                                  .setHeight(1),
                                                              top: responsive
                                                                  .setHeight(1),
                                                              right: 20),
                                                          child: Row(
                                                            children: [
                                                              MyText(
                                                                title: 'PDF',
                                                              ),
                                                              Spacer(),
                                                              Obx(
                                                                    () =>
                                                                    controller.task[1].selected == true ?
                                                                    Container(
                                                                      margin: getMargin(
                                                                        // top: 15,
                                                                        right: 5,
                                                                        // bottom: 15,
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
                                                                        // top: 15,
                                                                        right: 5,
                                                                        // bottom: 15,
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
                                                                              all: 1,
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
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Divider(),
                                                      InkWell(
                                                        splashFactory: NoSplash
                                                            .splashFactory,
                                                        onTap: () {
                                                          controller
                                                              .updateTaskStatus(
                                                              3);
                                                          resourceLibraryController.currentPage = 1;

                                                          print(
                                                              'resourceLibraryController .resourcesApiList.length ===> ${resourceLibraryController
                                                                  .resourcesApiList!
                                                                  .length}');
                                                          resourceLibraryController
                                                              .selectedFilter =
                                                          10;
                                                          resourceLibraryController
                                                              .resourcesApiList!
                                                              .clear();
                                                          resourceLibraryController
                                                              .pagingController1
                                                              .refresh();
                                                          Get.back();
                                                        },
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .only(
                                                              bottom: responsive
                                                                  .setHeight(1),
                                                              top: responsive
                                                                  .setHeight(1),
                                                              right: 20),
                                                          child: Row(
                                                            children: [

                                                              // SizedBox(
                                                              //   width: responsive.setWidth(4),
                                                              // ),
                                                              MyText(
                                                                title: 'Video',
                                                              ),
                                                              Spacer(),
                                                              Obx(
                                                                    () =>
                                                                    controller.task[2].selected == true ?
                                                                    Container(
                                                                      margin: getMargin(
                                                                        // top: 15,
                                                                        right: 5,
                                                                        // bottom: 15,
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
                                                                        // top: 15,
                                                                        right: 5,
                                                                        // bottom: 15,
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
                                                                              all: 1,
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
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Divider(),
                                                      InkWell(
                                                        splashFactory: NoSplash
                                                            .splashFactory,
                                                        onTap: () {
                                                          controller
                                                              .updateTaskStatus(
                                                              4);
                                                          resourceLibraryController.currentPage = 1;

                                                          print(
                                                              'resourceLibraryController .resourcesApiList.length ===> ${resourceLibraryController
                                                                  .resourcesApiList!
                                                                  .length}');
                                                          resourceLibraryController
                                                              .selectedFilter =
                                                          20;
                                                          resourceLibraryController
                                                              .resourcesApiList!
                                                              .clear();
                                                          resourceLibraryController
                                                              .pagingController1
                                                              .refresh();
                                                          Get.back();
                                                        },
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .only(
                                                              bottom: responsive
                                                                  .setHeight(1),
                                                              top: responsive
                                                                  .setHeight(1),
                                                              right: 20),
                                                          child: Row(
                                                            children: [

                                                              // SizedBox(
                                                              //   width: responsive.setWidth(4),
                                                              // ),
                                                              MyText(
                                                                title: 'Audio',
                                                              ),
                                                              Spacer(),
                                                              Obx(
                                                                    () =>
                                                                    controller.task[3].selected == true ?
                                                                    Container(
                                                                      margin: getMargin(
                                                                        // top: 15,
                                                                        right: 5,
                                                                        // bottom: 15,
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
                                                                        // top: 15,
                                                                        right: 5,
                                                                        // bottom: 15,
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
                                                                              all: 1,
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
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                );
                                              },
                                              child: Container(
                                                height: getSize(
                                                  24.00,
                                                ),
                                                width: getSize(
                                                  24.00,
                                                ),
                                                margin: getMargin(
                                                  top: 3,
                                                  bottom: 3,
                                                ),
                                                child: Stack(
                                                  alignment: Alignment.topRight,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                      Alignment.centerLeft,
                                                      child: CommonImageView(
                                                        imagePath: ImageConstant
                                                            .filterAppBar_icon,
                                                        height: getSize(
                                                          16.00,
                                                        ),
                                                        width: getSize(
                                                          19.00,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ) :
                                            menuScreen == true ?
                                            Semantics(
                                              label: SemanticsLabel
                                                  .LAB_SETTINGS_TAB,
                                              child: GestureDetector(
                                                onTap: () {
                                                  Get.toNamed(AppRoutes
                                                      .moreSettingsScreen);
                                                },
                                                child: Container(
                                                  height: getSize(
                                                    24.00,
                                                  ),
                                                  width: getSize(
                                                    27.00,
                                                  ),
                                                  margin: getMargin(
                                                    top: 3,
                                                    bottom: 3,
                                                  ),
                                                  child: Stack(
                                                    alignment: Alignment
                                                        .topRight,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                        Alignment.centerLeft,
                                                        child: CommonImageView(
                                                          imagePath: ImageConstant
                                                              .setting_line_light,
                                                          height: getSize(
                                                            20.00,
                                                          ),
                                                          width: getSize(
                                                            20.00,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ) :
                                            Semantics(
                                              label: SemanticsLabel
                                                  .LAB_NOTIFICATION_TAB,
                                              child: GestureDetector(
                                                onTap: () {
                                                  Get.delete<NotificationController>();
                                                  Get.delete<Notification_Unread_controller>();
                                                  Get.delete<Notification_All_Controller>();
                                                  Get.toNamed(AppRoutes.notificationScreen);
                                                  // Get.toNamed(AppRoutes.homeEmptyContainerScreen);
                                                },
                                                child: Obx(() =>
                                                notiController.notificationCount.value > 0 ?
                                                    Container(
                                                  margin: getMargin(
                                                    top: 3,
                                                    bottom: 3,
                                                  ),
                                                  child: Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: CommonImageView(
                                                      svgPath:  ImageConstant.notification,
                                                      height: getSize(
                                                        24.00,
                                                      ),
                                                      width: getSize(
                                                        27.00,
                                                      ),
                                                    ),
                                                  )
                                                ):
                                                Container(
                                                  margin: getMargin(
                                                    top: 3,
                                                    bottom: 3,
                                                  ),
                                                  child:  Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: CommonImageView(
                                                      svgPath: ImageConstant.notification_empty,
                                                      height: getSize(
                                                        23.00,
                                                      ),
                                                      width: getSize(
                                                        26.00,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                                )
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (searchField != null)
                                        SizedBox(
                                          height: responsive.setHeight(0.5),
                                        ),
                                      searchField ?? Container(),
                                    ],
                                  ),
                                ),
                              ),
                            if (basicAppBar == true)
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorConstant.whiteA702,
                                ),
                                //   .copyWith(
                                // border: Border(
                                //   bottom: BorderSide(
                                //       color: ColorConstant.hintTextColor,
                                //       width: 0.1),
                                // ),
                                // ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 15, right: 15),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          showBackButton == true ?
                                          GestureDetector(
                                            onTap: isBackButtonShow
                                                ? onBackTap
                                                : () {
                                              Get.back();
                                            },
                                            child: CommonImageView(
                                              svgPath: ImageConstant
                                                  .imgArrowleft,
                                              // scale: responsive.setWidth(scale ?? 0.90),
                                              color: ColorConstant.black900,
                                            ),
                                          ) :
                                          GestureDetector(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: MyText(
                                              title: backText ?? "back",
                                              clr: Colors.red,),
                                          ),
                                          Expanded(
                                              child: Center(
                                                child: GestureDetector(
                                                  onTap: screenNameOnTap,
                                                  child:
                                                  screenNameRx!=null
                                                      ? Obx(() =>Container(
                                                    color: ColorConstant.whiteA702,
                                                        padding: EdgeInsets.all(5),
                                                        child: MyText(
                                                    title: '${screenNameRx!.value}',
                                                    weight: 'Semi Bold',
                                                    line: 1,
                                                    toverflow: TextOverflow.ellipsis,
                                                    fontSize: responsive
                                                          .setTextScale(16),
                                                  ),
                                                      ))
                                                      : MyText(
                                                    title:
                                                    '${screenName ?? 'Screen Name'}',
                                                    weight: 'Semi Bold',
                                                    center: true,
                                                    fontSize: responsive
                                                        .setTextScale(16),
                                                  ),

                                                ),
                                              ),
                                          ),
                                              if (basicAppTrailingIcon == null)
                                          Container(
                                            width: responsive.setWidth(5),
                                          ),
                                          if (basicAppTrailingIcon != null)
                                            isMenuTab == false ?
                                            Container(
                                              width: 40,
                                              height: 40,
                                              child: Card(
                                                color: Colors.white,
                                                elevation: 2,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(20),),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    basicAppTrailingIconOnTap!();
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .all(5.0),
                                                    child: CommonImageView(
                                                      imagePath: basicAppTrailingIcon,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),),
                                              ),
                                            ) : GestureDetector(
                                              onTap: () {
                                                basicAppTrailingIconOnTap!();
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                    5.0),
                                                child: CommonImageView(
                                                  imagePath: basicAppTrailingIcon,
                                                  height: basicIconHeight ?? 20,
                                                  width: basicIconWidth ?? 20,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),),

                                          if (textButtonName != null)
                                            blueClrEndTask == true ? Semantics(
                                              label: trailngSemantics,
                                              child: GestureDetector(
                                                onTap: textOnTap!,
                                                child: Text(
                                                    textButtonName!,
                                                    overflow: TextOverflow
                                                        .ellipsis,
                                                    style: TextStyle(
                                                      color: ColorConstant
                                                          .primaryColor,
                                                      fontSize: getFontSize(
                                                        15,
                                                      ),
                                                      fontFamily: Platform.isIOS
                                                          ? 'SF Pro Display'
                                                          : 'Roboto',
                                                      fontWeight: FontWeight
                                                          .w500,
                                                    )),
                                              ),
                                            ) : greyClrEndTask == true
                                                ? GestureDetector(
                                              onTap: textOnTap!,
                                              child: Text(
                                                  textButtonName!,
                                                  overflow: TextOverflow
                                                      .ellipsis,
                                                  style: TextStyle(
                                                    color: ColorConstant
                                                        .gray400,
                                                    fontSize: getFontSize(
                                                      15,
                                                    ),
                                                    fontFamily: Platform.isIOS
                                                        ? 'SF Pro Display'
                                                        : 'Roboto',
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                            )
                                                :
                                            GestureDetector(
                                              onTap: textOnTap!,
                                              child: Text(
                                                  textButtonName!,
                                                  overflow: TextOverflow
                                                      .ellipsis,
                                                  style: TextStyle(
                                                    color: ColorConstant
                                                        .pink300,
                                                    fontSize: getFontSize(
                                                      14,
                                                    ),
                                                    fontFamily: Platform.isIOS
                                                        ? 'SF Pro Display'
                                                        : 'Roboto',
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                            )
                                        ],
                                      ),
                                      if (searchField != null)
                                        SizedBox(
                                          height: responsive.setHeight(1.5),
                                        ),
                                      searchField ?? Container(),
                                      SizedBox(
                                        height: responsive.setHeight(1.5),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            SizedBox(
                              height: responsive.setHeight(mainTopHeight ?? 0),
                            ),
                          ],
                        ),
                      Expanded(
                        child: Container(
                          width: responsive.setWidth(100),
                          // decoration: AppDecoration.fillGray101,
                          child: Column(
                            children: [
                              stickyHeader == false ?
                              SizedBox(
                                height: responsive.setHeight(1),
                              ) : Offstage(),
                              Expanded(child: child ?? Container())
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
