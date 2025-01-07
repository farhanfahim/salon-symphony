import 'dart:io';

import 'package:flutter/material.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/presentation/request_all_page/widgets/request_option_item_widget.dart';
import '../../core/utils/helper_functions.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/utils.dart';
import '../../widgets/custom_button.dart';
import '../goals_all_page/goals_all_page.dart';
import '../request_approved_page/controller/request_approved_controller.dart';
import '../request_approved_page/request_approved_page.dart';
import '../request_declined_page/controller/request_declined_controller.dart';
import '../request_declined_page/request_declined_page.dart';
import '../request_pending_page/controller/request_pending_controller.dart';
import '../request_pending_page/request_pending_page.dart';
import 'controller/request_all_controller.dart';

// ignore_for_file: must_be_immutable
class RequestAllPage extends StatelessWidget {
  Responsive responsive = Responsive();
  RequestAllController controller =
      Get.put(RequestAllController());
  // RequestPendingController requestPendingController = Get.put(RequestPendingController());
  // RequestApprovedController requestApprovedController = Get.put(RequestApprovedController());
  // RequestDeclinedController requestDeclinedController = Get.put(RequestDeclinedController());

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    controller.generateOption();
    return BaseviewScreen(
      basicAppBar: true,
      screenName: "Requests",
      showBottomBar: false,
      mainTopHeight: 0,
      bottomSafeArea: true,
      sidePadding: false,
      // stickyHeader: true,
      backgroundColor: ColorConstant.backgroundColor,
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
      child: Stack(
        children: [
          Column(
            children: [
    TabBar(
             tabs: [
               Tab(
                 text: "PENDING",
               ),
               Tab(
                 text: "APPROVED",
               ),
               Tab(
                 text: "DECLINED",
               ),
             ],
             labelColor: ColorConstant.deepPurpleA201,
             unselectedLabelColor: ColorConstant.gray600,
             indicatorColor: ColorConstant.primaryColor,
             controller: controller.tabController,
             indicator: CustomTabIndicator(),
           ),
              Container(
                height: 1,
                width: double.maxFinite,
                color: ColorConstant.gray400.withOpacity(0.3),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 70.0),
                  child: TabBarView(
                      controller: controller.tabController,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        RequestPendingPage(),
                        RequestApprovedPage(),
                        RequestDeclinedPage(),
                      ]),
                ),
              ),
            ],
          ),
          Positioned(
              bottom: 0,
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Color(0XFFCFCFCF).withOpacity(0.3),
                    ),
                  ),
                ),
                child:  CustomButton(
                  width: 343,
                  text: "New Request",
                  prefixWidget: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.add,
                      color: ColorConstant.whiteA700,
                    ),
                  ),
                  margin: getMargin(
                    left: 16,
                    top: 15,
                    right: 16,
                  ),
                  padding: ButtonPadding.PaddingAll18,
                  fontStyle: ButtonFontStyle.PoppinsSemiBold16,
                  onTap: () {
                    HelperFunction.showBottomSheet(
                      context,
                      bottomSheetHeight: responsive.setHeight(42),
                      screenTitle: "Select Request",
                      redclrEndTask: false,
                      isPadding: true,
                      screenEndTask: "Done",
                      widget: Obx(() => (
                          ListView.builder(
                            itemCount: controller.arrOfRequestType.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              print("length ${controller.arrOfRequestType.length}");
                              return RequestOptionItemWidget(index,
                                  controller.arrOfRequestType[index],
                                      () {controller.updateRequestItem(index);
                                  if (controller.arrOfRequestType[0].selected == true.obs) {
                                    Get.back();
                                    Get.toNamed(AppRoutes.addTimeRequestScreen);
                                  } else if (controller.arrOfRequestType[1].selected == true.obs) {
                                    Get.back();
                                    Get.toNamed(AppRoutes.scheduleRequestAllPage);
                                  } else if (controller.arrOfRequestType[2].selected == true.obs) {
                                    Get.back();
                                    Get.toNamed(AppRoutes.addAddEducationTrackingScreen,arguments: {
                                      "isEditing":false
                                    });
                                  }
                                  });
                            },
                          ))),
                    );
                  },
                ),
              ))
        ],
      ),
    );
  }
}

