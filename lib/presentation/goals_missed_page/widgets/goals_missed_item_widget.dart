import 'dart:io';
import '../controller/goals_missed_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

import '../models/goals_all_item_model.dart';

// ignore: must_be_immutable
class GoalsMissedItemWidget extends StatelessWidget {
  GoalsMissedItemWidget(this.goalsItemModelObj, {this.onTapColumnmindmap,this.index});

  GoalsItemModel goalsItemModelObj;
  int? index;

  var controller = Get.find<GoalsMissedController>();

  VoidCallback? onTapColumnmindmap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTapColumnmindmap!();
      },
      child: Container(
        margin: getMargin(
          top: 8.0,
          bottom: 8.0,
        ),
        padding: getPadding(
          all: 1,
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: getPadding(
                  left: 12,
              ),
              child: Row(
                children: [
                  CommonImageView(
                    svgPath: ImageConstant.red_cross,
                    height: 15,
                    width: 14,
                  ),
                  SizedBox(width: 10,),
                  Text(
                      "\$2K Weekly Service Sales Goal",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: ColorConstant.black900,
                        fontSize: 16,
                         fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                        fontWeight: FontWeight.w600,
                      )
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                top: 5,
                left: 38,
                bottom: index == 2? 5: 15
              ),
              child: Text(
                "Target Date:  Feb 9, 2023",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                  style: TextStyle(
                    color: ColorConstant.gray500,
                    fontSize: 13,

                     fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                    fontWeight: FontWeight.w300,
                  )


              ),
            ),
            index == 2? Offstage():
            Container(
              height: 1,
              color: ColorConstant.gray200,
            )

          ],
        ),
      ),
    );
  }
}
