import 'dart:io';

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/core/utils/app_constant.dart';
import 'package:salon_symphony/presentation/documents_screen/models/documents_model.dart';
import '../../core/loader.dart';
import '../../core/utils/helper_functions.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/utils.dart';
import '../../widgets/widgets_shimmer.dart';
import '../documents_screen/widgets/documents_item_widget.dart';
import 'controller/documents_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

class DocumentsScreen extends GetWidget<DocumentsController> {
  Responsive responsive = Responsive();
  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return BaseviewScreen(
        basicAppBar: true,
        screenName: "lbl_documents".tr,
        showBottomBar: false,
        mainTopHeight: 0,
        sidePadding: false,
        backgroundColor: ColorConstant.whiteA700,
        basicAppTrailingIcon: ImageConstant.imgMenuIcon,
        basicAppTrailingIconOnTap: () {
          HelperFunction.showBottomSheet(context,
              screenTitle: 'Documents Option',
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
              width: size.width,
              height: double.maxFinite,
              child: CustomRefreshIndicator(
                  //color: ColorConstant.black900,
                  onRefresh: () async {
                    if (controller.pagingController.itemList!.isNotEmpty) {
                      controller.pagingController.itemList!.clear();
                    }
                    controller.pagingController.refresh();
                    controller.isApiCalling.value = true;
                  },
                  child: PagedListView<int, DocumentData>(
                    pagingController: controller.pagingController,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    builderDelegate: PagedChildBuilderDelegate<DocumentData>(
                      itemBuilder: (context, item, index) {
                        return DocumentsItemWidget(item,(){

                          Get.toNamed(AppRoutes.documentDetail,arguments: {'id':item.id})!.then((value) {
                            print(value);
                            if(value!=null){
                              item.localStatus!.value = value;

                            }
                          });
                        });
                      },
                      noItemsFoundIndicatorBuilder: (context) =>
                      controller.isApiCalling.value
                          ? documentShimmer(context) //shimmer
                          : SizedBox(
                        width: double.maxFinite,
                        height: 600,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "You're all caught up!",
                                style: AppStyle.txtPoppinsSemiBold16.copyWith(
                                  height: 1.50,
                                  letterSpacing: 0.5,
                                )
                            ),
                            Text(
                                'Documents will appear here.',
                                style: AppStyle.txtPoppinsSemiBold16
                                    .copyWith(
                                  height: 1.50,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5,
                                )),
                          ],
                        ),
                      ), //shimmer
                      firstPageProgressIndicatorBuilder: (context) =>
                          documentShimmer(context), //shimmer
                      newPageProgressIndicatorBuilder: (context) =>
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              height: 30.0,
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Container(
                                  height: 30.0,
                                  child: Loader(
                                    isLoading: true,
                                    color: ColorConstant.black900,
                                  ),
                                ),
                              ), //loader
                            ),
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
                            top: 25.0,
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
              )),
        ));
  }


}
