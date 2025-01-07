import 'controller/home_empty_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/presentation/chat_module/chat_page/chat_page.dart';
import 'package:salon_symphony/presentation/home_empty_page/home_empty_page.dart';
import 'package:salon_symphony/presentation/more_page/more_page.dart';
import 'package:salon_symphony/presentation/resource_library_page/resource_library_page.dart';
import 'package:salon_symphony/presentation/task_to_do_tab_container_page/task_to_do_tab_container_page.dart';
import 'package:salon_symphony/widgets/custom_bottom_bar.dart';

class HomeEmptyContainerScreen extends GetWidget<HomeEmptyContainerController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Obx(() => getCurrentWidget(controller.type.value)),
            bottomNavigationBar:
                CustomBottomBar(onChanged: (BottomBarEnum type) {
              controller.type.value = type;
            })));
  }

  Widget getCurrentWidget(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return HomeEmptyPage();
      case BottomBarEnum.Learn:
        return ResourceLibraryPage();
      case BottomBarEnum.Tasks:
        return TaskToDoTabContainerPage();
      case BottomBarEnum.Chat:
        return ChatPage();
      case BottomBarEnum.Menu:
        return MorePage();
      default:
        return HomeEmptyPage();
    }
  }
}
