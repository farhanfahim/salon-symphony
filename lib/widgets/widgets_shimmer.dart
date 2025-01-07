import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/skeleton.dart';

import '../core/utils/responsive.dart';
import '../core/utils/utils.dart';

Widget restaurantTileShimmer() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
    margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          offset: const Offset(1, 2),
          blurRadius: 10,
        )
      ],
    ),
    child: Row(
      children: [
        SizedBox(width: 80.0, height: 80.0, child: Skeleton()),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 150.0, height: 20.0, child: Skeleton()),
              const SizedBox(
                height: 5.0,
              ),
              SizedBox(width: 100.0, height: 20.0, child: Skeleton()),
              const SizedBox(
                height: 5.0,
              ),
              SizedBox(width: 100.0, height: 20.0, child: Skeleton()),
            ],
          ),
        ),
      ],
    ),
  );
}
Widget showShimmer() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 60.0,
          width: 60.0,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: ClipOval(child: Skeleton()),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 150.0,
              height: 15.0,
              child: Skeleton(),
            ),
            const SizedBox(
              height: 5.0,
            ),
            SizedBox(
              width: 100.0,
              height: 15.0,
              child: Skeleton(),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget restaurantDetailShimmer() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
    margin: const EdgeInsets.symmetric(
      vertical: 5.0,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          offset: const Offset(1, 2),
          blurRadius: 10,
        )
      ],
    ),
    child: Row(
      children: [
        SizedBox(width: 80.0, height: 80.0, child: Skeleton()),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 150.0, height: 20.0, child: Skeleton()),
                  SizedBox(width: 40.0, height: 20.0, child: Skeleton()),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              SizedBox(width: 100.0, height: 20.0, child: Skeleton()),
              const SizedBox(
                height: 5.0,
              ),
              SizedBox(width: 100.0, height: 20.0, child: Skeleton()),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget checkedInUserShimmer() {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        child: Row(
          children: [
            SizedBox(width: 40.0, height: 40.0, child: Skeleton()),
            const SizedBox(
              width: 20.0,
            ),
            SizedBox(width: 150.0, height: 20.0, child: Skeleton()),
            const Spacer(),
            SizedBox(width: 40.0, height: 20.0, child: Skeleton()),
          ],
        ),
      ),
    ],
  );
}

Widget faqsSkeleton() {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 120.0,
                    height: 15.0,
                    child: Skeleton(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 200.0,
                    height: 15.0,
                    child: Skeleton(),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            SizedBox(
              width: 80.0,
              height: 15.0,
              child: Skeleton(),
            ),
          ],
        ),
      ),
      Container(
        height: 0.5,
        color: ColorConstant.hintTextColor.withOpacity(0.5),
      ),
    ],
  );
}

Widget userTileSkeleton() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 40.0,
                height: 40.0,
                child: Skeleton(),
              ),
              const SizedBox(
                width: 10.0,
              ),
              SizedBox(
                width: 200.0,
                height: 20.0,
                child: Skeleton(),
              ),
            ],
          ),
        ),
        Container(
          height: 0.5,
          color: ColorConstant.hintTextColor.withOpacity(0.5),
        ),
      ],
    ),
  );
}

Widget shimmerPagesTile(context) {
  Responsive responsive = Responsive();
  responsive.setContext(context);
  return Container(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: responsive.setWidth(40), height: 20.0, child: Skeleton()),
        SizedBox(
          height: responsive.setHeight(2),
        ),
        Container(
          height: responsive.setHeight(12),
          width: responsive.setWidth(100),
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Container(
                    width: responsive.setWidth(17),
                    height: responsive.setHeight(7),
                    child: Skeleton()),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Container(
                    width: responsive.setWidth(17),
                    height: responsive.setHeight(7),
                    child: Skeleton()),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Container(
                    width: responsive.setWidth(17),
                    height: responsive.setHeight(7),
                    child: Skeleton()),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Container(
                    width: responsive.setWidth(17),
                    height: responsive.setHeight(7),
                    child: Skeleton()),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Container(
                    width: responsive.setWidth(17),
                    height: responsive.setHeight(7),
                    child: Skeleton()),
              ),
            ],
          ),
        ),
        SizedBox(
          height: responsive.setHeight(5),
        ),
        Row(
          children: [
            Container(
                width: responsive.setWidth(8),
                height: responsive.setHeight(4),
                child: Skeleton(
                  cornerRadius: 100,
                )),
            SizedBox(
              width: responsive.setWidth(3),
            ),
            Container(
                width: responsive.setWidth(70),
                height: 30.0,
                child: Skeleton()),
          ],
        ),
        SizedBox(
          height: responsive.setHeight(3),
        ),
        Row(
          children: [
            Container(
                width: responsive.setWidth(8),
                height: responsive.setHeight(4),
                child: Skeleton(
                  cornerRadius: 100,
                )),
            SizedBox(
              width: responsive.setWidth(3),
            ),
            Container(
                width: responsive.setWidth(70),
                height: 30.0,
                child: Skeleton()),
          ],
        ),
        SizedBox(
          height: responsive.setHeight(3),
        ),
        Row(
          children: [
            Container(
                width: responsive.setWidth(8),
                height: responsive.setHeight(4),
                child: Skeleton(
                  cornerRadius: 100,
                )),
            SizedBox(
              width: responsive.setWidth(3),
            ),
            Container(
                width: responsive.setWidth(70),
                height: 30.0,
                child: Skeleton()),
          ],
        ),
      ],
    ),
  );
}

Widget shimmerTaskPage(context) {
  Responsive responsive = Responsive();
  responsive.setContext(context);
  return Column(
    // mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
        height: 10,
      ),
      Container(
        color: ColorConstant.backgroundColor,
        // width: MediaQuery.of(context).size.width,
        // height: responsive.setHeight(8.5),
        child: Skeleton(switcholor: true,width: 100,),
      ),
      SizedBox(
        height: 30,
      ),

      Container(
        color: Color(0xffF6F7FB),
        height: 15,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Skeleton(switcholor: true,width: 100,),
                  Spacer(),
                  Skeleton(switcholor: true,width: 100,),
                ],
              ),
              SizedBox(
                  height: 5
              ),
              Divider(),
              SizedBox(
                  height: 5
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Skeleton(switcholor: true,width: 100,),
                  Spacer(),
                  Skeleton(switcholor: true,width: 100,),
                ],
              ),
              SizedBox(
                  height: 5
              ),
              Divider(),
              SizedBox(
                  height: 5
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Skeleton(switcholor: true,width: 100,),
                  Spacer(),
                  Skeleton(switcholor: true,width: 100,),
                ],
              ),
              SizedBox(
                  height: 5
              ),
              Divider(),
              SizedBox(
                  height: 5
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Skeleton(switcholor: true,width: 100,),
                  Spacer(),
                  Skeleton(switcholor: true,width: 100,),
                ],
              ),
              SizedBox(
                height: responsive.setHeight(5),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(
                      //   width: responsive.setWidth(5),
                      // ),
                      Skeleton(switcholor: true,width: 350,height: 40,),

                    ],
                  ),
                  SizedBox(
                    height: responsive.setHeight(2),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Container(
        color: Color(0xffF6F7FB),
        height: 15,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Skeleton(switcholor: true,),
              SizedBox(
                height: 10,
              ),
              Skeleton(switcholor: true,),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      )
    ],
  );
}

Widget notificationNoLinkShimmer(context){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 25),
        child: Container( width: 200, height: 20, child: Skeleton(switcholor: true,)),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 0.0,top: 10.0,left: 25,right: 25),
        child: Container( width: double.maxFinite, height: 20, child: Skeleton(switcholor: true,)),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 10.0,top: 10.0,left: 25,right: 25),
        child: Container( width: double.maxFinite, height: 20, child: Skeleton(switcholor: true,)),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 25),
        child: Container( width: 200, height: 20, child: Skeleton(switcholor: true,)),
      ),

      SizedBox(
        height: 5,
      ),
      Divider(),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 25),
        child: Container( width: 200, height: 20, child: Skeleton(switcholor: true,)),
      ),
    ],
  );
}

Widget shimmerUserProfile(context) {
  Responsive responsive = Responsive();
  responsive.setContext(context);
  return Container(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: responsive.setHeight(2),
        ),
        Container(
          width: responsive.setWidth(100),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              children: [
                Container(
                    width: responsive.setHeight(13),
                    height: responsive.setHeight(13),
                    child: Skeleton(
                      cornerRadius: 100,
                    )),
                SizedBox(
                  height: responsive.setHeight(1),
                ),
                Container(
                    width: responsive.setWidth(30),
                    height: 20.0,
                    child: Skeleton()),
                SizedBox(
                  height: responsive.setHeight(0.5),
                ),
                Container(
                    width: responsive.setWidth(50),
                    height: 20.0,
                    child: Skeleton()),
                SizedBox(
                  height: responsive.setHeight(0.5),
                ),
                Container(
                    width: responsive.setWidth(35),
                    height: 20.0,
                    child: Skeleton()),
              ],
            ),
          ),
        ),
        SizedBox(
          height: responsive.setHeight(2),
        ),
        Divider(),
        SizedBox(
          height: responsive.setHeight(2),
        ),
        Container(
            width: responsive.setWidth(100), height: 30.0, child: Skeleton()),
        SizedBox(
          height: responsive.setHeight(2),
        ),
        Container(
            width: responsive.setWidth(100), height: 30.0, child: Skeleton()),
        SizedBox(
          height: responsive.setHeight(2),
        ),
        Container(
            width: responsive.setWidth(100), height: 30.0, child: Skeleton()),
        SizedBox(
          height: responsive.setHeight(2),
        ),
        Container(
            width: responsive.setWidth(100), height: 30.0, child: Skeleton()),
        SizedBox(
          height: responsive.setHeight(2),
        ),
        Container(
            width: responsive.setWidth(100), height: 30.0, child: Skeleton()),
        SizedBox(
          height: responsive.setHeight(2),
        ),
        Container(
            width: responsive.setWidth(100), height: 30.0, child: Skeleton()),
        SizedBox(
          height: responsive.setHeight(2),
        ),
        Container(
            width: responsive.setWidth(100), height: 30.0, child: Skeleton()),
        SizedBox(
          height: responsive.setHeight(2),
        ),
      ],
    ),
  );
}

Widget shimmerTermsAndPolicy(context) {
  Responsive responsive = Responsive();
  responsive.setContext(context);
  return Container(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: double.maxFinite, height: 20.0, child: Skeleton()),
        SizedBox(
          height: responsive.setHeight(0.5),
        ),
        Container(width: double.maxFinite, height: 20.0, child: Skeleton()),
        SizedBox(
          height: responsive.setHeight(0.5),
        ),
        Container(width: double.maxFinite, height: 20.0, child: Skeleton()),
        SizedBox(
          height: responsive.setHeight(0.5),
        ),
        Container(
            width: responsive.setWidth(40), height: 20.0, child: Skeleton()),
        SizedBox(
          height: responsive.setHeight(0.5),
        ),
        Container(width: double.maxFinite, height: 20.0, child: Skeleton()),
        SizedBox(
          height: responsive.setHeight(0.5),
        ),
        Container(width: double.maxFinite, height: 20.0, child: Skeleton()),
        SizedBox(
          height: responsive.setHeight(0.5),
        ),
        Container(
            width: responsive.setWidth(50), height: 20.0, child: Skeleton()),
        SizedBox(
          height: responsive.setHeight(0.5),
        ),
        Container(width: double.maxFinite, height: 20.0, child: Skeleton()),
        SizedBox(
          height: responsive.setHeight(0.5),
        ),
        Container(width: double.maxFinite, height: 20.0, child: Skeleton()),
        SizedBox(
          height: responsive.setHeight(0.5),
        ),
        Container(width: double.maxFinite, height: 15.0, child: Skeleton()),
        SizedBox(
          height: responsive.setHeight(0.5),
        ),
        Container(width: double.maxFinite, height: 20.0, child: Skeleton()),
        SizedBox(
          height: responsive.setHeight(0.5),
        ),
        Container(width: double.maxFinite, height: 20.0, child: Skeleton()),
        SizedBox(
          height: responsive.setHeight(0.5),
        ),
        Container(width: double.maxFinite, height: 20.0, child: Skeleton()),
        SizedBox(
          height: responsive.setHeight(0.5),
        ),
        Container(
            width: responsive.setWidth(40), height: 20.0, child: Skeleton()),
        SizedBox(
          height: responsive.setHeight(0.5),
        ),
        Container(width: double.maxFinite, height: 20.0, child: Skeleton()),
        SizedBox(
          height: responsive.setHeight(0.5),
        ),
        Container(width: double.maxFinite, height: 20.0, child: Skeleton()),
        SizedBox(
          height: responsive.setHeight(0.5),
        ),
        Container(
            width: responsive.setWidth(50), height: 20.0, child: Skeleton()),
        SizedBox(
          height: responsive.setHeight(0.5),
        ),
        Container(width: double.maxFinite, height: 20.0, child: Skeleton()),
        SizedBox(
          height: responsive.setHeight(0.5),
        ),
        Container(width: double.maxFinite, height: 20.0, child: Skeleton()),
        SizedBox(
          height: responsive.setHeight(0.5),
        ),
        Container(width: double.maxFinite, height: 15.0, child: Skeleton()),
      ],
    ),
  );
}

Widget educationHours(context) {
  Responsive responsive = Responsive();
  responsive.setContext(context);
  return Column(
    children: [
      Container(
        margin: getMargin(
          top: 8.0,
          bottom: 8.0,
        ),
        padding: getPadding(
          left: 13,
          top: 12,
          right: 13,
          bottom: 12,
        ),
        decoration: AppDecoration.outlineGray3012.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: getPadding(
                left: 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: getPadding(
                        top: 5,
                      ),
                      child: Container(
                          width: 80,
                          height: 15.0,
                          child: Skeleton(
                            switcholor: true,
                          ))),
                ],
              ),
            ),
            Padding(
                padding: getPadding(
                  left: 2,
                  top: 1,
                ),
                child: Container(
                    width: 120,
                    height: 15.0,
                    child: Skeleton(
                      switcholor: true,
                    ))),
            Padding(
              padding: getPadding(
                left: 2,
                top: 9,
                right: 79,
                bottom: 7,
              ),
              child: Row(
                children: [
                  CommonImageView(
                    svgPath: ImageConstant.imgComputer24X24,
                    height: getSize(
                      18.00,
                    ),
                    width: getSize(
                      18.00,
                    ),
                    margin: getMargin(
                      bottom: 1,
                    ),
                  ),
                  Padding(
                      padding: getPadding(
                        left: 8,
                        top: 1,
                      ),
                      child: Container(
                          width: 40,
                          height: 15.0,
                          child: Skeleton(
                            switcholor: true,
                          ))),
                  Spacer(),
                  CommonImageView(
                    svgPath: ImageConstant.imgClock,
                    height: getSize(
                      19.00,
                    ),
                    width: getSize(
                      19.00,
                    ),
                  ),
                  Padding(
                      padding: getPadding(
                        left: 6,
                      ),
                      child: Container(
                          width: 40,
                          height: 15.0,
                          child: Skeleton(
                            switcholor: true,
                          ))),
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: getMargin(
          top: 8.0,
          bottom: 8.0,
        ),
        padding: getPadding(
          left: 13,
          top: 12,
          right: 13,
          bottom: 12,
        ),
        decoration: AppDecoration.outlineGray3012.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: getPadding(
                left: 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: getPadding(
                        top: 5,
                      ),
                      child: Container(
                          width: 80,
                          height: 15.0,
                          child: Skeleton(
                            switcholor: true,
                          ))),
                ],
              ),
            ),
            Padding(
                padding: getPadding(
                  left: 2,
                  top: 1,
                ),
                child: Container(
                    width: 120,
                    height: 15.0,
                    child: Skeleton(
                      switcholor: true,
                    ))),
            Padding(
              padding: getPadding(
                left: 2,
                top: 9,
                right: 79,
                bottom: 7,
              ),
              child: Row(
                children: [
                  CommonImageView(
                    svgPath: ImageConstant.imgComputer24X24,
                    height: getSize(
                      18.00,
                    ),
                    width: getSize(
                      18.00,
                    ),
                    margin: getMargin(
                      bottom: 1,
                    ),
                  ),
                  Padding(
                      padding: getPadding(
                        left: 8,
                        top: 1,
                      ),
                      child: Container(
                          width: 40,
                          height: 15.0,
                          child: Skeleton(
                            switcholor: true,
                          ))),
                  Spacer(),
                  CommonImageView(
                    svgPath: ImageConstant.imgClock,
                    height: getSize(
                      19.00,
                    ),
                    width: getSize(
                      19.00,
                    ),
                  ),
                  Padding(
                      padding: getPadding(
                        left: 6,
                      ),
                      child: Container(
                          width: 40,
                          height: 15.0,
                          child: Skeleton(
                            switcholor: true,
                          ))),
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: getMargin(
          top: 8.0,
          bottom: 8.0,
        ),
        padding: getPadding(
          left: 13,
          top: 12,
          right: 13,
          bottom: 12,
        ),
        decoration: AppDecoration.outlineGray3012.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: getPadding(
                left: 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: getPadding(
                        top: 5,
                      ),
                      child: Container(
                          width: 80,
                          height: 15.0,
                          child: Skeleton(
                            switcholor: true,
                          ))),
                ],
              ),
            ),
            Padding(
                padding: getPadding(
                  left: 2,
                  top: 1,
                ),
                child: Container(
                    width: 120,
                    height: 15.0,
                    child: Skeleton(
                      switcholor: true,
                    ))),
            Padding(
              padding: getPadding(
                left: 2,
                top: 9,
                right: 79,
                bottom: 7,
              ),
              child: Row(
                children: [
                  CommonImageView(
                    svgPath: ImageConstant.imgComputer24X24,
                    height: getSize(
                      18.00,
                    ),
                    width: getSize(
                      18.00,
                    ),
                    margin: getMargin(
                      bottom: 1,
                    ),
                  ),
                  Padding(
                      padding: getPadding(
                        left: 8,
                        top: 1,
                      ),
                      child: Container(
                          width: 40,
                          height: 15.0,
                          child: Skeleton(
                            switcholor: true,
                          ))),
                  Spacer(),
                  CommonImageView(
                    svgPath: ImageConstant.imgClock,
                    height: getSize(
                      19.00,
                    ),
                    width: getSize(
                      19.00,
                    ),
                  ),
                  Padding(
                      padding: getPadding(
                        left: 6,
                      ),
                      child: Container(
                          width: 40,
                          height: 15.0,
                          child: Skeleton(
                            switcholor: true,
                          ))),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget flashCard(context) {
  Responsive responsive = Responsive();
  responsive.setContext(context);
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            margin: getMargin(
              top: 16.0,
              bottom: 8.0,
            ),
            decoration: AppDecoration.outlineBlack9000a.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: getVerticalSize(
                      180.00,
                    ),
                    width: getHorizontalSize(
                      363.00,
                    ),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Skeleton(
                          height: getVerticalSize(
                            180.00,
                          ),
                          width: getHorizontalSize(
                            363.00,
                          ),
                          cornerRadius: 10,
                          switcholor: true,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Container(
                      width: 100,
                      height: 15.0,
                      child: Skeleton(
                        switcholor: true,
                      )),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  child: Container(
                      width: 180,
                      height: 15.0,
                      child: Skeleton(
                        switcholor: true,
                      )),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  child: Container(
                      width: 200,
                      height: 10.0,
                      child: Skeleton(
                        switcholor: true,
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, bottom: 20, right: 20),
                  child: Row(
                    children: [
                      Container(
                          width: 20,
                          height: 15.0,
                          child: Skeleton(
                            switcholor: true,
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                          width: 80,
                          height: 15.0,
                          child: Skeleton(
                            switcholor: true,
                          )),
                      Spacer(),
                      Container(
                          width: 20,
                          height: 15.0,
                          child: Skeleton(
                            switcholor: true,
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                          width: 20,
                          height: 15.0,
                          child: Skeleton(
                            switcholor: true,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            margin: getMargin(
              top: 8.0,
              bottom: 8.0,
            ),
            decoration: AppDecoration.outlineBlack9000a.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: getVerticalSize(
                      180.00,
                    ),
                    width: getHorizontalSize(
                      363.00,
                    ),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Skeleton(
                          height: getVerticalSize(
                            180.00,
                          ),
                          width: getHorizontalSize(
                            363.00,
                          ),
                          cornerRadius: 10,
                          switcholor: true,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Container(
                      width: 100,
                      height: 15.0,
                      child: Skeleton(
                        switcholor: true,
                      )),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  child: Container(
                      width: 180,
                      height: 15.0,
                      child: Skeleton(
                        switcholor: true,
                      )),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  child: Container(
                      width: 200,
                      height: 10.0,
                      child: Skeleton(
                        switcholor: true,
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, bottom: 20, right: 20),
                  child: Row(
                    children: [
                      Container(
                          width: 20,
                          height: 15.0,
                          child: Skeleton(
                            switcholor: true,
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                          width: 80,
                          height: 15.0,
                          child: Skeleton(
                            switcholor: true,
                          )),
                      Spacer(),
                      Container(
                          width: 20,
                          height: 15.0,
                          child: Skeleton(
                            switcholor: true,
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                          width: 20,
                          height: 15.0,
                          child: Skeleton(
                            switcholor: true,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            margin: getMargin(
              top: 8.0,
              bottom: 8.0,
            ),
            decoration: AppDecoration.outlineBlack9000a.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: getVerticalSize(
                      180.00,
                    ),
                    width: getHorizontalSize(
                      363.00,
                    ),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Skeleton(
                          height: getVerticalSize(
                            180.00,
                          ),
                          width: getHorizontalSize(
                            363.00,
                          ),
                          cornerRadius: 10,
                          switcholor: true,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Container(
                      width: 100,
                      height: 15.0,
                      child: Skeleton(
                        switcholor: true,
                      )),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  child: Container(
                      width: 180,
                      height: 15.0,
                      child: Skeleton(
                        switcholor: true,
                      )),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  child: Container(
                      width: 200,
                      height: 10.0,
                      child: Skeleton(
                        switcholor: true,
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, bottom: 20, right: 20),
                  child: Row(
                    children: [
                      Container(
                          width: 20,
                          height: 15.0,
                          child: Skeleton(
                            switcholor: true,
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                          width: 80,
                          height: 15.0,
                          child: Skeleton(
                            switcholor: true,
                          )),
                      Spacer(),
                      Container(
                          width: 20,
                          height: 15.0,
                          child: Skeleton(
                            switcholor: true,
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                          width: 20,
                          height: 15.0,
                          child: Skeleton(
                            switcholor: true,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
Widget documentShimmer(context) {
  Responsive responsive = Responsive();
  responsive.setContext(context);
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: getPadding(
              left: 13,
              top: 15,
              bottom: 15,
            ),
            child: Skeleton(height:40,width:40,cornerRadius:0,switcholor: true,),
          ),
          Expanded(
            child: Padding(
              padding: getPadding(
                left: 13,
                top: 22,
                bottom: 5,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Skeleton(height:15,width:150,cornerRadius:0,switcholor: true,),
                  Padding(
                    padding: getPadding(
                      top: 4,
                      right: 10,
                    ),
                    child: Skeleton(height:15,width:100,cornerRadius:0,switcholor: true,),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    ],
  );
}

Widget tabShimmer() {
  return Padding(
    padding: const EdgeInsets.only(top: 3.0, bottom: 5.0, left: 15),
    child: Row(
      children: [
        // SizedBox(
        //   width: 15,
        // ),
        Skeleton(
          height: 35,
          width: 50,
          cornerRadius: 50,
          switcholor: true,
        ),
        SizedBox(
          width: 10,
        ),
        Skeleton(
          height: 35,
          width: 100,
          cornerRadius: 50,
          switcholor: true,
        ),
        SizedBox(
          width: 10,
        ),
        Skeleton(
          height: 35,
          width: 80,
          cornerRadius: 50,
          switcholor: true,
        ),
        SizedBox(
          width: 10,
        ),
        Skeleton(
          height: 35,
          width: 70,
          cornerRadius: 50,
          switcholor: true,
        ),
      ],
    ),
  );
}

Widget requestDetailShimmer() {
  return Column(
    children: [
      Container(
          // width: getHorizontalSize(343.00),
          padding: getPadding(left: 10, top: 5, right: 10),
          decoration: AppDecoration.outlineBlack9000a1
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: getPadding(left: 5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100.0,
                            height: 15.0,
                            child: Skeleton(
                              switcholor: true,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: SizedBox(
                                width: 100.0,
                                height: 15.0,
                                child: Skeleton(
                                  switcholor: true,
                                ),
                              ))
                        ])),
                Padding(
                    padding: getPadding(left: 5, top: 4),
                    child: SizedBox(
                      width: 100.0,
                      height: 15.0,
                      child: Skeleton(
                        switcholor: true,
                      ),
                    )),
                SizedBox(
                  height: 20,
                )
              ])),
      Container(
        margin: getMargin(top: 15),
        padding: getPadding(left: 17, top: 30, right: 17, bottom: 36),
        decoration: AppDecoration.outlineBlack9000a1.copyWith(
            // borderRadius: BorderRadiusStyle.roundedBorder10
            ),
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100.0,
                    height: 15.0,
                    child: Skeleton(
                      switcholor: true,
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 100.0,
                    height: 15.0,
                    child: Skeleton(
                      switcholor: true,
                    ),
                  )
                ]),
            SizedBox(
              height: 20,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100.0,
                    height: 15.0,
                    child: Skeleton(
                      switcholor: true,
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 100.0,
                    height: 15.0,
                    child: Skeleton(
                      switcholor: true,
                    ),
                  )
                ]),
            SizedBox(
              height: 20,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100.0,
                    height: 15.0,
                    child: Skeleton(
                      switcholor: true,
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 100.0,
                    height: 15.0,
                    child: Skeleton(
                      switcholor: true,
                    ),
                  )
                ]),
            SizedBox(
              height: 20,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100.0,
                    height: 15.0,
                    child: Skeleton(
                      switcholor: true,
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 100.0,
                    height: 15.0,
                    child: Skeleton(
                      switcholor: true,
                    ),
                  )
                ]),
          ],
        ),
      ),
    ],
  );
}

Widget profileShimmer() {
  return Column(
    children: [
      Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: getPadding(left: 26, right: 26),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Skeleton(
                        switcholor: true,
                        cornerRadius: getHorizontalSize(32.50),
                        height: getSize(65.00),
                        width: getSize(65.00),
                      ),
                      Padding(
                          padding: getPadding(left: 12, top: 16, bottom: 10),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Skeleton(
                                    switcholor: true,
                                    height: getSize(15.00),
                                    width: 100)
                              ]))
                    ])),
            SizedBox(height: 20),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                      padding:
                          getPadding(left: 26, top: 11, right: 26, bottom: 9),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CommonImageView(
                                svgPath: ImageConstant.imgStar,
                                height: getSize(30.00),
                                width: getSize(30.00)),
                            Padding(
                                padding:
                                    getPadding(left: 15, top: 11, bottom: 12),
                                child: Text("lbl_total_points".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsMedium16
                                        .copyWith(letterSpacing: 0.36)))
                          ])),
                  Padding(
                      padding: getPadding(top: 23, right: 26, bottom: 20),
                      child: Skeleton(
                          switcholor: true, height: getSize(15.00), width: 50))
                ]),
            Container(
                height: getVerticalSize(1.00),
                width: double.infinity,
                margin: getMargin(
                  left: 26,
                  top: 10,
                ),
                decoration: BoxDecoration(color: ColorConstant.gray100)),
            Align(
                alignment: Alignment.center,
                child: Padding(
                    padding: getPadding(left: 26, top: 30, right: 26),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                              padding: getPadding(bottom: 1),
                              child: Text("lbl_position".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsRegular14Gray600
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: ColorConstant.black900))),
                          Padding(
                              padding: getPadding(top: 1),
                              child: Skeleton(
                                  switcholor: true,
                                  height: getSize(15.00),
                                  width: 50))
                        ]))),
            Align(
                alignment: Alignment.center,
                child: Padding(
                    padding: getPadding(left: 26, top: 12, right: 26),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                              padding: getPadding(bottom: 1),
                              child: Text("Location",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsRegular14Gray600
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: ColorConstant.black900))),
                          Padding(
                              padding: getPadding(top: 1),
                              child: Skeleton(
                                  switcholor: true,
                                  height: getSize(15.00),
                                  width: 50))
                        ]))),
            Align(
                alignment: Alignment.center,
                child: Padding(
                    padding: getPadding(left: 26, top: 11, right: 26),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                              padding: getPadding(bottom: 1),
                              child: Text("Number",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsRegular14Gray600
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: ColorConstant.black900))),
                          Padding(
                              padding: getPadding(top: 1),
                              child: Skeleton(
                                  switcholor: true,
                                  height: getSize(15.00),
                                  width: 50))
                        ]))),
            Align(
                alignment: Alignment.center,
                child: Padding(
                    padding: getPadding(left: 26, top: 11, right: 26),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                              padding: getPadding(bottom: 1),
                              child: Text("lbl_hire_date".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsRegular14Gray600
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: ColorConstant.black900))),
                          Padding(
                              padding: getPadding(top: 1),
                              child: Skeleton(
                                  switcholor: true,
                                  height: getSize(15.00),
                                  width: 50))
                        ]))),
            Align(
                alignment: Alignment.center,
                child: Padding(
                    padding: getPadding(left: 26, top: 12, right: 26),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                              padding: getPadding(bottom: 2),
                              child: Text("lbl_school".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsRegular14Gray600
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: ColorConstant.black900))),
                          Padding(
                              padding: getPadding(top: 2),
                              child: Skeleton(
                                  switcholor: true,
                                  height: getSize(15.00),
                                  width: 50))
                        ]))),
            Align(
                alignment: Alignment.center,
                child: Padding(
                    padding:
                        getPadding(left: 26, top: 12, right: 26, bottom: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                              padding: getPadding(bottom: 1),
                              child: Text("Company",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsRegular14Gray600
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: ColorConstant.black900))),
                          Padding(
                              padding: getPadding(top: 1),
                              child: Skeleton(
                                  switcholor: true,
                                  height: getSize(15.00),
                                  width: 50))
                        ]))),
            Container(
                height: getVerticalSize(1.00),
                width: double.infinity,
                margin: getMargin(left: 26, top: 21, right: 0),
                decoration: BoxDecoration(color: ColorConstant.gray100)),
            Padding(
                padding: getPadding(left: 26, top: 21, right: 26),
                child: Text("Professional Bio",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsSemiBold16.copyWith(
                        fontSize: 14, letterSpacing: 0.36, height: 1.00))),
            Container(
                width: double.infinity,
                margin: getMargin(left: 26, top: 17, right: 26),
                child: Skeleton(
                    switcholor: true, height: getSize(15.00), width: 100)),
            Container(
                height: getVerticalSize(1.00),
                width: double.infinity,
                margin: getMargin(left: 26, top: 21, right: 0),
                decoration: BoxDecoration(color: ColorConstant.gray100)),
            SizedBox(height: getVerticalSize(20.00)),
            Padding(
                padding: getPadding(left: 26, top: 0, right: 0),
                child: Text('Interests',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsSemiBold16.copyWith(
                        fontSize: 14, letterSpacing: 0.36, height: 1.00))),
          ]),
    ],
  );
}
Widget rewardShimmer(){
  return Column(
    children: [
      Expanded(
          child: SingleChildScrollView(
              child: Padding(
                  padding:
                  getPadding(left: 16, top: 0, right: 16),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(getHorizontalSize(10.00),
                                  )),
                              border: Border.all(
                                color: ColorConstant.hintTextColor.withOpacity(0.2),
                              ),
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                      padding: getPadding(
                                          left: 10,
                                          top: 10,
                                          bottom: 10),
                                      child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(getHorizontalSize(10.00)),
                                              child:  Skeleton(switcholor: true,cornerRadius:getHorizontalSize(32.50),height: getSize(65.00),
                                                width: getSize(65.00),),),
                                            Padding(
                                                padding: getPadding(
                                                    left: 15,
                                                    top: 11,
                                                    bottom: 12),
                                                child: Skeleton(switcholor: true,height: getSize(15.00),
                                                    width: 200))
                                          ])),
                                  Padding(
                                      padding: getPadding(
                                          top: 23, right: 26, bottom: 20),
                                      child: Skeleton(switcholor: true,height: getSize(15.00),
                                          width: 50))
                                ])),
                        Container(
                            margin: getMargin(top: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    getHorizontalSize(10.00),
                                  )),
                              border: Border.all(
                                color: ColorConstant.hintTextColor.withOpacity(0.2),
                              ),
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                      padding: getPadding(
                                          left: 10,
                                          top: 18,
                                          bottom: 18),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(getHorizontalSize(10.00)),
                                        child:  Skeleton(switcholor: true,cornerRadius:getHorizontalSize(32.50),height: getSize(65.00),
                                          width: getSize(65.00),),)),
                                  // Padding(
                                  //     padding: getPadding(
                                  //         left: 15,
                                  //         top: 18,
                                  //         bottom: 18),
                                  //     child: Skeleton(switcholor: true,height: getSize(15.00),
                                  //         width: 200)),
                                  // Spacer(),
                                  // Padding(
                                  //     padding: getPadding(
                                  //         top: 23, right: 26, bottom: 20),
                                  //     child: Skeleton(switcholor: true,height: getSize(15.00),
                                  //         width: 50))
                                ])),
                        Container(
                            width: double.infinity,
                            margin: getMargin(top: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(getHorizontalSize(10.00),
                                  )),
                              border: Border.all(
                                color: ColorConstant
                                    .hintTextColor
                                    .withOpacity(0.2),
                              ),
                            ),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: getPadding(
                                          left: 14,
                                          top: 13,
                                          right: 14),
                                      child: Skeleton(switcholor: true,height: getSize(15.00),
                                          width: 100)),
                                  Container(
                                      height: 100,

                                      child: ListView.builder(
                                          physics: BouncingScrollPhysics(),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 10,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: getPadding(
                                                  left: 5,
                                                  top: 30,
                                                  right: 5,
                                                  bottom: 30),
                                              child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(getHorizontalSize(10.00)),
                                                  child:  Skeleton(switcholor: true,cornerRadius:getHorizontalSize(32.50),height: getSize(65.00),
                                                    width: getSize(65.00),),),
                                            );
                                          }))
                                ])),

                      ]
                  )
              )
          )
      )
    ],
  );
}
Widget tabShimmer2() {
  return Row(
    children: [
      SizedBox(width: 10,),
      Skeleton(height:35,width:50,cornerRadius:50,switcholor: true,),
      SizedBox(width: 10,),
      Skeleton(height:35,width:100,cornerRadius:50,switcholor: true,),
      SizedBox(width: 10,),
      Skeleton(height:35,width:80,cornerRadius:50,switcholor: true,),
      SizedBox(width: 10,),
      Skeleton(height:35,width:70,cornerRadius:50,switcholor: true,),

    ],
  );
}

Widget educationResourcesShimmer(){
  return  Column(
    children: [
      SizedBox(
        height: 10,
      ),
      Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: getMargin(
                top: 8.0,
                bottom: 8.0,
              ),
              decoration: AppDecoration.outlineBlack9000a.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: getVerticalSize(
                        180.00,
                      ),
                      width: getHorizontalSize(
                        363.00,
                      ),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Skeleton(
                            height: getVerticalSize(
                              180.00,
                            ),
                            width: getHorizontalSize(
                              363.00,
                            ),
                            cornerRadius: 10,
                            switcholor: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Container(
                        width: 100,
                        height: 15.0,
                        child: Skeleton(
                          switcholor: true,
                        )),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    child: Container(
                        width: 180,
                        height: 15.0,
                        child: Skeleton(
                          switcholor: true,
                        )),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    child: Container(
                        width: 200,
                        height: 10.0,
                        child: Skeleton(
                          switcholor: true,
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
      Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: getMargin(
                top: 8.0,
                bottom: 8.0,
              ),
              decoration: AppDecoration.outlineBlack9000a.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: getVerticalSize(
                        180.00,
                      ),
                      width: getHorizontalSize(
                        363.00,
                      ),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Skeleton(
                            height: getVerticalSize(
                              180.00,
                            ),
                            width: getHorizontalSize(
                              363.00,
                            ),
                            cornerRadius: 10,
                            switcholor: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Container(
                        width: 100,
                        height: 15.0,
                        child: Skeleton(
                          switcholor: true,
                        )),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    child: Container(
                        width: 180,
                        height: 15.0,
                        child: Skeleton(
                          switcholor: true,
                        )),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    child: Container(
                        width: 200,
                        height: 10.0,
                        child: Skeleton(
                          switcholor: true,
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
      Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: getMargin(
                top: 8.0,
                bottom: 8.0,
              ),
              decoration: AppDecoration.outlineBlack9000a.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: getVerticalSize(
                        180.00,
                      ),
                      width: getHorizontalSize(
                        363.00,
                      ),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Skeleton(
                            height: getVerticalSize(
                              180.00,
                            ),
                            width: getHorizontalSize(
                              363.00,
                            ),
                            cornerRadius: 10,
                            switcholor: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Container(
                        width: 100,
                        height: 15.0,
                        child: Skeleton(
                          switcholor: true,
                        )),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    child: Container(
                        width: 180,
                        height: 15.0,
                        child: Skeleton(
                          switcholor: true,
                        )),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    child: Container(
                        width: 200,
                        height: 10.0,
                        child: Skeleton(
                          switcholor: true,
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),

        ],
      )
    ],
  );
}
Widget documentDetailShimmer(){
  return Column(
    children: [
      Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Skeleton(switcholor: true,height: getSize(15.00),
                      width: 50)
                ),
                SizedBox(
                  height: 10,
                ),
                // make a row with text "PDF • 10 MB • Sep 24, 2022"
                Skeleton(switcholor: true,height: getSize(15.00),
                    width: 200),
                SizedBox(
                  height: 50,
                ),
                Divider(),

                // make a row with text "Description"
                SizedBox(
                  height: 20,
                ),
                Skeleton(switcholor: true,height: getSize(15.00),
                    width: 100),

                SizedBox(
                  height: 10,
                ),
                Skeleton(switcholor: true,height: getSize(15.00),
                    width: 200)
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Widget homeEventsShimmer(context, String name) {
  Responsive responsive = Responsive();
  responsive.setContext(context);
  return Container(
    width: size.width,
    child: Padding(
      padding: getPadding(left: 15,right: 15,top: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Hi there, ${name}!",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtPoppinsSemiBold20.copyWith(
                  height: 1.00, fontSize: 28, fontWeight: FontWeight.w700)),
          SizedBox(
            height: responsive.setHeight(1.3),
          ),
          Text("Today is ${Utils.getCurrentDay()}, ${Utils.getFormatedDateHome(DateTime.now())}",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtPoppinsRegular12Black900.copyWith(
                  height: 1.00, fontSize: 14, fontWeight: FontWeight.w400)),
          SizedBox(
            height: responsive.setHeight(3),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text("lbl_upcoming_events".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsMedium14.copyWith(
                        height: 1.00,
                        fontSize: 12,
                        fontWeight: FontWeight.w600)),
                Row(
                  children: [
                    Padding(
                        padding: getPadding(top: 1, bottom: 3, right: 2),
                        child: Text("Filters »",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsRegular12.copyWith(
                                fontSize: 12,
                                color: ColorConstant.black900,
                                fontWeight: FontWeight.w600))),
                    // Padding(
                    //     padding: getPadding(top: 1, bottom: 3),
                    //     child: Icon(
                    //       Icons.arrow_forward_outlined,
                    //       size: 13,
                    //       color: ColorConstant.black900,
                    //     ))
                  ],
                ),
              ]),
          SizedBox(
            height: responsive.setHeight(0.5),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: getMargin(
                            top: 8.0,
                            bottom: 8.0,
                          ),
                          decoration: AppDecoration.outlineBlack9000a.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder10,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: getVerticalSize(
                                    180.00,
                                  ),
                                  width: getHorizontalSize(
                                    363.00,
                                  ),
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Skeleton(
                                        height: getVerticalSize(
                                          180.00,
                                        ),
                                        width: getHorizontalSize(
                                          363.00,
                                        ),
                                        cornerRadius: 10,
                                        switcholor: true,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                child: Container(
                                    width: 100,
                                    height: 15.0,
                                    child: Skeleton(
                                      switcholor: true,
                                    )),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                                child: Container(
                                    width: 180,
                                    height: 15.0,
                                    child: Skeleton(
                                      switcholor: true,
                                    )),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                                child: Container(
                                    width: 200,
                                    height: 10.0,
                                    child: Skeleton(
                                      switcholor: true,
                                    )),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  );
                }),
          ),
          SizedBox(
            height: responsive.setHeight(3),
          ),
        ],
      ),
    ),
  );
}

Widget referralShimmer(context) {
  return Container(
    margin: getMargin(
      top: 8.0,
      bottom: 8.0,
    ),
    decoration: AppDecoration.outlineGray300.copyWith(
      borderRadius: BorderRadiusStyle.roundedBorder10,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: getPadding(
                left: 15,
                top: 15,
                right: 15,
              ),
              child: Skeleton(
                switcholor: true,
                width: 90,
                height: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0,top: 10),
              child: Skeleton(
                switcholor: true,
                width: 20,
                height: 20,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: getPadding(
            left: 15,
            top: 10,
            right: 20,
          ),
          child: Skeleton(
            switcholor: true,
            width: 40,
            height: 10,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: getPadding(
              left: 15,
              top: 10,
              right: 15,
              bottom: 17
          ),
          child: Skeleton(
            switcholor: true,
            width: 40,
            height: 10,
          ),
        ),
        // SizedBox(
        //   height: 15,
        // ),
      ],
    ),
  );
}
