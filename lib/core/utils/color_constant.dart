import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color bluegray10090 = fromHex('#90cfcfcf');

  static Color blueA400 = fromHex('#1877f2');

  static Color blueA2005e = fromHex('#5e3f87e1');

  static Color deepPurple400 = fromHex('#6957d6');
  static Color lightPurple = Color(0xffF2F1FD);

  static Color blueA200 = fromHex('#3a81eb');

  static Color black90087 = fromHex('#87000000');

  static Color deepPurple40018 = fromHex('#186d5dd3');

  static Color black90000 = fromHex('#00000000');

  static Color deepPurpleA201 = fromHex('#7b68ee');

  static Color pink500 = fromHex('#f82058');

  static Color deepPurpleA200 = fromHex('#7a68ee');

  static Color deepPurpleA20063 = fromHex('#637b68ee');

  static Color pink300 = fromHex('#ff519a');

  static Color pink100 = fromHex('#f2a7cb');

  static Color deepPurpleA20067 = fromHex('#677b68ee');

  static Color gray600 = fromHex('#707070');

  static Color black9004c = fromHex('#4c000000');

  static Color gray601 = fromHex('#707581');

  static Color black9000a = fromHex('#0a000000');

  static Color pink50 = fromHex('#ffe2ee');

  static Color gray400 = fromHex('#bcbcbc');

  static Color redA200 = fromHex('#ff5a4e');

  static Color gray602 = fromHex('#7c7c7e');

  static Color gray80099 = fromHex('#993c3c43');

  static Color gray200 = fromHex('#f1f0f0');
  static Color graybg = fromHex('#f1f3f6');

  static Color gray201 = fromHex('#ebeced');

  static Color bluegray401 = fromHex('#888888');

  static Color bluegray400 = fromHex('#817a8e');

  static Color black90019 = fromHex('#19000000');

  static Color whiteA701 = fromHex('#ffffff');

  static Color whiteA700 = fromHex('#ffffff');

  static Color whiteA702 = fromHex('#ffffff');

  static Color bluegray4003f = fromHex('#3f898989');

  static Color lightGreen100 = fromHex('#d3ffd3');

  static Color indigoA200 = fromHex('#5b4fe9');

  static Color green801 = fromHex('#12ad14');

  static Color deepPurpleA2006c = fromHex('#6c7b68ee');

  static Color green800 = fromHex('#00b000');

  static Color deepPurple100 = fromHex('#d1c9ff');

  static Color green600 = fromHex('#27ae60');

  static Color red100 = fromHex('#ffd3d3');

  static Color pinkA200 = fromHex('#f63d8b');

  static Color black900 = fromHex('#000000');

  static Color black901 = fromHex('#060910');

  static Color pink401 = fromHex('#d53692');

  static Color deepPurpleA100 = fromHex('#a296f4');

  static Color gray903 = fromHex('#11052c');

  static Color pink402 = fromHex('#f75274');

  static Color deepPurpleA101 = fromHex('#b0a4fc');

  static Color pink400 = fromHex('#df3c80');

  static Color purple400 = fromHex('#8f39ce');

  static Color gray501 = fromHex('#a7a7a7');

  static Color gray60087 = fromHex('#87707070');

  static Color gray301 = fromHex('#e6e6e6');
  static Color gray7F7F88 = fromHex('#7F7F88');
  static Color stickyBorderColor = fromHex('#CFCFCF');

  static Color gray500 = fromHex('#979797');

  static Color gray901 = fromHex('#0a1629');

  static Color gray902 = fromHex('#242424');

  static Color indigo50 = fromHex('#e6e4f2');

  static Color gray900 = fromHex('#1a1d24');

  static Color bluegray100 = fromHex('#cfcfcf');

  static Color amber200 = fromHex('#fbe18a');

  static Color gray101 = fromHex('#f3f1ff');
  static Color gray102 = fromHex('#A8A8A8');

  static Color gray300 = fromHex('#e5e4e4');
  static Color gray350 = fromHex('#c3c6ce');

  static Color orange300 = fromHex('#fcbb45');

  static Color gray100 = fromHex('#f2f2f2');

  static Color bluegray900 = fromHex('#363636');

  static Color cyan300 = fromHex('#50d8cd');

  static Color bluegray102 = fromHex('#d5d5d7');

  static Color bluegray101 = fromHex('#d9d9d9');

  static Color hintTextColor =  Color(0xff89889B);
  static Color pink =  Color(0xffF82058);

  static Color darkHintTextColor =  Color(0xff717171);

  static Color blackColor =  Colors.black;

  static Color primaryColor =  Color(0xff7B68EE);
  static Color abc =  Color(0xFF7B68EE).withOpacity(0.2);

  static Color errorColor = Colors.red;

  static Color success = Colors.green;

  static Color appPinkColor = Color(0xffFF519A);
  static Color seperateColor = Color(0xffF6F7FB);

  static Color appAquaColor = Color(0xff50D8CD);

  static Color backgroundColor = Color(0xFFFFFFFF);
  static Color backgroundColor2 = Color(0xFFEFEFEF);
  static Color red = Color(0xffF82058);

  static  Color appDescriptionTextColor = Color(0xFFA7A7A7);
  static  Color hyperLinkColor = Color(0xFFfff);

  Color dividerColor = Color(0xFFF2F2F2);

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
