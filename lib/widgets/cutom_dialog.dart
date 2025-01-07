import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_symphony/core/utils/semantics.dart';
// import 'package:price_comparison_app/widgets/custom_button.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/responsive.dart';
import '../theme/app_style.dart';
import 'custom_text.dart';

class CustomModelSheet extends StatelessWidget {
  CustomModelSheet(
      {required this.title, required this.msg, this.onTapYes,this.onTapNo,this.onTapOk,this.showOkButton,
      this.cancelSemantics=SemanticsLabel.LAB_CANCEL_BTN,this.titleSemantics,this.actionSemantics,});

  final String? title;
  final String? msg;
  final bool? showOkButton;
  final Function? onTapYes;
  final Function? onTapNo;
  final Function? onTapOk;
  final String? titleSemantics,actionSemantics;
  final String cancelSemantics;
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
            width: responsive.setWidth(80),
            decoration: BoxDecoration(
                color: ColorConstant.whiteA700,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10,),
                Container(
                  height: responsive.setHeight(5),
                  child: Center(
                    child: Semantics(
                      label: titleSemantics,
                      child: Text(
                          '$title',
                          textScaleFactor: 1.0,
                          style: AppStyle
                              .txtPoppinsRegular14Black901.copyWith(fontSize: 20)
                              .copyWith(height: 1.00)
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  '$msg',
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.0,
                    style: AppStyle
                        .txtPoppinsRegular14Black901

                        .copyWith(height: 1.5)
                ),
                SizedBox(
                  height: responsive.setHeight(2.5),
                ),
                Container(
                  height: 1,
                  width: responsive.setWidth(100),
                  color: ColorConstant.hintTextColor.withOpacity(0.3),
                ),
                showOkButton! ?Semantics(
                  label: cancelSemantics,
                  child: GestureDetector(
                    onTap: () {
                      onTapOk!();
                      Get.back();
                    },
                    child: Container(
                      width: responsive.setWidth(30),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Ok",
                          textAlign: TextAlign.center,
                            textScaleFactor: 1.0,
                            style: AppStyle
                            .txtPoppinsRegular14Pink300
                            .copyWith(height: 1.00)
                        ),
                      ),
                    ),
                  ),
                ):Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Semantics(
                      label: cancelSemantics,
                      child: GestureDetector(
                        onTap: () {
                          onTapNo!();
                          Get.back();
                        },
                        child: Container(
                          width: responsive.setWidth(30),
                          child: Text(
                            "No",
                            textAlign: TextAlign.center,
                              textScaleFactor: 1.0,
                              style: AppStyle
                              .txtPoppinsRegular14Pink300
                              .copyWith(height: 1.00,
                            color: ColorConstant.hintTextColor)
                          ),
                        ),
                      ),
                    ),

                    Container(
                      width: 1,
                      height: responsive.setHeight(5),
                      color: ColorConstant.hintTextColor.withOpacity(0.3),
                    ),

                    Semantics(label: actionSemantics,
                      child: GestureDetector(
                        onTap: () {
                          onTapYes!();

                        },
                        child: Container(
                          width: responsive.setWidth(30),
                          child: Text(
                            "Yes",
                            textAlign: TextAlign.center,
                              textScaleFactor: 1.0,
                              style: AppStyle
                                  .txtPoppinsRegular14Pink300
                                  .copyWith(height: 1.00)
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
