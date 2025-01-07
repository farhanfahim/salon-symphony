import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../../../core/utils/dummy_content.dart';
import '../../../core/utils/responsive.dart';
import '../controller/settings_onboarding_checklist_details_controller.dart';

// ignore: must_be_immutable
class OptionItemWidget extends StatelessWidget {
  OptionItemWidget(this.model,this.onTap);
  Responsive responsive = Responsive();
  quizModel model;
  VoidCallback onTap;
  var controller = Get.find<SettingsOnboardingChecklistDetailsController>();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return GestureDetector(
      onTap:onTap,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Text(
            model.name!,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPoppinsRegular14
                .copyWith(
              height: 1.29,
            ),
          ),
        ),
      ),
    );
  }
}
