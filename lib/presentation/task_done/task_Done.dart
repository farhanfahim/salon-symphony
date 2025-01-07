import 'dart:io';

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:salon_symphony/core/utils/image_constant.dart';
import 'package:salon_symphony/core/utils/responsive.dart';
import 'package:salon_symphony/core/utils/size_utils.dart';
import 'package:salon_symphony/data/models/task_data_model.dart';
import 'package:salon_symphony/presentation/task_details_screen/task_details_screen.dart';
import 'package:salon_symphony/presentation/task_done/controller/task_done_controller.dart';
import 'package:salon_symphony/presentation/task_todo/widgets/donelist.dart';
import 'package:salon_symphony/theme/app_style.dart';
import 'package:salon_symphony/widgets/common_image_view.dart';
import 'package:salon_symphony/widgets/expandable_tile.dart';
import 'package:salon_symphony/widgets/response_binding_widget.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/utils.dart';
import '../../routes/app_routes.dart';
import '../../widgets/widgetSkeleton.dart';
import '../task_to_do_tab_container_page/controller/task_to_do_tab_container_controller.dart';

class EducationTrackingDone extends StatelessWidget {
  TaskDoneController controller = Get.put(TaskDoneController());
  Responsive responsive = Responsive();
  TaskToDoTabContainerController taskToDoTabContainerController = Get.find();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);

    return Container(
        color: Color(0xffF1F3F6).withOpacity(0.5),
        child: CustomRefreshIndicator(
          onRefresh: () async {
            controller.currentPage = 1;
            controller.pagingController.refresh();
            taskToDoTabContainerController.getTasksCount();

          },
         // color: ColorConstant.deepPurpleA201,
          child: PagedListView<int, PagedTaskData>(
            padding: EdgeInsets.symmetric(horizontal: 15),
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            pagingController: controller.pagingController,
            // shrinkWrap: true,
            builderDelegate: PagedChildBuilderDelegate<PagedTaskData>(
              itemBuilder:(context, item, index)  {
                return  InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.taskDetailsScreen,arguments: {
                      'id': item.id,
                    })!.then((value) {
                      // controller.pagingController.refresh();
                      taskToDoTabContainerController.getTasksCount();
                    });
                  },
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonImageView(
                                svgPath:
                                item.userStatus!.status == 10?
                                ImageConstant.todo_icon_new:
                                item.userStatus!.status  == 20?
                                ImageConstant.red_mark:
                                ImageConstant.green_check,
                                height: 15,
                                width: 14,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                width: responsive.setWidth(2),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 5.0),
                                  child: Text(
                                    item.name!,
                                    maxLines: 1,
                                    style: AppStyle.txtInterRegular12.copyWith(
                                      fontSize: 15,
                                      overflow: TextOverflow.ellipsis,
                                      fontFamily: Platform.isIOS? 'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w600,
                                      color: ColorConstant.black900,
                                    ),
                                  ),
                                ),
                              ),
                              // Spacer(),
                              Text(
                                '${item.end!=null?Utils.taskFormatDate(item.end!):""}',
                                style: AppStyle.txtInterRegular12.copyWith(
                                  fontSize: 13,
                                  fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                  fontWeight: FontWeight.w500,
                                  color: item.userStatus!.status  == 20? ColorConstant.red:ColorConstant.hintTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),

                        index == controller.taskDataList!.length -1? Offstage()
                            : Container(
                          height: 1,width: double.maxFinite,
                          color: ColorConstant.gray200,
                        )

                      ],
                    ),
                  ),
                );
              },
              firstPageProgressIndicatorBuilder: (context){
                return Column(
                  children: [
                    taskShimmer(context),
                  ],
                );
              },
              newPageProgressIndicatorBuilder: (context) => Padding(
                padding: const EdgeInsets.all(5),
                child: Center(
                  child: Container(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          ColorConstant.deepPurpleA201),
                    ),
                  ),
                ),
              ),
              noItemsFoundIndicatorBuilder: (context) =>  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "You're all caught up!",
                      style: AppStyle.txtPoppinsSemiBold16.copyWith(
                        height: 1.50,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      )
                  ),
                  Text(
                      'Tasks will appear here once you complete them.',
                      style: AppStyle.txtPoppinsSemiBold16.copyWith(
                        height: 1.50,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      )
                  ),
                ],
              ),
            ),
          ),
            builder: (
                BuildContext context,
                Widget child,
                IndicatorController controller,
                ) {
              return Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  if (!controller.isIdle)
                    Positioned(
                      top: 25.0 * controller.value,
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child:  Image.asset(
                          ImageConstant.spinnerImage, // Replace with the actual path to your image
                          width: 24, // Adjust the width as needed
                          height: 24, // Adjust the height as needed
                          // You can apply color to the image if needed
                        ),

                      ),
                    ),
                  Transform.translate(
                    offset: Offset(0, 10.0 * controller.value),
                    child: child,
                  ),
                ],
              );
            }
        )
    );

  }
}
