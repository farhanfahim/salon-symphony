import 'package:flutter/services.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/core/utils/picker_type.dart';
import 'package:salon_symphony/core/utils/semantics.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import 'package:salon_symphony/widgets/custom_button.dart';
import '../../core/utils/helper_functions.dart';
import '../../core/utils/responsive.dart';
import '../../widgets/animatedButton.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textfield_link.dart';
import '../../widgets/custom_textfield_new.dart';
import '../../widgets/skeleton.dart';
import '../profile_specialities/model/specialites_response_model.dart';
import 'controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

// ignore_for_file: must_be_immutable
class EditProfileScreen extends GetWidget<EditProfileController> {

  Responsive responsive = Responsive();
  @override
  Widget build(BuildContext context) {

    responsive.setContext(context);
    return BaseviewScreen(
      showBottomBar: false,
      basicAppBar: true,
      mainTopHeight: 0,
      screenName: 'Edit Profile',
      bottomSafeArea: true,
      isResizeToAvoidBottomInset: true,
      backgroundColor: ColorConstant.whiteA700,
      sidePadding: false,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                  key: controller.formKey,
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Container(
                      width: size.width,
                      // padding: getPadding(all: 16),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                splashFactory: NoSplash.splashFactory,
                                onTap: () {
                                  controller.onTapBtntf(PickerType.gallery, context);
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
                                            :  controller.user.value.image!=null
                                                ? controller.user.value.image!.isNotEmpty? ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(100),
                                              child: CommonImageView(
                                                url: controller.myProfileResponseModelObj.value.data!.image,
                                                height:
                                                responsive.setHeight(30),
                                                width:
                                                responsive.setHeight(30),
                                                fit: BoxFit.cover,
                                              ),
                                            ):CommonImageView(
                                              svgPath: ImageConstant.imgUser,
                                              height:
                                              responsive.setHeight(30),
                                              width: responsive.setHeight(30),
                                            ):CommonImageView(
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
                                          controller.onTapBtntf(PickerType.gallery, context);
                                        },
                                        child: CommonImageView(
                                            svgPath: ImageConstant.imgCamera),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomTextField3(
                                fieldText: "Full Name",
                                semanticsLabel: SemanticsLabel.LAB_FULLNAME_FIELD,
                                controller: controller.nameController,
                                isFinal: false,
                                focusNode: controller.fullNameNode,
                                nextFocusNode: controller.phoneNode,
                                keyboardType: TextInputType.name,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(40),
                                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                                ],
                                onChanged: (value) {
                                  // controller.checkForm();
                                },
                                limit: 40,

                                validator: (value) {
                                  return HelperFunction.passwordValidate(value!);
                                },
                                onTap: () {}),
                            SizedBox(
                              height: responsive.setHeight(2),
                            ),
                            CustomTextField3(
                                fieldText: "Phone Number",
                                semanticsLabel: SemanticsLabel.LAB_PHONE_FIELD,
                                controller: controller.mobileNoController,
                                isFinal: false,
                                focusNode: controller.phoneNode,
                                nextFocusNode: controller.emailNode,
                                keyboardType: TextInputType.phone,
                                limit: 15,
                                onChanged: (value) {
                                  controller.checkForm();
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '';
                                  } else if (!controller.phoneNumberRegExp.hasMatch(value)) {
                                    return '';
                                  }
                                  return null;
                                },
                                onTap: () {}),
                            SizedBox(
                              height: responsive.setHeight(2),
                            ),
                            CustomTextField3(
                                semanticsLabel: SemanticsLabel.LAB_EMAIL_FIELD,
                                fieldText: "Email Address",
                                controller: controller.emailController,
                                isFinal: true,
                                focusNode: controller.emailNode,
                                // nextFocusNode: controller.passwordNode,
                                keyboardType: TextInputType.emailAddress,
                                limit: 50,
                                onChanged: (value) {
                                  controller.checkForm();
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '';
                                  }
                                  return null;
                                },
                                onTap: () {}),
                            SizedBox(
                              height: responsive.setHeight(2),
                            ),
                            CustomTextField3(
                              semanticsLabel: SemanticsLabel.LAB_POSITION_FIELD,
                              fieldText: "Position",
                              controller: controller.positionController,
                              focusNode: controller.positionNode,
                              isFinal: false,
                              enabled: false,
                              // focusNode: controller.positionNode,
                              // nextFocusNode: controller.locationNode,
                              keyboardType: TextInputType.text,
                              limit: HelperFunction.EMAIL_VALIDATION,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                }
                                return null;
                              },
                              iconData: Icons.keyboard_arrow_down,
                              // iconHinColor: true,
                              iconColorChange: true,
                              onChanged: (value) {
                                controller.checkForm();
                              },
                              sufixIconOnTap: (){
                                selectPosition(context);
                                if (controller.arrOfPosition.isEmpty){
                                  controller.getPositionListing();
                                }
                              },
                              onTap: () {
                                selectPosition(context);
                                if (controller.arrOfPosition.isEmpty){
                                  controller.getPositionListing();
                                }
                              },),
                            SizedBox(
                              height: responsive.setHeight(2),
                            ),
                            CustomTextField3(
                              semanticsLabel: SemanticsLabel.LAB_LOCATION_FIELD,
                              fieldText: "Location",
                              controller: controller.locationController,
                              isFinal: true,
                              focusNode: controller.locationNode,
                              keyboardType: TextInputType.text,
                              limit: 50,
                              onChanged: (value) {
                                controller.checkForm();
                              },
                              iconHinColor: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                }
                                return null;
                              },
                              onTap: () {

                              },),
                            SizedBox(
                              height: responsive.setHeight(2),
                            ),
                            CustomTextField3(
                              semanticsLabel: SemanticsLabel.LAB_HIRE_DATE_FIELD,
                              fieldText: "Hire Date",
                              controller: controller.hireDateController,
                              isFinal: false,
                              enabled: false,
                              focusNode: controller.hireDateNode,
                              // nextFocusNode: controller.dobNode,
                              keyboardType: TextInputType.text,
                              limit: HelperFunction.EMAIL_VALIDATION,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                }
                                return null;
                              },
                              icon: ImageConstant.imgCalendar,
                              // iconHinColor: true,
                              onChanged: (value) {
                                controller.checkForm();
                              },
                              sufixIconOnTap: (){
                                controller.selectAge(context, false);
                              },
                              onTap: () {
                                controller.selectAge(context, false);
                              },
                            ),
                            SizedBox(
                              height: responsive.setHeight(2),
                            ),
                            CustomTextField3(
                              semanticsLabel: SemanticsLabel.LAB_AGE_FIELD,
                              fieldText: "lbl_birthday".tr,
                              controller: controller.dobController,
                              isFinal: false,
                              enabled: false,
                              focusNode: controller.dobNode,
                              nextFocusNode: controller.schoolNode,
                              keyboardType: TextInputType.text,
                              limit: HelperFunction.EMAIL_VALIDATION,
                              onChanged: (value) {
                                controller.checkForm();
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                }
                                return null;
                              },
                              sufixIconOnTap: () {
                                controller.selectAge(context, true);
                              },
                              icon: ImageConstant.birthdayCake,
                              // iconHinColor: true,
                              onTap: () {
                                controller.selectAge(context, true);
                              },
                            ),
                            SizedBox(
                              height: responsive.setHeight(2),
                            ),
                            CustomTextField3(
                              fieldText: "School/University",
                              semanticsLabel: SemanticsLabel.LAB_INSTITUTION_FIELD,
                              controller: controller.schoolController,
                              isFinal: false,
                              onChanged: (value) {
                                controller.checkForm();
                              },
                              focusNode: controller.schoolNode,
                              nextFocusNode: controller.bioNode,
                              keyboardType: TextInputType.text,
                              limit: HelperFunction.SCHOOL_VALIDATION,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(HelperFunction.SCHOOL_VALIDATION),
                              ],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                }
                                return null;
                              },

                            ),
                            SizedBox(
                              height: responsive.setHeight(2),
                            ),
                            CustomTextField3(
                              semanticsLabel: SemanticsLabel.LAB_BIO_FIELD,
                              fieldText: "Bio",
                              controller: controller.bioController,
                              isFinal: true,
                              onChanged: (value) {
                                controller.checkForm();
                              },
                              focusNode: controller.bioNode,
                              keyboardType: TextInputType.text,
                              limit: HelperFunction.BIO_VALIDATION,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(HelperFunction.BIO_VALIDATION),
                              ],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                }
                                return null;
                              },

                            ),
                            SizedBox(
                              height: responsive.setHeight(2),
                            ),
                            CustomTextField3(
                              fieldText: "lbl_relationship".tr,
                              semanticsLabel: SemanticsLabel.LAB_RELATIONSHIP_FIELD,
                              controller: controller.relationController,
                              isFinal: false,
                              enabled: false,
                              focusNode: controller.relationNode,
                              // nextFocusNode: controller.locationNode,
                              keyboardType: TextInputType.text,
                              limit: HelperFunction.EMAIL_VALIDATION,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                }
                                return null;
                              },
                              iconData: Icons.keyboard_arrow_down,
                              iconHinColor: true,
                              onChanged: (value) {
                                controller.checkForm();
                              },
                              sufixIconOnTap: (){
                                selectRelation(context);
                              },
                              onTap: () {
                                selectRelation(context);
                              },),
                            SizedBox(
                              height: responsive.setHeight(2),
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 13.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Interests',
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        16,
                                      ),
                                      fontWeight: FontWeight.w500,
                                    ),),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // InkWell(
                                  //   onTap: (){
                                  //     print("salman");
                                  //     print("going from here");
                                  //
                                  //     Get.toNamed(AppRoutes.profileSpecialities,arguments: controller.selectedInterestId)!.then((value)  {
                                  //       print("hitted on baxck");
                                  //       if(value!=null) {
                                  //         if (controller.selectedInterest
                                  //             .isNotEmpty) {
                                  //           controller.selectedInterest.clear();
                                  //         }
                                  //         if (controller.selectedInterestId
                                  //             .isNotEmpty) {
                                  //           controller.selectedInterestId.clear();
                                  //         }
                                  //         List<
                                  //             SpecialitiesResponseData> intrests = value;
                                  //         for (var item in intrests) {
                                  //           if (item.selected!.value) {
                                  //             controller.selectedInterest.value
                                  //                 .add(item.name!);
                                  //             controller.selectedInterestId.value
                                  //                 .add(item.id!);
                                  //           }
                                  //         }
                                  //         controller.selectedInterest.refresh();
                                  //         controller.selectedInterestId.refresh();
                                  //       }
                                  //     });
                                  //
                                  //   },
                                  //   child: Container(
                                  //     width: double.maxFinite,
                                  //     decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.circular(5),
                                  //       border: Border.all(
                                  //           color: Colors.black12
                                  //       ),
                                  //     ),
                                  //     child: Padding(
                                  //       padding: const EdgeInsets.all(8.0),
                                  //       child: Obx(() =>controller.selectedInterest.length>0?Wrap(
                                  //         children: [
                                  //           for (var data in controller.selectedInterest)
                                  //             Text(data+" | ",
                                  //               style: AppStyle.txtPoppinsRegular14Black900,),
                                  //         ],
                                  //       ):Text("No interest selected",
                                  //         style: AppStyle.txtPoppinsRegular14Black900,),
                                  //   ),
                                  // ),
                                  // ),
                                  // ),
                              InkWell(
                                onTap: () {
                                  print("salman");
                                  print("going from here");

                                  Get.toNamed(AppRoutes.profileSpecialities, arguments: controller.selectedInterestId)!.then((value) {
                                    print("hitted on back");
                                    if (value != null) {
                                      if (controller.selectedInterest.isNotEmpty) {
                                        controller.selectedInterest.clear();
                                      }
                                      if (controller.selectedInterestId.isNotEmpty) {
                                        controller.selectedInterestId.clear();
                                      }
                                      List<SpecialitiesResponseData> interests = value;
                                      for (var item in interests) {
                                        if (item.selected!.value) {
                                          controller.selectedInterest.value.add(item.name!);
                                          controller.selectedInterestId.value.add(item.id!);
                                        }
                                      }
                                      controller.selectedInterest.refresh();
                                      controller.selectedInterestId.refresh();
                                    }
                                  });
                                },
                                child: Container(
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.black12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Obx(() => controller.selectedInterest.length > 0
                                        ? Wrap(
                                      children: [
                                        for (var index = 0; index < controller.selectedInterest.length; index++)
                                          Text(
                                            controller.selectedInterest[index] + (index < controller.selectedInterest.length - 1 ? " | " : ""),
                                            style: AppStyle.txtPoppinsRegular14Black900,
                                          ),
                                      ],
                                    )
                                        : Text(
                                      "No interest selected",
                                      style: AppStyle.txtPoppinsRegular14Black900,
                                    ),
                                    ),
                                  ),
                                ),),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      CustomIconButton(
                                        height: 34,
                                        width: 34,
                                        margin: getMargin(
                                            top: 2,
                                            bottom: 1,
                                            right: 10
                                        ),
                                        variant: IconButtonVariant.FillBlueA400,
                                        shape: IconButtonShape.CircleBorder15,
                                        padding: IconButtonPadding.PaddingAll8,
                                        child: CommonImageView(
                                          svgPath: ImageConstant.imgFacebook,
                                        ),
                                      ),
                                      Text('Facebook',
                                        style: TextStyle(
                                          color: ColorConstant.black900,
                                          fontSize: getFontSize(
                                            16,
                                          ),
                                          fontWeight: FontWeight.w400,
                                        ),),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),

                                  CustomTextFieldLink(
                                      fieldText: "Enter facebook url",
                                      controller: controller.facebookUrlController,
                                      isFinal: false,
                                      focusNode: controller.facebookNode,

                                      keyboardType: TextInputType.url,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return null;
                                        } else if (!controller.urlRegex.hasMatch(value)) {
                                          Utils.showToast("Please enter valid url" , true);
                                          return '';
                                        }
                                        return null;
                                      },
                                      limit: 50,
                                      onTap: () {}),

                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 12.0),
                                        child: CommonImageView(
                                          imagePath: ImageConstant.insta,
                                          height: 34,
                                        ),
                                      ),
                                      Text('Instagram',
                                        style: TextStyle(
                                          color: ColorConstant.black900,
                                          fontSize: getFontSize(
                                            16,
                                          ),
                                          fontWeight: FontWeight.w400,
                                        ),),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextFieldLink(
                                      fieldText: "Enter Instagram url",
                                      controller: controller.instagramUrlController,
                                      isFinal: false,
                                      focusNode: controller.instagramNode,
                                      // nextFocusNode: controller.passwordNode,
                                      keyboardType: TextInputType.url,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return null;
                                        } else if (!controller.urlRegex.hasMatch(value)) {
                                          Utils.showToast("Please enter valid url" , true);
                                          return '';
                                        }
                                        return null;
                                      },
                                      limit: 50,
                                      onTap: () {}),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 12.0),
                                        child: CommonImageView(
                                          imagePath: ImageConstant.tiktok,
                                          height: 34,
                                        ),
                                      ),
                                      Text('Tiktok',
                                        style: TextStyle(
                                          color: ColorConstant.black900,
                                          fontSize: getFontSize(
                                            16,
                                          ),
                                          fontWeight: FontWeight.w400,
                                        ),),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextFieldLink(
                                      fieldText: "Enter tiktok url",
                                      controller: controller.tiktokUrlController,
                                      isFinal: false,
                                      focusNode: controller.tiktokNode,
                                      // nextFocusNode: controller.passwordNode,
                                      keyboardType: TextInputType.url,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return null;
                                        } else if (!controller.urlRegex.hasMatch(value)) {
                                          Utils.showToast("Please enter valid url" , true);
                                          return '';
                                        }
                                        return null;
                                      },
                                      limit: 50,
                                      onTap: () {}),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 12.0),
                                        child: CommonImageView(
                                          imagePath: ImageConstant.portfolio,
                                          height: 34,
                                        ),
                                      ),
                                      Text('Portfolio',
                                        style: TextStyle(
                                          color: ColorConstant.black900,
                                          fontSize: getFontSize(
                                            16,
                                          ),
                                          fontWeight: FontWeight.w400,
                                        ),),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextFieldLink(
                                      fieldText: "Enter portfolio url",
                                      controller: controller.portfolioUrlController,
                                      isFinal: false,
                                      focusNode: controller.portfolioNode,
                                      // nextFocusNode: controller.passwordNode,
                                      keyboardType: TextInputType.url,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return null;
                                        } else if (!controller.urlRegex.hasMatch(value)) {
                                          Utils.showToast("Please enter valid url" , true);
                                          return '';
                                        }
                                        return null;
                                      },
                                      limit: 50,
                                      onTap: () {}),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text('Certificates:',
                                        style: TextStyle(
                                          color: ColorConstant.black900,
                                          fontSize: getFontSize(
                                            16,
                                          ),
                                          fontWeight: FontWeight.w500,
                                        ),),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () async {
                                          controller.onTapAddCertificate();
                                        },
                                        child: Text('Add',
                                          style: TextStyle(
                                            color: ColorConstant.redA200,
                                            fontSize: getFontSize(
                                              12,
                                            ),
                                            fontWeight: FontWeight.w400,
                                          ),),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),




                                ],
                              ),
                            ),
                            Container(
                              height: 100,

                              padding: const EdgeInsets.symmetric(horizontal: 13.0),
                              child: Obx (() =>controller.isCertificateUploading.value?Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.6,
                                        child:  SizedBox(width: MediaQuery.of(context).size.width*0.6, height: 15.0, child: Skeleton(switcholor: true,),),

                                      ),
                                      SizedBox(height: 5,),
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.4,
                                        child:  SizedBox(width: MediaQuery.of(context).size.width*0.4, height: 15.0, child: Skeleton(switcholor: true,),),

                                      ),
                                    ],
                                  ),
                                ],
                              ):controller.certificate.length>0?(
                                 ListView.builder(
                                  itemCount: controller.certificate.length,
                                  itemBuilder: (context, i){
                                    return Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [


                                            Padding(
                                              padding: const EdgeInsets.only(right: 12.0),
                                              child: CommonImageView(
                                                svgPath: ImageConstant.clipper,
                                                height: 34,
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context).size.width*0.7,
                                                  child: Text(controller.certificate[i].certificate != null?controller.certificate[i].certificate! :"",
                                                    style: TextStyle(
                                                      color: ColorConstant.black900,
                                                      fontSize: getFontSize(
                                                        16,
                                                      ),
                                                      fontWeight: FontWeight.w400,
                                                    ),),
                                                ),
                                                Text(controller.certificate[i].size!,
                                                  style: TextStyle(
                                                    color: ColorConstant.black900,
                                                    fontSize: getFontSize(
                                                      12,
                                                    ),
                                                    fontWeight: FontWeight.w400,
                                                  ),),
                                              ],
                                            ),
                                            Spacer(),
                                            GestureDetector(
                                              onTap:(){
                                                print("remove");
                                                print("${controller.certificate[i].toJson()}");
                                                controller.removeCertificate(controller.certificate[i].id!);
                                                controller.certificate.removeAt(i);
                                                },
                                              child: Padding(
                                                padding: const EdgeInsets.only(bottom: 14.0),
                                                child: Text('Remove',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: getFontSize(
                                                      12,
                                                    ),
                                                    fontWeight: FontWeight.w400,
                                                  ),),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20,)
                                      ],
                                    );
                                  },
                                )):Text("No certificate found",
                                  style: AppStyle.txtPoppinsRegular14Black900,),
                              ),
                            )

                          ]))),
            ),
          ),
          Obx(() =>         controller.isFormCompleted.value || controller.listOfImages.value.isNotEmpty  ?
          AnimatedButton(
            // semanticsLabel: SemanticsLabel.LAB_SIGNIN_BTN_LINK,
            text: "Save Changes",
            width: double.maxFinite,
            margin: getMargin(left: 15, top: 10, right: 15),
            padding: ButtonPaddingOfButton.PaddingAll18,
            fontStyle: ButtonFontStyleOfButton.PoppinsSemiBold16,
            alignment: Alignment.center,
            onPressed: () async {
              controller.validate(context);


            }, controller: controller.animatedButtonController,)
              : CustomButton(semanticsLabel: SemanticsLabel.LAB_UPDATE_PROF_BTN,
              width: 343,
              text: "Save Changes",
              onTap: () {
              },
              margin: getMargin(left: 15, top: 10, right: 15),
              variant: ButtonVariant.FillIndigo50,
              padding: ButtonPadding.PaddingAll18,
              fontStyle: ButtonFontStyle.PoppinsSemiBold16))


        ],
      ),
    );
  }

  void selectPosition(context) {
    Responsive responsive = Responsive();
    responsive.setContext(context);
    HelperFunction.showBottomSheet(
      context,
      redclrEndTask: false,
      isScrollControlled: true,
       bottomSheetHeight:responsive.setHeight(80),
      // spaceBetween: responsive.setHeight(4),
      screenTitle: 'Select Position',
      screenEndTask: "Done",
      widget: Obx(() => Padding(
        padding: EdgeInsets.only(top: responsive.setHeight(1.5)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            controller.isApiCalling.value?Skeleton(width: 200,height: 15,switcholor: true,):Expanded(
              child: ListView.builder(
                itemCount: controller.arrOfPosition.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  var data = controller.arrOfPosition[index];
                  // print('count ${arrOfOptions[1].selected!.value}');
                  return InkWell(
                    onTap: () {
                      controller.positionController.value.text = data.name.toString();
                      controller.saveInfo(context);
                      controller.updateItem(index);
                      Get.back();
                      print(controller.arrOfPosition
                          .where(
                              (element) => element.selected!.value == true)
                          .first
                          .id);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: responsive.setHeight(3.5), right: 20),
                      child: Row(
                        children: [
                          MyText(title: '${data.name}'),
                          Spacer(),
                          controller.arrOfPosition[index].selected!.value == true
                              ? Container(
                            margin: getMargin(
                              //   top: 15,
                              right: 5,
                              //   bottom: 15,
                            ),
                            decoration: AppDecoration
                                .outlineBluegray100
                                .copyWith(
                              borderRadius:
                              BorderRadiusStyle.roundedBorder10,
                              border: Border.all(
                                color: ColorConstant.primaryColor,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: getSize(
                                    15.00,
                                  ),
                                  width: getSize(
                                    15.00,
                                  ),
                                  margin: getMargin(
                                    all: 1,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.primaryColor,
                                    borderRadius:
                                    BorderRadius.circular(
                                      getHorizontalSize(
                                        50,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                              : Container(
                            margin: getMargin(
                              // top: 15,
                              right: 5,
                              // bottom: 15,
                            ),
                            decoration: AppDecoration
                                .outlineBluegray100
                                .copyWith(
                              borderRadius:
                              BorderRadiusStyle.roundedBorder10,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: getSize(
                                    15.00,
                                  ),
                                  width: getSize(
                                    15.00,
                                  ),
                                  margin: getMargin(
                                    all: 1,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.whiteA700,
                                    borderRadius:
                                    BorderRadius.circular(
                                      getHorizontalSize(
                                        50,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
  void selectRelation(context) {
    Responsive responsive = Responsive();
    responsive.setContext(context);
    HelperFunction.showBottomSheet(
      context,
      bottomSheetHeight: responsive.setHeight(43),
      spaceBetween: responsive.setHeight(4),
      screenEndTask: "Done",
      screenTitle: 'Relationship Status',
      widget: Obx(() => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.arrOfRelation.length,
          itemBuilder: (BuildContext context, int index) {
            var data = controller.arrOfRelation[index];
            // print('count ${arrOfOptions[1].selected!.value}');
            return InkWell(
              onTap: () {
                controller.relationController.value.text = data.name.toString();
                // saveInfo(context);
                controller.updateItem2(index);
                Get.back();
                controller.checkForm();
              },
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: responsive.setHeight(4), right: 20),
                child: Row(
                  children: [
                    MyText(title: '${data.name}'),
                    Spacer(),
                    controller.arrOfRelation[index].selected!.value == true
                        ? Container(
                      margin: getMargin(
                        // top: 15,
                        right: 5,
                        // bottom: 15,
                      ),
                      decoration:
                      AppDecoration.outlineBluegray100.copyWith(
                        borderRadius:
                        BorderRadiusStyle.roundedBorder10,
                        border: Border.all(
                          color: ColorConstant.primaryColor,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: getSize(
                              15.00,
                            ),
                            width: getSize(
                              15.00,
                            ),
                            margin: getMargin(
                              all: 1,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.primaryColor,
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  50,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                        : Container(
                      margin: getMargin(
                        // top: 15,
                        right: 5,
                        // bottom: 15,
                      ),
                      decoration:
                      AppDecoration.outlineBluegray100.copyWith(
                        borderRadius:
                        BorderRadiusStyle.roundedBorder10,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: getSize(
                              15.00,
                            ),
                            width: getSize(
                              15.00,
                            ),
                            margin: getMargin(
                              all: 1,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.whiteA700,
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  50,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      )),
    );
  }
}
