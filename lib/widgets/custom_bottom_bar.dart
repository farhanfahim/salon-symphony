import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/core/utils/semantics.dart';

import '../presentation/dashboard/controllers/dashboard_controller.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({this.onChanged});

  DashboardController controller = Get.put(DashboardController());

  RxInt selectedIndex = 0.obs;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imageHomeOutline,
      title: "lbl_home".tr,
      type: BottomBarEnum.Home,
    ),

    BottomMenuModel(
      icon: ImageConstant.imgMenu24X24,
      title: "lbl_tasks".tr,
      type: BottomBarEnum.Tasks,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgVolume24X24,
      title: "lbl_learn".tr,
      type: BottomBarEnum.Learn,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgReply,
      title: "lbl_chat".tr,
      type: BottomBarEnum.Chat,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgSettings,
      title: "lbl_menu".tr,
      type: BottomBarEnum.Menu,
    )
  ];


  final List<String> bottomBarLabels=[
    SemanticsLabel.LAB_HOME_TAB,SemanticsLabel.LAB_TASKS_TAB,SemanticsLabel.LAB_LEARN_TAB,
    SemanticsLabel.LAB_MESSAGES_TAB,SemanticsLabel.LAB_MENU_TAB,
  ];

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: ColorConstant.whiteA701,
          // borderRadius: BorderRadius.circular(
          //   getHorizontalSize(
          //     14.00,
          //   ),
          // ),
          boxShadow: [
            BoxShadow(
              color: ColorConstant.black90019,
              spreadRadius: getHorizontalSize(
                2.00,
              ),
              blurRadius: getHorizontalSize(
                2.00,
              ),
              offset: Offset(
                0, -1,
              ),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          currentIndex: controller.selectedIndex.value,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: Semantics(
                label: bottomBarLabels[index],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CommonImageView(
                      svgPath: bottomMenuList[index].icon,
                      height: getSize(
                        24.00,
                      ),
                      width: getSize(
                        24.00,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 6,
                      ),
                      child: Text(
                        bottomMenuList[index].title ?? "",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsMedium10.copyWith(
                          letterSpacing: 0.5,
                          height: 1.00,
                          fontSize: 12,
                          color: ColorConstant.gray600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              activeIcon: Semantics(
                label: bottomBarLabels[index],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CommonImageView(
                      svgPath: controller.selectedIndex == 0
                          ? ImageConstant.imgIcon
                          : controller.selectedIndex == 2
                              ? ImageConstant.imageBook
                              : controller.selectedIndex == 1
                                  ? ImageConstant.imagetask
                                  : controller.selectedIndex == 3
                                      ? ImageConstant.imageChat
                                      : controller.selectedIndex == 4
                                          ? ImageConstant.imageMenu
                                          : bottomMenuList[index].icon,
                      height: getSize(
                        24.00,
                      ),
                      width: getSize(
                        24.00,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 6,
                      ),
                      child: Text(
                        bottomMenuList[index].title ?? "",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style:
                            AppStyle.txtPoppinsRegular10DeeppurpleA201.copyWith(
                          letterSpacing: 0.5,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          height: 1.00,
                          color: ColorConstant.deepPurpleA201,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              label: '',
            );
          }),
          onTap: (index) { if (index == 0) {
          controller.selectedIndex.value = index;
          print('arso index is : $index');
          controller.changePage(index);
          controller.screenName.value = 'Home';
          controller.mainTopPadding.value = 2;
          controller.chatIcon.value = false;
          controller.learnIcon.value = false;
          controller.menuIcon.value = false;
          // controller.isBasicAppBar.value = true;
          }else if (index == 2) {
              controller.selectedIndex.value = index;
              print('arso index is : $index');
              controller.changePage(index);
              controller.screenName.value = 'Education Resources';
              controller.mainTopPadding.value = 0;
              controller.chatIcon.value = false;
              controller.menuIcon.value = false;
              controller.learnIcon.value = true;
              // controller.isBasicAppBar.value = true;
            }else if (index == 1) {
            controller.selectedIndex.value = index;
            print('arso index is : $index');
            controller.changePage(index);
            controller.screenName.value = 'Task Reminders';
            controller.mainTopPadding.value = 0;
            controller.chatIcon.value = false;
            controller.learnIcon.value = false;
            controller.menuIcon.value = false;
            // controller.isBasicAppBar.value = true;
          }else if (index == 3) {
              controller.selectedIndex.value = index;
              print('arso index is : $index');
              controller.changePage(index);
              controller.screenName.value = 'Messages';
              controller.mainTopPadding.value = 0;
              controller.chatIcon.value = true;
              controller.learnIcon.value = false;
              controller.menuIcon.value = false;

              // controller.isBasicAppBar.value = true;
            } else {
              controller.selectedIndex.value = index;
              print('arso index is : $index');
              controller.changePage(index);
              controller.screenName.value = 'Menu';
              controller.mainTopPadding.value = 0;
              controller.chatIcon.value = false;
              controller.learnIcon.value = false;
              controller.menuIcon.value = true;
              // controller.isBasicAppBar.value = true;
            }
          },
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  Learn,
  Tasks,
  Chat,
  Menu,
}

class BottomMenuModel {
  BottomMenuModel({required this.icon, this.title, required this.type});

  String icon;

  String? title;

  BottomBarEnum type;
}

///Set default widget when screen is not configured with bottom menu
Widget getDefaultWidget() {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.all(10),
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Please replace the respective Widget here',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    ),
  );
}
