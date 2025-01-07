import '../controller/referral_all_controller.dart';
import '../models/referral_all_item_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_button.dart';

// ignore: must_be_immutable
class ReferralAllItemWidget extends StatelessWidget {
  ReferralAllItemWidget(this.referralAllItemModelObj,this.index);
  int index;

  ReferralAllItemModel referralAllItemModelObj;

  var controller = Get.find<ReferralAllController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(
        top: 8.0,
        bottom: 8.0,
      ),
      decoration: AppDecoration.outlineGray300.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: getPadding(
              left: 15,
              top: 21,
              bottom: 16,
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
                  child: index==1 ||index==5?Text(
                    "lbl_taina_dorwart".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsMedium14.copyWith(
                      height: 1.00,
                    ),
                  ):Text(
                    "lbl_jakob_baptista".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsMedium14.copyWith(
                      height: 1.00,
                    ),
                  ),
                ),
                Container(
                  width: getHorizontalSize(
                    141.00,
                  ),
                  margin: getMargin(
                    top: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: getPadding(
                          bottom: 1,
                          right: 7
                        ),
                        child: Text(
                          "Position:",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsRegular12Black900,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          top: 1,
                        ),
                        child: Text(
                          "lbl_stylish".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsRegular12Gray600,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: getHorizontalSize(
                      141.00,
                    ),
                    margin: getMargin(
                      top: 9,
                      right: 1,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: getPadding(
                            top: 1,
                            right: 7
                          ),
                          child: Text(
                            "Relation:",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsRegular12Black900,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            bottom: 1,
                          ),
                          child: Text(
                            "lbl_friend".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsRegular12Gray600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          index==1||index==5? CustomButton(
            width: 65,
            text: "lbl_pending".tr,
            margin:  getMargin(
              left: 111,
              top: 10,
              right: 10,
              bottom: 65,
            ),
            variant: ButtonVariant.OutlineBluegray100_1,
            padding: ButtonPadding.PaddingAll4,
            fontStyle: ButtonFontStyle.PoppinsMedium10Gray600,
          ):CustomButton(
            width: 70,
            text: "lbl_approved".tr,
            margin: getMargin(
              left: 111,
              top: 10,
              right: 10,
              bottom: 65,
            ),
            variant: ButtonVariant.FillGreen801,
          ),
        ],
      ),
    );
  }
}
