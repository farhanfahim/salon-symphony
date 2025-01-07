import 'package:flutter/material.dart';
import 'package:salon_symphony/presentation/add_time_off_request_screen/models/add_time_off_request_model.dart';

import '/core/app_export.dart';

class AddTimeOffRequestController extends GetxController {
  Rx<TextEditingController> textfieldsController = TextEditingController().obs;

  Rx<TextEditingController> textfieldsOneController = TextEditingController().obs;

  Rx<TextEditingController> textfieldsTwoController = TextEditingController().obs;

  Rx<TextEditingController> textfieldsThreeController = TextEditingController().obs;

  Rx<AddTimeOffRequestModel> addTimeOffRequestModelObj =
      AddTimeOffRequestModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
