import 'package:flutter/material.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/presentation/goals_all_page/goals_all_page.dart';
import '../chat_constants.dart';
import '../chat_media/chat_media.dart';
import 'controller/chat_media_all_controller.dart';

// ignore_for_file: must_be_immutable
class ChatMediaAll extends StatelessWidget {

  ChatMediaAllController controller = Get.put(ChatMediaAllController());

  @override
  Widget build(BuildContext context) {
    return BaseviewScreen(
      basicAppBar: true,
      screenName: ChatConstants.groupChatMedia,
      showBottomBar: false,
      mainTopHeight: 0,
      isMenuTab: false,
      sidePadding: false,
      backgroundColor: ColorConstant.backgroundColor,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                tabs: [
                  Tab(
                    text: ChatConstants.all,
                  ),
                  Tab(
                    text: ChatConstants.photos,
                  ),
                  Tab(
                    text: ChatConstants.videos,
                  ),
                ],
                labelColor: ColorConstant.deepPurpleA201,
                unselectedLabelColor: ColorConstant.gray600,
                indicatorColor: ColorConstant.primaryColor,
                isScrollable: true,
                controller: controller.tabController,
                indicator: CustomTabIndicator(),
              ),
              Container(
                height: 1,
                width: double.maxFinite,
                color: ColorConstant.gray400.withOpacity(0.3),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 67.0),
                  child: TabBarView(
                      controller: controller.tabController,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        ChatMedia(),
                        ChatMedia(),
                        ChatMedia()
                      ]),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}

