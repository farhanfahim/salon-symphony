import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../../../core/utils/responsive.dart';
import '../controller/employee_dicrectry_details_controller.dart';
// ignore: must_be_immutable
class ActionItemWidget extends StatelessWidget {
  ActionItemWidget(this.text,this.onTap);
  Responsive responsive = Responsive();
  String text;
  VoidCallback onTap;
  var controller = Get.find<EmployeeDicrectryDetailsController>();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return GestureDetector(
      onTap:onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtPoppinsRegular14
              .copyWith(
            height: 1.29,
          ),
        ),
      ),
    );
  }
}
