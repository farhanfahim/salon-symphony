import 'package:flutter/material.dart';

import '../models/request_all_model.dart';
import '/core/app_export.dart';

class ScheduleRequestAllController extends GetxController with SingleGetTickerProviderMixin {
  ScheduleRequestAllController(this.requestAllModelObj);

  Rx<ScheduleRequestAllModel> requestAllModelObj;
  TabController? tabController;
  @override
  void onReady() {
    super.onReady();

  }

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
