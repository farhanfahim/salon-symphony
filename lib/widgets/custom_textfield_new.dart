import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/responsive.dart';
import '../theme/app_style.dart';

class CustomTextField3 extends StatefulWidget {
  String? fieldText;
  String? hintText;
  String? prefixText;
  bool? isFinal;
  bool? enabled;
  double? inRowPaddindLeft;
  double? inRowPaddindRight;
  List<TextInputFormatter>? inputFormatters;
  FormFieldValidator<String>? validator;
  int? limit;
  int? maxLines;
  String? icon;
  bool? showsuffix;
  bool? iconHinColor;
  Widget? postPixText;
  IconData? iconData;
  Function? sufixIconOnTap;
  Function? onTap;
  final Function(String)? onChanged;
  bool? isPassword;
  bool? isCaps;
  bool? isSurveyScreen;
  double? nameWidth;
  Rx<TextEditingController>? controller;
  TextInputType? keyboardType;
  FocusNode? focusNode;
  FocusNode? nextFocusNode;
  ValueChanged<String>? onFieldSubmitted;
  VoidCallback? onEditingComplete;
  Color? lableColor;
  bool? iconColorChange;
  bool? autoFocus;
  double? lableFontSize;
  double? iconSize;
  double? iconHeight;
  double? iconTopPadding;
  Widget? prefixWidget;
  String? semanticsLabel;

      CustomTextField3({
    Key? key,
    this.fieldText,
    this.hintText,
    this.prefixText,
    this.isFinal,
    this.validator,
    this.enabled = true,
    this.isCaps = false,
    this.isSurveyScreen = false,
    this.autoFocus = false,
    this.inRowPaddindLeft,
    this.inRowPaddindRight  ,
    this.inputFormatters,
    this.onChanged,
    this.icon,
    this.iconHinColor,
    this.postPixText,
    this.iconData,
    this.sufixIconOnTap,
    this.onTap,
    this.isPassword = false,
    this.limit,
    this.maxLines,
    this.nameWidth,
    this.focusNode,
    this.nextFocusNode,
    this.controller,
    this.keyboardType,
    this.onFieldSubmitted,
        this.iconTopPadding,
    this.onEditingComplete,
    this.lableColor,
    this.iconColorChange = false,
    this.lableFontSize,
    this.iconHeight,
    this.iconSize,
        this.showsuffix=true,
    this.prefixWidget,this.semanticsLabel,
  }) : super(key: key);

  @override
  _CustomTextField3State createState() => _CustomTextField3State();
}

class _CustomTextField3State extends State<CustomTextField3> {
  Responsive responsive = Responsive();

  String text = "";
  RxBool isFocus = false.obs;
  RxBool isNotEmpty = false.obs;


  @override
  void initState() {
    widget.controller!.value.addListener(() {

      print('text ${widget.controller!.value.text}');
      if (widget.controller!.value.text.isNotEmpty) {
        isNotEmpty.value = true;
      } else {
        isNotEmpty.value = false;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return GestureDetector(
      onTap: () {
        widget.onTap!();
      },
      child: Container(
        padding:  EdgeInsets.only(
          left: widget.inRowPaddindLeft ?? 16.0, right: widget.inRowPaddindRight ?? 16.0
        ),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: [
            Stack(
              children: [
                Focus(
                  onFocusChange: (hasFocus) {
                    print('hasFocus $hasFocus');
                    isFocus.value = hasFocus;
                    setState(() {});
                  },
                  child: Semantics(
                    label: widget.semanticsLabel,
                    child: TextFormField(

                      textCapitalization: widget.isCaps!
                          ? TextCapitalization.sentences
                          : TextCapitalization.none,
                      obscureText: widget.isPassword!,
                      focusNode: widget.focusNode,
                      autofocus: widget.autoFocus!,
                      validator: widget.validator,
                      enabled: widget.enabled ?? false,
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      cursorColor: ColorConstant.hintTextColor,
                      controller: widget.controller!.value,
                      keyboardType: widget.keyboardType,
                      maxLines: widget.maxLines ?? 1,
                      onChanged: (String newVal) {
                        print("newVal ${newVal}") ;
                        if (newVal.startsWith(' ')) {
                          widget.controller!.value.text = '';
                        } else if (newVal.length <= widget.limit!) {
                          text = newVal;
                        } else {
                          widget.controller!.value.value = TextEditingValue(
                              text: text,
                              selection: TextSelection(
                                  baseOffset: widget.limit!,
                                  extentOffset: widget.limit!,
                                  affinity: TextAffinity.downstream,
                                  isDirectional: false),
                              composing: TextRange(start: 0, end: widget.limit!));
                        }
                        if (widget.onChanged != null) {
                          widget.onChanged!(newVal);
                        }
                      },
                      inputFormatters: widget.inputFormatters,

                      textAlign: TextAlign.start,

                      onFieldSubmitted: widget.isSurveyScreen == false ?
                          (_) {
                        widget.isFinal!
                            ? FocusScope.of(context).unfocus()
                            : FocusScope.of(context)
                                .requestFocus(widget.nextFocusNode!);
                      }:
                      widget.onFieldSubmitted,
                      onEditingComplete: () {
                        widget.isFinal!
                            ? FocusScope.of(context).unfocus()
                            : FocusScope.of(context)
                                .requestFocus(widget.nextFocusNode!);
                      },
                      textInputAction: widget.isFinal!
                          ? TextInputAction.done
                          : TextInputAction.next,

                      // decoration: AppStyles.decoration2(widget.fieldText!),
                      style: AppStyle.txtPoppinsMedium18.copyWith(
                          fontSize: 15,
                          color: widget.lableColor ?? ColorConstant.blackColor,
                          fontWeight: FontWeight.normal),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: 10, right: 10, top: 23, bottom: 15),
                        // iconColor: Color(0XFFC3C6CE),
                        prefixText: widget.prefixText,
                        prefixStyle: AppStyle.txtPoppinsMedium18.copyWith(
                            fontSize: 15,
                            color: widget.lableColor ??
                                ColorConstant.blackColor,
                            fontWeight: FontWeight.normal),
                        prefixIcon: widget.prefixWidget == null
                            ? null
                            : Padding(
                                padding: widget.prefixWidget == null
                                    ? EdgeInsets.all(0.0)
                                    : EdgeInsets.all(10.0),
                                child: widget.prefixWidget ?? null,
                              ),
                        labelText: widget.fieldText,
                        hintText: widget.hintText,
                        hintStyle: TextStyle(
                            fontSize: 14,
                             fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                            color: ColorConstant.hintTextColor.withOpacity(0.5)),
                        alignLabelWithHint: true,
                        errorStyle: TextStyle(
                            color: Theme.of(context).errorColor,
                            height: 0// or any other color
                        ),
                        labelStyle: AppStyle.txtPoppinsMedium18.copyWith(
                            fontSize: widget.lableFontSize ?? 15,
                            letterSpacing: 0.3,
                            color: isFocus.value || isNotEmpty.value ? Color(0XFF7B68EE) : Color(0XFFaaaab1),
                            fontWeight: FontWeight.w400),
                        // contentPadding: EdgeInsets.only(left: 10,right: 10,bottom: 15),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.0, color: Theme.of(context).errorColor)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 0.0, color: ColorConstant.hintTextColor)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 0.0, color: ColorConstant.hintTextColor)),
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 0.0, color: ColorConstant.hintTextColor)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.0, color: ColorConstant.primaryColor)),
                      ),
                    ),
                  ),
                ),
                widget.showsuffix==true?
                Padding(
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () {
                        widget.sufixIconOnTap != null ? widget.sufixIconOnTap!() :widget.onTap!();
                      },
                      child: Container(
                        width: widget.iconSize ?? 44.0,
                        height: widget.iconHeight ?? 40.0,
                        margin: EdgeInsets.only(left: 5, right: 0),
                        padding: EdgeInsets.only(
                            right: 12.0, bottom: 8, top: widget.iconTopPadding ?? 0 /* top:15.0*/
                            ),
                        child: widget.postPixText != null
                            ? Align(
                                alignment: Alignment.centerRight,
                                child: widget.postPixText)
                            : widget.icon == null
                                ? widget.iconData == null
                                    ? Container()
                                    : Icon(
                                        widget.iconData,
                                        color: ColorConstant.hintTextColor.withOpacity(0.5),
                                      ):
                        widget.iconColorChange == true ?SvgPicture.asset(
                          widget.icon!,
                          matchTextDirection: true,
                          fit: BoxFit.fill,
                          color: Color(0XFFC3C6CE),
                        )
                                : SvgPicture.asset(
                                    widget.icon!,
                                    matchTextDirection: true,
                                    fit: BoxFit.fill,
                                    color: widget.iconHinColor == true ? ColorConstant.hintTextColor: null,
                                  ),
                      ),
                    ),
                  ),
                ):Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
