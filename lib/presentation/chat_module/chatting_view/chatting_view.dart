import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:intl/intl.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/core/utils/picker_type.dart';
import 'package:salon_symphony/core/utils/responsive.dart';
import 'package:salon_symphony/presentation/chat_module/chatting_view/widget/chatting_date_tile.dart';
import 'package:salon_symphony/presentation/chat_module/chatting_view/widget/chatting_tile.dart';
import '../../../core/utils/helper_functions.dart';
import '../../../core/utils/utils.dart';
import '../../../widgets/chat_text_field.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/search_text_field.dart';
import '../../../widgets/skeleton.dart';
import '../chat_constants.dart';
import '../chat_strings.dart';
import 'controller/chatting_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'models/chatting_model.dart';


class ChattingView extends StatelessWidget {


  ChattingViewController controller = Get.put(ChattingViewController());
  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return BaseviewScreen(
      screenNameRx: controller.screenName,
      basicAppBar: true,
      showBottomBar: false,
      sidePadding: false,
      bottomSafeArea: true,
      isBackButtonShow: true,
      showBackButton: true,
      isResizeToAvoidBottomInset: true,
      onBackTap: (){
        if(controller.map[ChatConstants.fromCreation]){
          if(controller.fromGroup.value){
            Get.back();
            Get.back();
            Get.back();
          }else{
            Get.back();
            Get.back();
          }
        }else{
          Get.back();
        }
      },
      isMenuTab: true,
      screenNameOnTap: (){
        if(controller.fromGroup.value) {
          if (controller.isBlocked.value == false) {
            Map<String, dynamic> map = {
              ChatConstants.documentId: controller.documentId.value,
            };
            Get.toNamed(AppRoutes.groupInfo, arguments: map);
          }
        }
      },
      basicAppTrailingIcon: ImageConstant.menu_dots,
      basicAppTrailingIconOnTap: () {
        HelperFunction.showBottomSheet(context,
            screenTitle: ChatConstants.selectAction,
            redclrEndTask: false,
            screenEndTask: ChatConstants.done,
            bottomSheetHeight: 270,
            widget: ListView.builder(
              controller: controller.scrollController,
              physics: BouncingScrollPhysics(),
              itemCount: controller.bottomSheet.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap:(){
                    ///report user
                    if(index == 0){
                      Get.back();
                      HelperFunction.showBottomSheet(context,
                          screenTitle: ChatConstants.selectAction,
                          redclrEndTask: true,
                          bottomSheetHeight: 500,
                          widget: Obx(() => ListView.builder(
                            controller: controller.scrollController,
                            physics: BouncingScrollPhysics(),
                            itemCount: controller.arrOfReportList!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap:(){
                                  controller.reportUserApi(controller.arrOfReportList![index].id!);
                                  Get.back();

                                },child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15.0),
                                child:  Text(controller.arrOfReportList![index].value!,
                                    overflow: TextOverflow.ellipsis,
                                    textScaleFactor: 1.0,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        16,
                                      ),
                                      letterSpacing: 0.5,
                                      fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w400,
                                    )),
                              ),
                              );
                            },
                          )));

                    }
                    ///block user
                    if(index == 1){
                      controller.blockUnBlockUser();
                      Get.back();

                    }
                    ///delete chat
                    if(index == 2){
                      controller.onTapDelete();
                    }
                    ///leave group
                    if(index == 3){
                      HelperFunction.showBottomSheet(context,
                          screenTitle: '',
                          screenEndTask: '',
                          color: Colors.transparent,
                          bottomSheetHeight: 460,
                          widget: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: ColorConstant.whiteA700,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  height: 180,
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          color: ColorConstant.gray100,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: CommonImageView(
                                            svgPath: ImageConstant.ic_delete,
                                            height: 30,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 10),
                                        child: MyText(
                                          title:
                                          'Are you sure you want to \nleave this group?',
                                          clr: ColorConstant.black900,
                                          fontSize: 20,
                                          letterSpacing: 0.5,
                                          weight: 'Bold',
                                          center: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.onTapLeaveGroup();
                                  },
                                  child: Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: ColorConstant.whiteA700,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: Center(
                                        child: MyText(
                                          title: 'Yes, Leave',
                                          clr: ColorConstant.errorColor,
                                          weight: 'Semi Bold',
                                          fontSize: 16,
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: ColorConstant.whiteA700,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: Center(
                                        child: MyText(
                                          title: 'No, Stay',
                                          clr: ColorConstant.hintTextColor,
                                          fontSize: 16,
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ));
                    }
                    /// report a problem
                    if(index == 4){
                      Utils.reportProblem();
                    }

                  },
                  child: Obx(() => controller.bottomSheet[index].name.value != ""? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child:  Text(controller.bottomSheet[index].name.value,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        color: ColorConstant.black900,
                        fontSize: getFontSize(
                          16,
                        ),
                        letterSpacing: 0.5,
                        fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                        fontWeight: FontWeight.w400,
                      )),
                ):Container()),
                );
              },
            ));
      },
      backgroundColor: ColorConstant.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Expanded(

              ///Chat list widget
              child: Obx(() => FutureBuilder<Stream<List<ChattingModel>>>(
                  future: controller.getChatMessages(),
                  builder: (context, messagesSnapshot) {
                    if (messagesSnapshot.hasData) {
                      return Obx(() => controller.chatList.length>0?StreamBuilder<List<ChattingModel>>(
                        stream: messagesSnapshot.requireData,
                        builder: (context, chatMessagesSnapshot) {
                          print("chatdocument ${chatMessagesSnapshot.data}");
                          if (chatMessagesSnapshot.hasData) {
                            return Obx(() => ListView(
                              controller: controller.scrollController,
                              reverse: true,
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              padding: const EdgeInsets.fromLTRB(4.0, 10, 4, 10),
                              children: List<Widget>.from(
                                  controller.addDatesInNewList().map((data) {
                                    if (data is ChattingModel) {
                                      return ChattingTile(
                                        type: data.type,
                                        userId: data.userId,
                                        senderId: data.senderId,
                                        text: data.text,
                                        image: data.image,
                                        video: data.video,
                                        pdf: data.pdf,
                                        time: data.time == null ? "..." : Utils.getTime(((data.time as Timestamp)).toDate()),
                                        fromGroup: controller.fromGroup.value,
                                      );
                                    } else if (data is DateTime) {
                                      return ChattingDateTile(date: data,);
                                    } else {
                                      return Container();
                                    }
                                  })),
                            ),);
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ):SizedBox(
                        width: double.maxFinite,
                        child: Center(
                          child: Text(
                              ChatConstants.noMessageFound,
                              style: AppStyle.txtPoppinsSemiBold16.copyWith(
                                height: 1.50,
                                letterSpacing: 0.5,
                              )
                          ),
                        ),
                      ),);
                    }

                    return const SizedBox();
                  })),
            ),
            Obx(() => controller.hideMessageField.value || controller.userNotFound.value?Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                MyText(
                  title:
                  ChatConstants.youCantReplyToThisConversation,
                  fontSize:
                  responsive.setTextScale(16),
                  clr: ColorConstant.blackColor,
                ),
                MyText(
                  title: "${controller.blockMessage}",
                  fontSize: responsive.setTextScale(14),
                  clr: ColorConstant.gray500,
                ),
              ],
            ):Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0.0),
                      child: GestureDetector(
                          onTap: (){
                            HelperFunction.showBottomSheet(context,
                              screenTitle: ChatConstants.selectAction,
                              redclrEndTask: false,
                              screenEndTask: ChatConstants.done,
                              bottomSheetHeight: 290,
                              widget: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      controller.onTapCamera(PickerType.gallery, context, GalleryMode.image, 10);
                                      Navigator.pop(context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                                      child:  Text("Image",
                                          overflow: TextOverflow.ellipsis,
                                          textScaleFactor: 1.0,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: ColorConstant.black900,
                                            fontSize: getFontSize(
                                              16,
                                            ),
                                            letterSpacing: 0.5,
                                            fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                  ),

                                  GestureDetector(
                                    onTap: (){
                                      controller.onTapCamera(PickerType.gallery, context, GalleryMode.video, 1);
                                      Navigator.pop(context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                                      child:  Text("Video",
                                          overflow: TextOverflow.ellipsis,
                                          textScaleFactor: 1.0,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: ColorConstant.black900,
                                            fontSize: getFontSize(
                                              16,
                                            ),
                                            letterSpacing: 0.5,
                                            fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      controller.onTapCamera(PickerType.camera, context, GalleryMode.image, 1);
                                      Navigator.pop(context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                                      child:  Text("Camera",
                                          overflow: TextOverflow.ellipsis,
                                          textScaleFactor: 1.0,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: ColorConstant.black900,
                                            fontSize: getFontSize(
                                              16,
                                            ),
                                            letterSpacing: 0.5,
                                            fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                  ),

                                  GestureDetector(
                                    onTap: (){
                                      // uploading document
                                      controller.uploadDocument();

                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                                      child:  Text("Document",
                                          overflow: TextOverflow.ellipsis,
                                          textScaleFactor: 1.0,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: ColorConstant.black900,
                                            fontSize: getFontSize(
                                              16,
                                            ),
                                            letterSpacing: 0.5,
                                            fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                  ),
                                ],
                              )
                            );
                          },
                          child: CommonImageView(
                            imagePath: ImageConstant.camera_chat,
                            width: 35,
                            height: 35,
                          )
                      ),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(bottom: 5,left: 5),

                          child: Obx(() => Focus(
                            onFocusChange: (hasFocus) {
                              controller.checkForm();
                              if (hasFocus) {
                                controller.checkForm();
                              }

                            },
                            child: ChatTextField(
                              width: responsive.setWidth(85),
                              borderColor: ColorConstant.hintTextColor.withOpacity(0.3),
                              showChat: true,
                              suffixIconData: Icons.send_rounded,
                              sufixcolor: controller.sendIcon.value == false ? ColorConstant.primaryColor.withOpacity(0.3):ColorConstant.primaryColor,
                              controller: controller.messageController.value,
                              hintText: ChatConstants.typeYourMessageHere,
                              maxLines: 5,
                              hintTextColor: ColorConstant.hintTextColor,
                              textColor: ColorConstant.blackColor,
                              onChanged: (String newVal){
                                if(newVal.startsWith(' ')){
                                  controller.messageController.value.text = '';
                                }
                                controller.messageController.value.text.isEmpty ?
                                controller.sendIcon.value = false :
                                controller.sendIcon.value = true;
                              },

                              cursorColor: ColorConstant.hintTextColor,
                              onTapSuffixIcon: () {
                                if(controller.sendIcon.value) {
                                  controller.sendMessage(
                                      controller.messageController.value.text,
                                      "", ChatStrings.messageTypeText, "");
                                }

                              },
                            ),
                          ),)
                      ),
                    ),

                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }


}
