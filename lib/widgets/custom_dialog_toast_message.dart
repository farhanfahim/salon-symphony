import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_symphony/core/app_export.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/image_constant.dart';
import '../core/utils/size_utils.dart';
import 'custom_button.dart';
import 'custom_text.dart';

class CustomAlertToastDialog extends StatelessWidget {
  VoidCallback ontap;
  String? image;
  String title;
  String body;
  String? btnTxt;
  bool? divider;
  bool bodyCenter;
  CustomAlertToastDialog({required this.ontap,required this.title,required this.body, this.image,this.divider,required this.bodyCenter,this.btnTxt});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        insetPadding: EdgeInsets.symmetric(horizontal: 20),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            image!=null?CommonImageView(
              svgPath: image!,
              height: 90,
            ):Offstage(),
            SizedBox(height: image!=null?15:0),
            MyText(
              title: title,
              clr: ColorConstant.black900,
              fontSize: 20,
              weight: "Semi Bold",
            ),
            SizedBox(
              height: 10,
            ),
            divider==true? Divider(thickness: 1,):Offstage(),
            divider==true?SizedBox(
              height: 15,
            ):Offstage(),
            MyText(
              title: body,
              clr: ColorConstant.black900,
              fontSize: 16,
              height: 1.6,
              center: bodyCenter,
            ),
            SizedBox(height: 24),
            CustomButton(
                width: double.maxFinite,
                text: btnTxt!=null?btnTxt:"Got it!",
                margin: getMargin(left: 5, top: 15, right: 5),
                padding: ButtonPadding.PaddingAll18,
                fontStyle: ButtonFontStyle.PoppinsSemiBold16,
                onTap:ontap,
                alignment:Alignment.center)

          ],
        ),
      ),
    );
  }
}