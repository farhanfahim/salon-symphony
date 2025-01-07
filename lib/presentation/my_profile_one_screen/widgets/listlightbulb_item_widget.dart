import '../controller/my_profile_one_controller.dart';
import '../models/listlightbulb_item_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

// ignore: must_be_immutable
class ListlightbulbItemWidget extends StatelessWidget {
  ListlightbulbItemWidget(this.listlightbulbItemModelObj);

  ListlightbulbItemModel listlightbulbItemModelObj;

  var controller = Get.find<MyProfileOneController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: getPadding(
          top: 7.5,
          bottom: 7.5,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: getPadding(
                top: 1,
              ),
              child: CommonImageView(
                svgPath: ImageConstant.imgLightbulb,
                height: getSize(
                  40.00,
                ),
                width: getSize(
                  40.00,
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                left: 15,
                top: 1,
              ),
              child: CommonImageView(
                svgPath: ImageConstant.imgLightbulb,
                height: getSize(
                  40.00,
                ),
                width: getSize(
                  40.00,
                ),
              ),
            ),
            Container(
              height: getVerticalSize(
                39.00,
              ),
              width: getHorizontalSize(
                40.00,
              ),
              margin: getMargin(
                left: 15,
                top: 1,
                bottom: 1,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CommonImageView(
                      svgPath: ImageConstant.imgMail,
                      height: getVerticalSize(
                        39.00,
                      ),
                      width: getHorizontalSize(
                        40.00,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: getPadding(
                        left: 10,
                        top: 9,
                        right: 10,
                        bottom: 9,
                      ),
                      child: CommonImageView(
                        imagePath: ImageConstant.imgEmojiorte381,
                        height: getSize(
                          20.00,
                        ),
                        width: getSize(
                          20.00,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: getVerticalSize(
                39.00,
              ),
              width: getHorizontalSize(
                40.00,
              ),
              margin: getMargin(
                left: 15,
                top: 1,
                bottom: 1,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CommonImageView(
                      svgPath: ImageConstant.imgMail,
                      height: getVerticalSize(
                        39.00,
                      ),
                      width: getHorizontalSize(
                        40.00,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: getPadding(
                        left: 10,
                        top: 9,
                        right: 10,
                        bottom: 9,
                      ),
                      child: CommonImageView(
                        imagePath: ImageConstant.imgEmojiorte381,
                        height: getSize(
                          20.00,
                        ),
                        width: getSize(
                          20.00,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: getVerticalSize(
                39.00,
              ),
              width: getHorizontalSize(
                40.00,
              ),
              margin: getMargin(
                left: 15,
                top: 1,
                bottom: 1,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CommonImageView(
                      svgPath: ImageConstant.imgMail,
                      height: getVerticalSize(
                        39.00,
                      ),
                      width: getHorizontalSize(
                        40.00,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: getPadding(
                        left: 10,
                        top: 9,
                        right: 10,
                        bottom: 9,
                      ),
                      child: CommonImageView(
                        imagePath: ImageConstant.imgEmojiorte381,
                        height: getSize(
                          20.00,
                        ),
                        width: getSize(
                          20.00,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: getVerticalSize(
                39.00,
              ),
              width: getHorizontalSize(
                40.00,
              ),
              margin: getMargin(
                left: 15,
                bottom: 1,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CommonImageView(
                      svgPath: ImageConstant.imgMail,
                      height: getVerticalSize(
                        39.00,
                      ),
                      width: getHorizontalSize(
                        40.00,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: getPadding(
                        left: 10,
                        top: 9,
                        right: 10,
                        bottom: 9,
                      ),
                      child: CommonImageView(
                        imagePath: ImageConstant.imgEmojismiley17,
                        height: getSize(
                          20.00,
                        ),
                        width: getSize(
                          20.00,
                        ),
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
