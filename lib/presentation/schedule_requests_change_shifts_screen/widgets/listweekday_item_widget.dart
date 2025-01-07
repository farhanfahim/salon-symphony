import '../controller/schedule_requests_change_shifts_controller.dart';
import '../models/listweekday_item_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

// ignore: must_be_immutable
class ListweekdayItemWidget extends StatelessWidget {
  ListweekdayItemWidget(this.listweekdayItemModelObj, {this.onTapRowweekday});

  ListweekdayItemModel listweekdayItemModelObj;

  var controller = Get.find<ScheduleRequestsChangeShiftsController>();

  VoidCallback? onTapRowweekday;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapRowweekday!();
      },
      child: Container(
        margin: getMargin(
          top: 4.875,
          bottom: 4.875,
        ),
        decoration: AppDecoration.outlineBlack9000a.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder15,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: getPadding(
                left: 20,
                top: 13,
                bottom: 11,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: getPadding(
                      right: 10,
                    ),
                    child: Text(
                      "lbl_monday".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsRegular14Black901,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 4,
                    ),
                    child: Text(
                      "msg_7_00_am_3_00".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsRegular12Gray600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                left: 178,
                top: 15,
                right: 17,
                bottom: 16,
              ),
              child: CommonImageView(
                svgPath: ImageConstant.imgArrowdown,
                height: getSize(
                  24.00,
                ),
                width: getSize(
                  24.00,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
