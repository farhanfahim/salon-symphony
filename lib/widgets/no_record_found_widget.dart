import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

// ignore: must_be_immutable
class NoRecordFoundWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 500,
      child: Center(
        child: Text(
          'no_record_found'.tr,
          style: AppStyle.txtPoppinsBold16.copyWith(fontSize: 20.0),
        ),
      ),
    );
  }
}
