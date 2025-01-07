
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/utils/color_constant.dart';
import 'package:salon_symphony/core/utils/image_constant.dart';
import 'package:salon_symphony/core/utils/responsive.dart';
import 'package:salon_symphony/core/utils/size_utils.dart';
import 'package:salon_symphony/theme/app_decoration.dart';
import 'package:salon_symphony/theme/app_style.dart';
import 'package:salon_symphony/widgets/common_image_view.dart';
import 'package:salon_symphony/widgets/custom_text.dart';
import 'package:salon_symphony/widgets/skeleton.dart';

Widget skeletonBaseWidget({required Widget child}) {
  return Skeleton();
}
Widget faqShimmer(){
  return Container(
    decoration: BoxDecoration(
        // border: Border.all(color: Color(0xff686868), width: 0.5),
        borderRadius: BorderRadius.circular(15.0)
    ),
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    margin: const EdgeInsets.only(bottom: 15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(width: 300.0, height: 20.0, child: Skeleton(switcholor: true,),),

        const SizedBox(height: 30.0,),

        SizedBox(width: 300.0, height: 20.0, child: Skeleton(switcholor: true,),),

        // const SizedBox(height: 10.0,),
      ],
    ),
  );
}

Widget interestShimmer (){
  return Expanded(
    child: ListView.builder(
      itemCount: 20,
        itemBuilder: (context, index){
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 35.0, height: 20.0, child: Skeleton(switcholor: true,),),

            // const SizedBox(height: 10.0,),
          ],
        );
        }
    ),
  );
}


Widget listShimmer(){
  return Container(
      color: ColorConstant.whiteA700,
      width: size.width,
      child: SingleChildScrollView(
          child: Container(

              color: ColorConstant.whiteA700,
              width: size.width,
              child: Stack(alignment: Alignment.topCenter, children: [

                Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                        padding: getPadding(right: 9, bottom: 26),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                    padding: getPadding(left: 15, top: 10),
                                    child: ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount:5,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              InkWell(
                                                onTap: () {

                                                },
                                                child: Container(
                                                    margin: getMargin(right: 10),
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(getHorizontalSize(25.00))),
                                                    child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        mainAxisSize: MainAxisSize.max,
                                                        children: [
                                                          Skeleton(switcholor: true, height: getSize(50.00),
                                                            width: getSize(50.00),cornerRadius: getHorizontalSize(
                                                                25.00),),
                                                          Padding(
                                                              padding: getPadding(
                                                                  left: 14,
                                                                  top: 18,
                                                                  bottom: 16),
                                                              child:  SizedBox(width: 200.0, height: 20.0, child: Skeleton(switcholor: true,),),),
                                                          Spacer(),

                                                        ])),
                                              ),
                                              Container(
                                                  height: getVerticalSize(1.00),
                                                  width: getHorizontalSize(324.00),
                                                  margin: getMargin(top: 10),
                                                  decoration: BoxDecoration(
                                                      color: ColorConstant.gray100)),
                                            ],
                                          );
                                        })),
                              ),

                            ])))
              ]))));
}
Widget requestListShimmer(){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(getHorizontalSize(25.00))),
            child: Padding(
              padding: getPadding(
                  left: 14,
                  top: 25,
                  bottom: 20),
              child:  SizedBox(width: 100.0, height: 15.0, child: Skeleton(switcholor: true,),),)),
        Container(
          height: 1,
          width: double.maxFinite,
          color: ColorConstant.gray200,
        ),
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(getHorizontalSize(25.00))),
            child: Padding(
              padding: getPadding(
                  left: 14,
                  top: 30,
                  bottom: 20),
              child:  SizedBox(width: 100.0, height: 15.0, child: Skeleton(switcholor: true,),),)),
        Container(
          height: 1,
          width: double.maxFinite,
          color: ColorConstant.gray200,
        ),
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(getHorizontalSize(25.00))),
            child: Padding(
              padding: getPadding(
                  left: 14,
                  top: 30,
                  bottom: 20),
              child:  SizedBox(width: 100.0, height: 15.0, child: Skeleton(switcholor: true,),),)),

      ],
    ),
  );
}

Widget tabShimmer() {
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


Widget taskShimmer(context){
  return Container(
    decoration: BoxDecoration(
        // border: Border.all(color: Color(0xff686868), width: 0.5),
        borderRadius: BorderRadius.circular(15.0)
    ),
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    margin: const EdgeInsets.only(top: 15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(width: MediaQuery.of(context).size.width, height: 20.0, child: Skeleton(switcholor: true,),),
        const SizedBox(height: 20.0,),
        Container(height: 1,width: double.maxFinite, color: ColorConstant.gray200,),
        const SizedBox(height: 20.0,),
        SizedBox(width: MediaQuery.of(context).size.width, height: 20.0, child: Skeleton(switcholor: true,),),
        const SizedBox(height: 20.0,),
        Container(height: 1,width: double.maxFinite, color: ColorConstant.gray200,),
        const SizedBox(height: 20.0,),
        SizedBox(width: MediaQuery.of(context).size.width, height: 20.0, child: Skeleton(switcholor: true,),),
        const SizedBox(height: 20.0,),
        Container(height: 1,width: double.maxFinite, color: ColorConstant.gray200,),
        const SizedBox(height: 20.0,),
      ],
    ),
  );
}


Widget resourceDetailShimmer(context){
  return Container(
    decoration: BoxDecoration(
        // border: Border.all(color: Color(0xff686868), width: 0.5),
        borderRadius: BorderRadius.circular(15.0)
    ),
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
    margin: const EdgeInsets.only(top: 0.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: getMargin(
                top: 0, bottom: 20),
            child: Skeleton(switcholor: true, width: MediaQuery.of(context).size.width, height: 200,)),
        SizedBox(width: 40, height: 20.0, child: Skeleton(switcholor: true,),),
        const SizedBox(height: 20.0,),
        SizedBox(width: MediaQuery.of(context).size.width, height: 20.0, child: Skeleton(switcholor: true,),),
        const SizedBox(height: 20.0,),
        SizedBox(width: 100, height: 20.0, child: Skeleton(switcholor: true,),),
        const SizedBox(height: 20.0,),
        Container(height: 1,width: double.maxFinite, color: ColorConstant.gray200,),
        const SizedBox(height: 20.0,),
        SizedBox(width: MediaQuery.of(context).size.width, height: 20.0, child: Skeleton(switcholor: true,),),
        const SizedBox(height: 20.0,),
        SizedBox(width: MediaQuery.of(context).size.width, height: 20.0, child: Skeleton(switcholor: true,),),
        const SizedBox(height: 20.0,),    SizedBox(width: MediaQuery.of(context).size.width, height: 20.0, child: Skeleton(switcholor: true,),),
        const SizedBox(height: 20.0,),    SizedBox(width: MediaQuery.of(context).size.width, height: 20.0, child: Skeleton(switcholor: true,),),
        const SizedBox(height: 20.0,),
        Container(height: 1,width: double.maxFinite, color: ColorConstant.gray200,),
        const SizedBox(height: 20.0,),
      ],
    ),
  );
}
Widget QuizSurveyShimmer(context){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Container(
      decoration: BoxDecoration(
          // border: Border.all(color: Color(0xff686868), width: 0.5),
          borderRadius: BorderRadius.circular(15.0)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      margin: const EdgeInsets.only(top: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: getMargin(
                  top: 0, bottom: 20),
              child: Skeleton(switcholor: true, width: MediaQuery.of(context).size.width, height: 165,)),
          // SizedBox(width: 40, height: 20.0, child: Skeleton(switcholor: true,),),
          // const SizedBox(height: 20.0,),
          SizedBox(width: MediaQuery.of(context).size.width, height: 20.0, child: Skeleton(switcholor: true,),),
          const SizedBox(height: 20.0,),
          SizedBox(width: MediaQuery.of(context).size.width, height: 20.0, child: Skeleton(switcholor: true,),),
          const SizedBox(height: 20.0,),

        ],
      ),
    ),
  );
}
Widget eventsDetailShimmer(context){
  return Container(
    decoration: BoxDecoration(
        // border: Border.all(color: Color(0xff686868), width: 0.5),
        borderRadius: BorderRadius.circular(15.0)
    ),
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(margin: getMargin(top: 0, bottom: 20),
            child: Skeleton(switcholor: true, width: MediaQuery.of(context).size.width, height: 250,)),
        SizedBox(width: 40, height: 20.0, child: Skeleton(switcholor: true,),),
        const SizedBox(height: 20.0,),
        SizedBox(width: MediaQuery.of(context).size.width, height: 20.0, child: Skeleton(switcholor: true,),),
        const SizedBox(height: 20.0,),
        SizedBox(width: 100, height: 20.0, child: Skeleton(switcholor: true,),),
        const SizedBox(height: 20.0,),
        Container(height: 1,width: double.maxFinite, color: ColorConstant.gray200,),
        const SizedBox(height: 20.0,),
        SizedBox(width: MediaQuery.of(context).size.width, height: 20.0, child: Skeleton(switcholor: true,),),
        const SizedBox(height: 20.0,),
        SizedBox(width: MediaQuery.of(context).size.width, height: 20.0, child: Skeleton(switcholor: true,),),
        const SizedBox(height: 20.0,),    SizedBox(width: MediaQuery.of(context).size.width, height: 20.0, child: Skeleton(switcholor: true,),),
        const SizedBox(height: 20.0,),    SizedBox(width: MediaQuery.of(context).size.width, height: 20.0, child: Skeleton(switcholor: true,),),
        const SizedBox(height: 20.0,),
        Container(height: 1,width: double.maxFinite, color: ColorConstant.gray200,),
        const SizedBox(height: 20.0,),
      ],
    ),
  );
}

Widget pagesShimmer(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [

      SizedBox(width: 200.0, height: 20.0, child: Skeleton(switcholor: true,),),

      const SizedBox(height: 5.0,),

      SizedBox(width: 250.0, height: 20.0, child: Skeleton(switcholor: true,),),

      const SizedBox(height: 5.0,),

      SizedBox(width: 300.0, height: 20.0, child: Skeleton(switcholor: true,),),

      const SizedBox(height: 5.0,),

      SizedBox(width: 300.0, height: 20.0, child: Skeleton(switcholor: true,),),

      const SizedBox(height: 10.0,),
    ],
  );
}





Widget scheduleShimmer(){

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        decoration: BoxDecoration(
          color: ColorConstant.backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 18.0,
            left: 15,
            right: 15,
          ),
          child: Column(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Get.back();
                    },
                    child: CommonImageView(
                      svgPath: ImageConstant.imgArrowleft,
                      color: ColorConstant.hintTextColor,
                    ),
                  ),
                  SizedBox(
                    width: 90 ),

                  Center(
                    child: MyText(
                      title: '${'Create Account'}',
                      weight: 'Semi Bold',
                      fontSize: 16,
                    ),
                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: Center(
                  child: MyText(
                    title: "Add Schedule",
                    fontSize: 30,
                    weight: 'Semi Bold',
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: MyText(
                  title: "And lastly, toggle on the days you work.",
                  clr: ColorConstant.black900,
                ),
              ),
            ],
          ),
        ),
      ),
      Container(
          margin: getMargin(left: 16, top: 22, right: 16),
          decoration: AppDecoration.simpleOutline
              .copyWith(
              borderRadius:
              BorderRadiusStyle.roundedBorder15),
          child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
           Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: getPadding(
                            left: 20, top: 10),
                        child: Skeleton(switcholor: true,width: 100,)),

                    Padding(
                        padding:
                        getPadding(left: 20, bottom: 10,top: 5),
                        child: Skeleton(switcholor: true,width: 30,))
                  ],
                ),
                Container(
                    margin: getMargin(
                        top: 10, right: 15, bottom: 10),
                    child: Skeleton(switcholor: true, width: 40,))
              ])),
      Container(
          margin: getMargin(left: 16, top: 10, right: 16),
          decoration: AppDecoration.simpleOutline
              .copyWith(
              borderRadius:
              BorderRadiusStyle.roundedBorder15),
          child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
           Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: getPadding(
                            left: 20, top: 10),
                        child: Skeleton(switcholor: true,width: 100,)),

                    Padding(
                        padding:
                        getPadding(left: 20, bottom: 10,top: 5),
                        child: Skeleton(switcholor: true,width: 30,))
                  ],
                ),
                Container(
                    margin: getMargin(
                        top: 10, right: 15, bottom: 10),
                    child: Skeleton(switcholor: true, width: 40,))
              ])),
      Container(
          margin: getMargin(left: 16, top: 10, right: 16),
          decoration: AppDecoration.simpleOutline
              .copyWith(
              borderRadius:
              BorderRadiusStyle.roundedBorder15),
          child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
           Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: getPadding(
                            left: 20, top: 10),
                        child: Skeleton(switcholor: true,width: 100,)),

                    Padding(
                        padding:
                        getPadding(left: 20, bottom: 10,top: 5),
                        child: Skeleton(switcholor: true,width: 30,))
                  ],
                ),
                Container(
                    margin: getMargin(
                        top: 10, right: 15, bottom: 10),
                    child: Skeleton(switcholor: true, width: 40,))
              ])),
    ],
  );
}
Widget scheduleShimmer2(){

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [

      Container(
          margin: getMargin(left: 16, top: 22, right: 16),
          decoration: AppDecoration.simpleOutline
              .copyWith(
              borderRadius:
              BorderRadiusStyle.roundedBorder15),
          child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
           Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: getPadding(
                            left: 20, top: 10),
                        child: Skeleton(switcholor: true,width: 100,)),

                    Padding(
                        padding:
                        getPadding(left: 20, bottom: 10,top: 5),
                        child: Skeleton(switcholor: true,width: 30,))
                  ],
                ),
                Container(
                    margin: getMargin(
                        top: 10, right: 15, bottom: 10),
                    child: Skeleton(switcholor: true, width: 40,))
              ])),
      Container(
          margin: getMargin(left: 16, top: 10, right: 16),
          decoration: AppDecoration.simpleOutline
              .copyWith(
              borderRadius:
              BorderRadiusStyle.roundedBorder15),
          child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
           Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: getPadding(
                            left: 20, top: 10),
                        child: Skeleton(switcholor: true,width: 100,)),

                    Padding(
                        padding:
                        getPadding(left: 20, bottom: 10,top: 5),
                        child: Skeleton(switcholor: true,width: 30,))
                  ],
                ),
                Container(
                    margin: getMargin(
                        top: 10, right: 15, bottom: 10),
                    child: Skeleton(switcholor: true, width: 40,))
              ])),
      Container(
          margin: getMargin(left: 16, top: 10, right: 16),
          decoration: AppDecoration.simpleOutline
              .copyWith(
              borderRadius:
              BorderRadiusStyle.roundedBorder15),
          child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
           Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: getPadding(
                            left: 20, top: 10),
                        child: Skeleton(switcholor: true,width: 100,)),

                    Padding(
                        padding:
                        getPadding(left: 20, bottom: 10,top: 5),
                        child: Skeleton(switcholor: true,width: 30,))
                  ],
                ),
                Container(
                    margin: getMargin(
                        top: 10, right: 15, bottom: 10),
                    child: Skeleton(switcholor: true, width: 40,))
              ])),
      Container(
          margin: getMargin(left: 16, top: 10, right: 16),
          decoration: AppDecoration.simpleOutline
              .copyWith(
              borderRadius:
              BorderRadiusStyle.roundedBorder15),
          child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: getPadding(
                            left: 20, top: 10),
                        child: Skeleton(switcholor: true,width: 100,)),

                    Padding(
                        padding:
                        getPadding(left: 20, bottom: 10,top: 5),
                        child: Skeleton(switcholor: true,width: 30,))
                  ],
                ),
                Container(
                    margin: getMargin(
                        top: 10, right: 15, bottom: 10),
                    child: Skeleton(switcholor: true, width: 40,))
              ])),
      Container(
          margin: getMargin(left: 16, top: 10, right: 16),
          decoration: AppDecoration.simpleOutline
              .copyWith(
              borderRadius:
              BorderRadiusStyle.roundedBorder15),
          child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: getPadding(
                            left: 20, top: 10),
                        child: Skeleton(switcholor: true,width: 100,)),

                    Padding(
                        padding:
                        getPadding(left: 20, bottom: 10,top: 5),
                        child: Skeleton(switcholor: true,width: 30,))
                  ],
                ),
                Container(
                    margin: getMargin(
                        top: 10, right: 15, bottom: 10),
                    child: Skeleton(switcholor: true, width: 40,))
              ])),
    ],
  );
}