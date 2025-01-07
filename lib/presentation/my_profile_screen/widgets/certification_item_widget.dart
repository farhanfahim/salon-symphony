import '../controller/my_profile_controller.dart';
import '../models/my_profile_item_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class CertificationItemWidget extends StatelessWidget {
  int pos;
  CertificationItemWidget(this.pos);


  var controller = Get.find<MyProfileController>();

  @override
  Widget build(BuildContext context) {
    return Container(

        padding:
        getPadding(left: 0, top: 19, right: 26),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment:
            CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              CommonImageView(
                svgPath: ImageConstant.clipper,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.6,
                child: Text(
                  controller.myProfileResponseModelObj.value.data!.certificates![pos].certificate != null ? controller.myProfileResponseModelObj.value.data!.certificates![pos].certificate! : '',
                  maxLines: 2,
                  style: TextStyle(
                    color: ColorConstant.black900,
                    fontSize: getFontSize(
                      14,
                    ),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Spacer(),
              Text(
                controller.myProfileResponseModelObj.value.data!.certificates![pos].size!,
                style: TextStyle(
                  color: ColorConstant.hintTextColor,
                  fontSize: getFontSize(
                    12,
                  ),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ]));
  }
}
