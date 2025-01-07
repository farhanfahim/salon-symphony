import 'dart:io';

import 'package:flutter/services.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import '../../core/utils/helper_functions.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/utils.dart';
import '../reimbursment/reimbursment.dart';
import '../submit_hours/Submit_hours.dart';
import 'controller/add_add_education_tracking_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

class AddAddEducationTrackingScreen extends GetWidget<AddAddEducationTrackingController> {
  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return BaseviewScreen(
     basicAppBar: true,
     screenName: "Education Request",
     showBottomBar: false,
     mainTopHeight: 0,
      isResizeToAvoidBottomInset: true,
      sidePadding: false,
     backgroundColor: ColorConstant.whiteA700 ,
      basicAppTrailingIcon: ImageConstant.imgMenuIcon,
      basicAppTrailingIconOnTap: () {
        HelperFunction.showBottomSheet(context,
            screenTitle: 'Request Option',
            redclrEndTask: false,
            screenEndTask: 'Done',
            bottomSheetHeight: 150,
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),

                GestureDetector(
                  onTap: () async {
                    try {
                      Utils.reportProblem();
                    } catch (e) {
                      Utils.showToast(e.toString(), true);
                    }
                  },
                  child: Row(
                    children: [
                      CommonImageView(
                        imagePath: ImageConstant.report_problem_icon,
                        height: 17,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Report a Problem',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: getFontSize(
                              16,
                            ),
                            letterSpacing: 0.5,
                            fontFamily:
                            Platform.isIOS ? 'SF Pro Display' : 'Roboto',
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                ),
              ],
            ));
      },
     child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          decoration: BoxDecoration(
            color:  Color(0xffF5F5F5),
            borderRadius: BorderRadius.circular(8.0),
          ),
          height: 45.0,
          padding: getPadding(bottom: 5,top: 5,left: 5,right: 5),
          margin: EdgeInsets.symmetric(horizontal: 15.0),
          child: TabBar(
            labelColor:  ColorConstant.whiteA700,
            unselectedLabelColor: ColorConstant.hintTextColor,
            labelStyle: AppStyle.txtPoppinsRegular14.copyWith(
              color: ColorConstant.whiteA700,
            ),
            unselectedLabelStyle: AppStyle.txtPoppinsRegular14.copyWith(
              color: ColorConstant.hintTextColor,
            ),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              // border: Border.all(color:  Color(0xffF5F6F8), width: 1.5),
              color: ColorConstant.primaryColor,
            ),
            tabs: [
              Tab(
                text: "Class Hours",
              ),
              Tab(
                text: "Reimbursement",
              ),

            ],
            controller: controller.tabController,
          ),
        ),
       SizedBox(
        height: 20,
       ),
       Expanded(
        child: TabBarView(
            controller: controller.tabController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              SubmitHours(),
              Reimbursment(),

            ]),
       )
      ],
     ),
    );
  }
}









