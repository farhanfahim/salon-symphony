import '../controller/chang_shift_timing_controller.dart';
import '../models/listfour_one_item_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

// ignore: must_be_immutable
class ListfourOneItemWidget extends StatelessWidget {
  ListfourOneItemWidget(this.listfourOneItemModelObj);

  ListfourOneItemModel listfourOneItemModelObj;

  var controller = Get.find<ChangShiftTimingController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: getPadding(
          top: 16.969986,
          bottom: 16.969986,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: getPadding(
                bottom: 2,
              ),
              child: Text(
                "lbl_04".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsSemiBold20,
              ),
            ),
            Padding(
              padding: getPadding(
                left: 33,
                top: 2,
              ),
              child: Text(
                "lbl3".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtInterMedium20,
              ),
            ),
            Padding(
              padding: getPadding(
                left: 33,
                top: 1,
                bottom: 2,
              ),
              child: Text(
                "lbl_30".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsSemiBold20,
              ),
            ),
            Padding(
              padding: getPadding(
                left: 33,
                top: 2,
              ),
              child: Text(
                "lbl3".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtInterMedium20,
              ),
            ),
            Padding(
              padding: getPadding(
                left: 34,
                top: 1,
                bottom: 1,
              ),
              child: Text(
                "lbl_am".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsSemiBold20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
