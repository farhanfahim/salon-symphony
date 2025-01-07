import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:salon_symphony/presentation/notification_screen/controller/notification_controller.dart';
import '../../../baseviews/baseview_process_screen.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/utils/semantics.dart';
import '../../../core/utils/size_utils.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/common_image_view.dart';
import '../../../widgets/cutom_dialog.dart';
import '../../../widgets/search_text_field.dart';
import '../../chat_module/chat_page/chat_page.dart';
import '../../home_screen/home_screen.dart';
import '../../more_page/more_page.dart';
import '../../resource_library_page/resource_library_page.dart';
import '../../task_to_do_tab_container_page/task_to_do_tab_container_page.dart';
import '../controllers/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen();

  DashboardController controller = Get.put(DashboardController());

  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return Obx(
      () => WillPopScope(
        onWillPop: () async {
          return (await Get.dialog(CustomModelSheet(
                  title: 'Alert',
                  msg: "Are you sure you want to close application? ",
              showOkButton: false,
              onTapYes: () {
                // exit(0);
                SystemNavigator.pop();
              },
              onTapNo: () {


              }))) ??
              false;
        },
        child: BaseviewScreen(
          mainTopHeight: controller.mainTopPadding.value,
          sidePadding: false,
          chatScreen: controller.chatIcon.value,
          learnScreen: controller.learnIcon.value,
          menuScreen: controller.menuIcon.value,
          profileWidget: Semantics(
            label: SemanticsLabel.LAB_PROFILE_TAB,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.myProfileScreen);
              },
              child: controller.user.value.image!=null
                  ? controller.user.value.image!.isNotEmpty?ClipRRect(
                borderRadius: BorderRadius.circular(
                    getHorizontalSize(15.50)),
                child: CommonImageView(
                  url: controller.user.value.image,
                  height: getSize(30.00),
                  width: getSize(30.00),
                  fit: BoxFit.cover,
                ),
              ): CommonImageView(
                svgPath: ImageConstant.imgUser,
                height: getSize(30.00),
                width: getSize(30.00),
              ):CommonImageView(
                svgPath: ImageConstant.imgUser,
                height: getSize(30.00),
                width: getSize(30.00),
              ),
            ),
          ),
          screenName: controller.screenName.isEmpty
              ? 'Home'
              : controller.screenName.value,
          basicAppBar: controller.isBasicAppBar.value,
          backgroundColor: ColorConstant.backgroundColor,
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: controller.pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              HomeScreen(),
              TaskToDoTabContainerPage(),
              ResourceLibraryPage(),
              ChatPage(),
              MorePage(),
            ],
          ),
        ),
      ),
    );
  }
}
