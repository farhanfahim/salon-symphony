import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:salon_symphony/core/app_export.dart';

class CustomSwitch extends StatelessWidget {
  CustomSwitch({this.alignment, this.margin, this.value, this.onChanged});

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  bool? value;

  Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildSwitchWidget(),
          )
        : _buildSwitchWidget();
  }

  _buildSwitchWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Transform.scale(
        scale: 0.8,
        child: CupertinoSwitch(
          value: value ?? false,
        /*  height: getHorizontalSize(22),
          width: getHorizontalSize(36),
          toggleSize: 19.25,
          borderRadius: getHorizontalSize(
            11.00,
          ),*/
          activeColor: ColorConstant.deepPurpleA201,
          // activeToggleColor: ColorConstant.whiteA701,
          // inactiveColor: ColorConstant.bluegray100,
          // inactiveToggleColor: ColorConstant.whiteA701,
           onChanged: (value) {
          onChanged!(value);
        },
        ),
      ),
    );
  }
}
