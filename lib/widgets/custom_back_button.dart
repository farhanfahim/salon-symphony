import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_symphony/core/app_export.dart';


import '../core/utils/responsive.dart';

class CustomBackButton extends StatelessWidget {
  CustomBackButton({this.scale, this.color});

  double? scale;
  Color? color;

  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: CommonImageView(
        svgPath: ImageConstant.imgArrowleft,
          // scale: responsive.setWidth(scale ?? 0.90),
          color: color ?? ColorConstant.black900,
      ),
    );
  }
}
