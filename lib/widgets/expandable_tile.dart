import 'dart:io';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/size_utils.dart';

class Expandable_tile extends StatefulWidget {
String title;
Widget  collapseChild;
// ExpandableController? controller;
  Expandable_tile({required this.title,required this.collapseChild});

  @override
  State<Expandable_tile> createState() => _Expandable_tileState();
}



class _Expandable_tileState extends State<Expandable_tile> {

ExpandableController expandableController = ExpandableController();
bool isExpanded = true;


  @override
  void initState() {
    super.initState();
    expandableController.toggle();
    expandableController.addListener(() {
      expandableController.expanded? isExpanded = true: isExpanded = false;
      print("isExpanded $isExpanded");
      setState(() {

      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent,splashFactory: NoSplash.splashFactory),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 15.0),
        child: ExpandablePanel(
          theme:   ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            tapBodyToCollapse: true,
            animationDuration: Duration(milliseconds: 001),
            expandIcon: CupertinoIcons.chevron_down,
            iconSize: 20,
            iconRotationAngle: 3.14/2,
            iconPadding: EdgeInsets.only(right: 15, top: 10, bottom: 10),
            iconColor:isExpanded == false ? ColorConstant.primaryColor: Color(0xFF7F7F88),
            collapseIcon: CupertinoIcons.chevron_right,
          ),
          header: Padding(
            padding:  EdgeInsets.only(left: 15.0),
            child: Text(widget.title ,style: TextStyle(
              color: isExpanded == false ? ColorConstant.primaryColor:ColorConstant.black900,
              fontSize: getFontSize(
                14,
              ),
               fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
              fontWeight: FontWeight.w600,
            ),),
          ),
          controller:expandableController,
          collapsed: widget.collapseChild,
          expanded:Container() ,

        ),
      ),
    );
  }
}
