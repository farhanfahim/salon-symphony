import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/core/utils/helper_functions.dart';

import '../notification_all/notification_all_screen.dart';
import '../notification_screen/widgets/listdescription_item_widget.dart';
import '../notification_screen/widgets/listthisisdummyc_item_widget.dart';
import '../notification_screen/widgets/listthisisdummyc_two_item_widget.dart';
import '../notification_unread/controller/notification_unread_controller.dart';
import '../notification_unread/notification_unread.dart';
import 'controller/notification_controller.dart';
import 'models/listdescription_item_model.dart';
import 'models/listthisisdummyc_item_model.dart';
import 'models/listthisisdummyc_two_item_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

class NotificationScreen extends GetWidget<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return BaseviewScreen(
        basicAppBar: true,
        screenName: "lbl_notifications".tr,
        showBottomBar: false,
        sidePadding: false,
        basicAppTrailingIcon: ImageConstant.menu_dots,
        basicAppTrailingIconOnTap: () {
          HelperFunction.showBottomSheet(
            context,
            bottomSheetHeight: 200,
            screenTitle: "Notification Options",
            screenEndTask: "Done",
            widget: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      CommonImageView(
                        svgPath: ImageConstant.blue_check,
                      ),
                      Flexible(
                        child: ListTile(
                          title: Text(
                            "Mark all as Read",
                            textScaleFactor: 1.0,
                          ),
                          onTap: () {
                            // controller.markAsRead.value = true;
                            controller.markAllAsReadApi();
                            print(controller.markAsRead.value);
                            Get.back();
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CommonImageView(
                        svgPath: ImageConstant.clear_check,
                      ),
                      Flexible(
                        child: ListTile(
                          title: Text(
                            "Clear all notifications",
                            textScaleFactor: 1.0,
                          ),
                          onTap: () {
                            controller.clearAllNotifications();
                            // controller.markAsRead.value = false;
                            print(controller.markAsRead.value);
                            Get.back();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        backgroundColor: ColorConstant.whiteA700,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Container(
                decoration: BoxDecoration(
                  color: Color(0xffF5F5F5),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                height: 50.0,
                padding: getPadding(bottom: 5, top: 5, left: 5, right: 5),
                margin: EdgeInsets.symmetric(horizontal: 15.0),
                child: TabBar(
                  labelColor: ColorConstant.whiteA700,
                  unselectedLabelColor: ColorConstant.hintTextColor,
                  labelStyle: AppStyle.txtPoppinsRegular14.copyWith(
                    color: ColorConstant.whiteA700,
                  ),
                  unselectedLabelStyle: AppStyle.txtPoppinsRegular14.copyWith(
                    color: ColorConstant.hintTextColor,
                  ),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    // border: Border.all(color:  Color(0xffF5F6F8), width: 1.5),
                    color: ColorConstant.primaryColor,
                  ),
                  tabs: [
                    new Tab(
                      text: "All",
                    ),
                    new Tab(
                        text: "Unread (${controller.notificationCount.value})"),
                  ],
                  controller: controller.tabController,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Notification_All_Screen(),
                  Notification_Unread_screen(),
                ],
              ),
            )
          ],
        ));
  }

  onTapImgArrowleft() {
    Get.back();
  }
}
