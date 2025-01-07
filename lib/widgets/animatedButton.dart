import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/utils/color_constant.dart';
import 'package:salon_symphony/core/utils/size_utils.dart';

import 'animated_custom_button.dart';

class AnimatedButton extends StatefulWidget {
  AnimatedButton(
      {
        required this.text,
        required this.controller,
        this.loadedIcon,
        this.height,
        this.fontStyle,
        this.margin,
        this.alignment,
        this.prefixWidget,
        this.suffixWidget,
        this.padding,
        this.variant,
        this.width,
        this.shape,
        this.semanticsLabel,
        this.loadingText,
        required this.onPressed});

  /// Initial text display
  final String text;

  /// Loading text
  final String? loadingText;

  /// You can also customized the last icon appear in the animation progress.
  final Widget? loadedIcon;

  /// Default 50.
  final double? height;

  ButtonFontStyleOfButton? fontStyle;

  EdgeInsetsGeometry? margin;
  String? semanticsLabel;

  ButtonPaddingOfButton? padding;

  Widget? prefixWidget;

  Widget? suffixWidget;

  double? width;

  Alignment? alignment;

  ButtonVariantOfButton? variant;

  ButtonShapeOfButton? shape;
  /// AnimatedButtonController to help control the animation progress.
  /// Call [controller.completed()] when getting response from your request
  /// Call [controller.reset()] to restart button animation
  final AnimatedButtonController controller;

  /// Customize on pressing action
  final VoidCallback onPressed;

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with TickerProviderStateMixin {
  static int simulatedLoadingTime = 3;
  bool _isLoading = false;
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;
  late Animation<double> _buttonWidthAnimation;
  late Animation<Offset> _checkIconOffsetAnimation;

  @override
  void initState() {
    super.initState();
    widget.controller.addLoadedListener((bool shouldReset) {
      if (shouldReset) {
        _animationController.reset();
        _isLoading = false;
        return;
      }
      _animationController.forward(from: 0.6);
    });

    _animationController = AnimationController(
        duration: Duration(seconds: simulatedLoadingTime), vsync: this)
      ..addListener(() {
        if (_animationController.value >= 0.6 &&
            !(widget.controller.value)) {
          _animationController.stop(canceled: false);
        }
        if(mounted) {
          setState(() {});
        }
      });

    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.0, 0.7, curve: Curves.ease)));
    _buttonWidthAnimation = Tween<double>(begin: 400, end: 50).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.7, 0.9, curve: Curves.decelerate)));
    _checkIconOffsetAnimation =
        Tween<Offset>(begin: Offset(0, -2), end: Offset.zero).animate(
            CurvedAnimation(
                parent: _animationController,
                curve: Interval(0.9, 1.0, curve: Curves.easeOutBack)));
  }

  bool get _progressLoadingCompleted => _progressAnimation.value == 1.0;
  bool get _visibleIcon => _checkIconOffsetAnimation.value.dy > -2;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.semanticsLabel,
      child: Container(
        // height: widget.height ?? 60,
        // width: _buttonWidthAnimation.value,
        width: getHorizontalSize(width ?? 0),

//      margin: EdgeInsets.only(top: 32.0, left: 28.0, right: 28.0),
        child: GestureDetector(
          onTap: () {
            if (_isLoading) return;
            _isLoading = true;
            _animationController.forward();
            if (widget.onPressed != null) {
              widget.onPressed();
            }
          },
          child: Container(
            width: getHorizontalSize(width ?? 0),
            height: getVerticalSize(51),
            margin: widget.margin,
            padding: _setPadding(),
            decoration: _buildDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.prefixWidget ?? SizedBox(),
                _progressAnimation.value == 0.0
                    ?
                Text(
                  widget.text != null ? widget.text : "",
                  textAlign: TextAlign.center,
                  style: _setFontStyle(),
                ) : Container(
                  width: getVerticalSize(25),
                  height: getVerticalSize(25),
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                    // value: _progressAnimation.value,

                  ),
                ),
                widget.suffixWidget ?? SizedBox(),
              ],
            ),
          ),


          /*Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: AppColors.APP_PRIMARY_COLOR,
                borderRadius: BorderRadius.circular(5.0),
              ),
              // padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                          child: Text(
                            widget.text,
                            style: AppStyles.regularTextStyle(fontSize: 12.0.sp, color: AppColors.WHITE_COLOR),
                          ),
                        ),
                      ),
                    ],
                  ),
                  _progressAnimation.value == 0.0
                      ? Container()
                      : FadeOutDown(
                    duration: Duration(milliseconds: 500),
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(5.0), bottomLeft: Radius.circular(5.0)),
                        child:
                      ),
                    ),
                  ),
                ],
              )),*/
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
    switch (widget.padding) {
      case ButtonPaddingOfButton.PaddingAll18:
        return getPadding(
          all: 14,
        );
      case ButtonPaddingOfButton.PaddingAll21:
        return getPadding(
          all: 21,
        );
      case ButtonPaddingOfButton.PaddingAll13:
        return getPadding(
          all: 13,
        );
      case ButtonPaddingOfButton.PaddingAll4:
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
    switch (widget.variant) {
      case ButtonVariantOfButton.OutlineBlack900:
        return ColorConstant.black900;
      case ButtonVariantOfButton.OutlineBluegray101:
        return ColorConstant.whiteA701;
      case ButtonVariantOfButton.FillBlueA400:
        return ColorConstant.blueA400;
      case ButtonVariantOfButton.FillBluegray100:
        return ColorConstant.bluegray100;
      case ButtonVariantOfButton.OutlineBluegray100:
        return ColorConstant.whiteA701;
      case ButtonVariantOfButton.FillPink300:
        return ColorConstant.pink300;
      case ButtonVariantOfButton.FillGreen800:
        return ColorConstant.green800;
      case ButtonVariantOfButton.FillDeeppurpleA100:
        return ColorConstant.deepPurpleA100;
      case ButtonVariantOfButton.FillIndigo50:
        return ColorConstant.abc;
      case ButtonVariantOfButton.FillGray200:
        return ColorConstant.gray200;
      case ButtonVariantOfButton.FillPink500:
        return ColorConstant.pink500;
      case ButtonVariantOfButton.FillGreen801:
        return ColorConstant.green801;
      case ButtonVariantOfButton.FillPink50:
        return ColorConstant.pink50;
      case ButtonVariantOfButton.FillBlack900:
        return ColorConstant.black900;
      case ButtonVariantOfButton.OutlineBluegray100_1:
        return null;
      default:
        return ColorConstant.deepPurpleA201;
    }
  }

  _setBorder() {
    switch (widget.variant) {
      case ButtonVariantOfButton.OutlineBlack900:
        return Border.all(
          color: ColorConstant.black900,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariantOfButton.OutlineBluegray101:
        return Border.all(
          color: ColorConstant.bluegray101,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariantOfButton.OutlineBluegray100:
        return Border.all(
          color: ColorConstant.bluegray100,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariantOfButton.OutlineBluegray100_1:
        return Border.all(
          color: ColorConstant.bluegray100,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariantOfButton.FillDeeppurpleA201:
      case ButtonVariantOfButton.FillBlueA400:
      case ButtonVariantOfButton.FillBluegray100:
      case ButtonVariantOfButton.FillPink300:
      case ButtonVariantOfButton.FillGreen800:
      case ButtonVariantOfButton.FillDeeppurpleA100:
      case ButtonVariantOfButton.FillIndigo50:
      case ButtonVariantOfButton.FillGray200:
      case ButtonVariantOfButton.FillPink500:
      case ButtonVariantOfButton.FillGreen801:
      case ButtonVariantOfButton.FillPink50:
      case ButtonVariantOfButton.FillBlack900:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (widget.shape) {
      case ButtonShapeOfButton.CustomBorderLR15:
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
      case ButtonShapeOfButton.CustomBorderTL10:
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
      case ButtonShapeOfButton.CustomBorderTL15:
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
      case ButtonShapeOfButton.RoundedBorder15:
        return BorderRadius.circular(
          getHorizontalSize(
            15.00,
          ),
        );
      case ButtonShapeOfButton.CustomBorderLR5:
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
      case ButtonShapeOfButton.CustomBorderTL5:
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
      case ButtonShapeOfButton.RoundedBorder8:
        return BorderRadius.circular(
          getHorizontalSize(
            8.00,
          ),
        );
      case ButtonShapeOfButton.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            5.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (widget.fontStyle) {
      case ButtonFontStyleOfButton.PoppinsSemiBold16:
        return TextStyle(
          color: ColorConstant.whiteA701,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyleOfButton.PoppinsRegular14:
        return TextStyle(
          color: ColorConstant.whiteA701,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyleOfButton.PoppinsRegular14Black900:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyleOfButton.PoppinsRegular14Gray600:
        return TextStyle(
          color: ColorConstant.gray600,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyleOfButton.PoppinsRegular12:
        return TextStyle(
          color: ColorConstant.whiteA701,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyleOfButton.PoppinsMedium12:
        return TextStyle(
          color: ColorConstant.whiteA701,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyleOfButton.PoppinsMedium10Black900:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            10,
          ),
          fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w500,
        );case ButtonFontStyleOfButton.PoppinsMedium10White:
      return TextStyle(
        color: ColorConstant.whiteA700,
        fontSize: getFontSize(
          10,
        ),
        fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
        fontWeight: FontWeight.w500,
      );
      case ButtonFontStyleOfButton.PoppinsRegular13:
        return TextStyle(
          color: ColorConstant.whiteA701,
          fontSize: getFontSize(
            13,
          ),
          fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyleOfButton.PoppinsRegular13Black900:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            13,
          ),
          fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyleOfButton.PoppinsMedium10Gray600:
        return TextStyle(
          color: ColorConstant.gray600,
          fontSize: getFontSize(
            10,
          ),
          fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyleOfButton.PoppinsMedium12Pink300:
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

typedef void OnLoaded(bool shouldReset);

class AnimatedButtonController extends ValueNotifier<bool> {
  OnLoaded? _callback;

  AnimatedButtonController({bool value = false}) : super(value);

  void completed() {
    value = true;
    if (_callback != null) {
      _callback!(false);
    }
  }

  void addLoadedListener(OnLoaded callback) {
    this._callback = callback;
  }

  void reset() {
    value = false;
    if (_callback != null) {
      _callback!(true);
    }
  }
}




enum ButtonShapeOfButton {
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
enum ButtonPaddingOfButton {
  PaddingAll18,
  PaddingAll21,
  PaddingAll13,

  PaddingAll7,

  PaddingAll4,
}
enum ButtonVariantOfButton {
  FillDeeppurpleA201,
  OutlineBlack900,
  OutlineBluegray101,
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
enum ButtonFontStyleOfButton {
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
