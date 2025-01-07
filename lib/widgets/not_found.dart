
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../core/utils/color_constant.dart';
import '../core/utils/image_constant.dart';
import '../core/utils/size_utils.dart';
import 'common_image_view.dart';
import 'custom_text.dart';


class NotFound extends StatelessWidget {
  String title;
  NotFound({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // CommonImageView(
        //   svgPath: ImageConstant.imgCadr168X220,
        //   height: getSize(
        //     200.00,
        //   ),
        //   width: getSize(
        //     250.00,
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: MyText(
            center: true,
            title: "No $title Found",
            fontSize: 14,
            clr: ColorConstant.hintTextColor,
          ),
        )
      ],
    );
  }
}
