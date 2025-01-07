import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:salon_symphony/core/utils/utils.dart';

import '../core/utils/color_constant.dart';
import '../widgets/cutom_dialog.dart';

class BaseviewAuthScreen extends StatelessWidget {
  BaseviewAuthScreen({this.child, this.closeApp, this.stickfooter = true});

  Widget? child;
  bool? closeApp;
  bool? stickfooter;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          systemNavigationBarColor: ColorConstant.whiteA700,
          statusBarBrightness: Platform.isIOS ? Brightness.light : Brightness.dark,
          statusBarIconBrightness: Platform.isIOS ? Brightness.light : Brightness.dark),
    );
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0,boldText: false ),
      child: Scaffold(
          backgroundColor: ColorConstant.whiteA700,
          body: WillPopScope(
              onWillPop: () async {
                if (closeApp != null && closeApp != true) {
                  Get.back();
                  return false;
                } else {
                  return (await Get.dialog(CustomModelSheet(
                          title: 'Alert',
                          msg:
                              "Are you sure you want to \nclose application? ",
                      showOkButton: false,
                      onTapYes: () {
                        // exit(0);
                        SystemNavigator.pop();
                      },
                      onTapNo: () {


                      }))) ??
                      false;
                }
              },
              child: SafeArea(
                bottom: stickfooter!,
                child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      Utils.hideKeyboard(context);
                    },
                    child: child!),
              ))),
    );
  }
}
