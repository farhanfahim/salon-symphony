import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/presentation/chat_module/chat_constants.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/helper_functions.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/picker_type.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/common_image_view.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_textfield_new.dart';
import '../chat_strings.dart';
import 'controller/group_info_controller.dart';

class GroupInfo extends StatelessWidget {
  Responsive responsive = Responsive();
  GroupInfoController controller = Get.put(GroupInfoController());

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return BaseviewScreen(
      basicAppBar: true,
      mainTopHeight: 0,
      sidePadding: false,
      textButtonName: ChatConstants.update,
      blueClrEndTask: true,
      isResizeToAvoidBottomInset: false,
      textOnTap: () {
        controller.uploadMedia(context);
      },
      showBottomBar: false,
      screenName: '       Group Info',
      backgroundColor: ColorConstant.backgroundColor,
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Container(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child:InkWell(
                      splashFactory: NoSplash.splashFactory,
                      onTap: () {
                        controller.onTapCamera(PickerType.gallery, context, GalleryMode.image, 1);

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
                                  () => controller.listOfImages.isNotEmpty  && controller.listOfImages[0].image!.path.isNotEmpty
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
                              ):controller.firebaseImage.value.isNotEmpty?ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(100),
                                    child: CommonImageView(
                                      url: controller
                                          .firebaseImage.value,
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
                                controller.onTapCamera(PickerType.gallery, context, GalleryMode.image, 1);

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
                    height: 40,
                  ),
                  CustomTextField3(
                      fieldText: ChatConstants.groupName,
                      controller: controller.groupNameController,
                      isFinal: true,
                      focusNode: controller.groupNameNode,
                      keyboardType: TextInputType.name,
                      limit: 50,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(50),
                      ],
                      validator: (value) {
                        return HelperFunction.stringValidate3(value!);
                      },
                      onTap: () {}),
                  SizedBox(
                    height: 20,
                  ),

                  GestureDetector(
                    onTap: (){
                      Map<String, dynamic> map = {
                        ChatConstants.documentId: controller.documentId.value,
                      };
                      Get.toNamed(AppRoutes.chatMediaAll, arguments: map);
                    },
                    child: Container(
                      color: ColorConstant.whiteA702,
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: ColorConstant.whiteA702,
                        child: Container(
                          width: double.maxFinite,
                          margin: const EdgeInsets.only(top: 15,bottom: 15,left: 15,right: 15),
                          child: Row(
                            children: [
                              MyText(
                                title:
                                ChatConstants.media,
                                fontSize:
                                responsive.setTextScale(16),
                                clr: ColorConstant.blackColor,
                              ),
                              Spacer(),
                              CommonImageView(
                                svgPath: ImageConstant.imgArrowright,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                ],
              ),
            ),

            Expanded(
              child: Container(
                color: ColorConstant.whiteA702,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Material(
                    elevation: 5,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                    color: ColorConstant.whiteA702,
                    child: FutureBuilder<String>(
                      //Future for user id
                      future: controller.appPreferences.getUserId(),
                      builder: (context, userIdSnapshot) {
                        if (userIdSnapshot.hasData && userIdSnapshot.connectionState == ConnectionState.done) {
                          return StreamBuilder<DocumentSnapshot>(
                              stream: FirebaseFirestore.instance.collection(ChatStrings.chatsCollectionReference).doc(controller.documentId.value).snapshots(),
                              builder: (context, chatSnapshot) {
                                if (chatSnapshot.hasData) {

                                  return ListView.builder(
                                    padding: EdgeInsets.symmetric(vertical: 1),
                                    itemCount: chatSnapshot.requireData.get(ChatStrings.userIds).length + 1,

                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {

                                      return Padding(
                                        padding: EdgeInsets.symmetric(vertical: 0.6),
                                        child: index == 0
                                            ? GestureDetector(
                                          onTap: (){
                                            print(controller.adminName.value);
                                            controller.onTapAddMember();
                                          },
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Text(
                                                      "${chatSnapshot.requireData.get(ChatStrings.userIds).length} ${chatSnapshot.requireData.get(ChatStrings.userIds).length>1?ChatConstants.members:ChatConstants.member}",
                                                      style: AppStyle.txtPoppinsSemiBold16
                                                  )
                                              ),
                                              Obx(() => controller.isAdmin.value?Container(

                                                  margin: getMargin(left: 10,bottom: 4),
                                                  decoration: BoxDecoration(
                                                      color: ColorConstant.whiteA702,
                                                      borderRadius: BorderRadius.circular(getHorizontalSize(25.00))),
                                                  child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: getSize(50.0),
                                                          height: getSize(50.0),
                                                          decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            color: ColorConstant.pink300,
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20.0),
                                                            child: CommonImageView(
                                                              imagePath: ImageConstant.appbar_add_icon,
                                                              color: ColorConstant.whiteA700,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding: getPadding(
                                                                left: 14,
                                                                top: 18,
                                                                bottom: 16),
                                                            child: Text(
                                                                ChatConstants.addMember,
                                                                overflow: TextOverflow.ellipsis,
                                                                textAlign: TextAlign.left,
                                                                style: TextStyle(
                                                                  color: ColorConstant.pink300,
                                                                  fontSize: getFontSize(15,),
                                                                  fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                                                  fontWeight: FontWeight.w500,
                                                                ))),

                                                      ])):Container(),)
                                            ],
                                          ),
                                        )
                                            : StreamBuilder<QuerySnapshot>(
                                            stream: controller.getMembers(chatSnapshot.requireData.get(ChatStrings.userIds),index),
                                            builder: (context, userSnapshot) {
                                              var hasData = userSnapshot.hasData;
                                              if (userSnapshot.hasData && userSnapshot.connectionState == ConnectionState.active) {
                                                if (userIdSnapshot.requireData !=
                                                    userSnapshot.requireData.docs.first.get(ChatStrings.id).toString()) {
                                                  controller.groupMembers.add(int.parse(userSnapshot.requireData.docs.first.get(ChatStrings.id)));
                                                }
                                                if(userSnapshot.requireData.docs.first.get(ChatStrings.id) == controller.adminId.value.toString()) {
                                                  controller.adminName.value = userSnapshot.requireData.docs.first.get(ChatStrings.name);
                                                }
                                                return Column(
                                                  children: [
                                                    Padding(
                                                      padding: getPadding(left:10, top: 10,right: 10,bottom: 10),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  getHorizontalSize(25.00)),
                                                              child: hasData && userSnapshot.requireData.docs.first.get(ChatStrings.image)!=""?CommonImageView(
                                                                  url: userSnapshot.requireData.docs.first.get(ChatStrings.image),
                                                                  height: getSize(50.00),
                                                                  width: getSize(50.00),
                                                                  fit: BoxFit.cover):CommonImageView(
                                                                svgPath: ImageConstant.imgUser,
                                                                height: getSize(50.00),
                                                                width: getSize(50.00),
                                                              )),

                                                          Expanded(
                                                            child: Padding(
                                                                padding: getPadding(
                                                                    left: 14,
                                                                    top: 18,
                                                                    bottom: 15),
                                                                child: Text(
                                                                    hasData ? userSnapshot.requireData.docs.first.get(ChatStrings.name): '',
                                                                    overflow: TextOverflow.ellipsis,
                                                                    softWrap: true,
                                                                    textAlign: TextAlign.left,
                                                                    style: AppStyle.txtPoppinsRegular14Black900.copyWith(fontSize: 15,fontWeight: FontWeight.w500))),
                                                          ),
                                                          Obx(() => controller.isAdmin.value?GestureDetector(
                                                            onTap: (){
                                                              if(userSnapshot.requireData.docs.first.get(ChatStrings.id) != controller.adminId.value.toString()){
                                                                controller.removeMemberFromGroup(int.parse(userSnapshot.requireData.docs.first.get(ChatStrings.id)),
                                                                    userSnapshot.requireData.docs.first.get(ChatStrings.name));
                                                                controller.groupMembers.removeWhere((item) => item == int.parse(userSnapshot.requireData.docs.first.get(ChatStrings.id)));
                                                              }
                                                            },
                                                            child: MyText(
                                                              title:
                                                              userSnapshot.requireData.docs.first.get(ChatStrings.id) != controller.adminId.value.toString()?"Remove":"Admin",
                                                              fontSize: responsive.setTextScale(11),
                                                              clr: ColorConstant.gray500,
                                                            ),
                                                          ):MyText(
                                                            title:
                                                            userSnapshot.requireData.docs.first.get(ChatStrings.id) !=  controller.adminId.value.toString()?"":"Admin",
                                                            fontSize: responsive.setTextScale(11),
                                                            clr: ColorConstant.gray500,
                                                          ),)
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: MediaQuery.of(context).size.width*0.88,height: 1,color: ColorConstant.gray200,
                                                    ),
                                                  ],
                                                );
                                              } else {
                                                return const SizedBox();
                                              }
                                            }),
                                      );
                                    },
                                  );
                                } else {
                                  return SizedBox(
                                    height: 15,
                                  );
                                }
                              });
                        } else {
                          return SizedBox(
                            height: 15,
                          );
                        }
                      },
                    ),
                ),
              ),
            ),

          ],
        ),
      ) ,
    );
  }
}
