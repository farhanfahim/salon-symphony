import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/core/utils/color_constant.dart';
import 'package:salon_symphony/presentation/add_scheduale_screen/controller/add_schedule_controller.dart';
import 'package:salon_symphony/theme/app_style.dart';

import '../core/utils/utils.dart';

class TimePicker extends StatefulWidget {

  static const TOD_AM="AM",TOD_PM="PM";


  final double height;
  final double? width;
  final DateTime? initialTime;
   int intialHours;
  final String initialTimeStr;
  final void Function(String time) onSelectTime;
  TimePicker({Key? key,this.height=150,this.width,this.initialTime,
    required this.onSelectTime, this.intialHours = 9, required this.initialTimeStr}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TimePickerState();
  }

}

class _TimePickerState extends State<TimePicker>{

  static const TOD_LIST=[TimePicker.TOD_AM,TimePicker.TOD_PM];

  late String hour,min,tod;

  late FixedExtentScrollController hourScroll,minScroll,todScroll;

  @override
  void initState() {
    initializeTime();
    hourScroll=FixedExtentScrollController(initialItem: int.parse(hour)-1);
    minScroll=FixedExtentScrollController(initialItem: int.parse(min));
    todScroll=FixedExtentScrollController(initialItem: TOD_LIST.indexOf(tod));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    //widget.onSelectTime(getTime());
    super.didChangeDependencies();
  }

  String getTime(){
    return "$hour:$min $tod";
  }

  @override
  void dispose() {
    hourScroll.dispose();
    minScroll.dispose();
    todScroll.dispose();
    super.dispose();
  }

  void initializeTime(){
    // final DateTime date=widget.initialTime??DateTime.now();
    //final DateTime date = DateTime();
    // final String time=formatTime12(date.hour, date.minute);

    DateTime convertedTime = Utils.convertTime(widget.initialTimeStr, 00);
    widget.intialHours = convertedTime.hour;
    final String time = formatTime12(widget.intialHours,00);
    print("time: ${widget.intialHours}");
    final List<String> list1 = time.split(" ");
    final List<String> list2 = list1[0].split(":");
    hour = list2[0];
    // min = list2[1];
    min = getNum(convertedTime.minute);
    tod = list1[1];
  }

  @override
  Widget build(BuildContext context) {
    return Container(height: widget.height,width: widget.width,
      child: Row(children: [
        buildItem(count: 12,
            value: hour,increment: true,
            controller: hourScroll,
            onSelected: (val){
          setState(() {
            hour=val;
          });
          widget.onSelectTime(getTime());
        }),
        buildItem(count: 60,
            value: min,
            controller: minScroll,
            onSelected: (val){
          setState(() {
            min=val;
          });
          widget.onSelectTime(getTime());
        }),
        buildItem(list: TOD_LIST,
            value: tod,
            controller: todScroll,
            onSelected: (val){
          setState(() {
            tod=val;
          });
          widget.onSelectTime(getTime());
        })
      ],),
    );
  }

  Widget buildItem({
    FixedExtentScrollController? controller,
    List<String>? list,int? count,String? value,
    bool increment=false,
    required Function(String val) onSelected}){
    assert(list!=null || count!=null);
    return Expanded(
      child: CupertinoPicker.builder(
        scrollController: controller,
        itemExtent: 50,
          selectionOverlay:Container(),
        onSelectedItemChanged: (ind){
        final String value=list?[ind]??getNum(increment?(ind+1):ind);
        onSelected(value);
      },
        //selectionOverlay: Container(),
        itemBuilder: (con,ind){
          final String val=list?[ind]??getNum(increment?(ind+1):ind);
          final bool isSelected=(val==value);
          return Center(child: Text(val,
            style: TextStyle(color: isSelected?ColorConstant.black900:ColorConstant.gray600,
                 fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
             fontWeight: isSelected?FontWeight.w600:FontWeight.w400,
              fontSize: isSelected?getFontSize(24): getFontSize(20),
             // fontWeight: FontWeight.w
            ),
          ));
        },childCount: list?.length??count,),
    );
  }

  String getNum(int ind){
    return ind <= 9 ? "0$ind":"$ind";
  }

  String formatTime12(int hour, int min){
    String tod = TimePicker.TOD_AM;
    if(hour <= 0){
      hour = 12;
    }
    else if(hour == 12){
      tod = TimePicker.TOD_PM;
    }
    else if(hour>12){
      hour = hour-12;
      tod = TimePicker.TOD_PM;
    }
    return "${getNum(hour)}:${getNum(min)} ${tod}";
  }

}
