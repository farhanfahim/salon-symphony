import '/core/app_export.dart';
import 'package:flutter/material.dart';

class AddAddEducationTrackingController extends GetxController
    with SingleGetTickerProviderMixin {

  TabController? tabController;
  Map<String, dynamic> map = Get.arguments;

  @override
  void onReady() {

    super.onReady();
  }


  @override
  void onInit() {

    if(map["index"]!=null){
      tabController = TabController(length: 2, vsync: this,initialIndex: map["index"]);
    }else{
      tabController = TabController(length: 2, vsync: this,initialIndex: 0);
    }
    super.onInit();

  }


  @override
  void onClose() {
    super.onClose();
  }





}
