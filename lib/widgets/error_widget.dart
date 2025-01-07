import 'package:flutter/material.dart';
import 'package:salon_symphony/core/utils/color_constant.dart';
import 'package:salon_symphony/widgets/common_image_view.dart';
import 'package:salon_symphony/widgets/custom_text.dart';

import '../core/app_export.dart';
import '../core/utils/image_constant.dart';

class RecordDeletedWidget extends StatelessWidget {
  const RecordDeletedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonImageView(
                svgPath: ImageConstant.global_empty_fallback_icon,
                height: 100,
              ),
              SizedBox(
                height: 20,
              ),
              MyText(
                title: "This content no longer exists.",
                clr: ColorConstant.black900,
                fontSize: 16,
                height: 1.5,
                letterSpacing: 0.5,
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: (){
                  Get.offAllNamed(AppRoutes.dashboardRoute);
                },
                child: MyText(
                  title: "Home",
                  clr: ColorConstant.deepPurpleA201,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
