import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_symphony/widgets/custom_text.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_style.dart';
import '../../widgets/common_image_view.dart';

class SearchTeamScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF7F8FA),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
        child: SingleChildScrollView(
            child: Padding(
              padding: getPadding(left: 15, right: 15),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  children: [
                   MyText(title: 'Search results will appear here.',
                   clr: Color(0xFF7F7F88),
                   fontSize: 14,
                   )
                  ]),
            )),
      ),
    );
  }
}
