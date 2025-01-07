import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import '../../../baseviews/baseview_process_screen.dart';
import '../../../core/utils/responsive.dart';
import 'controller/image_view_controller.dart';


class ImageView extends StatelessWidget {
  ImageViewController controller = Get.put(ImageViewController());
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
                // Down Swipe
                Navigator.pop(context);
              } else if (details.delta.dy < -sensitivity) {
                // Up Swipe
                Navigator.pop(context);
              }
            },
            child: Obx(() => Center(
              child: CommonImageView(
                url: controller.imageUrl.value,
              ),
            ))
        )
    );
  }
}
