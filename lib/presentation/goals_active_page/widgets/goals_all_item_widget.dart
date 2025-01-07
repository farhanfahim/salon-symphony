import 'dart:io';
import '../../../core/utils/app_constant.dart';
import '../../../core/utils/utils.dart';
import '../../goals_missed_page/models/goal_response_model.dart';
import '../controller/goals_active_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

import '../models/goals_all_item_model.dart';

// ignore: must_be_immutable
class GoalsAllItemWidget extends StatelessWidget {
  GoalsAllItemWidget(this.model, {this.onTap,this.index});

  GoalData model;

  int? index;
  var controller = Get.find<GoalsActiveController>();

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
                    // svgPath: ImageConstant.todo_logo,
                    svgPath: model.userStatus!.status==AppConstant.ACTIVE? ImageConstant.clock_purple:
                    model.userStatus!.status==AppConstant.ACHIEVED? ImageConstant.green_check:
                    ImageConstant.red_cross,
                    height: 15,
                    width: 14,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(width: 10,),
                  Flexible(
                    child: Text(
                        "${model.name!=null?model.name!:"-"}",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          color: ColorConstant.black900,
                          fontSize:
                            16,
                           fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                          fontWeight: FontWeight.w600,
                        )
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                top: 5,
                left: 38,
              ),
              child: Text(
                  "Target Date: ${model.endDate!=null?Utils.getFormatedDate(model.endDate!):"-"}",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    color: ColorConstant.gray500,
                    fontSize: 13,
                     fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                    fontWeight: FontWeight.w300,
                  )


              ),
            ),




          ],
        ),
      ),
    );
  }
}
