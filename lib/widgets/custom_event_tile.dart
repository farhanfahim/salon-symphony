import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_symphony/core/utils/dummy_content.dart';
import 'package:salon_symphony/core/utils/responsive.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import 'package:salon_symphony/data/models/eventsListModel.dart';
import 'package:salon_symphony/presentation/home_events_all_page/controller/home_events_all_controller.dart';
import 'package:salon_symphony/widgets/custom_radio_button.dart';
import 'package:salon_symphony/widgets/custom_switch.dart';
import 'package:salon_symphony/widgets/custom_text.dart';
import 'package:salon_symphony/widgets/skeleton.dart';
import 'package:shimmer/shimmer.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/helper_functions.dart';
import '../core/utils/image_constant.dart';
import '../core/utils/size_utils.dart';

import '../presentation/home_screen/controller/home_controller.dart';
import '../theme/app_decoration.dart';
import '../theme/app_style.dart';
import 'common_image_view.dart';
import 'custom_button.dart';

class CustomEventTile extends StatelessWidget {
  CustomEventTile({this.index,this.homeScreen, this.data2,required this.length});

  EventsData? data2;

  int? index;
  int length=0;
  bool? homeScreen;

  HomeController controller = Get.find();

  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return Column(
      children: [
        Container(
          width: responsive.setWidth(100),
          decoration: BoxDecoration(
            color: ColorConstant.whiteA700,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorConstant.gray300, width: 1),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: responsive.setHeight(22),
                    decoration: BoxDecoration(
                        // color: ColorConstant.red100,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                    ),
                      child: CommonImageView(
                        url: data2!.image!=null?data2!.image!:"",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        radius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                  ),
                Align(
                    alignment:Alignment.topRight,
                      child: Container(
                      margin: getMargin(left: 19, top: 15, right: 13, bottom: 20),
                      // width: 46,
                        height: 21,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(2)),
                          gradient: LinearGradient(
                              colors: [
                                Color(0XFFF63E8B),
                                Color(0XFF7B68EE)
                              ],
                            end: Alignment.centerLeft,
                            begin: Alignment.centerRight,
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
                          child: MyText(
                            title:
                            data2!.price == 0 ?
                                'FREE':
                            r'$'+ data2!.price.toString(),
                            fontSize: 11,
                            center: true,
                            letterSpacing: 0.5,
                            weight: 'Semi Bold',
                            clr: ColorConstant.whiteA700 ,
                          ),
                        ),
                      ),
                    ),

                  Container(
                      height: responsive.setHeight(25.2),
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12.0, left: 15),
                            child: Row(
                              children: [
                                MyText(
                                  title: '${Utils.getFormatedDateForEvents(data2!.startDate!=null?data2!.startDate!:"")} AT ${data2!.startTime} ${data2!.timezone == null ? '' : data2!.timezone}',
                                  fontSize: responsive.setTextScale(13),
                                  weight: 'Bold',
                                  clr: ColorConstant.appPinkColor,
                                ),
                              ],
                            ),
                          ))),
                  Container(
                    height: responsive.setHeight(24),
                    width: responsive.setWidth(100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width:  responsive.setWidth(66),
                          // color: ColorConstant.black900,
                        ),
                        // Spacer(),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: data2!.allReservation!.length >
                                    4
                                    ? 4
                                    : data2!.allReservation!.length,
                                itemBuilder: (context, index) {
                                  return Align(
                                    alignment: Alignment.bottomRight,
                                    widthFactor: 0.6,
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Colors.white,
                                      child: index == (data2!.allReservation!.length > 4 ? 3 : data2!.allReservation!.length- 1) ?
                                      Stack(
                                        children: [
                                          data2!.allReservation![index].user != null && data2!.allReservation![index].user!.image != null?
                                          CircleAvatar(
                                            radius: 17.5,
                                            backgroundColor: Colors.transparent, // Set the background color to transparent
                                            child: CachedNetworkImage(
                                              imageUrl: data2!.allReservation![index].user!.image.toString(),
                                              imageBuilder: (context, imageProvider) => CircleAvatar(
                                                radius: 17.5,
                                                backgroundImage: imageProvider,
                                              ),
                                              placeholder: (context, url) => Skeleton(switcholor: true,),
                                              errorWidget: (context, url, error) => CircleAvatar(
                                                radius: 17.5,
                                                backgroundColor: Colors.transparent, // Set the background color to transparent
                                                child: Icon(Icons.error),
                                              ),
                                            ),
                                          ) :CommonImageView(
                                            svgPath: ImageConstant.imgUser,
                                            height: getSize(40.00),
                                            width: getSize(40.00),
                                          ) ,
                                          data2!.allReservation!.length > 4 ?
                                          Positioned(child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.black26.withOpacity(0.5),
                                            ),
                                            child: Center(
                                              child: MyText(
                                                title: '+${data2!.allReservation!.length - 4}',
                                                fontSize: responsive.setTextScale(10),
                                                weight: 'Semi Bold',
                                                clr: ColorConstant.whiteA700,
                                              ),
                                            ),
                                          )): Offstage()
                                        ],
                                      ):

                                      data2!.allReservation![index].user != null && data2!.allReservation![index].user!.image != null?
                                   // CommonImageView(
                                   //      url:    data2!.allReservation![index].user!.image
                                   //          .toString(),
                                   //   radius: BorderRadius.circular(17.5),
                                   // )
                                      CircleAvatar(
                                        radius: 17.5,
                                        backgroundColor: Colors.transparent, // Set the background color to transparent
                                        child: CachedNetworkImage(
                                          imageUrl: data2!.allReservation![index].user!.image.toString(),
                                          imageBuilder: (context, imageProvider) => CircleAvatar(
                                            radius: 17.5,
                                            backgroundImage: imageProvider,
                                          ),
                                          placeholder: (context, url) => Skeleton(switcholor: true,),
                                          errorWidget: (context, url, error) => CircleAvatar(
                                            radius: 17.5,
                                            backgroundColor: Colors.transparent, // Set the background color to transparent
                                            child: Icon(Icons.error),
                                          ),
                                        ),
                                      )
                                      /*CircleAvatar(
                                        radius: 17.5,
                                        backgroundColor: Colors.white,
                                        backgroundImage: NetworkImage(data2!.allReservation![index].user!.image
                                            .toString()),
                                      )*/ :CommonImageView(
                                        svgPath: ImageConstant.imgUser,
                                        height: getSize(40.00),
                                        width: getSize(40.00),
                                      )
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: responsive.setWidth(2.5),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: responsive.setHeight(0.5),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: MyText(
                  title: '${data2!.name}',
                  fontSize: responsive.setTextScale(18),
                  letterSpacing: 0.5,
                  line: 1,
                  toverflow: TextOverflow.ellipsis,
                  weight: 'Bold',
                ),
              ),
              SizedBox(
                height: responsive.setHeight(0.5),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.ideographic,
                  children: [
                    // MyText(
                    //   title: '${controller.eventList[index!].eventType}',
                    //   fontSize: responsive.setTextScale(14),
                    //   weight: 'Semi Bold',
                    // ),
                    // SizedBox(width: responsive.setWidth(2),),
                    Expanded(
                      child: MyText(
                        title: '${data2!.address == '' ? 'Online Event • Tap to view event details' : data2!.address}',
                        fontSize: responsive.setTextScale(14),
                        clr: ColorConstant.black900,
                         toverflow: TextOverflow.ellipsis,
                        line: 1,
                      ),
                    ),
                    SizedBox(width: responsive.setWidth(5),),
                  ],
                ),
              ),
              SizedBox(
                height: responsive.setHeight(1.5),
              ),
              GestureDetector(
                onTap: () {
                  controller.updateStatus(data2!);
                  HelperFunction.showBottomSheet(
                    redclrEndTask:false,
                    context,
                    bottomSheetHeight:  responsive.setHeight(36),
                    spaceBetween: responsive.setHeight(4),
                    screenTitle: 'Event Response',
                    screenEndTask: "Done",
                    widget: ListView.builder(
                      itemCount: controller.listIntrust.length,
                      padding: EdgeInsets.only(top: responsive.setHeight(1),),
                      itemBuilder: (BuildContext context, int ind) {
                        return ind == 3 ? Container():InkWell(
                          onTap: () {
                            controller.eventList[ind].eventIntrust = controller.listIntrust[ind].id;
                            controller.eventsReservation(
                                data2!.id!,
                                controller.eventList[ind].eventIntrust == 10 ? 10
                                    : controller.eventList[ind].eventIntrust == 20 ? 20 : 30,
                             data2!
                            );
                            if(data2!.userReservation != null){
                              data2!.userReservation!.localStatusId!.value = controller.listIntrust[ind].id!;
                              controller.eventList[ind].eventIntrust == 10 ?
                              data2!.localStatus.value  = 'Going' :
                              controller.eventList[ind].eventIntrust == 20 ?
                              data2!.localStatus.value  ='Interested':
                              controller.eventList[ind].eventIntrust == 30 ?
                              data2!.localStatus.value  = "Can't Go" : '';
                            }
                            controller.listIntrust[ind].selected!.value = true;
                            controller.listIntrust.refresh();
                            controller.eventList.refresh();
                            Get.back();
                          },
                          child: Padding(
                            padding:
                            EdgeInsets.only(bottom: responsive.setHeight(1)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Row(
                                    children: [
                                      CommonImageView(
                                        imagePath: controller.listIntrust[ind].image,
                                        height: responsive.setHeight(3),
                                      ),
                                      SizedBox(
                                        width: responsive.setWidth(4),
                                      ),
                                      MyText(
                                        title: '${controller.listIntrust[ind].name}',
                                        //weight: 'Semi Bold',
                                      ),
                                      Spacer(),
                                      Obx(() => controller.listIntrust[ind].selected!.value == true
                                          ?  Container(
                                        margin: getMargin(
                                          // top: 15,
                                          right: 5,
                                          // bottom: 15,
                                        ),
                                        decoration:
                                        AppDecoration.outlineBluegray100.copyWith(
                                          borderRadius: BorderRadiusStyle.roundedBorder10,
                                          border: Border.all(
                                            color: ColorConstant.primaryColor,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: getSize(
                                                15.00,
                                              ),
                                              width: getSize(
                                                15.00,
                                              ),
                                              margin: getMargin(
                                                all: 2,
                                              ),
                                              decoration: BoxDecoration(
                                                color: ColorConstant.primaryColor,
                                                borderRadius: BorderRadius.circular(
                                                  getHorizontalSize(
                                                    50,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                          : Container(
                                        margin: getMargin(
                                          // top: 15,
                                          right: 5,
                                          // bottom: 15,
                                        ),
                                        decoration:
                                        AppDecoration.outlineBluegray100.copyWith(
                                          borderRadius: BorderRadiusStyle.roundedBorder10,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: getSize(
                                                15.00,
                                              ),
                                              width: getSize(
                                                15.00,
                                              ),
                                              margin: getMargin(
                                                all: 1,
                                              ),
                                              decoration: BoxDecoration(
                                                color: ColorConstant.whiteA700,
                                                borderRadius: BorderRadius.circular(
                                                  getHorizontalSize(
                                                    50,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      )


                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: responsive.setHeight(1.5),
                                ),
                                ind == 3 ? Offstage():
                                Divider()
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child:
                 Obx(() =>  Container(
                   height: responsive.setHeight(5),
                   width: responsive.setWidth(100),
                   decoration: BoxDecoration(
                       gradient:  data2!.localStatus.value == 'Going' ?LinearGradient(
                           colors: [
                             ColorConstant.primaryColor,
                             ColorConstant.primaryColor,
                             ColorConstant.appPinkColor,
                           ],
                           begin: Alignment.centerLeft,
                           end: Alignment.centerRight,
                           stops: const [0.05, 0.3, 0.95]):null,
                       color: data2!.localStatus.value == ''
                           ? Color(0xffF1F3F6)
                           : data2!.localStatus.value == 'Going'
                           ? ColorConstant.appPinkColor
                           : data2!.localStatus.value =='Interested'
                           ? ColorConstant.primaryColor
                           : ColorConstant.appPinkColor,
                       borderRadius: BorderRadius.circular(5)),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       SizedBox(
                         width: responsive.setWidth(10),
                       ),
                      MyText(
                         title: data2!.localStatus.value == ''
                             ? 'RESPOND'
                             : data2!.localStatus.value.toUpperCase(),
                         fontSize:  14,
                         clr: data2!.localStatus.value == ''
                             ?ColorConstant.black900:ColorConstant.whiteA700,
                         weight: 'Bold',
                       ),
                       Padding(
                         padding: const EdgeInsets.only(top:8.0,bottom: 8,right: 16,left: 8),
                         child: CommonImageView(
                           svgPath: ImageConstant.imgVuesaxBoldArrowdown,
                           height: 20,
                           width: 20,
                           color:  data2!.localStatus.value == ''
                               ?ColorConstant.gray350:ColorConstant.whiteA700,
                         ),
                       )
                     ],
                   ),
                 ),)
                ),


              ),
              SizedBox(
                height: responsive.setHeight(2),

              ),


            ],
          ),
        ),
        length> 0 && index==length-1?Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Text("You're all caught up!",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtPoppinsRegular12.copyWith(
                  fontSize: 13,color: ColorConstant.gray7F7F88,fontWeight: FontWeight.w400,)),
        ):Container(),
      ],
    );
  }
}
