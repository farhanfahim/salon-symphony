import 'dart:io';
import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/services.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/core/utils/responsive.dart';
import 'package:salon_symphony/widgets/response_binding_widget.dart';

import '../../core/utils/app_constant.dart';
import '../../core/utils/dummy_content.dart';
import '../../core/utils/helper_functions.dart';
import '../../core/utils/utils.dart';
import '../../data/models/TaskResponseModel.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/error_widget.dart';
import '../../widgets/widgets_shimmer.dart';
import '../chat_module/chat_constants.dart';
import 'controller/task_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_button.dart';
import 'package:salon_symphony/widgets/custom_drop_down.dart';

class TaskDetailsScreen extends StatelessWidget {
  TaskDetailsController controller = Get.put(TaskDetailsController());

  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return BaseviewScreen(
      basicAppBar: true,
      showBottomBar: false,
      screenName: 'Task Details',
      sidePadding: false,
      mainTopHeight: 0,
      isMenuTab: true,
      basicAppTrailingIcon: ImageConstant.menu_dots,
      basicAppTrailingIconOnTap: () {
        HelperFunction.showBottomSheet(context,
            screenTitle: 'Task Options',
            redclrEndTask: false,
            screenEndTask: 'Done',
            bottomSheetHeight: 260,
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    String deepLink = '${AppConstant.shareBaseUrl}/tasks/details/${controller.tasksResponseModel.value.id!}';
                    // String deepLink = '${AppConstant.shareBaseUrl}?taskid=${controller.tasksResponseModel.value.id!}';
                    // await Clipboard.setData(ClipboardData(text: deepLink));
                    Utils.share(deepLink);

                    Get.back();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: 20.0,
                      top: responsive.setHeight(1),
                    ),
                    child: Row(
                      children: [
                        CommonImageView(
                          imagePath: ImageConstant.share_icon,
                          height: 17,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text('Share task',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: 15,
                              letterSpacing: 0.5,
                              fontFamily:
                                  Platform.isIOS ? 'SF Pro Display' : 'Roboto',
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () async {
                    try {
                      Utils.reportProblem();
                    } catch (e) {
                      Utils.showToast(e.toString(), true);
                    }
                  },
                  child: Row(
                    children: [
                      CommonImageView(
                        imagePath: ImageConstant.report_problem_icon,
                        height: 17,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Report a Problem',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: 15,
                            letterSpacing: 0.5,
                            fontFamily:
                                Platform.isIOS ? 'SF Pro Display' : 'Roboto',
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                ),
            Obx(() =>controller.showcancel.value?SizedBox(
                  height: 30,
                ):Offstage()),
            Obx(() =>controller.showcancel.value?
                GestureDetector(
                  onTap: () {
                    HelperFunction.showBottomSheet(context,
                        screenTitle: '',
                        screenEndTask: '',
                        color: Colors.transparent,
                        isScrollControlled: true,
                        bottomSheetHeight: 470,
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
                                height: 200,
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
                                          imagePath: ImageConstant.cancel_icon,
                                          height: 30,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10),
                                      child: MyText(
                                        title:
                                            'Ask manager to cancel this task permanently?',
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
                                onTap: () async {
                                  await controller.askToCancel(
                                      taskId: controller
                                          .tasksResponseModel.value.id!);
                                  Navigator.pop(context);
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
                                        title: 'Yes',
                                        clr: ColorConstant.errorColor,
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
                                        title: 'No',
                                        clr: ColorConstant.hintTextColor,
                                        fontSize: 16,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ));
                  },
                  child: Row(
                    children: [
                      CommonImageView(
                        imagePath: ImageConstant.cancel_icon,
                        height: 17,
                      ),
                      SizedBox(
                        width: 15,
                      ),


                      Text('Ask to cancel task',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: ColorConstant.pink500,
                            fontSize: 15,
                            letterSpacing: 0.5,
                            fontFamily:
                                Platform.isIOS ? 'SF Pro Display' : 'Roboto',
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                ):Offstage()),
              ],
            ));
      },
      backgroundColor: ColorConstant.backgroundColor,
      child: Obx(() => ResponseBindingWidget(
          apiCallStatus: controller.apiCallStatus.value,
          loadingWidget: (){
            return shimmerTaskPage(context);
          },
          errorWidget: (){
            return RecordDeletedWidget();
          },
          successWidget: (){
            return Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Container(
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Container(

                                color: ColorConstant.backgroundColor,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 30.0),
                                  child: Text(
                                    // controller.tasksResponseModel.value.name!,
                                    controller.tasksResponseModel.value.name!,
                                    // maxLines: 1,
                                    // overflow: TextOverflow.ellipsis,
                                    style: AppStyle.txtInterRegular12.copyWith(
                                      fontSize: 20,
                                      fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w700,
                                      color: ColorConstant.black900,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              color: Color(0xffF6F7FB),
                              height:15,
                            ),
                         Obx(() =>    Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                           child: Container(
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 SizedBox(
                                     height: 5
                                 ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                     MyText(
                                       title: 'Due On',
                                       // clr: ColorConstant.black900,
                                       fontSize: 14,
                                       weight: 'Semi Bold',
                                     ),
                                     Spacer(),
                                     MyText(
                                       title: '${Utils.formatDate(controller.tasksResponseModel.value.end!)}',
                                       // clr: ColorConstant.black900,
                                       fontSize: 14,
                                       weight: 'Semi Bold',
                                     ),
                                   ],
                                 ),
                                 SizedBox(
                                     height: 5
                                 ),
                                 Divider(),
                                 SizedBox(
                                     height: 5
                                 ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                     MyText(
                                       title: 'Task Type',
                                       // clr: ColorConstant.black900,
                                       fontSize: 14,
                                       weight: 'Semi Bold',
                                     ),
                                     Spacer(),
                                     MyText(
                                       title: '${controller.tasksResponseModel.value.typeName}',
                                       // clr: ColorConstant.black900,
                                       fontSize: 14,
                                       weight: 'Semi Bold',
                                     ),
                                   ],
                                 ),
                                 SizedBox(
                                     height: 5
                                 ),
                                 Divider(),
                                 SizedBox(
                                     height: 5
                                 ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                     MyText(
                                       title: 'Repeats',
                                       // clr: ColorConstant.black900,
                                       fontSize: 14,
                                       weight: 'Semi Bold',
                                     ),
                                     Spacer(),
                                     MyText(
                                       title: controller.tasksResponseModel.value.repeat!,
                                       // clr: ColorConstant.black900,
                                       fontSize: 14,
                                       weight: 'Semi Bold',
                                     ),
                                   ],
                                 ),
                                 SizedBox(
                                     height: 5
                                 ),
                                 Divider(),
                                 SizedBox(
                                     height: 5
                                 ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                     MyText(
                                       title: 'Status',
                                       // clr: ColorConstant.black900,
                                       fontSize: 14,
                                       weight: 'Semi Bold',
                                       clr: controller.tasksResponseModel.value.userStatus!.localStatus!.value  == AppConstant.TASK_OVERDUE
                                           ? ColorConstant.black900
                                           : ColorConstant.black900,
                                     ),
                                     Spacer(),
                                     MyText(
                                       title: controller.tasksResponseModel.value.userStatus!.localStatus!.value   == AppConstant.TASK_DONE
                                           ?"Done (${Utils.formatDate(DateTime.now().toString())})":controller.tasksResponseModel.value.userStatus!.localStatus!.value==AppConstant.TASK_OVERDUE?"Overdue":"To Do",
                                       clr: controller.tasksResponseModel.value.userStatus!.localStatus!.value   == AppConstant.TASK_OVERDUE
                                           ? ColorConstant.errorColor
                                           : ColorConstant.black900,
                                       fontSize: 14,
                                       weight: 'Semi Bold',
                                     ),
                                   ],
                                 ),
                                 SizedBox(
                                   height: responsive.setHeight(5),
                                 ),

                                 Obx(() =>  Container(
                                   decoration: BoxDecoration(
                                     color:  Color(0xffF5F5F5),
                                     borderRadius: BorderRadius.circular(8.0),
                                   ),
                                   height: 50.0,
                                   padding: getPadding(bottom: 5,top: 5,left: 5,right: 5),
                                   // margin: EdgeInsets.symmetric(horizontal: 15.0),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Expanded(
                                         child: GestureDetector(
                                           onTap: () {

                                             if(controller.tasksResponseModel.value.userStatus!.localStatus!.value != AppConstant.TASK_TODO){
                                               controller.updateTaskStatus(1);
                                               print('task id ${controller.tasksResponseModel.value.userStatus!.id!}');
                                               controller.tasksResponseModel.value.userStatus!.localStatus!.value = AppConstant.TASK_TODO;
                                               controller.updateTaskApi(taskId: controller.tasksResponseModel.value.userStatus!.id!, status: AppConstant.TASK_TODO);
                                             }

                                           },
                                           child: Container(
                                               decoration: BoxDecoration(
                                                 color: controller.tasksResponseModel.value.userStatus!.localStatus!.value  == AppConstant.TASK_TODO || controller.tasksResponseModel.value.userStatus!.localStatus!.value  == AppConstant.TASK_OVERDUE ? ColorConstant.primaryColor : Color(0xffF5F5F5),
                                                 borderRadius: BorderRadius.circular(8.0),
                                               ),
                                               child: Center(
                                                   child: MyText(
                                                     title: "TO DO",
                                                     clr: controller.tasksResponseModel.value.userStatus!.localStatus!.value  == AppConstant.TASK_TODO || controller.tasksResponseModel.value.userStatus!.localStatus!.value  == AppConstant.TASK_OVERDUE  ? ColorConstant.whiteA700 : ColorConstant.hintTextColor,
                                                     weight: 'Semi Bold',
                                                     fontSize: 13,
                                                   )
                                               )
                                           ),
                                         ),
                                       ),
                                       Expanded(
                                         child: GestureDetector(
                                           onTap: () {
                                             if( controller.tasksResponseModel.value.userStatus!.localStatus!.value != AppConstant.TASK_DONE){
                                               controller.updateTaskStatus(3);
                                               print('task id ${controller.tasksResponseModel.value.userStatus!.id!}');
                                               controller.tasksResponseModel.value.userStatus!.localStatus!.value = AppConstant.TASK_DONE;
                                               controller.updateTaskApi(taskId: controller.tasksResponseModel.value.userStatus!.id!, status: AppConstant.TASK_DONE);

                                             }

                                           },
                                           child: Container(
                                               decoration: BoxDecoration(
                                                 color: controller.tasksResponseModel.value.userStatus!.localStatus!.value  == AppConstant.TASK_DONE ? ColorConstant.green801 : Color(0xffF5F5F5),
                                                 borderRadius: BorderRadius.circular(8.0),
                                               ),
                                               child: Center(
                                                   child: MyText(
                                                     title: "DONE",
                                                     clr: controller.tasksResponseModel.value.userStatus!.localStatus!.value  == AppConstant.TASK_DONE ? ColorConstant.whiteA700 : ColorConstant.hintTextColor,
                                                     weight: 'Semi Bold',
                                                     fontSize: 13,

                                                   )
                                               )
                                           ),
                                         ),
                                       )
                                     ],
                                   ),
                                 ))
                               ],

                             ),
                           ),
                         ),),

                            Container(
                              color: Color(0xffF6F7FB),
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    MyText(
                                      title: 'Description',
                                      weight: 'Semi Bold',
                                      fontSize: 14,
                                      letterSpacing: 0.5,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    MyText(
                                      title: controller.tasksResponseModel.value.description!,
                                      fontSize: 14,
                                      // letterSpacing: 0.5,
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              Map<String, dynamic> map = {
                                                ChatConstants.userId: controller.tasksResponseModel.value.assignee!.id!.toString(),
                                                ChatConstants.threadName: controller.tasksResponseModel.value.assignee!.name!,
                                                ChatConstants.fromCreation: true,
                                                ChatConstants.fromGroup: false};
                                              Get.toNamed(AppRoutes.chattingView,arguments: map);
                                            },
                                            child:
                                            controller.tasksResponseModel.value.assignee!.image != null  ?
                                            Stack(
                                              children: [
                                                Container(
                                                  height: 43,width: 43,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: CommonImageView(
                                                    url:  controller.tasksResponseModel.value.assignee!.image,
                                                    height: 43,
                                                    radius: BorderRadius.circular(100),
                                                  ),
                                                ),
                                                Positioned(
                                                    bottom: -2,
                                                    right: -2,
                                                    child: Container(
                                                      height: 20,
                                                      width: 20,
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant.whiteA700,
                                                          borderRadius: BorderRadius.circular(100)
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(3.0),
                                                        child: CommonImageView(
                                                          svgPath: ImageConstant.user_message,
                                                          height: 15,
                                                        ),
                                                      ),
                                                    )
                                                )
                                              ],
                                            )
                                                :
                                            Stack(
                                              children: [
                                                CommonImageView(
                                                  svgPath: ImageConstant.imgUser,
                                                  height: 40,
                                                ),
                                                Positioned(
                                                    bottom: -2,
                                                    right: -2,
                                                    child: Container(
                                                      height: 20,
                                                      width: 20,
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant.whiteA700,
                                                          borderRadius: BorderRadius.circular(100)
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(3.0),
                                                        child: CommonImageView(
                                                          svgPath: ImageConstant.user_message,
                                                          height: 15,
                                                        ),
                                                      ),
                                                    )
                                                )
                                              ],
                                            )
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        MyText(
                                          title: controller.tasksResponseModel.value.assignee!.name!,
                                          weight: 'Semi Bold',
                                          fontSize: 13,
                                        ),
                                        MyText(
                                          title: ' assigned this task.',
                                          fontSize: 13,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      Obx(() =>Visibility(
                        visible: controller.showCon.value,
                        child: Positioned(
                          top: -50,
                          // alignment: Alignment.topCenter,
                          child: ConfettiWidget(
                            confettiController: controller.confettiController,
                            blastDirection:  pi / 2,
                            blastDirectionality: BlastDirectionality.explosive,
                            gravity: 0.5,
                            numberOfParticles: 40,
                            emissionFrequency: 0,

                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            );
          }),)
    );
  }

  onTapImgArrowleft() {
    Get.back();
  }

  onTapImgHiconBold() {
    Get.toNamed(AppRoutes.eventDetailsScreen);
  }
}
