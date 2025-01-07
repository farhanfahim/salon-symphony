import 'dart:io';

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:salon_symphony/presentation/survey_screen/widgets/filter_item_widget.dart';

import '../../baseviews/baseview_process_screen.dart';
import '../../core/utils/helper_functions.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/utils.dart';
import '../../data/models/getSurveyListing.dart';
import '../../widgets/search_text_field.dart';
import '../../widgets/widgets_shimmer.dart';
import '../search_screen/search_screen.dart';
import '../start_survey_screen/start_survey_screen.dart';
import '../survey_screen/widgets/survey_item_widget.dart';
import 'controller/survey_controller.dart';
import 'models/survey_item_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_icon_button.dart';

class  SurveyScreen extends GetWidget<SurveyController> {
  Responsive responsive = Responsive();
  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return BaseviewScreen(
     basicAppBar: true,
     sidePadding: false,
     screenName: "Surveys",
     showBottomBar: false,
     backgroundColor: ColorConstant.whiteA700,
        basicAppTrailingIcon: ImageConstant.imgMenuIcon,
        basicAppTrailingIconOnTap: () {
          HelperFunction.showBottomSheet(context,
              screenTitle: 'Surveys Option',
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
     mainTopHeight: 0,
     child: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 15.0),
       child:  CustomRefreshIndicator(
         //color: ColorConstant.deepPurple400,
         onRefresh: ()async{
           controller.pagingController.refresh();
           controller.currentPage = 1;
         },
         child: PagedListView<int, GetSurveyListingData>(
           physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
           pagingController: controller.pagingController,
           builderDelegate: PagedChildBuilderDelegate<GetSurveyListingData>(
             itemBuilder:(context, item, index)  {
               return SurveyItemWidget(item,index: index, onTapColumnmindmap: (){
                 Get.toNamed(AppRoutes.StartSurvey, arguments:{
                   'id': item.id
                 })!.then((value) => {
                   controller.pagingController.refresh(),
                   controller.currentPage = 1
                 });

               },);
             },
             firstPageProgressIndicatorBuilder: (context){
               return Column(
                 children: [
                   referralShimmer(context),
                   referralShimmer(context)
                 ],
               );
             },
             newPageProgressIndicatorBuilder: (context) => Padding(
               padding: const EdgeInsets.all(5),
               child: Center(
                 child: Container(
                   child: CircularProgressIndicator(
                     valueColor: AlwaysStoppedAnimation<Color>(
                         ColorConstant.deepPurpleA201),
                   ),
                 ),
               ),
             ),
             noItemsFoundIndicatorBuilder: (context) => Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text(
                     "You're all caught up!",
                     style: AppStyle.txtPoppinsSemiBold16.copyWith(
                       height: 1.50,
                       fontWeight: FontWeight.w600,
                       letterSpacing: 1,
                     )
                 ),
                 Text(
                     'Team survey will appear here.',
                     style: AppStyle.txtPoppinsSemiBold16.copyWith(
                       height: 1.50,
                       fontSize: 13,
                       fontWeight: FontWeight.w500,
                       letterSpacing: 0.5,
                     )
                 ),
               ],
             ),
           ),
         ),
           builder: (
               BuildContext context,
               Widget child,
               IndicatorController controller,
               ) {
             return Stack(
               alignment: Alignment.topCenter,
               children: <Widget>[
                 if (!controller.isIdle)
                   Positioned(
                     top: 25.0 ,
                     child: SizedBox(
                       height: 30,
                       width: 30,
                       child:  Image.asset(
                         ImageConstant.spinnerImage, // Replace with the actual path to your image
                         width: 24, // Adjust the width as needed
                         height: 24, // Adjust the height as needed
                         // You can apply color to the image if needed
                       ),

                     ),
                   ),
                 Transform.translate(
                   offset: Offset(0, 10.0 * controller.value),
                   child: child,
                 ),
               ],
             );
           }
       ),
     )
    );
  }



}
