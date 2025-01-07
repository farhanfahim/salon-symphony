import 'package:salon_symphony/presentation/quizzes_screen/controller/quizzes_controller.dart';

import '../../core/utils/responsive.dart';
import '../quizzes_screen/widgets/quizzes_item_widget.dart';
import 'models/quizzes_item_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

class QuizzesScreen extends GetWidget<QuizzesController> {
  QuizzesController controller = Get.put(QuizzesController());
  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
        padding: getPadding(left: 16, top: 5, right: 16, bottom: 15),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.quizzesModelObj.value.quizzesItemList.length,
        itemBuilder: (context, index) {
          QuizzesItemModel model =
              controller.quizzesModelObj.value.quizzesItemList[index];
          return Container()
            /*QuizzesItemWidget(
              onTapColumnrectangleeightyfive: onTapColumnrectangleeightyfive)*/;
        }));
  }

  onTapColumnrectangleeightyfive() {
    Get.toNamed(AppRoutes.quizzesDetailsScreen);
  }
}
