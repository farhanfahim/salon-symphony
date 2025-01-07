import 'dart:io';
import 'package:salon_symphony/core/utils/responsive.dart';
import 'package:salon_symphony/presentation/task_details_screen/task_details_screen.dart';
import 'package:salon_symphony/widgets/custom_text.dart';

import '../../../core/utils/dummy_content.dart';
import '../../../core/utils/utils.dart';
import '../../../data/models/TaskResponseModel.dart';
import '../controller/education_tracking_all_controller.dart';
import '../models/listpn1248_item_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_button.dart';

// ignore: must_be_immutable
class taskTileOverDue extends StatelessWidget {
  taskTileOverDue(this.data, this.index);
  TasksData data;
  int index;
  Responsive responsive = Responsive();
  var controller = Get.find<EducationTrackingAllController>();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return InkWell(
      onTap: () {
        Get.to(() => TaskDetailsScreen(),arguments: {
          'id': data.data![index].id,
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
          margin: getMargin(
            top: 8.0,
            bottom: 8.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonImageView(
                    svgPath: ImageConstant.red_mark,
                    height: 15,
                    width: 14,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    width: responsive.setWidth(2),
                  ),
                  Text(
                    data.data![index].name!,
                    style: AppStyle.txtInterRegular12.copyWith(
                      fontSize: 16,
                       fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                      fontWeight: FontWeight.w700,
                      color: ColorConstant.black900,
                    ),
                  ),

                ],
              ),

              SizedBox(
                height: responsive.setHeight(1),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 22.0, bottom: index == data.data!.length -1? 2: 18.0),
                child: Text(
                  'Due Date:  ${Utils.formatDate(data.data![index].end!)}',
                  style: AppStyle.txtInterRegular12.copyWith(
                    fontSize: 13,
                     fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                    fontWeight: FontWeight.w400,
                    color: ColorConstant.errorColor,
                  ),

                ),
              ),
              index == data.data!.length -1 ? Offstage():
              Container(
                height: 1,width: double.maxFinite,
                color: ColorConstant.gray200,
              )

            ],
          ),
        ),
      ),
    );
  }
}



