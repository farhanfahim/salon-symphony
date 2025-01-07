import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/core/utils/semantics.dart';
import 'package:salon_symphony/presentation/my_profile_screen/widgets/certification_item_widget.dart';
import '../../core/utils/utils.dart';
import '../../widgets/response_binding_widget.dart';
import '../../widgets/widgets_shimmer.dart';
import 'controller/my_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

class MyProfileScreen extends GetWidget<MyProfileController> {
  @override
  Widget build(BuildContext context) {
    return BaseviewScreen(
      basicAppBar: true,
      trailngSemantics: SemanticsLabel.LAB_PROFILE_TAB,
      screenName: "lbl_my_profile".tr,
      showBottomBar: false,
      sidePadding: false,
      blueClrEndTask: true,
      mainTopHeight: 0,
      textButtonName: "Edit",
      textOnTap: () {
        Get.toNamed(AppRoutes.editProfileScreen,)!.then((value) {
          if(value==true) {
            controller.myProfileApi();
          }
        });
      },
      backgroundColor: ColorConstant.whiteA700,
      child:
      Obx(() =>  ResponseBindingWidget(
          apiCallStatus: controller.apiCallStatus.value,
          errorWidget: () {
            return Container();
          },
          loadingWidget: () {
            return profileShimmer();
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
            return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      child: SingleChildScrollView(
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: getPadding(left: 26, right: 26),
                                          child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                controller.user.value.image!=null
                                                    ? controller.user.value.image!.isNotEmpty?
                                                ClipRRect(
                                                  borderRadius: BorderRadius.circular(
                                                      getHorizontalSize(32.50),
                                                  ),
                                                  child: CommonImageView(
                                                    url: controller.myProfileResponseModelObj.value.data!.image,
                                                    height: getSize(65.00),
                                                    width: getSize(65.00),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ):ClipRRect(
                                                  borderRadius: BorderRadius.circular(
                                                      getHorizontalSize(32.50)),
                                                  child: CommonImageView(
                                                    svgPath: ImageConstant.imgUser,
                                                    height: getSize(65.00),
                                                    width: getSize(65.00),
                                                  ),
                                                ):ClipRRect(
                                                  borderRadius: BorderRadius.circular(
                                                      getHorizontalSize(32.50)),
                                                  child: CommonImageView(
                                                    svgPath: ImageConstant.imgUser,
                                                    height: getSize(65.00),
                                                    width: getSize(65.00),
                                                  ),
                                                ),

                                                Flexible(
                                                  child: Padding(
                                                      padding: getPadding(
                                                          left: 12, top: 16, bottom: 10),
                                                      child: Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                                controller
                                                                    .myProfileResponseModelObj
                                                                    .value
                                                                    .data!
                                                                    .name!,
                                                                overflow:
                                                                TextOverflow.ellipsis,
                                                                textAlign: TextAlign.left,
                                                                maxLines: 2,
                                                                style: AppStyle
                                                                    .txtPoppinsMedium16
                                                                    .copyWith(
                                                                    fontSize: 18.5,
                                                                    fontWeight:
                                                                    FontWeight.w700,
                                                                    height: 1.00)),
                                                          ])),
                                                )
                                              ])),
                                      SizedBox(height: 20),
                                      Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                                padding: getPadding(
                                                    left: 26,
                                                    top: 11,
                                                    right: 26,
                                                    bottom: 9),
                                                child: Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      CommonImageView(
                                                          svgPath: ImageConstant.imgStar,
                                                          height: getSize(30.00),
                                                          width: getSize(30.00)),
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 15,
                                                              top: 11,
                                                              bottom: 12),
                                                          child: Text(
                                                              "lbl_total_points".tr,
                                                              overflow:
                                                              TextOverflow.ellipsis,
                                                              textAlign: TextAlign.left,
                                                              style: AppStyle
                                                                  .txtPoppinsMedium16
                                                                  .copyWith(
                                                                  letterSpacing:
                                                                  0.36)))
                                                    ])),
                                            Padding(
                                                padding: getPadding(
                                                    top: 23, right: 26, bottom: 20),
                                                child: Text(controller.myProfileResponseModelObj.value.data !=null?
                                                controller.myProfileResponseModelObj.value.data!.totalPoints.toString() : "0",
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle.txtPoppinsMedium16
                                                        .copyWith(letterSpacing: 0.36)))
                                          ]),
                                      Container(
                                          height: getVerticalSize(1.00),
                                          width: double.infinity,
                                          margin: getMargin(
                                            left: 26,
                                            top: 10,
                                          ),
                                          decoration: BoxDecoration(
                                              color: ColorConstant.gray100)),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                              padding: getPadding(
                                                  left: 26, top: 30, right: 26),
                                              child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                        padding: getPadding(bottom: 1),
                                                        child: Text("lbl_position".tr,
                                                            overflow:
                                                            TextOverflow.ellipsis,
                                                            textAlign: TextAlign.left,
                                                            style: AppStyle
                                                                .txtPoppinsRegular14Gray600
                                                                .copyWith(
                                                                fontWeight:
                                                                FontWeight.w600,
                                                                color: ColorConstant
                                                                    .black900))),
                                                    Padding(
                                                        padding: getPadding(top: 1),
                                                        child: Text(
                                                            controller.myProfileResponseModelObj.value.data!.position !=null?
                                                            controller.myProfileResponseModelObj.value.data!.position!.name! : "-",
                                                            overflow:
                                                            TextOverflow.ellipsis,
                                                            textAlign: TextAlign.left,
                                                            style: AppStyle
                                                                .txtPoppinsRegular14Black900
                                                                .copyWith(height: 1.00)))
                                                  ]))),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                              padding: getPadding(
                                                  left: 26, top: 12, right: 26),
                                              child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                        padding: getPadding(bottom: 1),
                                                        child: Text("Location",
                                                            overflow:
                                                            TextOverflow.ellipsis,
                                                            textAlign: TextAlign.left,
                                                            style: AppStyle
                                                                .txtPoppinsRegular14Gray600
                                                                .copyWith(
                                                                fontWeight:
                                                                FontWeight.w600,
                                                                color: ColorConstant
                                                                    .black900))),
                                                    Flexible(
                                                      child: Padding(
                                                          padding: getPadding(top: 1,left: 40),
                                                          child: Text(controller.myProfileResponseModelObj.value.data!.location !=null?controller.myProfileResponseModelObj.value.data!.location!.name!:"-",
                                                              overflow:
                                                              TextOverflow.ellipsis,
                                                              maxLines: 2,
                                                              textAlign: TextAlign.right,
                                                              style: AppStyle
                                                                  .txtPoppinsRegular14Black900)),
                                                                  // .copyWith(height: 1.50,))),
                                                    )
                                                  ]))),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                              padding: getPadding(
                                                  left: 26, top: 11, right: 26),
                                              child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                        padding: getPadding(bottom: 1),
                                                        child: Text("Number",
                                                            overflow:
                                                            TextOverflow.ellipsis,
                                                            textAlign: TextAlign.left,
                                                            style: AppStyle
                                                                .txtPoppinsRegular14Gray600
                                                                .copyWith(
                                                                fontWeight:
                                                                FontWeight.w600,
                                                                color: ColorConstant
                                                                    .black900))),
                                                    Padding(
                                                        padding: getPadding(top: 1),
                                                        child: Text(controller.myProfileResponseModelObj.value.data!.phone!=null?controller.myProfileResponseModelObj.value.data!.phone!:"-",
                                                            overflow:
                                                            TextOverflow.ellipsis,
                                                            textAlign: TextAlign.left,
                                                            style: AppStyle
                                                                .txtPoppinsRegular14Black900
                                                                .copyWith(height: 1.00)))
                                                  ]))),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                              padding: getPadding(
                                                  left: 26, top: 11, right: 26),
                                              child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                        padding: getPadding(bottom: 1),
                                                        child: Text("lbl_hire_date".tr,
                                                            overflow:
                                                            TextOverflow.ellipsis,
                                                            textAlign: TextAlign.left,
                                                            style: AppStyle
                                                                .txtPoppinsRegular14Gray600
                                                                .copyWith(
                                                                fontWeight:
                                                                FontWeight.w600,
                                                                color: ColorConstant
                                                                    .black900))),
                                                    Padding(
                                                        padding: getPadding(top: 1),
                                                        child: Text(controller.myProfileResponseModelObj.value.data!.hireDate!=null?Utils.getFormatedDate( controller.myProfileResponseModelObj.value.data!.hireDate!):"-",
                                                            overflow:
                                                            TextOverflow.ellipsis,
                                                            textAlign: TextAlign.left,
                                                            style: AppStyle
                                                                .txtPoppinsRegular14Black900
                                                                .copyWith(height: 1.00)))
                                                  ]))),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                              padding: getPadding(
                                                  left: 26, top: 12, right: 26),
                                              child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                        padding: getPadding(bottom: 2),
                                                        child: Text("lbl_school".tr,
                                                            overflow:
                                                            TextOverflow.ellipsis,
                                                            textAlign: TextAlign.left,
                                                            style: AppStyle
                                                                .txtPoppinsRegular14Gray600
                                                                .copyWith(
                                                                fontWeight:
                                                                FontWeight.w600,
                                                                color: ColorConstant
                                                                    .black900))),
                                                    Flexible(
                                                      child: Padding(
                                                          padding: getPadding(top: 2,left: 40),
                                                          child: Text(
                                                              controller.myProfileResponseModelObj.value.data!.school!=null && controller.myProfileResponseModelObj.value.data!.school != ''?controller.myProfileResponseModelObj.value.data!.school!:"-",
                                                              overflow:
                                                              TextOverflow.ellipsis,
                                                              maxLines: 2,
                                                              textAlign: TextAlign.right,
                                                              style: AppStyle
                                                                  .txtPoppinsRegular14Black900
                                                                  .copyWith(height: 1.00))),
                                                    )
                                                  ]))),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                              padding: getPadding(
                                                  left: 26,
                                                  top: 12,
                                                  right: 26,
                                                  bottom: 15),
                                              child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                        padding: getPadding(bottom: 1),
                                                        child: Text("Company",
                                                            overflow:
                                                            TextOverflow.ellipsis,
                                                            textAlign: TextAlign.left,
                                                            style: AppStyle
                                                                .txtPoppinsRegular14Gray600
                                                                .copyWith(
                                                                fontWeight:
                                                                FontWeight.w600,
                                                                color: ColorConstant
                                                                    .black900))),
                                                    Padding(
                                                        padding: getPadding(top: 1),
                                                        child: Text(controller.myProfileResponseModelObj.value.data!.salon !=null ?controller.myProfileResponseModelObj.value.data!.salon!.name!:"-",
                                                            overflow:
                                                            TextOverflow.ellipsis,
                                                            textAlign: TextAlign.left,
                                                            style: AppStyle
                                                                .txtPoppinsRegular14Black900
                                                                .copyWith(height: 1.00)))
                                                  ]))),
                                      Container(
                                          height: getVerticalSize(1.00),
                                          width: double.infinity,
                                          margin: getMargin(left: 26, top: 21, right: 0),
                                          decoration: BoxDecoration(
                                              color: ColorConstant.gray100)),
                                      Padding(
                                          padding:
                                          getPadding(left: 26, top: 21, right: 26),
                                          child: Text("Professional Bio",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtPoppinsSemiBold16
                                                  .copyWith(
                                                  fontSize: 14,
                                                  letterSpacing: 0.5,
                                                  height: 1.00))),
                                      Container(
                                          width: double.infinity,
                                          margin: getMargin(left: 26, top: 17, right: 26),
                                          child: RichText(
                                              text: TextSpan(children: [
                                                TextSpan(
                                                    text:
                                                    controller.myProfileResponseModelObj.value.data!.bio!=null && controller.myProfileResponseModelObj.value.data!.bio != '' ?controller.myProfileResponseModelObj.value.data!.bio!:"-",
                                                    style: TextStyle(
                                                        color: ColorConstant.black900,
                                                        fontSize: getFontSize(14),
                                                        fontFamily: 'SF pro display',
                                                        letterSpacing: 0.5,
                                                        fontWeight: FontWeight.w400)),
                                              ]),
                                              textAlign: TextAlign.left)),
                                      Container(
                                          height: getVerticalSize(1.00),
                                          width: double.infinity,
                                          margin: getMargin(left: 26, top: 21, right: 0),
                                          decoration: BoxDecoration(
                                              color: ColorConstant.gray100)),
                                      SizedBox(height: getVerticalSize(20.00)),
                                      Padding(
                                          padding: getPadding(left: 26, top: 0, right: 0),
                                          child: Text('Interests',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtPoppinsSemiBold16
                                                  .copyWith(
                                                  fontSize: 14,
                                                  letterSpacing: 0.5,
                                                  height: 1.00))),
                                      Container(
                                          width: double.infinity,
                                          height: getVerticalSize(48.00),
                                          padding:
                                          getPadding(left: 26, top: 19, right: 0),
                                          child: Obx (() =>controller.myProfileResponseModelObj.value.data!=null?controller.myProfileResponseModelObj.value.data!.specialities!.length>0?ListView.builder(
                                              itemCount: controller.myProfileResponseModelObj.value.data!.specialities!.length,
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              itemBuilder:
                                                  (BuildContext context, int index) {
                                                return Container(
                                                    margin: EdgeInsets.only(right: 10),
                                                    padding: getPadding(
                                                        left: 13,
                                                        top: 7.5,
                                                        right: 13,
                                                        bottom: 7),
                                                    decoration: AppDecoration
                                                        .txtFillDeeppurpleA201
                                                        .copyWith(
                                                        borderRadius:
                                                        BorderRadiusStyle
                                                            .txtRoundedBorder4),
                                                    child: Text(controller.myProfileResponseModelObj.value.data!.specialities![index].name!,
                                                        overflow: TextOverflow.ellipsis,
                                                        textAlign: TextAlign.left,
                                                        style: AppStyle
                                                            .txtPoppinsRegular12WhiteA701));
                                              }):Text("No Specialities",
                                            style: AppStyle.txtPoppinsRegular14Black900,):Text("No Specialities",
                                            style: AppStyle.txtPoppinsRegular14Black900,),)),
                                      Container(
                                          height: getVerticalSize(1.00),
                                          width: double.infinity,
                                          margin: getMargin(left: 26, top: 21, right: 0),
                                          decoration: BoxDecoration(
                                              color: ColorConstant.gray100)),
                                      SizedBox(height: getVerticalSize(20.00)),


                                      Padding(
                                          padding:
                                          getPadding(left: 26, top: 12, right: 26),
                                          child: Text('Certificates',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtPoppinsSemiBold16
                                                  .copyWith(
                                                  fontSize: 14,
                                                  letterSpacing: 0.5,
                                                  height: 1.00))),

                                      Container(
                                          width: double.infinity,

                                          padding:
                                          getPadding(left: 26, top: 19, right: 0),
                                          child: Obx (() =>controller.myProfileResponseModelObj.value.data !=null ?
                                          controller.myProfileResponseModelObj.value.data!.certificates!.length>0?ListView.builder(
                                              itemCount: controller.myProfileResponseModelObj.value.data!.certificates!.length,
                                              physics: NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemBuilder:
                                                  (BuildContext context, int index) {
                                                return CertificationItemWidget(index);
                                              }):Text("No Certificates",
                                            style: AppStyle.txtPoppinsRegular14Black900,):Text("No Certificates",
                                            style: AppStyle.txtPoppinsRegular14Black900,),)),

                                      Container(
                                          height: getVerticalSize(1.00),
                                          width: double.infinity,
                                          margin: getMargin(left: 26, top: 21, right: 0),
                                          decoration: BoxDecoration(
                                              color: ColorConstant.gray100)),
                                      SizedBox(height: getVerticalSize(20.00)),
                                      Padding(
                                          padding:
                                          getPadding(left: 26, top: 13, right: 26),
                                          child: Text("Badges",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtPoppinsSemiBold16
                                                  .copyWith(
                                                  fontSize: 14,
                                                  letterSpacing: 0.5,
                                                  height: 1.00))),
                                      controller.myProfileResponseModelObj.value.data!.badges!.isNotEmpty?
                                      Padding(
                                          padding: getPadding(
                                              left: 26, top: 18, right: 26, bottom: 20),
                                          child: Container(
                                            height: 50,
                                            child: ListView.builder(
                                                itemCount: controller.myProfileResponseModelObj.value.data!.badges!.length,
                                                scrollDirection: Axis.horizontal,
                                                shrinkWrap: true,
                                                itemBuilder:
                                                    (BuildContext context, int index) {
                                                  return Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                                        child: ClipRRect(
                                                            borderRadius: BorderRadius.circular(
                                                                getHorizontalSize(10.00)),
                                                            child: CommonImageView(
                                                                url: controller.myProfileResponseModelObj.value.data!.badges![index].badge,
                                                                height: getSize(40.00),
                                                                width: getSize(40.00),
                                                                fit: BoxFit.cover)),
                                                      ),
                                                    ],
                                                  );
                                                }),
                                          ),): Padding(
                                        padding: getPadding(
                                            left: 26, top: 18, right: 26, bottom: 20),
                                                child: Text("No Badges",
                                        style: AppStyle.txtPoppinsRegular14Black900,),
                                              ),
                                    ]),


                                SizedBox(
                                  height: 20,
                                )
                              ])))
                ]);
          }
      ))
    );
  }
}
