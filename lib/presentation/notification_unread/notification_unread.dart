import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:salon_symphony/core/utils/image_constant.dart';
import 'package:salon_symphony/core/utils/size_utils.dart';
import 'package:salon_symphony/presentation/chat_module/chat_constants.dart';
import 'package:salon_symphony/routes/app_routes.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/utils.dart';
import '../../theme/app_style.dart';
import '../../widgets/widgetSkeleton.dart';
import '../notification_all/controller/notification_all_controller.dart';
import '../notification_nolink_screen/notification_nolink_screen.dart';
import '../notification_screen/controller/notification_controller.dart';
import '../notification_screen/models/listdescription_item_model.dart';
import '../notification_screen/models/listthisisdummyc_item_model.dart';
import '../notification_screen/models/listthisisdummyc_two_item_model.dart';
import '../notification_screen/models/notification_response_model.dart';
import '../notification_screen/widgets/listdescription_item_widget.dart';
import '../notification_screen/widgets/listthisisdummyc_item_widget.dart';
import '../notification_screen/widgets/listthisisdummyc_two_item_widget.dart';
import 'controller/notification_unread_controller.dart';

class Notification_Unread_screen extends StatelessWidget {
  Notification_Unread_controller controller = Get.put(Notification_Unread_controller());
  NotificationController notificationController = Get.find();
  Notification_All_Controller notificationAllController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: CustomRefreshIndicator(
                  onRefresh: () async {
                    controller.currentPage = 1;
                    controller.pagingController.refresh();
                    notificationController.getNotificationsCount();

                  },
                  // color: ColorConstant.deepPurpleA201,
                  child: PagedListView<int, NotificationData>(
                    physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    pagingController: controller.pagingController,
                    builderDelegate: PagedChildBuilderDelegate<NotificationData>(
                      itemBuilder:(context, item, index)  {
                        return  Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: InkWell(
                              onTap: (){
                                notificationController.getNotificationsCount();
                                if (item.refId != null && item.type != 100) {
                                  if (item.type == 160){
                                    Map<String, dynamic> map = {
                                      ChatConstants.userId: item.refId.toString(),
                                      ChatConstants.threadName: item.user_name,
                                      ChatConstants.fromCreation: true,
                                      ChatConstants.fromGroup: false,
                                    };
                                    Get.toNamed(AppRoutes.chattingView, arguments: map);
                                    notificationController.getNotificationsCount();
                                    notificationAllController.currentPage = 1;
                                    notificationAllController.pagingController.refresh();
                                  }else{
                                    if (item.notifiableId == item.refId && item.type == 90){
                                      Get.toNamed(AppRoutes.myProfileScreen);
                                      notificationController.getNotificationsCount();
                                      notificationAllController.currentPage = 1;
                                      notificationAllController.pagingController.refresh();

                                    }else{
                                      Utils.navigateToScreens(int.parse(item.type!.toString()), item.refId!);
                                      if(item.localRead!.value == false){
                                        controller.markSingleRead(item.id!);
                                        notificationController.getNotificationsCount();
                                        notificationAllController.currentPage = 1;
                                        notificationAllController.pagingController.refresh();
                                      }
                                    }

                                  }
                                }else{
                                  // Get.to(NotificationNoLinkScreen(data: item,));
                                  Get.toNamed(AppRoutes.notificationNoLinkScreen, arguments: {
                                    'id': item.id,
                                  });
                                  if(item.localRead!.value == false){
                                    controller.markSingleRead(item.id!);
                                    notificationController.getNotificationsCount();
                                    notificationAllController.currentPage = 1;
                                    notificationAllController.pagingController.refresh();
                                  }
                                }
                              },
                              child: NotificationsList( data: item)),
                        );
                      },
                      firstPageProgressIndicatorBuilder: (context){
                        return Column(
                          children: [
                            taskShimmer(context),
                          ],
                        );
                      },
                      newPageProgressIndicatorBuilder: (context) => Padding(
                        padding: const EdgeInsets.all(5),
                        child: Center(
                          child: Container(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  ColorConstant.deepPurpleA201),
                            ),
                          ),
                        ),
                      ),
                      noItemsFoundIndicatorBuilder: (context) =>  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              'No notifications found.',
                              style: AppStyle.txtPoppinsSemiBold16.copyWith(
                                height: 1.50,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                              )
                          ),
                          Text(
                              'Unread notifications will appear here.',
                              style: AppStyle.txtPoppinsSemiBold16.copyWith(
                                height: 1.50,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5,
                              )
                          ),
                        ],
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
              ))
        ]);
  }
}
