import '../controller/quizzes_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

import '../models/quizTab.dart';

// ignore: must_be_immutable
class Listall1ItemWidget extends StatelessWidget {
  Listall1ItemWidget(this.listall1ItemModelObj);

  Listall1ItemModel listall1ItemModelObj;

  var controller = Get.find<QuizzesController>();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Padding(
        padding: getPadding(
          right: 40,
        ),
        child: Text(
          "lbl_all".tr,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          // style: AppStyle.txtPoppinsMedium14DeeppurpleA200,
        ),
      ),
    );
  }
}
