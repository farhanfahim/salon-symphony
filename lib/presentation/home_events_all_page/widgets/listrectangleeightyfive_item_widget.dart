// import '../../../core/utils/dummy_content.dart';
// import '../../../core/utils/responsive.dart';
// import '../../../widgets/custom_text.dart';
// import '../../home_events_details_screen/home_events_details_screen.dart';
// import '../controller/home_events_all_controller.dart';
// import '../models/listrectangleeightyfive_item_model.dart';
// import 'package:flutter/material.dart';
// import 'package:salon_symphony/core/app_export.dart';
// import 'package:salon_symphony/widgets/custom_button.dart';
//
// // ignore: must_be_immutable
// class ListrectangleeightyfiveItemWidget extends StatelessWidget {
//   ListrectangleeightyfiveItemWidget({this.data,this.index});
//
//   // ListrectangleeightyfiveItemModel listrectangleeightyfiveItemModelObj;
//
//   eventDataModel? data;
//   int? index;
//   var controller = Get.find<HomeEventsAllController>();
//   Responsive responsive = Responsive();
//   @override
//   Widget build(BuildContext context) {
//     responsive.setContext(context);
//     return Column(
//       children: [
//         Card(
//           shape:RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10)
//           ),
//           child: Container(
//             width: responsive.setWidth(100),
//             decoration: BoxDecoration(
//               color: ColorConstant.whiteA700,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Stack(
//                   children: [
//                     Container(
//                       height: responsive.setHeight(22),
//                       decoration: BoxDecoration(
//                           color: ColorConstant.red100,
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(10),
//                               topRight: Radius.circular(10)),
//                           image: DecorationImage(
//                               image: AssetImage(controller.eventList[index!].eventPic.toString()),
//                               fit: BoxFit.cover)),
//                       child: Column(
//                         children: [
//                           CustomButton(
//                               width: 46,
//                               text: "lbl_free".tr,
//                               margin:
//                               getMargin(left: 19, top: 15, right: 10, bottom: 20),
//                               variant: ButtonVariant.FillPink300,
//                               fontStyle: ButtonFontStyle.PoppinsRegular12,
//                               alignment: Alignment.topRight)
//                         ],
//                       ),
//                     ),
//
//                     Container(
//                         height: responsive.setHeight(26.4),
//                         child: Align(
//                             alignment: Alignment.bottomLeft,
//                             child: Padding(
//                               padding: const EdgeInsets.only(top: 12.0, left: 8),
//                               child: Row(
//                                 children: [
//                                   CommonImageView(
//                                     imagePath: ImageConstant.imgStarSimple,
//                                     height: responsive.setHeight(2),
//                                   ),
//                                   SizedBox(
//                                     width: responsive.setWidth(2),
//                                   ),
//                                   MyText(
//                                     title: '${controller.eventList[index!].eventDate}',
//                                     fontSize: responsive.setTextScale(14),
//                                     weight: 'Semi Bold',
//                                   ),
//                                 ],
//                               ),
//                             ))),
//                     Container(
//                       height: responsive.setHeight(24),
//                       width: responsive.setWidth(100),
//                       child: Row(
//                         children: [
//                           Container(
//                             width: responsive.setWidth(70),
//                           ),
//                           Expanded(
//                             child: Align(
//                               alignment: Alignment.bottomRight,
//                               child: Container(
//                                 // width: responsive.setWidth(2),
//                                 child: ListView.builder(
//                                   scrollDirection: Axis.horizontal,
//                                   itemCount: controller.eventList[index!].membersList!.length > 4
//                                       ? 4
//                                       : controller.eventList[index!].membersList!.length,
//                                   itemBuilder: (context, index) {
//                                     return Align(
//                                       alignment: Alignment.bottomRight,
//                                       widthFactor: 0.5,
//                                       child: CircleAvatar(
//                                         radius: 20,
//                                         backgroundColor: Colors.white,
//                                         child: CircleAvatar(
//                                           radius: 19,
//                                           backgroundImage: index ==
//                                               (data!.membersList!.length > 4
//                                                   ? 3
//                                                   : data!.membersList!.length - 1)
//                                               ? AssetImage(
//                                               ImageConstant.imgRectangle79427X304)
//                                               : AssetImage(data!
//                                               .membersList![index].memberImage
//                                               .toString()),
//                                           child: index ==
//                                               (data!.membersList!.length > 4
//                                                   ? 3
//                                                   : data!.membersList!.length - 1)
//                                               ? MyText(
//                                             title:
//                                             '+${data!.membersList!.length > 4 ? 3 : data!.membersList!.length - 1}',
//                                             clr: ColorConstant.whiteA700,
//                                           )
//                                               : Container(),
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: responsive.setHeight(0.5),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8.0),
//                   child: MyText(
//                     title: '${controller.eventList[index!].eventName}',
//                     fontSize: responsive.setTextScale(18),
//                     weight: 'Semi Bold',
//                   ),
//                 ),
//                 SizedBox(
//                   height: responsive.setHeight(0.5),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.baseline,
//                     textBaseline: TextBaseline.ideographic,
//                     children: [
//                       MyText(
//                         title: '${controller.eventList[index!].eventType}',
//                         fontSize: responsive.setTextScale(14),
//                         weight: 'Semi Bold',
//                       ),
//                       SizedBox(width: responsive.setWidth(2),),
//                       Expanded(
//                         child: MyText(
//                           title: '${controller.eventList[index!].eventAddress}',
//                           fontSize: responsive.setTextScale(13),
//                           clr: ColorConstant.darkHintTextColor,
//                           // toverflow: TextOverflow.ellipsis,
//                           line: 1,
//                         ),
//                       ),
//                       SizedBox(width: responsive.setWidth(5),),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: responsive.setHeight(1.5),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
