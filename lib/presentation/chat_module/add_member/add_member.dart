import 'package:flutter/material.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/presentation/chat_module/chat_constants.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../../core/utils/utils.dart';
import '../../../widgets/response_binding_widget.dart';
import '../../../widgets/widgetSkeleton.dart';
import '../firestore_controller.dart';
import 'controller/add_member_controller.dart';

class AddMember extends StatelessWidget {
  AddMemberController controller = Get.put(AddMemberController());

  @override
  Widget build(BuildContext context) {
    return BaseviewScreen(
      basicAppBar: true,
      screenName: ChatConstants.selectMember,
      showBottomBar: false,
      showBackButton: false,
      backText: ChatConstants.cancel,
      mainTopHeight: 0,
      sidePadding: false,
      blueClrEndTask: true,
      textButtonName: ChatConstants.done,
      textOnTap: () {

        if(controller.isAdding.value == false) {
          print("done");
          if (controller.newMember.length > 0) {
            for (var item in controller.newMember) {
              print(item);
            }
            controller.addMemberToGroup(controller.newMember);
          } else {
            Utils.showToast(ChatConstants.SelectAtLeastOneMember, true);
          }
        }
      },
      backgroundColor: ColorConstant.whiteA700,
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
                      child: Obx(() =>  ScrollablePositionedList.builder(
                          itemCount: controller.arrOfUsers.length,
                          itemBuilder: (context, index) => controller.arrOfUsers[index].id!=-1?
                          GestureDetector(
                            onTap: (){
                              controller.updateQuizItem(index);
                            },child: Column(
                            children: [
                              ListTile(
                                title: Container(
                                    padding: getPadding(
                                        left: 0,
                                        top: 25,
                                        bottom: 16),
                                    child: Text(
                                        controller.arrOfUsers[index].name!,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsRegular14Black900)),
                                leading: ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(
                                        getHorizontalSize(25.00)),
                                    child: controller
                                        .arrOfUsers[index].image!=null?CommonImageView(
                                        url: controller.arrOfUsers[index].image,
                                        height: getSize(50.00),
                                        width: getSize(50.00),
                                        fit: BoxFit.cover):CommonImageView(
                                      svgPath: ImageConstant.imgUser,
                                      height: getSize(50.00),
                                      width: getSize(50.00),
                                    )),
                                trailing: controller.arrOfUsers[index].isSelected!.value == true
                                    ? Container(
                                  margin: getMargin(
                                    top: 15,
                                    bottom: 10,),
                                  decoration: BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder10,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: getSize(18.00,),
                                        width: getSize(18.00,),
                                        margin: getMargin(all: 1,),
                                        decoration: BoxDecoration(
                                          color: ColorConstant.primaryColor,
                                          borderRadius: BorderRadius.circular(
                                            getHorizontalSize(50,),
                                          ),
                                        ),
                                        child: Icon(Icons.check,
                                          size: 10,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                    : Container(
                                  margin: getMargin(
                                    top: 15,
                                    bottom: 10,
                                  ),
                                  decoration: AppDecoration.outlineBluegray100.copyWith(
                                    borderRadius: BorderRadiusStyle.roundedBorder10,
                                  ),
                                  child:
                                  Column(
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
                              ),
                              Divider(),
                            ],
                          ),
                          ):Container(height: 0,)),)),
                ));
          }
      ))
    );
  }
}
