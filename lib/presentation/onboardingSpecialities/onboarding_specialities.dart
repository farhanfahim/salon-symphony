import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import 'package:salon_symphony/widgets/animatedButton.dart';
import 'package:salon_symphony/widgets/custom_button.dart';
import '../../baseviews/baseview_auth_screen.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_style.dart';
import '../../widgets/common_image_view.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/response_binding_widget.dart';
import '../../widgets/skeleton.dart';
import '../../widgets/widgetSkeleton.dart';
import 'controller/onboarding_specialities_controller.dart';

class OnboardingSpecialities extends StatelessWidget {
  Map<String, dynamic> map;
  OnboardingSpecialities({required this.map});
  OnboardingSpecialitiesController controller = Get.put(OnboardingSpecialitiesController());
  Responsive responsive = Responsive();
  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return BaseviewAuthScreen(
        child:  Obx(() =>  ResponseBindingWidget(
            apiCallStatus: controller.apiCallStatus.value,
            errorWidget: () {
              return Container();
            },
            loadingWidget: () {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: ColorConstant.backgroundColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 18.0,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: CommonImageView(
                                      svgPath: ImageConstant.imgArrowleft,
                                      // color: ColorConstant.hintTextColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: responsive.setWidth(22),
                                  ),
                                  Center(
                                    child: MyText(
                                      title: '${'    Create Account'}',
                                      weight: 'Semi Bold',
                                      fontSize: responsive.setTextScale(16),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: responsive.setHeight(4),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: MyText(
                                title: "Select Interests",
                                fontSize: responsive.setTextScale(30),
                                weight: 'Semi Bold',
                              ),
                            ),
                            SizedBox(
                              height: responsive.setHeight(1),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: MyText(
                                title:
                                "Add your interests and service specialties",
                                clr: ColorConstant.black900,
                              ),
                            ),
                            SizedBox(
                              height: responsive.setHeight(2),
                            ),
                          ],
                        ),
                      ),

                      faqShimmer(),
                    ],
                  ),
                ),
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
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: ColorConstant.backgroundColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 18.0,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: CommonImageView(
                                      svgPath: ImageConstant.imgArrowleft,
                                      // color: ColorConstant.hintTextColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: responsive.setWidth(22),
                                  ),
                                  Center(
                                    child: MyText(
                                      title: '${'    Create Account'}',
                                      weight: 'Semi Bold',
                                      fontSize: responsive.setTextScale(16),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15.0, right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: responsive.setHeight(4),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: MyText(
                                      title: "Select Interests",
                                      fontSize: responsive.setTextScale(30),
                                      weight: 'Semi Bold',
                                    ),
                                  ),
                                  SizedBox(
                                    height: responsive.setHeight(1),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: MyText(
                                      title:
                                      "Add your interests and service specialties",
                                      clr: ColorConstant.black900,
                                    ),
                                  ),
                                  SizedBox(
                                    height: responsive.setHeight(2),
                                  ),
                                ],
                              ),
                            ),
                            Obx(
                                  () => Wrap(
                                children: controller.arrOfSpecialitiesList!.map((e) {
                                  return GestureDetector(
                                    onTap: () {
                                      var index =
                                      controller.arrOfSpecialitiesList!.indexOf(e);
                                      print(index);

                                      if (controller.arrOfSpecialitiesList![index].selected!.value == false) {
                                        controller.arrOfSpecialitiesList![index]
                                            .selected!.value = true;
                                        controller.selectedInterestId.add(controller.arrOfSpecialitiesList![index].id!);
                                        controller.arrOfSpecialitiesList!.refresh();
                                      } else {
                                        controller.arrOfSpecialitiesList![index]
                                            .selected!.value = false;
                                        controller.selectedInterestId.remove(controller.arrOfSpecialitiesList![index].id!);
                                        controller.arrOfSpecialitiesList!.refresh();
                                      }
                                      print(controller
                                          .arrOfSpecialitiesList![index].selected);
                                      print(controller.selectedInterestId);

                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(100),
                                          border: Border.all(
                                              color: e.selected!.value == false ?ColorConstant
                                                  .gray400: ColorConstant.primaryColor ),
                                          color: e.selected!.value == false
                                              ? Colors.white
                                              : ColorConstant.primaryColor,
                                        ),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.only(top: 12.0,bottom: 12.0,left: 17.0,right: 17.0),
                                          child: MyText(
                                            title: e.name.toString(),
                                            clr: e.selected!.value == false
                                                ? ColorConstant
                                                .hintTextColor
                                                : Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                  Obx(() =>     controller.selectedInterestId.isNotEmpty ?Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: AnimatedButton(
                      // semanticsLabel: SemanticsLabel.LAB_SIGNIN_BTN_LINK,
                      text: "Finish Setup",
                      width: responsive.setWidth(100),
                      padding: ButtonPaddingOfButton.PaddingAll18,
                      fontStyle: ButtonFontStyleOfButton.PoppinsSemiBold16,
                      alignment: Alignment.center,
                      onPressed: () async {

                        if(controller.selectedInterestId.isNotEmpty){
                          // controller.pageIndex.value = 1;
                          controller.UpdateInt();

                        }else{
                          controller.animatedButtonController.reset();
                          Utils.showToast('Select your interests', true);
                        }
                      }, controller: controller.animatedButtonController,),
                  )
                      :Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CustomButton(
                        width: responsive.setWidth(100),
                        text: "Finish Setup",
                        margin: getMargin(
                          top: 40,
                        ),
                        onTap: () {
                        },
                        variant: ButtonVariant.FillIndigo50,
                        padding: ButtonPadding.PaddingAll18,
                        fontStyle:
                        ButtonFontStyle.PoppinsSemiBold16,
                        alignment: Alignment.center),
                      ),)
                    ],
                  ),
                ),
              );
            }
        ))
    );
  }
}
