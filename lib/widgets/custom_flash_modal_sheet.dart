import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:price_comparison_app/widgets/custom_button.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/image_constant.dart';
import '../core/utils/responsive.dart';
import '../core/utils/size_utils.dart';
import '../theme/app_style.dart';
import 'common_image_view.dart';
import 'custom_text.dart';

class CustomFlashModelSheet extends StatelessWidget {
  CustomFlashModelSheet({required this.msg,this.onNext, this.onUndo,this.secondStyle = false});

  final String? msg;
  final bool? secondStyle;
  final Function()? onNext;
  final Function()? onUndo;
  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return Scaffold(
      backgroundColor: ColorConstant.black900.withOpacity(0.1),
      body: Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: responsive.setWidth(80),
                padding: getPadding(top: 30,bottom: 0),
                decoration: BoxDecoration(
                    color: ColorConstant.whiteA700,
                    borderRadius: BorderRadius.circular(20),),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    secondStyle == true ?
                    Container(
                      height:70,
                      width:70,
                      decoration: BoxDecoration(
                          color: ColorConstant.pink,
                          shape: BoxShape.circle,
                        border: Border.all(color: Colors.white.withOpacity(0.9),width: 2),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: CommonImageView(imagePath: ImageConstant.imgEmoji, height: getSize(24.00), width: getSize(24.00)),
                      ),
                    ):  Container(
                      height:70,
                      width:70,
                      decoration: BoxDecoration(
                        color: ColorConstant.green600,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white.withOpacity(0.9),width: 2),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: CommonImageView(imagePath: ImageConstant.exited_emoji, height: getSize(24.00), width: getSize(24.00)),
                      ),
                    ),

                    SizedBox(height: 20,),
                    Container(
                        width: responsive.setWidth(80),
                        decoration: BoxDecoration(
                            color: ColorConstant.whiteA700,
                            borderRadius: BorderRadius.circular(20),),
                        child: Text(msg!,
                            maxLines: null,
                            textAlign: TextAlign.center,
                            style: AppStyle.txtPoppinsSemiBold18
                                .copyWith(letterSpacing: 0.09))

                    ),
                    SizedBox(height: 10,),

                    Container(
                      decoration: BoxDecoration(
                        color: ColorConstant.gray100,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),),
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap:onUndo,
                              child: CommonImageView(svgPath: ImageConstant.ic_undo, height: getSize(24.00), width: getSize(24.00))),
                          Spacer(),
                          GestureDetector(
                            onTap:onNext,
                            child: MyText(
                              title: 'Next',
                              fontSize: 14,
                              clr: ColorConstant.primaryColor,
                            ),
                          )
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
