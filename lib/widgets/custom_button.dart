import 'dart:io';

import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.onTap,
      this.width,
      this.margin,
      this.prefixWidget,
      this.suffixWidget,this.semanticsLabel,
        this.txtcolor,
      this.text});

  String? semanticsLabel;

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  VoidCallback? onTap;

  double? width;

  EdgeInsetsGeometry? margin;

  Widget? prefixWidget;
  Color? txtcolor;

  Widget? suffixWidget;

  String? text;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Semantics(
      label: semanticsLabel,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: getHorizontalSize(width ?? 0),
          height: getVerticalSize(51),
          margin: margin,
          padding: _setPadding(),
          decoration: _buildDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              prefixWidget ?? SizedBox(),
              Text(
                text ?? "",
                textScaleFactor: 1,
                textAlign: TextAlign.center,
                style: _setFontStyle(txtcolor),
              ),
              suffixWidget ?? SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      border: _setBorder(),
      borderRadius: _setBorderRadius(),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingAll18:
        return getPadding(
          all: 14,
        );
      case ButtonPadding.PaddingAll21:
        return getPadding(
          all: 21,
        );
      case ButtonPadding.PaddingAll13:
        return getPadding(
          all: 13,
        );
      case ButtonPadding.PaddingAll4:
        return getPadding(
          all: 4,
        );
      default:
        return getPadding(
          all: 7,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.OutlineBlack900:
        return ColorConstant.black900;
      case ButtonVariant.OutlineBluegray101:
        return ColorConstant.whiteA701;
        case ButtonVariant.OutlineBluegraybg:
        return ColorConstant.graybg;
      case ButtonVariant.FillBlueA400:
        return ColorConstant.blueA400;
      case ButtonVariant.FillBluegray100:
        return ColorConstant.bluegray100;
      case ButtonVariant.OutlineBluegray100:
        return ColorConstant.whiteA701;
      case ButtonVariant.FillPink300:
        return ColorConstant.pink300;
      case ButtonVariant.FillGreen800:
        return ColorConstant.green800;
      case ButtonVariant.FillDeeppurpleA100:
        return ColorConstant.deepPurpleA100;
      case ButtonVariant.FillIndigo50:
        return ColorConstant.abc;
      case ButtonVariant.FillGray200:
        return ColorConstant.gray200;
      case ButtonVariant.FillPink500:
        return ColorConstant.pink500;
      case ButtonVariant.FillGreen801:
        return ColorConstant.green801;
      case ButtonVariant.FillPink50:
        return ColorConstant.pink50;
      case ButtonVariant.FillBlack900:
        return ColorConstant.black900;
      case ButtonVariant.OutlineBluegray100_1:
        return null;
      default:
        return ColorConstant.deepPurpleA201;
    }
  }

  _setBorder() {
    switch (variant) {
      case ButtonVariant.OutlineBlack900:
        return Border.all(
          color: ColorConstant.black900,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineBluegray101:
        return Border.all(
          color: ColorConstant.bluegray101,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineBluegray100:
        return Border.all(
          color: ColorConstant.bluegray100,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineBluegray100_1:
        return Border.all(
          color: ColorConstant.bluegray100,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.FillDeeppurpleA201:
      case ButtonVariant.FillBlueA400:
      case ButtonVariant.FillBluegray100:
      case ButtonVariant.FillPink300:
      case ButtonVariant.FillGreen800:
      case ButtonVariant.FillDeeppurpleA100:
      case ButtonVariant.FillIndigo50:
      case ButtonVariant.FillGray200:
      case ButtonVariant.FillPink500:
      case ButtonVariant.FillGreen801:
      case ButtonVariant.FillPink50:
      case ButtonVariant.FillBlack900:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.CustomBorderLR15:
        return BorderRadius.only(
          topLeft: Radius.circular(
            getHorizontalSize(
              5.00,
            ),
          ),
          topRight: Radius.circular(
            getHorizontalSize(
              15.00,
            ),
          ),
          bottomLeft: Radius.circular(
            getHorizontalSize(
              5.00,
            ),
          ),
          bottomRight: Radius.circular(
            getHorizontalSize(
              5.00,
            ),
          ),
        );
      case ButtonShape.CustomBorderTL10:
        return BorderRadius.only(
          topLeft: Radius.circular(
            getHorizontalSize(
              10.00,
            ),
          ),
          topRight: Radius.circular(
            getHorizontalSize(
              5.00,
            ),
          ),
          bottomLeft: Radius.circular(
            getHorizontalSize(
              5.00,
            ),
          ),
          bottomRight: Radius.circular(
            getHorizontalSize(
              5.00,
            ),
          ),
        );
      case ButtonShape.CustomBorderTL15:
        return BorderRadius.only(
          topLeft: Radius.circular(
            getHorizontalSize(
              15.00,
            ),
          ),
          topRight: Radius.circular(
            getHorizontalSize(
              5.00,
            ),
          ),
          bottomLeft: Radius.circular(
            getHorizontalSize(
              5.00,
            ),
          ),
          bottomRight: Radius.circular(
            getHorizontalSize(
              5.00,
            ),
          ),
        );
      case ButtonShape.RoundedBorder15:
        return BorderRadius.circular(
          getHorizontalSize(
            15.00,
          ),
        );
      case ButtonShape.CustomBorderLR5:
        return BorderRadius.only(
          topLeft: Radius.circular(
            getHorizontalSize(
              0.00,
            ),
          ),
          topRight: Radius.circular(
            getHorizontalSize(
              5.00,
            ),
          ),
          bottomLeft: Radius.circular(
            getHorizontalSize(
              0.00,
            ),
          ),
          bottomRight: Radius.circular(
            getHorizontalSize(
              5.00,
            ),
          ),
        );
      case ButtonShape.CustomBorderTL5:
        return BorderRadius.only(
          topLeft: Radius.circular(
            getHorizontalSize(
              5.00,
            ),
          ),
          topRight: Radius.circular(
            getHorizontalSize(
              0.00,
            ),
          ),
          bottomLeft: Radius.circular(
            getHorizontalSize(
              5.00,
            ),
          ),
          bottomRight: Radius.circular(
            getHorizontalSize(
              0.00,
            ),
          ),
        );
      case ButtonShape.RoundedBorder8:
        return BorderRadius.circular(
          getHorizontalSize(
            8.00,
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            5.00,
          ),
        );
    }
  }

  _setFontStyle(Color? txtcolor) {
    switch (fontStyle) {
      case ButtonFontStyle.PoppinsSemiBold16:
        return TextStyle(
          color: txtcolor!=null?txtcolor:ColorConstant.whiteA701,
          fontSize: getFontSize(
            16,
          ),
           fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.PoppinsRegular14:
        return TextStyle(
          color: ColorConstant.whiteA701,
          fontSize: getFontSize(
            14,
          ),
           fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.PoppinsRegular14Black900:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            14,
          ),
           fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.PoppinsRegular14Gray600:
        return TextStyle(
          color: ColorConstant.gray600,
          fontSize: getFontSize(
            14,
          ),
           fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.PoppinsRegular12:
        return TextStyle(
          color: ColorConstant.whiteA701,
          fontSize: getFontSize(
            12,
          ),
           fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.PoppinsMedium12:
        return TextStyle(
          color: ColorConstant.whiteA701,
          fontSize: getFontSize(
            12,
          ),
           fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.PoppinsMedium10Black900:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            10,
          ),
           fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w500,
        );case ButtonFontStyle.PoppinsMedium10White:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            10,
          ),
           fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.PoppinsRegular13:
        return TextStyle(
          color: ColorConstant.whiteA701,
          fontSize: getFontSize(
            13,
          ),
           fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.PoppinsRegular13Black900:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            13,
          ),
           fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.PoppinsMedium10Gray600:
        return TextStyle(
          color: ColorConstant.gray600,
          fontSize: getFontSize(
            10,
          ),
           fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.PoppinsMedium12Pink300:
        return TextStyle(
          color: ColorConstant.pink300,
          fontSize: getFontSize(
            12,
          ),
           fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w500,
        );
      default:
        return TextStyle(
          color: ColorConstant.whiteA701,
          fontSize: getFontSize(
            10,
          ),
           fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w500,
        );
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder5,
  CustomBorderLR15,
  CustomBorderTL10,
  CustomBorderTL15,
  RoundedBorder15,
  CustomBorderLR5,
  CustomBorderTL5,
  RoundedBorder8,
}
enum ButtonPadding {
  PaddingAll18,
  PaddingAll21,
  PaddingAll13,

  PaddingAll7,

  PaddingAll4,
}
enum ButtonVariant {
  FillDeeppurpleA201,
  OutlineBlack900,
  OutlineBluegray101,
  OutlineBluegraybg,
  FillBlueA400,
  FillBluegray100,
  OutlineBluegray100,
  FillPink300,
  FillGreen800,
  FillDeeppurpleA100,
  FillIndigo50,
  FillGray200,
  FillPink500,
  FillGreen801,
  OutlineBluegray100_1,
  FillPink50,
  FillBlack900,
}
enum ButtonFontStyle {
  PoppinsSemiBold16,
  PoppinsRegular14,
  PoppinsRegular14Black900,
  PoppinsRegular14Gray600,
  PoppinsRegular12,
  PoppinsMedium12,
  PoppinsMedium10,
  PoppinsMedium10Black900,
  PoppinsMedium10White,
  PoppinsRegular13,
  PoppinsRegular13Black900,
  PoppinsMedium10Gray600,
  PoppinsMedium12Pink300,
}
