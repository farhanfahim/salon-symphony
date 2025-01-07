import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/core/utils/picker_type.dart';
import 'package:salon_symphony/presentation/chat_module/chat_constants.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/helper_functions.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/common_image_view.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_textfield_new.dart';
import '../../../widgets/response_binding_widget.dart';
import '../../../widgets/widgetSkeleton.dart';
import 'controller/create_group_chat_controller.dart';

class CreateGroupChatScreen extends GetWidget<CreateGroupChatController> {
  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return Obx(() =>  BaseviewScreen(
      basicAppBar: true,
      mainTopHeight: 0,
      sidePadding: false,
      textButtonName: ChatConstants.next,
      blueClrEndTask: controller.isUserSelected.value == true && controller.isText.value == true ? true : null,
      greyClrEndTask: controller.isUserSelected.value == true && controller.isText.value == true ? null : true,
      isResizeToAvoidBottomInset: false,
      textOnTap: () {
        controller.onTapNext();
      },
      showBottomBar: false,
      screenName: '       Create Group',
      backgroundColor: ColorConstant.backgroundColor,
      child: Obx(() =>  ResponseBindingWidget(
          apiCallStatus: controller.apiCallStatus.value,
          errorWidget: () {
            return Container();
          },
          loadingWidget: () {
            return Column(
              children: [
                listShimmer(),
              ],
            );
          },
          emptyWidget: (){
            return RefreshIndicator(
              color: ColorConstant.black900,
              onRefresh: () async {
                if (controller.arrOfUsers.isNotEmpty) {
                  controller.arrOfUsers.clear();
                }
                await controller.getUsers();
              },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  width: double.maxFinite,
                  height: 500,
                  child: Center(
                    child: Text(
                        ChatConstants.noRecordFound,
                        style: AppStyle.txtPoppinsSemiBold16.copyWith(
                          height: 1.50,
                          letterSpacing: 0.5,
                        )
                    ),
                  ),
                ),
              ),
            );
          },
          successWidget: () {
            return Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Obx(() => controller.isUserSelected.value == true
                      ? Column(
                    children: [
                      SizedBox(height: 20,),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          splashFactory: NoSplash.splashFactory,
                          onTap: () {
                            controller.onTapCamera(PickerType.gallery, context, GalleryMode.image, 1);
                          },
                          child: Container(
                            height: getSize(100.00),
                            width: getSize(100.00),
                            margin: getMargin(left: 15, top: 28, right: 15),
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Obx(() => controller.listOfImages.isNotEmpty  && controller.listOfImages[0].image!.path.isNotEmpty
                                    ? ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: CommonImageView(
                                    file: controller.listOfImages[0].image,
                                    height: responsive.setHeight(30),
                                    width: responsive.setHeight(30),
                                    fit: BoxFit.cover,
                                  ),
                                ):CommonImageView(
                                  svgPath: ImageConstant.imgUser,
                                  height: responsive.setHeight(30),
                                  width: responsive.setHeight(30),
                                ),
                                ),
                                CustomIconButton(
                                  height: 30,
                                  width: 30,
                                  margin: getMargin(left: 10, top: 10),
                                  variant: IconButtonVariant.OutlineWhiteA701,
                                  shape: IconButtonShape.CircleBorder15,
                                  alignment: Alignment.bottomRight,
                                  onTap: () {
                                    controller.onTapCamera(PickerType.gallery, context, GalleryMode.image, 1);

                                  },
                                  child: CommonImageView(svgPath: ImageConstant.imgCamera),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40,),
                      CustomTextField3(
                          fieldText: ChatConstants.groupName,
                          controller: controller.groupNameController,
                          isFinal: true,
                          focusNode: controller.groupNameNode,
                          keyboardType: TextInputType.name,
                          limit: 50,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.isText.value = true;
                              print('isText ${controller.isText.value}');
                            } else {
                              controller.isText.value = false;
                              print('isText ${controller.isText.value}');
                            }
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(50),
                          ],
                          validator: (value) {
                            return HelperFunction.stringValidate3(value!);
                          },
                          onTap: () {}),
                      SizedBox(height: 20,),
                      Container(
                        height: 85,
                        width: double.maxFinite,
                        padding: const EdgeInsets.only(bottom: 8.0,left: 10,right: 10),
                        child: Container(
                          child: Obx(() => ListView.builder(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.arrOfUsers.length,
                              itemBuilder: (context, index) {
                                return controller.arrOfUsers[index].isSelected!.value
                                    ? Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                              borderRadius: BorderRadius.circular(getHorizontalSize(25.00)),
                                              child: controller.arrOfUsers[index].image!=null?CommonImageView(
                                                  url: controller.arrOfUsers[index].image,
                                                  height: getSize(50.00),
                                                  width: getSize(50.00),
                                                  fit: BoxFit.cover):CommonImageView(
                                                svgPath: ImageConstant.imgUser,
                                                height: getSize(50.00),
                                                width: getSize(50.00),
                                              ))

                                        ],
                                      ),
                                    ),
                                    Positioned(
                                        right: 0,
                                        top: 5,
                                        child: GestureDetector(
                                          onTap: () {
                                            controller.updateQuizItem(index);
                                          },
                                          child: CommonImageView(
                                            svgPath: ImageConstant.img_remove,
                                            height: getSize(24.00,),
                                            width: getSize(24.00,),
                                            fit: BoxFit.cover,
                                          ),
                                        ))
                                  ],
                                )
                                    : Container();
                              })),
                        ),
                      ),
                    ],
                  )
                      : Container(),),
                  Container(
                      height: getVerticalSize(1.00),
                      width: size.width,
                      margin: getMargin(top: 10),
                      decoration: BoxDecoration(color: ColorConstant.gray100)),
                  Expanded(
                    child:  Container(
                        width: size.width,
                        child: Obx(() => ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.arrOfUsers.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  controller.updateQuizItem(index);
                                },
                                child: Container(
                                    color: ColorConstant.backgroundColor,
                                    padding: getPadding(left: 15, top: 0),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [

                                          Padding(
                                              padding: getPadding(top: 10, right: 10,bottom: 10),
                                              child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    ClipRRect(
                                                        borderRadius: BorderRadius.circular(getHorizontalSize(25.00)),
                                                        child: controller.arrOfUsers[index].image!=null?CommonImageView(
                                                            url: controller.arrOfUsers[index].image,
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
                                                              controller.arrOfUsers[index].name!,
                                                              overflow: TextOverflow.ellipsis,
                                                              softWrap: true,
                                                              textAlign: TextAlign.left,
                                                              style: AppStyle.txtPoppinsRegular14Black900.copyWith(
                                                                  fontSize: 15,fontWeight: FontWeight.w500))
                                                      ),
                                                    ),

                                                    controller.arrOfUsers[index].isSelected!.value == true
                                                        ? Container(
                                                      decoration: AppDecoration.outlineBluegray100.copyWith(
                                                        borderRadius: BorderRadiusStyle.roundedBorder10,
                                                      ),
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                            height: getSize(17.00,),
                                                            width: getSize(17.00,),
                                                            decoration: BoxDecoration(
                                                              color: ColorConstant.primaryColor,
                                                              borderRadius: BorderRadius.circular(getHorizontalSize(50,),),
                                                            ),
                                                            child: CommonImageView(
                                                                imagePath: ImageConstant.imageCheckSelected,
                                                                height: getVerticalSize(12.00),
                                                                width: getHorizontalSize(12.00),
                                                                fit: BoxFit.cover),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                        : Container(
                                                      decoration: AppDecoration.outlineBluegray100.copyWith(
                                                        borderRadius: BorderRadiusStyle.roundedBorder10,),
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                            height: getSize(15.00,),
                                                            width: getSize(15.00,),
                                                            margin: getMargin(all: 1,),
                                                            decoration: BoxDecoration(
                                                              color: ColorConstant.whiteA700,
                                                              borderRadius: BorderRadius.circular(getHorizontalSize(50,),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(width: 15,),
                                                  ])),

                                          Container(
                                            width: MediaQuery.of(context).size.width*0.9,height: 1,color: ColorConstant.gray200,
                                          ),

                                        ])),
                              );
                            }))),
                  ),
                ],
              ),
            );
          }
      )) ,
    ));
  }
}
