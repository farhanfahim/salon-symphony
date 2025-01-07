import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../data/models/candidateReferralModel.dart';
import '../../widgets/widgets_shimmer.dart';
import '../referral_approved_page/widgets/listmindmap_item_widget.dart';
import 'controller/referral_approved_controller.dart';
import 'models/listmindmap_item_model.dart';
import 'models/referral_approved_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

// ignore_for_file: must_be_immutable
class ReferralApprovedPage extends StatelessWidget {
  ReferralApprovedController controller =
      Get.put(ReferralApprovedController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: CustomRefreshIndicator(
             // color: ColorConstant.deepPurple400,
              onRefresh: () async{
                controller.pagingController1.refresh();
              },
              child: PagedListView<int, CandidateReferralData>(
                // padding: EdgeInsets.symmetric(horizontal: 15),
                physics: AlwaysScrollableScrollPhysics(),
                pagingController: controller.pagingController1,
                // shrinkWrap: true,
                builderDelegate: PagedChildBuilderDelegate<CandidateReferralData>(
                  itemBuilder:(context, item, index)  {
                    return Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: ListmindmapItemWidget(item)
                    );
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
                  noItemsFoundIndicatorBuilder: (context) =>  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                            "You're all caught up!",
                            style: AppStyle.txtPoppinsSemiBold16.copyWith(
                              height: 1.50,
                              letterSpacing: 0.5,

                            )
                        ),
                      ),
                    ],

                  )
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
            )));
  }
}
