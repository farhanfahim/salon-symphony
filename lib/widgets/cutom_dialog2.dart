import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:price_comparison_app/widgets/custom_button.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/responsive.dart';
import 'custom_text.dart';

class CustomModelSheet2 extends StatelessWidget {
  CustomModelSheet2(
      {required this.title, required this.msg, required this.onTap});

  final String? title;
  final String? msg;
  final Function? onTap;

  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return Scaffold(
      backgroundColor: ColorConstant.hintTextColor.withOpacity(0.3),
      body: Container(
        height: responsive.setHeight(100),
        width: responsive.setWidth(100),
        color: ColorConstant.hintTextColor.withOpacity(0.3),
        child: Center(
          child: Container(
            width: responsive.setWidth(90),
            decoration: BoxDecoration(
                color: ColorConstant.whiteA700,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: responsive.setHeight(6),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(
                              title: '$title',
                              center: true,
                              clr: ColorConstant.black900,
                              fontSize: responsive.setTextScale(20),
                              weight: 'Semi Bold',
                            ),
                            GestureDetector(
                              onTap: (){
                                Get.back();
                              },
                              child: MyText(
                                title: 'Close',
                                center: true,
                                clr: ColorConstant.errorColor,
                                fontSize: responsive.setTextScale(15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      height: 1,
                      width: responsive.setWidth(100),
                      color: ColorConstant.hintTextColor.withOpacity(0.3),
                    ),
                  ),
                  SizedBox(
                    height: responsive.setHeight(2),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: MyText(
                      title: '$msg',
                      clr: ColorConstant.hintTextColor,
                      // fontSize: responsive.setTextScale(18),
                    ),
                  ),
                  SizedBox(
                    height: responsive.setHeight(3),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
