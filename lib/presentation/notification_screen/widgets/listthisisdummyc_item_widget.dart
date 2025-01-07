import '../../../widgets/custom_text.dart';
import '../../notification_nolink_screen/notification_nolink_screen.dart';
import '../controller/notification_controller.dart';
import '../models/listthisisdummyc_item_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

// ignore: must_be_immutable
class ListthisisdummycItemWidget extends StatelessWidget {
  ListthisisdummycItemWidget(this.listthisisdummycItemModelObj);

  ListthisisdummycItemModel listthisisdummycItemModelObj;

  var controller = Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        // Get.to(NotificationNoLinkScreen());
      },
      child: Container(
        margin: getMargin(
          top: 8.0,
          bottom: 8.0,
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: getPadding(
                top: 0,
                right: 16,
                left: 38,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  MyText(
                    title: 'June Juliano assigned you a task ',
                    clr: ColorConstant.black900,
                    fontSize: 14.5,
                    weight: "Semi Bold",
                  ),
                  Text(
                    "1d ago",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsRegular12Gray600.copyWith(color: Color(0xffA8A8A8)),
                  ),

                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: getPadding(
                  left: 38,
                  top: 4,
                  right: 10,
                  bottom: 14,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: getPadding(
                        bottom: 1,
                      ),
                      child: Text(
                        "Vacation Time (Mar 3,2023)",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsRegular12Gray600.copyWith(
                          color:  ColorConstant.black900,
                          fontSize: 13
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Container(
              height: 1,width: double.maxFinite,
              color: ColorConstant.gray200,
            )
          ],
        ),
      ),
    );
  }
}
