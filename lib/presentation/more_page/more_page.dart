import 'package:salon_symphony/core/utils/responsive.dart';
import 'package:salon_symphony/presentation/add_new_rererral_screen/add_new_rererral_screen.dart';
import 'package:salon_symphony/presentation/goals_achieved_page/goals_achieved_page.dart';
import 'package:salon_symphony/presentation/referral_all_page/referral_all_page.dart';
import 'package:salon_symphony/presentation/request_all_page/request_all_page.dart';
import 'package:salon_symphony/presentation/search_screen/search_screen.dart';

import '../../widgets/search_text_field.dart';
import '../education_tracking/education_tracking_screen.dart';
import '../goals_all_page/goals_all_page.dart';
import '../home_events_all_page/home_events_all_page.dart';
import '../referral_approved_page/referral_approved_page.dart';
import '../referral_tabView/referral_TabView.dart';
import 'controller/more_controller.dart';
import 'models/more_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_icon_button.dart';

// ignore_for_file: must_be_immutable
class MorePage extends StatelessWidget {
  MoreController controller = Get.put(MoreController(MoreModel().obs));

  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: responsive.setHeight(2),
          ),
          SearchTextField(
            hintText: 'Search resources, events, tasks and more...',
            height: responsive.setHeight(5.5),
            backgroundColor: ColorConstant.seperateColor,
            prefixWidget: Padding(
              padding: getPadding(left: 13, right: 12, top: 13, bottom: 13),
              child: CommonImageView(
                svgPath: ImageConstant.search_icon_new,
                fit: BoxFit.fitHeight,
                color: ColorConstant.hintTextColor.withOpacity(0.4),
              ),
            ),
            readOnly: true,
            hintTextColor: ColorConstant.hintTextColor.withOpacity(0.6),
            prefixIconColor: ColorConstant.hintTextColor,
            textColor: ColorConstant.blackColor,
            borderColor: ColorConstant.whiteA700.withOpacity(0.3),
            cursorColor: ColorConstant.hintTextColor,
            onTap: (){
              Get.toNamed(AppRoutes.searchScreen);
            },
          ),
          SizedBox(
            height: responsive.setHeight(3),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  menuItem(
                    imagePath: ImageConstant.imgMenu44X44,
                    menuName: "lbl_requests".tr,
                    onTap: (){
                      Get.to(RequestAllPage());
                    },
                  ),
                  menuItem(
                    imagePath: ImageConstant.imgTelevision44X44,
                    menuName: "Education",
                    onTap: (){
                       Get.toNamed(AppRoutes.educationTrackingScreen);
                    },
                  ),
                  menuItem(
                      imagePath: ImageConstant.imgFlagaltlight,
                      menuName: "lbl_goals".tr,
                      onTap: () {
                        Get.to(GoalsAllPage());
                      }),
                  menuItem(
                    imagePath: ImageConstant.imgFile44X44,
                    menuName: "lbl_flashcards".tr,
                    onTap: () {
                      onTapRowfile();
                    },
                  ),
                  menuItem(
                      imagePath: ImageConstant.imgQuestion,
                      menuName: "lbl_quizzes".tr,
                      onTap: () {
                        Get.toNamed(AppRoutes.quizzesAllScreen);
                      }),


                  menuItem(
                    imagePath: ImageConstant.imgFile1,
                    menuName: "lbl_documents".tr,
                    onTap: (){
                      Get.toNamed(AppRoutes.documentsScreen);
                    },
                  ),


                  menuItem(
                    imagePath: ImageConstant.Check_ring_light,
                    menuName: "New Hire Checklist",
                    onTap: (){
                      Get.toNamed(AppRoutes.settingsOnboardingChecklistScreen);
                    },
                  ),

                  menuItem(
                    imagePath: ImageConstant.imgUser44X44,
                    menuName: "Members",
                    onTap: (){
                      // Get.to(Team);
                      Get.toNamed(AppRoutes.employeeDicrectryScreen);
                    },
                  ),

                  menuItem(
                    imagePath: ImageConstant.imgMenu3,
                    menuName: "lbl_surveys".tr,
                    onTap: () {
                      Get.toNamed(AppRoutes.surveyScreen);
                    },
                  ),

                  menuItem(
                    imagePath: ImageConstant.imgMegaphone,
                    menuName: "Events",
                    onTap: (){
                      Get.to(()=>HomeEventsAllPage());
                    },
                  ),

                  menuItem(
                    imagePath: ImageConstant.imgUser1,
                    menuName: "lbl_refer_candidate".tr,
                    onTap: (){
                      Get.to(ReferralTabView());

                      // Get.toNamed(AppRoutes);
                    },
                  ),

                  menuItem(
                    imagePath: ImageConstant.rewards_svg,
                    menuName: "Rewards",
                    onTap: (){
                      Get.toNamed(AppRoutes.rewardsScreen);
                    },
                  ),

                  // menuItem(
                  //   imagePath: ImageConstant.imageSetting,
                  //   menuName: "Settings",
                  //   onTap: (){
                  //     Get.toNamed(AppRoutes.moreSettingsScreen);
                  //   },
                  //
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  onTapChat() {
    Get.toNamed(AppRoutes.quizzesAllScreen);
  }

  onTapRowfile() {
    Get.toNamed(AppRoutes.flashcardsScreen);
  }
}

class menuItem extends StatelessWidget {
  menuItem({this.imagePath, this.menuName, this.onTap, this.showDivider});

  String? imagePath;
  String? menuName;
  Function? onTap;
  bool? showDivider;

  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomIconButton(
                    height: 44,
                    width: 44,
                    variant: IconButtonVariant.OutlineGray300,
                    padding: IconButtonPadding.PaddingAll8,
                    child: CommonImageView(
                        svgPath: imagePath ?? ImageConstant.imgUser44X44)),
                SizedBox(
                  width: responsive.setWidth(4),
                ),
                Text(menuName ?? "lbl_team".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsRegular14Black900
                        .copyWith(height: 1.00,letterSpacing: 0.5,fontWeight: FontWeight.w500, fontSize: 15))
              ]),
          SizedBox(
            height: responsive.setHeight(1),
          ),
          if (showDivider != false)
            Container(
                height: getVerticalSize(1.00),
                width: getHorizontalSize(343.00),
                decoration: BoxDecoration(
                    color: ColorConstant.hintTextColor.withOpacity(0.1))),
          SizedBox(
            height: responsive.setHeight(1),
          ),
        ],
      ),
    );
  }
}
