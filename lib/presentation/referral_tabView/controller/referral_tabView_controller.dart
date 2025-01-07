import 'package:flutter/material.dart';
import '../model/model.dart';
import '/core/app_export.dart';
class ReferalController extends GetxController with SingleGetTickerProviderMixin {
  ReferalController(this.referralModel);
  TextEditingController searchController = new TextEditingController();


  Rx<ReferralAllTabContainerModel> referralModel;
  TabController? tabController;
  RxBool selected = false.obs;
  @override
  void onReady() {
    super.onReady();
  }

  void selectTab(){
    selected.value = true;
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