import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salon_symphony/core/app_export.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/responsive.dart';
import '../theme/app_style.dart';

class CustomTextField extends StatefulWidget {
  String? fieldText;
  String? hintText;
  bool? isFinal;
  bool? enabled;
  List<TextInputFormatter>? inputFormatters;
  FormFieldValidator<String>? validator;
  int? limit;
  int? maxLines;
  String? icon;
  String? suffixText;
  bool? showsuffix;
  bool? iconHinColor;
  Widget? postPixText;
  IconData? iconData;
  Function? sufixIconOnTap;
  Function? onTap;
  final Function(String)? onChanged;
  bool? isPassword;
  bool? isCaps;
  double? nameWidth;
  Rx<TextEditingController>? controller;
  TextInputType? keyboardType;
  FocusNode? focusNode;
  FocusNode? nextFocusNode;
  ValueChanged<String>? onFieldSubmitted;
  VoidCallback? onEditingComplete;
  Color? lableColor;
  double? lableFontSize;
  double? iconSize;
  double? iconHeight;
  Widget? prefixWidget;

  CustomTextField({
    Key? key,
    this.fieldText,
    this.hintText,
    this.isFinal,
    this.validator,
    this.enabled = true,
    this.isCaps = false,
    this.inputFormatters,
    this.onChanged,
    this.icon,
    this.suffixText,
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
    this.onEditingComplete,
    this.lableColor,
    this.lableFontSize,
    this.iconHeight,
    this.iconSize,
    this.showsuffix=true,
    this.prefixWidget,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
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
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
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
                  child: TextFormField(
                    textCapitalization: widget.isCaps!
                        ? TextCapitalization.sentences
                        : TextCapitalization.none,
                    obscureText: widget.isPassword!,
                    focusNode: widget.focusNode,
                    validator: widget.validator,
                    enabled: widget.enabled ?? false,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    onFieldSubmitted: (_) {
                      widget.isFinal!
                          ? FocusScope.of(context).unfocus()
                          : FocusScope.of(context)
                          .requestFocus(widget.nextFocusNode!);
                      setState(() {});
                    },
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
                    style:
                    AppStyle.txtPoppinsMedium18.copyWith(
                        fontSize: widget.lableFontSize ?? 13,
                        color: widget.lableColor ?? ColorConstant.blackColor,
                        fontWeight: FontWeight.normal,

                    ),
                    textAlignVertical: widget.focusNode!.hasPrimaryFocus || isNotEmpty.value? TextAlignVertical.bottom : null,
                    decoration: InputDecoration(
                      suffixText: widget.suffixText ?? null,
                      contentPadding: EdgeInsets.only(
                          left: 14, right: 0, top: 30, bottom: 10),
                      prefixIcon: widget.prefixWidget == null
                          ? null
                          : Padding(
                        padding: widget.prefixWidget == null
                            ? EdgeInsets.all(0.0)
                            : EdgeInsets.all(10.0),
                        child: widget.prefixWidget ?? null,
                      ),
                      // labelText: widget.fieldText,
                      hintText: widget.hintText,
                      hintStyle: TextStyle(
                        fontSize: 14,
                           fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                          color: ColorConstant.hintTextColor.withOpacity(0.8)),
                      alignLabelWithHint: true,
                      errorStyle: TextStyle(
                          color: Theme.of(context).errorColor,
                          height: 0// or any other color
                      ),
                      labelStyle: AppStyle.txtPoppinsMedium18.copyWith(
                          fontSize: widget.lableFontSize ?? 14,
                          color: widget.lableColor ?? ColorConstant.hintTextColor,
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

                Positioned(
                  top: 7,
                  left: 14,
                  child: Obx(
                      () => isFocus.value || isNotEmpty.value?
                      Text(
                        widget.fieldText!,
                        style:  AppStyle.txtPoppinsMedium18.copyWith(
                            fontSize: widget.lableFontSize ?? 14,
                            color:  isFocus.value || isNotEmpty.value? ColorConstant.primaryColor : ColorConstant.hintTextColor   ,
                             fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                            fontWeight: FontWeight.w400)
                    ) : Container(),
                  ),
                ),
                widget.showsuffix==true?
                GestureDetector(
                  onTap: () {
                    widget.sufixIconOnTap!();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 13, right: 5),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          widget.sufixIconOnTap!();
                        },
                        child: Container(
                          width: widget.iconSize ?? 38.0,
                          height: 33.0,
                          margin: EdgeInsets.only(left: 5, right: 0),
                          padding: EdgeInsets.only(
                              right: 12.0, bottom: 5, top: 2 /* top:15.0*/
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
                            color: ColorConstant.hintTextColor,
                          )
                              : SvgPicture.asset(
                            widget.icon!,
                            matchTextDirection: true,
                            fit: BoxFit.fill,
                            color: widget.iconHinColor == true ? ColorConstant.hintTextColor:null,
                          ),
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
