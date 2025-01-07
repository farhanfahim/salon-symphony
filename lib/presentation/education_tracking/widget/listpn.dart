import '../controller/education_tracking_controller.dart';
import '../model/pnlist_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

// ignore: must_be_immutable
class Listpn0001245OneItemWidget extends StatelessWidget {
  Listpn0001245OneItemWidget(this.listpn0001245OneItemModelObj,
      {this.onTapColumnpn0001245one});

  Listpn0001245OneItemModel listpn0001245OneItemModelObj;

  var controller = Get.find<EducationTrackingController>();

  VoidCallback? onTapColumnpn0001245one;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapColumnpn0001245one!();
      },
      child: Container(
        margin: getMargin(
          top: 8.0,
          bottom: 8.0,
        ),
        padding: getPadding(
          left: 13,
          top: 12,
          right: 13,
          bottom: 12,
        ),
        decoration: AppDecoration.outlineGray3012.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: getPadding(
                left: 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: getPadding(
                      top: 5,
                    ),
                    child: Text(
                      "lbl_lenny_strand".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsRegular12Gray600,
                    ),
                  ),
                  CommonImageView(
                    svgPath: ImageConstant.imgCheckmark20X20,
                    height: getSize(
                      19.00,
                    ),
                    width: getSize(
                      19.00,
                    ),
                    margin: getMargin(
                      bottom: 4,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                left: 2,
                top: 1,
              ),
              child: Text(
                "msg_balayage_techniques".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsSemiBold14.copyWith(
                  height: 1.53,
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                left: 2,
                top: 9,
                right: 79,
                bottom: 7,
              ),
              child: Row(
                children: [
                  CommonImageView(
                    svgPath: ImageConstant.imgComputer,
                    height: getSize(
                      18.00,
                    ),
                    width: getSize(
                      18.00,
                    ),
                    margin: getMargin(
                      bottom: 1,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 8,
                      top: 1,
                    ),
                    child: Text(
                      "lbl_mar_14_2022".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsRegular12Black900.copyWith(
                        letterSpacing: 0.05,
                      ),
                    ),
                  ),
                  Spacer(),
                  CommonImageView(
                    svgPath: ImageConstant.imgClock18X18,
                    height: getSize(
                      19.00,
                    ),
                    width: getSize(
                      19.00,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 6,
                    ),
                    child: Text(
                      "lbl_2_hours".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsRegular12Black900.copyWith(
                        letterSpacing: 0.05,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
