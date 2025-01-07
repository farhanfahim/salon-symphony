import '../controller/employee_dicrectry_details_controller.dart';
import '../models/listfacebook1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class Listfacebook1ItemWidget extends StatelessWidget {
  Listfacebook1ItemWidget(this.listfacebook1ItemModelObj);

  Listfacebook1ItemModel listfacebook1ItemModelObj;

  var controller = Get.find<EmployeeDicrectryDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(
        top: 10.5,
        right: 6,
        bottom: 10.5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            10.00,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomIconButton(
            height: 34,
            width: 34,
            margin: getMargin(
              top: 2,
              bottom: 1,
            ),
            variant: IconButtonVariant.FillBlueA400,
            shape: IconButtonShape.CircleBorder15,
            padding: IconButtonPadding.PaddingAll8,
            child: CommonImageView(
              svgPath: ImageConstant.imgFacebook,
            ),
          ),
          Padding(
            padding: getPadding(
              left: 10,
              top: 2,
              bottom: 1,
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
                    "lbl_facebook".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsRegular12Black900.copyWith(
                      letterSpacing: 0.05,
                      height: 1.00,
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 6,
                  ),
                  child: Text(
                    "msg_www_facebook_co".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsRegular12Gray600.copyWith(
                      letterSpacing: 0.05,
                      height: 1.00,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
