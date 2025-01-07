import 'package:salon_symphony/baseviews/baseview_auth_screen.dart';
import 'package:salon_symphony/core/utils/responsive.dart';
import '../../widgets/custom_text.dart';
import 'controller/splash_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

class SplashOneScreen extends GetWidget<SplashOneController> {
  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return BaseviewAuthScreen(
      stickfooter: false,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: responsive.setHeight(5),
              ),
              Hero(
                tag: 'logo',
                child: CommonImageView(
                  imagePath: ImageConstant.splash_logo_new,
                  height: getVerticalSize(100.00),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: MyText(
                  title: 'Version 2.8.18',
                  weight: 'Light Bold',
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
