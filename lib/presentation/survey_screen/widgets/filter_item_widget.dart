import 'package:flutter/material.dart';
import 'package:salon_symphony/presentation/survey_screen/survey_screen.dart';
import '../../../../core/app_export.dart';
import '../../../core/utils/dummy_content.dart';
import '../../../core/utils/responsive.dart';
import '../controller/survey_controller.dart';

// ignore: must_be_immutable
class FilterItemWidget extends StatelessWidget {
  FilterItemWidget(this.model,this.onTap);
  Responsive responsive = Responsive();
  quizModel model;
  VoidCallback onTap;
  var controller = Get.find<SurveyController>();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return GestureDetector(
      onTap:onTap,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [

                Container(
                  margin: getMargin(
                    top: 20,
                    bottom: 20,
                  ),

                ),
                Text(
                  model.name!,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPoppinsRegular14
                      .copyWith(
                    height: 1.29,
                  ),
                ),
                Spacer(),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
