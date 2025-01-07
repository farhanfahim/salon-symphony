import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:salon_symphony/core/utils/color_constant.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/custom_text.dart';
import '../../widgets/custom_toast.dart';


class HelperFunction {
  static String? emailValidate(String val) {
    if (val.isEmpty) {
      return null;
    } else if (val.isEmail == false) {
      return null;
    } else {
      return null;
    }
  }

  static String? stringValidate(val, {fieldName}) {
    if (val.isEmpty || val == '') {
      return null;
    } else {
      return null;
    }
  }

  static num? numberValidate(val, {fieldName}) {
    if (val.isEmpty || val == '') {
      return null;
    } else {
      return null;
    }
  }



  static String? stringValidate2(val, fieldName) {
    if (val.isEmpty || val == '') {
      return '${fieldName ?? 'Field'} cannot be empty *';
    } else {
      return null;
    }
  }

  static String? stringValidate3(val, {fieldName}) {
    if (val.isEmpty || val == '') {
      return "";
    } else {
      return null;
    }
  }

  static String? fullNameValidator(val, {fieldName}) {
    if (val.isEmpty || val == '' ) {
      return null;
    } else if(val.trim().contains(' ') == false ||  val.toString().length  < 3) {
      print("val =====> $val");
      return "";
    }
    else {
      print("else val =====> $val");
      return null;
    }
  }


  static String? stringValidateWithLImit(val,limit, {fieldName}) {
    if (val.isEmpty || val == '') {
      return null;
    }else if(val.toString().length > limit){
      return null;
    } else {
      return null;
    }
  }



  //
  // static String? passwordValidate(String value) {
  //   if (value.isEmpty || value == "") {
  //     return "Password field cannot be empty";
  //   }
  //   if (value.length < 6) {
  //     return "Password is really short please enter at least 6 character.";
  //   } else {
  //     return null;
  //   }
  // }
  static String? passwordValidate(String value) {
    if (value.isEmpty || value == "") {
      return "";
    }
    if (value.length < 8) {
      return "";
    } else {
      return null;
    }
  }


  static bool showPassword(bool value) {
    if (value == true) {
      return false;
    } else {
      return true;
    }
  }

  static void showBottomSheet(context,
      {double? bottomSheetHeight,
      double? spaceBetween,
        double? radius,
        bool? redclrEndTask,
        bool? isLeftPadding = true,
        bool? isPadding,
      String? screenTitle,
      String? screenEndTask,
      Function? onTap,
        bool? isScrollControlled,
        Color? color,
      Widget? save,
      Widget? widget}) {
    showModalBottomSheet(
      isScrollControlled: isScrollControlled ?? false,
        backgroundColor: color ?? Colors.white,
        barrierColor: Colors.black.withOpacity(0.75),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(radius ?? 15.0), topLeft: Radius.circular(radius ?? 15.0)),
        ),
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: bottomSheetHeight ?? 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(title: '${screenTitle ?? 'Screen Name'}',weight: 'Semi Bold',fontSize: 18,),
                      GestureDetector(
                          onTap: () {
                            if(onTap != null){
                              onTap();
                            }else{
                              Get.back();
                            }
                          },
                          child: MyText(
                            title: '${screenEndTask ?? 'Close'}',
                            fontSize: 14,
                            clr: redclrEndTask == true?  ColorConstant.pink:ColorConstant.primaryColor,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                isPadding == true ? Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Container(height: 1,width: double.maxFinite,color: ColorConstant.gray400.withOpacity(0.3),),
                ) : Divider(),

                Expanded(child: Padding(
                  padding:  EdgeInsets.only( left: isLeftPadding == false ? 0 : 20, right: 0),
                  child: widget ?? Container(),
                )),
              ],
            ),
          );
        });
  }

  static bool validateEmail(String email) {
    if (email.isEmpty) {
      CustomToast().showToast("Email can not be empty", true);
      return false;
    } else if (!email.isEmail) {
      CustomToast().showToast("Email format is not correct", true);
      return false;
    }
    return true;
  }

  static bool validatePassword(String password) {
    if (password.isEmpty) {
      CustomToast().showToast("Password can not be empty", true);
      return false;
    } else if (password.length < 8) {
      CustomToast().showToast("Password must be 8 characters long", true);
      return false;
    }
    return true;
  }

  static Future<void> clearLocalStorage() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.clear();
  }

  // static Future<Map> getUserInfo() async {
  //   SharedPreferences storage = await SharedPreferences.getInstance();
  //   String? id = storage.getString(LocalDBKeys.USERID);
  //   String? token = storage.getString(LocalDBKeys.TOKEN);
  //
  //   return {
  //     "token": token,
  //     "id": id,
  //   };
  // }




  static const double FULL_SCREEN_SIZE = 100.0;
  static const int EMAIL_VALIDATION = 255;
  static const int BIO_VALIDATION = 475;
  static const int Password_VALIDATION = 25;
  static const int SCHOOL_VALIDATION = 100;

//  Forms padding
  static const double FORM_PADDING = 10.0;
  static const double FORM_PADDING2 = 15.0;

//  Screens padding
  static const double SCREENS_SIDE_PADDING = 15.0;
}
