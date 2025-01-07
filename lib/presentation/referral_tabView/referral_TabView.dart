import 'dart:io';

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_symphony/core/utils/helper_functions.dart';
import 'package:salon_symphony/core/utils/utils.dart';

import '../../baseviews/baseview_process_screen.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../widgets/common_image_view.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/search_text_field.dart';
import '../goals_all_page/goals_all_page.dart';
import '../referral_all_page/referral_all_page.dart';
import '../referral_approved_page/referral_approved_page.dart';
import '../referral_pending_page/referral_pending_page.dart';
import '../search_screen/search_screen.dart';
import 'controller/referral_tabView_controller.dart';
import 'model/model.dart';

class ReferralTabView extends StatelessWidget {
  ReferalController controller =
  Get.put(ReferalController(ReferralAllTabContainerModel().obs));
  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return BaseviewScreen(
        basicAppBar: true,
        screenName: "Candidates",
        showBottomBar: false,
        mainTopHeight: 0,
        bottomSafeArea: true,
        sidePadding: false,
        backgroundColor: ColorConstant.whiteA700,
        basicAppTrailingIcon: ImageConstant.imgMenuIcon,
        basicAppTrailingIconOnTap: () {
          HelperFunction.showBottomSheet(context,
              screenTitle: 'Candidate Option',
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
        child: Stack(
          children: [
            Column(
              children: [
                TabBar(
                  // isScrollable: true,
                  tabs: [

                    Tab(
                      text: "PENDING",
                    ),
                    Tab(
                      text: "APPROVED",
                    ),

                  ],
                  labelColor: ColorConstant.deepPurpleA201,
                  unselectedLabelColor: ColorConstant.gray600,
                  indicatorColor: ColorConstant.primaryColor,
                  controller: controller.tabController,
                  indicator: CustomTabIndicator(),
                ),
                Container(height: 1,width: double.maxFinite,color: ColorConstant.gray400.withOpacity(0.3),),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TabBarView(
                        controller: controller.tabController,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          ReferralPendingPage(),
                          ReferralApprovedPage(),

                        ]),
                  ),
                ),

              ],
            ),
            Positioned(
                bottom: 0,
                child: Stack(
                  children: [
                    Blur(
                      blur: 8,
                      child: Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          border: Border(
                            top: BorderSide(
                              color: ColorConstant.black900,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: CustomButton(
                          width: 343,
                          text: "New Referral",
                          prefixWidget: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.add,
                              color: ColorConstant.whiteA700,
                            ),
                          ),
                          onTap: () {
                            Get.toNamed(AppRoutes.addNewRererralScreen);
                          },
                          margin: getMargin(
                              left: 16, top: 15, right: 16),
                          padding: ButtonPadding.PaddingAll18,
                          fontStyle: ButtonFontStyle.PoppinsSemiBold16)
                    )
                  ],
                ))
          ],
        )
    );
  }
}


