import 'dart:io';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.keyboardType,
      this.margin,
      this.controller,
        this.readOnly = false,
      this.focusNode,
        this.nextFocusNode,
      this.isObscureText = false,
      this.textInputAction = TextInputAction.next,
      this.maxLines,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.onChanged,
      this.suffix,
      this.suffixConstraints,
      this.validator});

  TextFormFieldShape? shape;
  final Function(String)? onChanged;
  TextFormFieldPadding? padding;

  TextFormFieldVariant? variant;

  TextFormFieldFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;
  TextInputType? keyboardType;
  TextEditingController? controller;

  FocusNode? focusNode;

  FocusNode? nextFocusNode;

  bool? isObscureText;
  bool readOnly;

  TextInputAction? textInputAction;

  int? maxLines;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  BoxConstraints? suffixConstraints;

  FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildTextFormFieldWidget(),
          )
        : _buildTextFormFieldWidget();
  }

  _buildTextFormFieldWidget() {
    return Container(
      width: getHorizontalSize(width ?? 0),
      margin: margin,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        readOnly: readOnly,
        onChanged: onChanged,
        style: _setFontStyle(),
        obscureText: isObscureText!,
        textInputAction: textInputAction,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLines: maxLines ?? 1,
        decoration: _buildDecoration(),
        validator: validator,
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: _setFontStyle(),
      border: _setBorderStyle(),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 1.0, color: ColorConstant.hintTextColor)),
      disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 1.0, color: ColorConstant.hintTextColor)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 1.0, color: ColorConstant.primaryColor)),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      case TextFormFieldFontStyle.PoppinsRegular14:
        return TextStyle(
          color: ColorConstant.gray600,
          fontSize: getFontSize(
            14,
          ),
           fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.PoppinsSemiBold16:
        return TextStyle(
          color: ColorConstant.whiteA701,
          fontSize: getFontSize(
            16,
          ),
           fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w600,
        );
      case TextFormFieldFontStyle.PoppinsRegular12:
        return TextStyle(
          color: ColorConstant.gray600,
          fontSize: getFontSize(
            12,
          ),
           fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.PoppinsRegular14Black901:
        return TextStyle(
          color: ColorConstant.black901,
          fontSize: getFontSize(
            14,
          ),
           fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.PoppinsRegular14Gray400:
        return TextStyle(
          color: ColorConstant.gray400,
          fontSize: getFontSize(
            14,
          ),
           fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w400,
        );
      default:
        return TextStyle(
          color: ColorConstant.gray601,
          fontSize: getFontSize(
            14,
          ),
           fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w400,
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      case TextFormFieldShape.RoundedBorder10:
        return BorderRadius.circular(
          getHorizontalSize(
            10.00,
          ),
        );
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            5.00,
          ),
        );
    }
  }

  _setBorderStyle() {
    switch (variant) {
      case TextFormFieldVariant.OutlineBluegray100:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.bluegray100,
            width: 1,
          ),
        );
      case TextFormFieldVariant.FillDeeppurpleA201:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.FillBlack900:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.FillCyan300:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.FillPink300:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.FillGreen800:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.OutlineGray600:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.gray600,
            width: 1,
          ),
        );
      case TextFormFieldVariant.OutlineBlack9000a:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.FillPink500:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.FillBlueA2005e:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.gray301,
            width: 1,
          ),
        );
    }
  }

  _setFillColor() {
    switch (variant) {
      case TextFormFieldVariant.OutlineBluegray100:
        return ColorConstant.whiteA701;
      case TextFormFieldVariant.FillDeeppurpleA201:
        return ColorConstant.deepPurpleA201;
      case TextFormFieldVariant.FillBlack900:
        return ColorConstant.black900;
      case TextFormFieldVariant.FillCyan300:
        return ColorConstant.cyan300;
      case TextFormFieldVariant.FillPink300:
        return ColorConstant.pink300;
      case TextFormFieldVariant.FillGreen800:
        return ColorConstant.green800;
      case TextFormFieldVariant.OutlineGray600:
        return ColorConstant.whiteA701;
      case TextFormFieldVariant.OutlineBlack9000a:
        return ColorConstant.whiteA701;
      case TextFormFieldVariant.FillPink500:
        return ColorConstant.pink500;
      case TextFormFieldVariant.FillBlueA2005e:
        return ColorConstant.blueA2005e;
      default:
        return ColorConstant.whiteA701;
    }
  }

  _setFilled() {
    switch (variant) {
      case TextFormFieldVariant.OutlineBluegray100:
        return true;
      case TextFormFieldVariant.FillDeeppurpleA201:
        return true;
      case TextFormFieldVariant.FillBlack900:
        return true;
      case TextFormFieldVariant.FillCyan300:
        return true;
      case TextFormFieldVariant.FillPink300:
        return true;
      case TextFormFieldVariant.FillGreen800:
        return true;
      case TextFormFieldVariant.OutlineGray600:
        return true;
      case TextFormFieldVariant.OutlineBlack9000a:
        return true;
      case TextFormFieldVariant.FillPink500:
        return true;
      case TextFormFieldVariant.FillBlueA2005e:
        return true;
      default:
        return true;
    }
  }

  _setPadding() {
    switch (padding) {
      case TextFormFieldPadding.PaddingTB17_1:
        return getPadding(
          left: 12,
          top: 12,
          right: 12,
          bottom: 17,
        );
      case TextFormFieldPadding.PaddingAll14:
        return getPadding(
          all: 14,
        );
      case TextFormFieldPadding.PaddingT21:
        return getPadding(
          left: 18,
          top: 21,
          right: 18,
          bottom: 18,
        );
      case TextFormFieldPadding.PaddingT15:
        return getPadding(
          left: 10,
          top: 15,
          right: 10,
          bottom: 10,
        );
      case TextFormFieldPadding.PaddingT11:
        return getPadding(
          left: 8,
          top: 11,
          right: 8,
          bottom: 8,
        );
      default:
        return getPadding(
          left: 16,
          top: 16,
          right: 16,
          bottom: 17,
        );
    }
  }
}

enum TextFormFieldShape {
  RoundedBorder5,
  RoundedBorder10,
}
enum TextFormFieldPadding {
  PaddingTB17,
  PaddingTB17_1,
  PaddingAll14,
  PaddingT21,
  PaddingT15,
  PaddingT11,
}
enum TextFormFieldVariant {
  OutlineGray301,
  OutlineBluegray100,
  FillDeeppurpleA201,
  FillBlack900,
  FillCyan300,
  FillPink300,
  FillGreen800,
  OutlineGray600,
  OutlineBlack9000a,
  FillPink500,
  FillBlueA2005e,
}
enum TextFormFieldFontStyle {
  PoppinsRegular14Gray601,
  PoppinsRegular14,
  PoppinsSemiBold16,
  PoppinsRegular12,
  PoppinsRegular14Black901,
  PoppinsRegular14Gray400,
}
