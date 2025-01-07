import 'package:salon_symphony/presentation/notification_screen/models/notification_response_model.dart';
import 'package:salon_symphony/widgets/custom_text.dart';

import '../../notification_nolink_screen/notification_nolink_screen.dart';
import '../../task_details_screen/task_details_screen.dart';
import '../controller/notification_controller.dart';
import '../models/listdescription_item_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

// ignore: must_be_immutable
class NotificationsList extends StatelessWidget {
  NotificationsList({required this.data});
  var controller = Get.find<NotificationController>();
  NotificationData  data;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(
        top: 6.0,
        bottom: 6.0,
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: getPadding(
              top: 0,
              right: 16,
              left: 16
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.max,
              children: [
                Obx(() => data.localRead!.value == false
                    ? Padding(
                  padding: EdgeInsets.only(top: 6.0),
                      child: Container(
                  height: getSize(
                      8.00,
                  ),
                  width: getSize(
                      8.00,
                  ),

                  decoration: BoxDecoration(
                      color: ColorConstant.pink300,
                      shape: BoxShape.circle
                  ),
                ),
                    )
                    : Container(
                  height: getSize(
                    8.00,
                  ),
                  width: getSize(
                    8.00,
                  ),
                  margin: getMargin(
                    top: 5,
                    bottom: 5,
                  ),
                )),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MyText(
                        title: '${data.title} ',
                        clr: ColorConstant.black900,
                        line: 1,
                        toverflow: TextOverflow.ellipsis,
                        fontSize: 14.5,
                        weight: "Semi Bold",
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      MyText(
                        title: '${data.message}',
                        clr: ColorConstant.black900,
                        line: 2,
                        toverflow: TextOverflow.ellipsis,
                        fontSize: 13,

                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  data.createdAgo.toString(),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPoppinsRegular12Gray600.copyWith(color: Color(0xffA8A8A8)),
                ),

              ],
            ),
          ),

          SizedBox(
            height: 16,
          ),

          Divider(height: 1,)

          // Container(
          //   height: 1,width: double.maxFinite,
          //   color: ColorConstant.gray200,
          // )
        ],
      ),
    );
  }
}
