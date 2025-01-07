import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/responsive.dart';
import '../theme/app_style.dart';

class CustomTextField2 extends StatefulWidget {
  String? fieldText;
  String? hintText;
  bool? isFinal;
  bool? enabled;
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
  double? nameWidth;
  TextEditingController? controller;
  TextInputType? keyboardType;
  FocusNode? focusNode;
  FocusNode? nextFocusNode;
  ValueChanged<String>? onFieldSubmitted;
  VoidCallback? onEditingComplete;
  Color? lableColor;
  Color? borderColor;
  double? lableFontSize;
  double? iconSize;
  double? iconHeight;
  Widget? prefixWidget;

  CustomTextField2({
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
    this.borderColor,
    this.lableFontSize,
    this.iconHeight,
    this.iconSize,
    this.showsuffix=true,
    this.prefixWidget,
  }) : super(key: key);

  @override
  _CustomTextField2State createState() => _CustomTextField2State();
}

class _CustomTextField2State extends State<CustomTextField2> {
  Responsive responsive = Responsive();

  String text = "";

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return GestureDetector(
      onTap: () {
        widget.onTap!();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: Container(
          // padding: EdgeInsets.only(
          //   top: 13.0,
          // ),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                  width: 1.0, color: widget.borderColor ?? ColorConstant.hintTextColor
              )
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  TextFormField(
                    textCapitalization: widget.isCaps!
                        ? TextCapitalization.sentences
                        : TextCapitalization.none,
                    obscureText: widget.isPassword!,
                    focusNode: widget.focusNode,
                    validator: widget.validator,
                    enabled: widget.enabled ?? false,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorColor: ColorConstant.hintTextColor,
                    controller: widget.controller,
                    keyboardType: widget.keyboardType,
                    maxLines: widget.maxLines ?? 1,
                    onChanged: (String newVal) {
                      if (newVal.startsWith(' ')) {
                        widget.controller!.text = '';
                      } else if (newVal.length <= widget.limit!) {
                        text = newVal;
                      } else {
                        widget.controller!.value = TextEditingValue(
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
                    style: AppStyle.txtPoppinsMedium18.copyWith(
                        fontSize: widget.lableFontSize ?? 13,
                        color:  ColorConstant.blackColor,
                        fontWeight: FontWeight.normal),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 10, right: 0, top: 15, bottom: 15),
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
                          color: ColorConstant.hintTextColor.withOpacity(0.5)),
                      alignLabelWithHint: true,
                      errorStyle: TextStyle(
                        // color: Theme.of(context).errorColor, // or any other color
                        height: 0// or any other color
                      ),
                      labelStyle: AppStyle.txtPoppinsMedium18.copyWith(
                          fontSize: widget.lableFontSize ?? 14,
                          color: widget.lableColor ?? ColorConstant.hintTextColor,
                          fontWeight: FontWeight.w400),
                      // contentPadding: EdgeInsets.only(left: 10,right: 10,bottom: 15),
                      errorBorder: InputBorder.none,
                      border: InputBorder.none,
                      enabledBorder:InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,

                    ),
                  ),


                  widget.showsuffix==true?
                  GestureDetector(
                    onTap: () {
                      widget.sufixIconOnTap!();
                      print('aerssss');
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 25),
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
      ),
    );
  }
}
