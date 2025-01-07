import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton(
      {this.shape,
      this.padding,
      this.variant,
      this.alignment,
      this.margin,
      this.height,
      this.width,
      this.child,
      this.onTap});

  IconButtonShape? shape;

  IconButtonPadding? padding;

  IconButtonVariant? variant;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  double? height;

  double? width;

  Widget? child;

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildIconButtonWidget(),
          )
        : _buildIconButtonWidget();
  }

  _buildIconButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: IconButton(
        constraints: BoxConstraints(
          minHeight: getSize(height ?? 0),
          minWidth: getSize(width ?? 0),
        ),
        padding: EdgeInsets.all(0),
        icon: Container(
          alignment: Alignment.center,
          width: getSize(width ?? 0),
          height: getSize(height ?? 0),
          padding: _setPadding(),
          decoration: _buildDecoration(),
          child: child,
        ),
        onPressed: onTap,
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      border: _setBorder(),
      borderRadius: _setBorderRadius(),
      gradient: _setGradient(),
      boxShadow: _setBoxShadow(),
    );
  }

  _setPadding() {
    switch (padding) {
      case IconButtonPadding.PaddingAll8:
        return getPadding(
          all: 8,
        );
      case IconButtonPadding.PaddingAll13:
        return getPadding(
          all: 13,
        );
      default:
        return getPadding(
          all: 5,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case IconButtonVariant.OutlineWhiteA701:
        return ColorConstant.deepPurpleA201;
      case IconButtonVariant.OutlineBlack9000a:
        return ColorConstant.whiteA701;
      case IconButtonVariant.FillBlueA400:
        return ColorConstant.blueA400;
      case IconButtonVariant.FillBlack900:
        return ColorConstant.black900;
      case IconButtonVariant.FillWhite:
        return ColorConstant.whiteA700;
      case IconButtonVariant.FillDeeppurple40018:
        return ColorConstant.deepPurple40018;
      case IconButtonVariant.FillPink300:
        return ColorConstant.pink300;
      case IconButtonVariant.FillGreen800:
        return ColorConstant.green800;
      case IconButtonVariant.OutlineGray300:
        return ColorConstant.whiteA701;
      case IconButtonVariant.GradientAmber200IndigoA200:
      case IconButtonVariant.OutlineGray201:
        return null;
      default:
        return ColorConstant.deepPurpleA201;
    }
  }

  _setBorder() {
    switch (variant) {
      case IconButtonVariant.OutlineWhiteA701:
        return Border.all(
          color: ColorConstant.whiteA701,
          width: getHorizontalSize(
            2.00,
          ),
        );
      case IconButtonVariant.OutlineGray300:
        return Border.all(
          color: ColorConstant.gray300,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case IconButtonVariant.OutlineGray201:
        return Border.all(
          color: ColorConstant.gray201,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case IconButtonVariant.FillDeeppurpleA201:
      case IconButtonVariant.OutlineBlack9000a:
      case IconButtonVariant.FillBlueA400:
      case IconButtonVariant.GradientAmber200IndigoA200:
      case IconButtonVariant.FillBlack900:
      case IconButtonVariant.FillWhite:
      case IconButtonVariant.FillDeeppurple40018:
      case IconButtonVariant.FillPink300:
      case IconButtonVariant.FillGreen800:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case IconButtonShape.RoundedBorder10:
        return BorderRadius.circular(
          getHorizontalSize(
            10.00,
          ),
        );
      case IconButtonShape.CircleBorder15:
        return BorderRadius.circular(
          getHorizontalSize(
            15.00,
          ),
        );
      case IconButtonShape.CircleBorder25:
        return BorderRadius.circular(
          getHorizontalSize(
            25.00,
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

  _setGradient() {
    switch (variant) {
      case IconButtonVariant.GradientAmber200IndigoA200:
        return LinearGradient(
          begin: Alignment(
            0.8548047385131238,
            0.14666091503312106,
          ),
          end: Alignment(
            0.14666091503312106,
            0.8548047385131239,
          ),
          colors: [
            ColorConstant.amber200,
            ColorConstant.pink401,
            ColorConstant.indigoA200,
          ],
        );
      case IconButtonVariant.FillDeeppurpleA201:
      case IconButtonVariant.OutlineWhiteA701:
      case IconButtonVariant.OutlineBlack9000a:
      case IconButtonVariant.FillBlueA400:
      case IconButtonVariant.FillBlack900:
      case IconButtonVariant.FillWhite:
      case IconButtonVariant.FillDeeppurple40018:
      case IconButtonVariant.FillPink300:
      case IconButtonVariant.FillGreen800:
      case IconButtonVariant.OutlineGray300:
      case IconButtonVariant.OutlineGray201:
        return null;
      default:
        return null;
    }
  }

  _setBoxShadow() {
    switch (variant) {
      case IconButtonVariant.OutlineBlack9000a:
        return [
          BoxShadow(
            color: ColorConstant.black9000a,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              11,
            ),
          )
        ];
      case IconButtonVariant.FillDeeppurpleA201:
      case IconButtonVariant.OutlineWhiteA701:
      case IconButtonVariant.FillBlueA400:
      case IconButtonVariant.GradientAmber200IndigoA200:
      case IconButtonVariant.FillBlack900:
      case IconButtonVariant.FillWhite:
      case IconButtonVariant.FillDeeppurple40018:
      case IconButtonVariant.FillPink300:
      case IconButtonVariant.FillGreen800:
      case IconButtonVariant.OutlineGray300:
      case IconButtonVariant.OutlineGray201:
        return null;
      default:
        return null;
    }
  }
}

enum IconButtonShape {
  RoundedBorder10,
  CircleBorder15,
  RoundedBorder5,
  CircleBorder25,
}
enum IconButtonPadding {
  PaddingAll5,
  PaddingAll8,
  PaddingAll13,
}
enum IconButtonVariant {
  FillDeeppurpleA201,
  OutlineWhiteA701,
  OutlineBlack9000a,
  FillBlueA400,
  GradientAmber200IndigoA200,
  FillBlack900,
  FillWhite,
  FillDeeppurple40018,
  FillPink300,
  FillGreen800,
  OutlineGray300,
  OutlineGray201,
}
