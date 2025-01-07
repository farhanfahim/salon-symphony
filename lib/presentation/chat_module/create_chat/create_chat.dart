import 'dart:io';
import 'package:flutter/material.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../../core/utils/responsive.dart';
import '../../../widgets/response_binding_widget.dart';
import '../../../widgets/widgetSkeleton.dart';
import '../chat_constants.dart';
import 'controller/create_chat_controller.dart';


class CreateChat extends StatelessWidget {
  CreateChatController controller = Get.put(CreateChatController());
  Responsive responsive = Responsive();
  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return BaseviewScreen(
        basicAppBar: true,
        mainTopHeight: 0,
        sidePadding: false,
        showBottomBar: false,
        screenName: ChatConstants.newMessage,
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
            return Container(
                color: ColorConstant.whiteA700,
                width: size.width,
                child: RefreshIndicator(
                  color: ColorConstant.black900,
                  onRefresh: () async {
                    if (controller.arrOfUsers.isNotEmpty) {
                      controller.arrOfUsers.clear();
                    }
                    await controller.getUsers();
                  },
                  child: Container(
                      color: ColorConstant.whiteA700,
                      width: size.width,
                      child: Obx(() => ScrollablePositionedList.builder(
                        itemCount: controller.arrOfUsers.length,
                        itemBuilder: (context, index) => controller.arrOfUsers[index].id!=-1?GestureDetector(
                          onTap: (){
                            Map<String, dynamic> map = {
                              ChatConstants.userId: controller.arrOfUsers[index].id!.toString(),
                              ChatConstants.threadName: controller.arrOfUsers[index].name,
                              ChatConstants.fromCreation: true,
                              ChatConstants.fromGroup: false};
                            Get.toNamed(AppRoutes.chattingView,arguments: map);

                          },child: Column(
                          children: [
                            ListTile(
                              title: Container(
                                  child: Text(
                                      controller.arrOfUsers[index].name!,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsRegular14Black900)),
                              leading: ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(getHorizontalSize(25.00)),
                                  child: controller.arrOfUsers[index].image!=null?CommonImageView(
                                      url: controller.arrOfUsers[index].image,
                                      height: getSize(50.00),
                                      width: getSize(50.00),
                                      fit: BoxFit.cover):CommonImageView(
                                    svgPath: ImageConstant.imgUser,
                                    height: getSize(50.00),
                                    width: getSize(50.00),
                                  )),
                              trailing:Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: CommonImageView(
                                  svgPath: ImageConstant.imgChatIcon,
                                  height: getSize(15.00),
                                  width: getSize(15.00),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(height: 1,width: double.maxFinite,color: ColorConstant.gray101,),

                            )
                          ],
                        ),
                        ):Column(
                          children: [
                            Padding(
                              padding: getPadding(left: 15, right: 15),
                              child: GestureDetector(
                                onTap: (){


                                  Get.toNamed(AppRoutes.createGroupChat);
                                },
                                child: Container(

                                    margin: getMargin(bottom: 10),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.whiteA700,
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
                                              color: ColorConstant.primaryColor,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: CommonImageView(
                                                imagePath: ImageConstant.group_icon,
                                                color: ColorConstant.whiteA700,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                              padding: getPadding(
                                                  left:
                                                  14,
                                                  top: 18,
                                                  bottom:
                                                  16),
                                              child: Text(
                                                  ChatConstants.createGroupChat,
                                                  overflow:
                                                  TextOverflow
                                                      .ellipsis,
                                                  textAlign:
                                                  TextAlign
                                                      .left,
                                                  style: TextStyle(
                                                    color: ColorConstant.primaryColor,
                                                    fontSize: getFontSize(
                                                      15,
                                                    ),
                                                    fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                                    fontWeight: FontWeight.w500,
                                                  ))),
                                          Spacer(),
                                          CommonImageView(
                                            svgPath: ImageConstant.imgArrowright,
                                          )

                                        ])),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              width: double.maxFinite,height: 1,color: ColorConstant.gray200,
                            ),
                            SizedBox(height: 5,),
                          ],
                        ),),)),
                ));
          }
      ))
    );
  }
}
