import '/core/app_export.dart';
import 'package:salon_symphony/presentation/home_empty_page/models/home_empty_model.dart';
import 'package:flutter/material.dart';

class HomeEmptyController extends GetxController {
  HomeEmptyController(this.homeEmptyModelObj);

  TextEditingController searchFieldController = TextEditingController();

  Rx<HomeEmptyModel> homeEmptyModelObj;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    searchFieldController.dispose();
  }
}
