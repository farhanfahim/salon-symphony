import '../controller/chang_shift_timing_controller.dart';
import '../models/listseven_item_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

// ignore: must_be_immutable
class ListsevenItemWidget extends StatelessWidget {
  ListsevenItemWidget(this.listsevenItemModelObj);

  ListsevenItemModel listsevenItemModelObj;

  var controller = Get.find<ChangShiftTimingController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(
        left: 1,
        top: 16.9600065,
        right: 1,
        bottom: 16.9600065,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: getPadding(
              top: 1,
              bottom: 2,
            ),
            child: Text(
              "lbl_07".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtPoppinsSemiBold20,
            ),
          ),
          Padding(
            padding: getPadding(
              left: 34,
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
              bottom: 2,
            ),
            child: Text(
              "lbl_00".tr,
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
              left: 36,
              top: 1,
              bottom: 1,
            ),
            child: Text(
              "lbl_pm".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtPoppinsSemiBold20,
            ),
          ),
        ],
      ),
    );
  }
}
