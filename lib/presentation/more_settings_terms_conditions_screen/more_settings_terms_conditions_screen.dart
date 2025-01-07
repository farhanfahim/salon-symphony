import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salon_symphony/widgets/response_binding_widget.dart';
import 'package:salon_symphony/widgets/widgetSkeleton.dart';

import '../../baseviews/baseview_process_screen.dart';
import 'controller/more_settings_terms_conditions_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

class MoreSettingsTermsConditionsScreen
    extends GetWidget<MoreSettingsTermsConditionsController> {
  @override
  Widget build(BuildContext context) {
    return BaseviewScreen(
        basicAppBar: true,
        screenName: "Privacy Policy",
        showBottomBar: false,
        sidePadding: false,
        bottomSafeArea: true,
        mainTopHeight: 0,
        backgroundColor: ColorConstant.whiteA700,
        child: Obx(() =>  ResponseBindingWidget(
            apiCallStatus: controller.apiCallStatus.value,
            errorWidget: () {
              return Container();
            },
            loadingWidget: () {
              return Column(
                children: [
                  pagesShimmer(),
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
              return SingleChildScrollView(
                child: Html(
                  data: controller.termsAndConditionResponseModel.value.data!.content!,
                  style: {
                    "body": Style(
                      fontSize: FontSize(14.0),
                      color: ColorConstant.bluegray900,
                      textAlign: TextAlign.left,
                      lineHeight: LineHeight(1.67),
                    ),
                  },
                ),
              );
            }
        )),);
  }

  onTapImgArrowleft() {
    Get.back();
  }
}
