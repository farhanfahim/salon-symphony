import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../baseviews/baseview_process_screen.dart';
import '../../widgets/response_binding_widget.dart';
import '../../widgets/widgetSkeleton.dart';
import 'controller/more_settings_faqs_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

class MoreSettingsFaqsScreen extends GetWidget<MoreSettingsFaqsController> {
  @override
  Widget build(BuildContext context) {
    return BaseviewScreen(
        basicAppBar: true,
        screenName: "lbl_faqs".tr,
        showBottomBar: false,
        sidePadding: true,
        backgroundColor: ColorConstant.whiteA700,
        child: Obx(() =>  ResponseBindingWidget(
            apiCallStatus: controller.apiCallStatus.value,
            errorWidget: () {
              return Container();
            },
            loadingWidget: () {
              return Column(
                children: [
                  faqShimmer(),
                ],
              );
            },
            emptyWidget: (){
              return SizedBox(
                width: double.maxFinite,
                height: 500,
                child: Center(
                  child: Text(
                    'No Record Found'.tr,
                    style: AppStyle.txtPoppinsBold16.copyWith(fontSize: 20.0.sp),
                  ),
                ),
              );
            },
            successWidget: () {
              return Container(
                  height: MediaQuery.of(context).size.height,
                  // width: size.width,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.arrOfFaqList!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Theme(
                            data: ThemeData().copyWith(dividerColor: Colors.white),
                            child: ExpansionTile(
                              collapsedBackgroundColor: Colors.white,
                              backgroundColor: Colors.white,
                              iconColor: Colors.black,
                              textColor: Colors.black,
                              collapsedIconColor: Colors.black,
                              collapsedTextColor: Colors.black,
                              title: Text(
                                  controller.arrOfFaqList![index].question!,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .txtPoppinsMedium14.copyWith(fontSize: 15, fontWeight: FontWeight.w600)
                              ),
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                                  child: Text(
                                    controller.arrOfFaqList![index].answer!,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .txtPoppinsRegular12Black900
                                        .copyWith(height: 2),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      );
                    },
                  ));
            }
        )));
  }

}
