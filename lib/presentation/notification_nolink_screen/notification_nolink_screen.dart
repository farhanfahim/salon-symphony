import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/core/utils/helper_functions.dart';
import 'package:salon_symphony/presentation/notification_screen/models/notification_response_model.dart';
import 'package:salon_symphony/widgets/response_binding_widget.dart';
import 'package:salon_symphony/widgets/widgets_shimmer.dart';
import '../../core/utils/utils.dart';
import '../../widgets/custom_text.dart';
import '../notification_screen/models/listthisisdummyc_item_model.dart';
import 'controller/notification_nolink_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

class NotificationNoLinkScreen extends GetWidget<NotificationNoLinkController> {


  @override
  Widget build(BuildContext context) {
    return BaseviewScreen(
        basicAppBar: true,
        screenName: "Notification Details",
        showBottomBar: false,
        sidePadding: false,

        backgroundColor: ColorConstant.whiteA700,
        child: Obx(() =>
         ResponseBindingWidget(
             apiCallStatus: controller.apiCallStatus.value,
             loadingWidget: (){
           return notificationNoLinkShimmer(context);
             },
             errorWidget: (){
               return Container();
             },
             successWidget: (){
           return Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 25),
                 child: Padding(
                   padding: const EdgeInsets.only(left: 00.0),
                   child: MyText(
                     title: controller.data.value.data!.title!,
                     line: 2,
                     toverflow: TextOverflow.ellipsis,
                     clr: ColorConstant.black900,
                     fontSize: 19,
                     weight: "Semi Bold",
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 25),
                 child: MyText(
                   title: controller.data.value.data!.message!,
                   clr: ColorConstant.black900,
                   fontSize: 15,
                 ),
               ),
               controller.data.value.data!.link != null?
               GestureDetector(
                 onTap: (){
                   Utils.launchUrls(controller.data.value.data!.link!);
                 },
                 child: Padding(
                   padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 25),
                   child: MyText(
                     title: controller.data.value.data!.link!,
                     under: true,
                     clr: ColorConstant.deepPurpleA200,
                     fontSize: 15,
                   ),
                 ),
               ):Offstage(),

               SizedBox(
                 height: 5,
               ),
               Divider(),
               controller.data.value.data!.postedBy != null?
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 25),
                 child: MyText(
                   title: "Posted by ${controller.data.value.data!.postedBy!.name} • ${Utils.formatDate(controller.data.value.data!.createdAt!)}",
                   clr: ColorConstant.gray102,
                   fontSize: 13,
                   weight: "Regular",
                 ),
               ): Offstage(),
             ],
           );
             }
         )
        )
    );
  }

  onTapImgArrowleft() {
    Get.back();
  }
}
