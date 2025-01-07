import 'package:salon_symphony/core/utils/responsive.dart';
import 'package:salon_symphony/presentation/taks_overdue/controller/task_overDue_controller.dart';
import 'package:salon_symphony/presentation/task_done/controller/task_done_controller.dart';
import 'package:salon_symphony/widgets/no_internet_found.dart';
import '../../core/utils/helper_functions.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/search_text_field.dart';
import '../goals_all_page/goals_all_page.dart';
import '../resource_library_page/widgets/item_widget.dart';
import '../search_screen/search_screen.dart';
import '../taks_overdue/task_OverDue.dart';
import '../task_done/task_Done.dart';
import '../task_todo/controller/education_tracking_all_controller.dart';
import '../task_todo/task_ToDo.dart';
import 'controller/task_to_do_tab_container_controller.dart';
import 'models/task_to_do_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

// ignore_for_file: must_be_immutable
class TaskToDoTabContainerPage extends StatelessWidget {
  TaskToDoTabContainerController controller = Get.put(TaskToDoTabContainerController(TaskToDoTabContainerModel().obs));
  EducationTrackingAllController educationTrackingAllController = Get.put(EducationTrackingAllController());
  TaskOverDueController taskOverDueController = Get.put(TaskOverDueController());
  TaskDoneController taskDoneController = Get.put(TaskDoneController());
  Responsive responsive = Responsive();
  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: responsive.setHeight(2),
        ),
        Container(
          width: responsive.setWidth(100),
          child: TabBar(
            indicatorColor:ColorConstant.primaryColor,
            indicator: CustomTabIndicator(),
            controller: controller.group156Controller,
            labelColor: ColorConstant.deepPurpleA201,
            unselectedLabelColor: ColorConstant.gray600,
            tabs: [
              Tab(
                text: "TO DO",
              ),
              Tab(
                text: "OVERDUE",
              ),
              Tab(
                text: "DONE",
              ),
            ],

          ),
        ),

        Container(height: 1,width: double.maxFinite,color: ColorConstant.gray400.withOpacity(0.3),),
    controller.isInternetAvailable.value ?
        Expanded(
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: controller.group156Controller,
            children: [
              EducationTrackingTodo(),
              EducationTrackingOverDue(),
              EducationTrackingDone(),
              // EducationTrackingDone(),
            ],
          ),
        ): Expanded(
          child: NoInternetFound(context, (){
            controller.getTasksCount();
            educationTrackingAllController.pagingController.refresh();
            taskDoneController.pagingController.refresh();
            taskOverDueController.pagingController.refresh();
          }),
        )
      ],
    );
  }
}
