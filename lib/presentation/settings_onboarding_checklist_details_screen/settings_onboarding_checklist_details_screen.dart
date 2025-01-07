import 'package:readmore/readmore.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/presentation/settings_onboarding_checklist_details_screen/widgets/option_item_widget.dart';
import 'package:salon_symphony/widgets/error_widget.dart';
import 'dart:io';

import '../../core/utils/helper_functions.dart';
import '../../core/utils/responsive.dart';
import '../../data/services/api_call_status.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/widgetSkeleton.dart';
import 'controller/settings_onboarding_checklist_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_button.dart';

class SettingsOnboardingChecklistDetailsScreen
    extends GetWidget<SettingsOnboardingChecklistDetailsController> {
  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return BaseviewScreen(
        basicAppBar: true,
        screenName: "New Hire Checklist",
        showBottomBar: false,
        sidePadding: false,
        bottomSafeArea: true,
        isMenuTab: true,
        backgroundColor: ColorConstant.whiteA700,
        child:Obx(() => Container(
          child: controller.apiCallStatus.value==ApiCallStatus.success?Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          title: controller.SingleResponse.value.name!,
                          clr: ColorConstant.black900,
                          weight: 'Bold',
                          fontSize: 22,
                          line: 2,
                          toverflow: TextOverflow.ellipsis,
                          letterSpacing: 0.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: MyText(
                            title: controller.SingleResponse.value.description!=null?controller.SingleResponse.value.description!:"",
                            clr: ColorConstant.black900,
                            fontSize: 16,
                            height: 1.5,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Color(0XFFCFCFCF).withOpacity(0.3),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Obx(() =>  CustomButton(
                        width: 343,
                        text: controller.SingleResponse.value.userStatus==10?"Mark Complete":"Completed",
                        margin: getMargin(
                          left: 16,
                          top: 15,
                          right: 16,
                        ),
                        padding: ButtonPadding.PaddingAll18,
                        fontStyle: ButtonFontStyle.PoppinsSemiBold16,
                        onTap: () {
                          controller.updateHireCheckListStatus(controller.SingleResponse.value.userStatus==10?20:10,controller.SingleResponse.value.id!);

                        },
                      ),)

                    )
                  ],
                )

              ]):
          controller.apiCallStatus.value==ApiCallStatus.loading?
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: taskShimmer(context),
              ): RecordDeletedWidget(),
        ))
        );
  }
}
