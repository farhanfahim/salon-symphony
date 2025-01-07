import 'package:flutter/material.dart';
import '../../../core/utils/dummy_content.dart';
import '/core/app_export.dart';

class GoalsAllController extends GetxController
    with SingleGetTickerProviderMixin {
  TextEditingController searchController = new TextEditingController();

  RxList<goalsBottomSheet> arrOfOptions = DummyContent.goalsData.obs;
  TabController? tabController;
  RxBool selected = false.obs;

  @override
  void onReady() {
    arrOfOptions.value = DummyContent.goalsData;
    super.onReady();
  }

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
  }

  updateItem(int index) {
    for (var item in arrOfOptions) {
      item.selected = false.obs;
    }
    arrOfOptions[index].selected = true.obs;
    arrOfOptions.refresh();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
