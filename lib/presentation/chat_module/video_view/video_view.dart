import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/presentation/chat_module/video_view/widget/my_video_player.dart';
import '../../../baseviews/baseview_process_screen.dart';
import '../../../core/utils/responsive.dart';
import 'controller/video_view_controller.dart';


class VideoView extends StatelessWidget {
  VideoViewController controller = Get.put(VideoViewController());
  Responsive responsive = Responsive();
  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return BaseviewScreen(
        basicAppBar: true,
        screenName: "",
        showBottomBar: false,
        isMenuTab: false,
        mainTopHeight: 0,
        basicAppTrailingIcon: null,

        sidePadding: false,
        backgroundColor: ColorConstant.black900,
        child: GestureDetector(
          onVerticalDragUpdate: (details) {
            int sensitivity = 15;
            if (details.delta.dy > sensitivity) {
              Get.back();
            } else if (details.delta.dy < -sensitivity) {
              Get.back();
            }
          },
          child:  Obx(() => MyVideoPlayer(mediaUrl: controller.url.value)),
        )
    );
  }
}
