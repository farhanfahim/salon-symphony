import '../../../core/utils/utils.dart';
import '../../../data/models/getSurveyListing.dart';
import '../controller/survey_controller.dart';
import '../models/survey_item_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class SurveyItemWidget extends StatelessWidget {
  SurveyItemWidget(this.data, {this.onTapColumnmindmap,this.index});

  GetSurveyListingData data;

  var controller = Get.find<SurveyController>();
int? index ;
  VoidCallback? onTapColumnmindmap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapColumnmindmap!();
      },
      child: Container(
        margin: getMargin(
          top: 8.0,
          bottom: 8.0,
        ),
        decoration: AppDecoration.outlineGray300.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: getPadding(
                    left: 15,
                    top: 15,
                    right: 15,
                  ),
                  child: Text(
                    '${data.category!=null?data.category!.name!=null?data.category!.name!:"":""} Survey',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsMedium14.copyWith(
                      height: 1.00,
                      fontSize: 12,
                      color: ColorConstant.black900,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0,top: 10),
                  child: CommonImageView(
                    svgPath: data.userSurveyStatus == 30 ?ImageConstant.survey_complete_check:ImageConstant.survey_incomplete,

                  ),
                ),
              ],
            ),
            Padding(
              padding: getPadding(
                left: 15,
                top: 10,
                right: 20,
              ),
              child: Text(
                data.name!=null? data.name!:"" ,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: AppStyle.txtPoppinsMedium14.copyWith(
                  height: 1.30,
                  // letterSpacing: 0.5,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  decoration: data.userSurveyStatus == 20 ? TextDecoration.lineThrough : TextDecoration.none,

                ),
              ),
            ),
            Padding(
              padding: getPadding(
                left: 15,
                top: 10,
                right: 15,
                bottom: 17
              ),
              child: Text(
               "${data.surveyQuestions!=null?data.surveyQuestions!.length:"0"} ${"${data.surveyQuestions!.length > 1 ? 'Questions': 'Question'}"} • ${Utils.formatDate(data.createdAt!)}",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsRegular12Gray600.copyWith(
                  color: Color(0xff808080),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
