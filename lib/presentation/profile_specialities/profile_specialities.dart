import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/responsive.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/response_binding_widget.dart';
import '../../widgets/widgetSkeleton.dart';
import 'controller/profile_specialities_controller.dart';

class ProfileSpecialities extends StatelessWidget {
  ProfileSpecialitiesController controller = Get.put(ProfileSpecialitiesController());
  Responsive responsive = Responsive();
  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return BaseviewScreen(
      screenName: '    Interests',
      basicAppBar: true,
      showBottomBar: false,
      sidePadding: false,
      isMenuTab: false,
      textButtonName: 'Done',
      textOnTap: (){
        Get.back(result: controller.arrOfSpecialitiesList);
      },
      backgroundColor: ColorConstant.whiteA700,
      child:  Obx(() =>  ResponseBindingWidget(
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
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          MyText(
                            title:
                            'Select your services specialties.',
                            clr: ColorConstant.hintTextColor,
                          ),
                          SizedBox(
                            height: responsive.setHeight(3),
                          ),
                          Obx(
                                () => Wrap(
                              children: controller.arrOfSpecialitiesList!.map((e) {
                                return GestureDetector(
                                  onTap: () {
                                    var index =
                                    controller.arrOfSpecialitiesList!.indexOf(e);
                                    print(index);

                                    if (controller
                                        .arrOfSpecialitiesList![index].selected!.value ==
                                        false) {
                                      controller.arrOfSpecialitiesList![index]
                                          .selected!.value = true;
                                      controller.arrOfSpecialitiesList!.refresh();
                                    } else {
                                      controller.arrOfSpecialitiesList![index]
                                          .selected!.value = false;
                                      controller.arrOfSpecialitiesList!.refresh();
                                    }
                                    print(controller
                                        .arrOfSpecialitiesList![index].selected);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        border: Border.all(
                                            color: ColorConstant
                                                .hintTextColor),
                                        color: e.selected!.value == false
                                            ? Colors.white
                                            : ColorConstant.primaryColor,
                                      ),
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.all(10.0),
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
                  ],
                ),
              ),
            );
          }
      ))
    );
  }
}
