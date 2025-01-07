import 'dart:io';

import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

class AppStyle {
  static TextStyle txtPoppinsRegular12BlueA200 = TextStyle(
    color: ColorConstant.blueA200,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular14WhiteA701 = TextStyle(
    color: ColorConstant.whiteA701,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular14Black901 = TextStyle(
    color: ColorConstant.black901,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular14Black900 = TextStyle(
    color: ColorConstant.black900,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular10Green800 = TextStyle(
    color: ColorConstant.green800,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      10,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsMedium14Gray600 = TextStyle(
    color: ColorConstant.gray600,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtPoppinsRegular10Green801 = TextStyle(
    color: ColorConstant.green801,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      10,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsMedium24Pink500 = TextStyle(
    color: ColorConstant.pink500,
    fontSize: getFontSize(
      24,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtRobotoRegular20Black90099 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black900 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black9008 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black9009 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black9006 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black9007 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black9004 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black9005 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black9002 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black9003 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black9001 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular14Bluegray400 = TextStyle(
    color: ColorConstant.bluegray400,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90089 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90088 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90090 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular16Gray600 = TextStyle(
    color: ColorConstant.gray600,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular12Gray600 = TextStyle(
    color: ColorConstant.gray600,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90098 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90097 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90096 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90095 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90094 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90093 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90092 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90091 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtMuliBold16 = TextStyle(
    color: ColorConstant.green600,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtMuliBold16RedA200 = TextStyle(
    color: ColorConstant.redA200,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtPoppinsRegular16Bluegray100 = TextStyle(
    color: ColorConstant.bluegray100,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black900109 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black900108 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black900107 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black900106 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black900105 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black900104 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black900103 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black900102 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black900101 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular16Pink300 = TextStyle(
    color: ColorConstant.pink300,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black900100 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular14Pink300 = TextStyle(
    color: ColorConstant.pink300,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsMedium14WhiteA701 = TextStyle(
    color: ColorConstant.whiteA701,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtPoppinsMedium24 = TextStyle(
    color: ColorConstant.pink300,
    fontSize: getFontSize(
      24,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtPoppinsMedium20 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtInterMedium20 = TextStyle(
    color: ColorConstant.bluegray100,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtPoppinsRegular14Gray500 = TextStyle(
    color: ColorConstant.gray500,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular12Gray901 = TextStyle(
    color: ColorConstant.gray901,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsMedium12DeeppurpleA201 = TextStyle(
    color: ColorConstant.deepPurpleA201,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtPoppinsRegular10WhiteA701 = TextStyle(
    color: ColorConstant.whiteA701,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      10,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular12Gray60087 = TextStyle(
    color: ColorConstant.gray60087,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsBold16 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtPoppinsMedium20Black901 = TextStyle(
    color: ColorConstant.black901,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtPoppinsRegular12Bluegray100 = TextStyle(
    color: ColorConstant.bluegray100,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular12Bluegray900 = TextStyle(
    color: ColorConstant.bluegray900,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsMedium14 = TextStyle(
    color: ColorConstant.black900,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtPoppinsMedium12 = TextStyle(
    color: ColorConstant.whiteA701,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtPoppinsMedium10 = TextStyle(
    color: ColorConstant.gray600,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      10,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtPoppinsMedium18 = TextStyle(
    color: ColorConstant.deepPurpleA201,
    fontSize: getFontSize(
      18,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtPoppinsMedium16 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtPoppinsRegular14Gray601 = TextStyle(
    color: ColorConstant.gray601,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular14Gray600 = TextStyle(
    color: ColorConstant.gray600,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsMedium14DeeppurpleA201 = TextStyle(
    color: ColorConstant.deepPurpleA201,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtPoppinsMedium14Green800 = TextStyle(
    color: ColorConstant.green800,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtRobotoRegular20Black90039 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90038 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90037 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90036 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90035 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90034 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90033 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular12Bluegray400 = TextStyle(
    color: ColorConstant.bluegray400,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsSemiBold14 = TextStyle(
    color: ColorConstant.black900,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtPoppinsSemiBold16 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtRobotoRegular20Black90043 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90042 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90041 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90040 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsSemiBold17 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      17,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtPoppinsSemiBold18 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      18,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtRobotoRegular20Black90029 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90028 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90027 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90026 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90025 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90024 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90023 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular14Bluegray100 = TextStyle(
    color: ColorConstant.bluegray100,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90022 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular14 = TextStyle(
    color: ColorConstant.gray900,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular15 = TextStyle(
    color: ColorConstant.black900,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      15,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular16 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsSemiBold28 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      28,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtPoppinsSemiBold24 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      24,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtPoppinsRegular13Gray600 = TextStyle(
    color: ColorConstant.gray600,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      13,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );
  static TextStyle txtPoppinsRegular11Gray600 = TextStyle(
    color: ColorConstant.gray600,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      11,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsMedium16DeeppurpleA201 = TextStyle(
    color: ColorConstant.deepPurpleA201,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtPoppinsSemiBold20 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtPoppinsRegular20 = TextStyle(
    color: ColorConstant.gray600,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90032 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtInterRegular12 = TextStyle(
    color: ColorConstant.whiteA701,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90031 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90030 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90018 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90017 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90016 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90015 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90014 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90013 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90012 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90011 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular10DeeppurpleA201 = TextStyle(
    color: ColorConstant.deepPurpleA201,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      10,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90019 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular10 = TextStyle(
    color: ColorConstant.gray501,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      10,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular12 = TextStyle(
    color: ColorConstant.deepPurpleA201,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular13 = TextStyle(
    color: ColorConstant.black900,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      13,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90021 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90020 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsSemiBold16Pink300 = TextStyle(
    color: ColorConstant.pink300,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtRobotoRegular20Black900119 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black900118 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black900117 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black900116 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black900115 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black900114 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black900113 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black900112 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black900111 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSourceSansProRegular14 = TextStyle(
    color: ColorConstant.black900,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black900110 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtSourceSansProRegular12 = TextStyle(
    color: ColorConstant.black900,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsMedium10DeeppurpleA201 = TextStyle(
    color: ColorConstant.deepPurpleA201,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      10,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtRobotoRegular16 = TextStyle(
    color: ColorConstant.bluegray401,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90010 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90079 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsMedium14Gray903 = TextStyle(
    color: ColorConstant.gray903,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtRobotoRegular20Black90078 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90077 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular12Pink300 = TextStyle(
    color: ColorConstant.pink300,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90087 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90086 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90085 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90084 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90083 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90082 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90081 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90080 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90069 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90068 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90067 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90066 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular11Black900 = TextStyle(
    color: ColorConstant.black900,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      11,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular12Black900 = TextStyle(
    color: ColorConstant.black900,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular14Gray901 = TextStyle(
    color: ColorConstant.gray901,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90076 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90075 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90074 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90073 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular14Gray903 = TextStyle(
    color: ColorConstant.gray903,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90072 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular14Gray902 = TextStyle(
    color: ColorConstant.gray902,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90071 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90070 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90059 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90058 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90057 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90056 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90055 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsMediumItalic14 = TextStyle(
    color: ColorConstant.bluegray100,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtPoppinsRegular12WhiteA701 = TextStyle(
    color: ColorConstant.whiteA701,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtInterRegular12Bluegray900 = TextStyle(
    color: ColorConstant.bluegray900,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90065 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90064 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90063 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90062 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90061 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular14DeeppurpleA201 = TextStyle(
    color: ColorConstant.deepPurpleA201,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90060 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsMedium12Black900 = TextStyle(
    color: ColorConstant.black900,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtRobotoRegular20Black90049 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90048 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90047 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90046 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90045 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90044 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsMedium24Black900 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      24,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtPoppinsRegular20Bluegray100 = TextStyle(
    color: ColorConstant.bluegray100,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular10Gray600 = TextStyle(
    color: ColorConstant.gray600,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      10,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90054 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsMedium14Pink500 = TextStyle(
    color: ColorConstant.pink500,
    letterSpacing: 0.5,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtRobotoRegular20Black90053 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90052 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90051 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black90050 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
    fontWeight: FontWeight.w400,
  );
}
