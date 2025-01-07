import 'dart:io';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

class CustomFloatingEditText extends StatelessWidget {
  CustomFloatingEditText(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.controller,
      this.focusNode,
      this.isObscureText = false,
        this.readOnly = false,
      this.textInputAction = TextInputAction.next,
      this.maxLines,
      this.labelText,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.validator});

  FloatingEditTextShape? shape;

  FloatingEditTextPadding? padding;

  FloatingEditTextVariant? variant;

  FloatingEditTextFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  FocusNode? focusNode;

  bool? isObscureText;
  bool readOnly;

  TextInputAction? textInputAction;

  int? maxLines;

  String? labelText;

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
            child: _buildFloatingEditTextWidget(),
          )
        : _buildFloatingEditTextWidget();
  }

  _buildFloatingEditTextWidget() {
    return Container(
      width: getHorizontalSize(width ?? 0),
      margin: margin,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        readOnly: readOnly,
        style: _setFontStyle(),
        obscureText: isObscureText!,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textInputAction: textInputAction,
        maxLines: maxLines ?? 1,
        decoration: _buildDecoration(),
        validator: validator,
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      labelText: labelText ?? "",
      labelStyle: _setFontStyle(),
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
      case FloatingEditTextFontStyle.PoppinsRegular14:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            14,
          ),
           fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w400,
        );
      case FloatingEditTextFontStyle.PoppinsRegular14Gray900:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: getFontSize(
            14,
          ),
           fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w400,
        );
      default:
        return TextStyle(
          color: ColorConstant.black900,
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
      case FloatingEditTextShape.RoundedBorder5:
        return BorderRadius.circular(
          getHorizontalSize(
            5.00,
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
      case FloatingEditTextVariant.OutlineDeeppurpleA201:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.deepPurpleA201,
            width: 1,
          ),
        );
      case FloatingEditTextVariant.OutlineBluegray100:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.bluegray100,
            width: 1,
          ),
        );
      case FloatingEditTextVariant.OutlineGray301:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.gray301,
            width: 1,
          ),
        );
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.deepPurpleA201,
            width: 1,
          ),
        );
    }
  }

  _setFillColor() {
    switch (variant) {
      case FloatingEditTextVariant.OutlineDeeppurpleA201:
        return ColorConstant.whiteA701;
      case FloatingEditTextVariant.OutlineBluegray100:
        return ColorConstant.whiteA701;
      case FloatingEditTextVariant.OutlineGray301:
        return ColorConstant.whiteA701;
      default:
        return ColorConstant.whiteA701;
    }
  }

  _setFilled() {
    switch (variant) {
      case FloatingEditTextVariant.OutlineDeeppurpleA201:
        return true;
      case FloatingEditTextVariant.OutlineBluegray100:
        return true;
      case FloatingEditTextVariant.OutlineGray301:
        return true;
      default:
        return true;
    }
  }

  _setPadding() {
    switch (padding) {
      case FloatingEditTextPadding.PaddingTB17:
        return getPadding(
          left: 16,
          top: 16,
          right: 16,
          bottom: 17,
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

enum FloatingEditTextShape {
  RoundedBorder5,
}
enum FloatingEditTextPadding {
  PaddingTB17,
}
enum FloatingEditTextVariant {
  OutlineDeeppurpleA201,
  OutlineBluegray100,
  OutlineGray301,
}
enum FloatingEditTextFontStyle {
  PoppinsRegular14,
  PoppinsRegular14Gray900,
}
