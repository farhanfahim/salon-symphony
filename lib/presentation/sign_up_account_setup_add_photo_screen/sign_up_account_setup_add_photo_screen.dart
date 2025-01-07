import 'package:image_pickers/image_pickers.dart';
import 'package:salon_symphony/baseviews/baseview_auth_screen.dart';
import 'package:salon_symphony/core/utils/dummy_content.dart';
import 'package:salon_symphony/core/utils/picker_type.dart';
import 'package:salon_symphony/core/utils/responsive.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import 'package:salon_symphony/widgets/custom_back_button.dart';

import '../../widgets/animatedButton.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_form_field.dart';
import '../add_scheduale_screen/add_schedule_screen.dart';
import 'controller/sign_up_account_setup_add_photo_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_button.dart';
import 'package:salon_symphony/widgets/custom_icon_button.dart';

class SignUpAccountSetupAddPhotoScreen
    extends GetWidget<SignUpAccountSetupAddPhotoController> {
  Map<String, dynamic> map;
  SignUpAccountSetupAddPhotoScreen({required this.map});
  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return GestureDetector(
      onTap: (){
        Utils.hideKeyboard(context);
      },
      child: BaseviewAuthScreen(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: ColorConstant.backgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 18.0,
                  left: 15,
                  right: 15,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        SizedBox(width: 20,),
                        Center(
                          child: MyText(
                            title: '${'Create Account'}',
                            weight: 'Semi Bold',
                            fontSize: responsive.setTextScale(16),
                          ),
                        ),
                        Spacer(),

                        GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.onboardingSpecialities,arguments: map);
                            },
                            child: MyText(
                              title: "Skip",
                              clr: ColorConstant.hintTextColor,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: responsive.setHeight(5),
                          ),
                        ],
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: MyText(
                                        title: "Upload Photo",
                                        fontSize: responsive.setTextScale(30),
                                        weight: 'Semi Bold',
                                      ),
                                    ),
                                    SizedBox(
                                      height: responsive.setHeight(1),
                                    ),
                                    Center(
                                      child: MyText(
                                        title: "Now let’s add your profile photo.",
                                        clr: ColorConstant.black900,
                                      ),
                                    ),
                                    SizedBox(
                                      height: responsive.setHeight(5),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: InkWell(
                                        splashFactory: NoSplash.splashFactory,
                                        onTap: () {
                                          controller.onTapBtntf(PickerType.gallery, context, GalleryMode.image, 1);
                                        },
                                        child: Container(
                                          height: getSize(100.00),
                                          width: getSize(100.00),
                                          margin:
                                              getMargin(left: 15, top: 28, right: 15),
                                          child: Stack(
                                            alignment: Alignment.bottomRight,
                                            children: [
                                              Obx(
                                                () => controller.listOfImages.value.isNotEmpty && controller.listOfImages[0].image !=null
                                                    ? ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.circular(100),
                                                        child: CommonImageView(
                                                          file: controller.listOfImages[0].image,
                                                          height:
                                                              responsive.setHeight(30),
                                                          width:
                                                              responsive.setHeight(30),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      )
                                                    :CommonImageView(
                                                  svgPath: ImageConstant.imgUser,
                                                  height:
                                                  responsive.setHeight(30),
                                                  width: responsive.setHeight(30),
                                                ),
                                              ),
                                              CustomIconButton(
                                                height: 30,
                                                width: 30,
                                                margin: getMargin(left: 10, top: 10),
                                                variant:
                                                    IconButtonVariant.OutlineWhiteA701,
                                                shape: IconButtonShape.CircleBorder15,
                                                alignment: Alignment.bottomRight,
                                                onTap: () {
                                                  controller.onTapBtntf(PickerType.gallery, context, GalleryMode.image, 1);
                                                },
                                                child: CommonImageView(
                                                    svgPath: ImageConstant.imgCamera),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Obx(
                                      () =>  controller.listOfImages.value.isNotEmpty && controller.listOfImages[0].image !=null ?AnimatedButton(
                                        // semanticsLabel: SemanticsLabel.LAB_SIGNIN_BTN_LINK,
                                        text: "Continue",
                                        width: double.maxFinite,
                                        margin: getMargin(left: 15, top: 44, right: 15),
                                        padding: ButtonPaddingOfButton.PaddingAll18,
                                        fontStyle: ButtonFontStyleOfButton.PoppinsSemiBold16,
                                        alignment: Alignment.center,
                                        onPressed: () async {

                                          if(controller.listOfImages.value.isNotEmpty){
                                            controller.pageIndex.value = 1;
                                            controller.uploadMedia();


                                          }else{
                                          Utils.showToast('Update Profile Picture', true);
                                          }
                                        }, controller: controller.animatedButtonController,):CustomButton(
                                          width: responsive.setWidth(100),
                                          text: "Continue",
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
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                height: getSize(22.00),
                width: getSize(22.00),
                child: CommonImageView(
                  imagePath: ImageConstant.imgLogo,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onTapTxtSkip() {
    Get.toNamed(AppRoutes.signUpAccountSetupSelectInterestsScreen);
  }

  onTapImgUser() {
    Get.toNamed(AppRoutes.signUpAccountSetupAddedPhotoScreen);
  }
}
