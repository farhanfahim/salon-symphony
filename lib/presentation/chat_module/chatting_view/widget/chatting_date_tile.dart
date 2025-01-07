import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/presentation/chat_module/chat_constants.dart';
import '../../../../core/utils/color_constant.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/utils/utils.dart';
import '../../../../widgets/common_image_view.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/skeleton.dart';
import '../../chat_strings.dart';
import '../controller/chatting_view_controller.dart';

class ChattingDateTile extends StatelessWidget {
  ChattingDateTile({
    Key? key,
    required this.date,
  }) : super(key: key);

  final DateTime date;

  ChattingViewController controller = Get.find();
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: controller.isDateToday(date)?Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ChatConstants.today,
            style: TextStyle(
              color: ColorConstant.darkHintTextColor,
              fontSize: getFontSize(
                12,
              ),
              fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "${Utils.getTime(date)}",
            style: TextStyle(
              color: ColorConstant.hintTextColor,
              fontSize: getFontSize(
                12,
              ),
              fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ):Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${Utils.getDay(date)}, ",
            style: TextStyle(
              color: ColorConstant.darkHintTextColor,
              fontSize: getFontSize(
                12,
              ),
              fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "${Utils.getTime(date)}",
            style: TextStyle(
              color: ColorConstant.hintTextColor,
              fontSize: getFontSize(
                12,
              ),
              fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),

        ],
      ),
    );
  }
}
