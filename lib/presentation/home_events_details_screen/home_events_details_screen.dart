import 'dart:io';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/core/utils/dummy_content.dart';
import 'package:salon_symphony/core/utils/responsive.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import 'package:salon_symphony/data/models/eventsListModel.dart';
import 'package:salon_symphony/presentation/home_events_details_screen/widgets/action_item_widget.dart';
import 'package:salon_symphony/widgets/custom_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/utils/app_constant.dart';
import '../../core/utils/helper_functions.dart';
import '../../data/services/api_call_status.dart';
import '../../widgets/custom_radio_button.dart';
import '../../widgets/error_widget.dart';
import '../../widgets/response_binding_widget.dart';
import '../../widgets/skeleton.dart';
import '../../widgets/widgetSkeleton.dart';
import '../home_screen/controller/home_controller.dart';
import 'controller/home_events_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_button.dart';
import 'package:salon_sym'
    'phony/widgets/custom_text_form_field.dart';

class HomeEventsDetailsScreen extends StatelessWidget {
  HomeController controller = Get.put(HomeController());
  Responsive responsive = Responsive();

  // eventDataModel? data;
  // EventsData? data2;
  // int? index;

  var map = Get.arguments;

  HomeEventsDetailsScreen();

  HomeEventsDetailsController detailController =
      Get.put(HomeEventsDetailsController());

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return BaseviewScreen(
        isMenuTab: true,
        backgroundColor: ColorConstant.backgroundColor,
        showBottomBar: false,
        stickyHeader: true,
        basicAppBar: true,
        screenName: 'Event Details',
        sidePadding: false,
        mainTopHeight: 0.5,
        basicAppTrailingIcon: ImageConstant.imgMenuIcon,
        basicAppTrailingIconOnTap: () {
          HelperFunction.showBottomSheet(context,
              screenTitle: 'Event Options',
              redclrEndTask: false,
              screenEndTask: 'Done',
              bottomSheetHeight: 210,
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                      String deepLink = '${AppConstant.shareBaseUrl}/events/details/${detailController.eventsreponseModel.value.id}';
                      // String deepLink = '${AppConstant.shareBaseUrl}?eventId=${detailController.eventsreponseModel.value.id}&index=${int.parse(map['index'].toString())}';
                      deepLink = Uri.encodeFull(deepLink);
                      // await Clipboard.setData(ClipboardData(text: deepLink));
                      Utils.share(deepLink);
                    },
                    child: Row(
                      children: [
                        CommonImageView(
                          imagePath: ImageConstant.share_icon,
                          height: 17,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text('Share event',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                16,
                              ),
                              letterSpacing: 0.5,
                              fontFamily:
                                  Platform.isIOS ? 'SF Pro Display' : 'Roboto',
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () async {
                      try {
                        Utils.reportProblem();
                      } catch (e) {
                        Utils.showToast(e.toString(), true);
                      }
                    },
                    child: Row(
                      children: [
                        CommonImageView(
                          imagePath: ImageConstant.report_problem_icon,
                          height: 17,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text('Report a Problem',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                16,
                              ),
                              letterSpacing: 0.5,
                              fontFamily:
                                  Platform.isIOS ? 'SF Pro Display' : 'Roboto',
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                  ),
                ],
              ));
        },
        child: Obx(() => ResponseBindingWidget(
          apiCallStatus: detailController.apiCallStatus.value,
          loadingWidget: () {
            return resourceDetailShimmer(context);
          },
          errorWidget: (){
            return RecordDeletedWidget();
          },
          successWidget: () {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(children: [
                                  Container(
                                    height: responsive.setHeight(30),
                                    width: responsive.setWidth(100),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.red100,
                                     /*   image: DecorationImage(
                                            image: NetworkImage(
                                              detailController
                                                  .eventsreponseModel
                                                  .value
                                                  .image!,
                                            ),
                                            fit: BoxFit.cover)*/),
                                    child: CommonImageView(
                                      url:  detailController
                                          .eventsreponseModel
                                          .value
                                          .image!,
                                      fit: BoxFit.cover,

                                    ),
                                  ),
                                  //container with rounded border
                                  Container(
                                    // height: responsive.setHeight(6.5),
                                    // width: responsive.setWidth(13),
                                    margin: getMargin(top: 15),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(5),
                                          bottomRight: Radius.circular(5)),
                                      color: ColorConstant.primaryColor,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0,
                                              bottom: 8,
                                              left: 15,
                                              right: 15),
                                          child: Text(
                                            Utils.formatDate(detailController
                                                .eventsreponseModel
                                                .value
                                                .startDate!),
                                            style: AppStyle
                                                .txtRobotoRegular20Black9001
                                                .copyWith(
                                                color:
                                                ColorConstant.whiteA700,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: responsive.setHeight(2),
                                      ),
                                      Text(
                                          "${detailController.eventsreponseModel.value.name}",
                                          // overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsSemiBold18
                                              .copyWith(
                                              letterSpacing: 0.07,
                                              fontSize: 24,
                                              fontWeight: FontWeight.w800)),
                                      SizedBox(
                                        height: responsive.setHeight(2),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: getSize(25.00),
                                            width: getSize(24.00),
                                            decoration: BoxDecoration(
                                              color: ColorConstant.whiteA700,
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: ColorConstant.gray300,
                                                  width: 1),
                                            ),
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(4.0),
                                              child: CommonImageView(
                                                  imagePath: ImageConstant.bag,
                                                  height: getSize(16.00),
                                                  width: getSize(16.00)),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          MyText(
                                            title:
                                            "${detailController.eventsreponseModel.value.type == 10 ? 'In-Person' : 'Online'}, ${detailController.eventsreponseModel.value.category!.name}",
                                            clr: ColorConstant.black900,
                                            weight: 'Semi Bold',
                                            fontSize: 13.5,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: responsive.setHeight(1),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: getSize(25.00),
                                            width: getSize(24.00),
                                            decoration: BoxDecoration(
                                              color: ColorConstant.whiteA700,
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: ColorConstant.gray300,
                                                  width: 1),
                                            ),
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(4.0),
                                              child: CommonImageView(
                                                  imagePath:
                                                  ImageConstant.global_logo,
                                                  height: getSize(16.00),
                                                  width: getSize(16.00)),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Flexible(
                                            child: GestureDetector(
                                              onTap: () {

                                                if(detailController.eventsreponseModel.value.type==10){
                                                  Utils.launchUrls(detailController
                                                          .eventsreponseModel
                                                          .value
                                                          .location!);
                                                }else{
                                                  Utils
                                                      .launchUrls(
                                                      detailController
                                                          .eventsreponseModel
                                                          .value
                                                          .link!);
                                                }

                                              },
                                              child: MyText(
                                                title:
                                                detailController.eventsreponseModel.value.type == 10?"${detailController.eventsreponseModel.value.address}":"${detailController.eventsreponseModel.value.link}",
                                                clr: ColorConstant.deepPurpleA200,
                                                weight: 'Semi Bold',
                                                line: 1,
                                                toverflow: TextOverflow.ellipsis,
                                                fontSize: 13.5,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: responsive.setHeight(1),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: getSize(25.00),
                                            width: getSize(24.00),
                                            decoration: BoxDecoration(
                                              color: ColorConstant.whiteA700,
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: ColorConstant.gray300,
                                                  width: 1),
                                            ),
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(4.0),
                                              child: CommonImageView(
                                                  imagePath: ImageConstant
                                                      .calendar_check,
                                                  height: getSize(16.00),
                                                  width: getSize(16.00)),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Flexible(
                                            child: MyText(
                                              title:
                                              "${detailController.eventsreponseModel.value.startTime} ${detailController.eventsreponseModel.value.timezone == null ? '' : detailController.eventsreponseModel.value.timezone!} - ${detailController.eventsreponseModel.value.endTime} ${detailController.eventsreponseModel.value.timezone == null ? '' : detailController.eventsreponseModel.value.timezone!}",
                                              clr: ColorConstant.black900,
                                              line: 2,
                                              weight: 'Semi Bold',
                                              fontSize: 13.5,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: responsive.setHeight(1),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: getSize(25.00),
                                            width: getSize(25.00),
                                            decoration: BoxDecoration(
                                              color: ColorConstant.whiteA700,
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: ColorConstant.gray300,
                                                  width: 1),
                                            ),
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(4.0),
                                              child: CommonImageView(
                                                  imagePath:
                                                  ImageConstant.clr_user2,
                                                  height: getSize(16.00),
                                                  width: getSize(16.00)),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Flexible(
                                            child: MyText(
                                              title:
                                              "With ${detailController.eventsreponseModel.value.instructor}",
                                              clr: ColorConstant.black900,
                                              weight: 'Semi Bold',
                                              line: 2,
                                              toverflow: TextOverflow.ellipsis,
                                              fontSize: 13.5,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: responsive.setHeight(2),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: ColorConstant.gray100,
                                  thickness: 1,
                                ),
                                detailController
                                    .eventsreponseModel
                                    .value
                                    .allReservation!
                                    .length>0?InkWell(
                                  onTap: () {
                                    HelperFunction.showBottomSheet(
                                      redclrEndTask: false,
                                      context,
                                     isScrollControlled: true,
                                      bottomSheetHeight:
                                      responsive.setHeight(80),
                                      spaceBetween: responsive.setHeight(4),
                                      screenEndTask: 'Done',
                                      screenTitle: 'Members Going',
                                      widget: ListView.builder(
                                        itemCount: detailController
                                            .eventsreponseModel
                                            .value
                                            .allReservation!
                                            .length,
                                        itemBuilder:
                                            (BuildContext context, int ind) {
                                          return GestureDetector(
                                            onTap: () {
                                              Get.back();
                                              if(detailController.userID == detailController.eventsreponseModel.value.allReservation![ind].user?.id.toString()){
                                                Get.toNamed(
                                                    AppRoutes.myProfileScreen);
                                              }else {
                                                Get.toNamed(AppRoutes.employeeDicrectryDetailsScreen, arguments: {
                                                  'id': detailController.eventsreponseModel.value.allReservation![ind].user?.id,
                                                  'name': detailController.eventsreponseModel.value.allReservation![ind].user!.name,
                                                });
                                              }
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  bottom:
                                                  responsive.setHeight(2)),
                                              child: Row(
                                                children: [
                                                  detailController.eventsreponseModel.value.allReservation![ind].user != null &&
                                                  detailController.eventsreponseModel.value.allReservation![ind].user!.image != null
                                                      ? CommonImageView(
                                                    url: detailController.eventsreponseModel.value.allReservation![ind].user!.image.toString(),
                                                    height:getSize(35.00),
                                                    width:getSize(35.00),
                                                    radius: BorderRadius.circular(50),
                                                  ) : CommonImageView(
                                                    svgPath: ImageConstant
                                                        .imgUser,
                                                    height:
                                                    getSize(35.00),
                                                    width: getSize(35.00),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                    responsive.setWidth(4),
                                                  ),
                                                  MyText(
                                                    title:
                                                    '${detailController.eventsreponseModel.value.allReservation![ind].user != null ? detailController.eventsreponseModel.value.allReservation![ind].user!.name : ' '}',
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: responsive.setWidth(100),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.whiteA700),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 32.0,
                                          right: 8,
                                          top: 10,
                                          bottom: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: responsive.setHeight(5),
                                            width: detailController.eventsreponseModel.value.allReservation!.length > 3
                                                ? responsive.setWidth(26)
                                                :detailController.eventsreponseModel.value.allReservation!.length == 3 ? responsive.setWidth(18):detailController.eventsreponseModel.value.allReservation!.length == 2 ? responsive.setWidth(13) : responsive.setWidth(7),
                                            // width: responsive.setWidth(2),
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: detailController
                                                  .eventsreponseModel
                                                  .value
                                                  .allReservation!
                                                  .length >
                                                  4
                                                  ? 4
                                                  : detailController
                                                  .eventsreponseModel
                                                  .value
                                                  .allReservation!
                                                  .length,
                                              itemBuilder: (context, index) {
                                                return Align(
                                                  alignment:
                                                  Alignment.bottomRight,
                                                  widthFactor: 0.6,
                                                  child: CircleAvatar(
                                                    radius: 18,
                                                    backgroundColor:
                                                    Colors.transparent,
                                                    child: index ==
                                                        (detailController
                                                            .eventsreponseModel
                                                            .value
                                                            .allReservation!
                                                            .length >
                                                            4
                                                            ? 3
                                                            : detailController
                                                            .eventsreponseModel
                                                            .value
                                                            .allReservation!
                                                            .length -
                                                            1)
                                                        ? Stack(
                                                      children: [
                                                        detailController
                                                            .eventsreponseModel
                                                            .value
                                                            .allReservation![index].user != null
                                                            && detailController
                                                            .eventsreponseModel
                                                            .value
                                                            .allReservation![
                                                        index]
                                                            .user!
                                                            .image != null
                                                            ? CircleAvatar(
                                                          backgroundColor: Colors.transparent,
                                                          radius:
                                                          17.5,
                                                          backgroundImage: NetworkImage(
                                                              detailController
                                                              .eventsreponseModel
                                                              .value
                                                              .allReservation![index]
                                                              .user!
                                                              .image
                                                              .toString()),
                                                        )
                                                            : CommonImageView(
                                                          svgPath:
                                                          ImageConstant.imgUser,
                                                          height:
                                                          getSize(40.00),
                                                          width:
                                                          getSize(40.00),
                                                        ),
                                                        detailController
                                                            .eventsreponseModel
                                                            .value
                                                            .allReservation!
                                                            .length >
                                                            4
                                                            ? Positioned(
                                                            child:
                                                            Container(
                                                              decoration:
                                                              BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .black26
                                                                    .withOpacity(0.5),
                                                              ),
                                                              child:
                                                              Center(
                                                                child:
                                                                MyText(
                                                                  title:
                                                                  '+${detailController.eventsreponseModel.value.allReservation!.length - 4}',
                                                                  fontSize:
                                                                  responsive.setTextScale(10),
                                                                  weight:
                                                                  'Semi Bold',
                                                                  clr: ColorConstant
                                                                      .whiteA700,
                                                                ),
                                                              ),
                                                            ))
                                                            : Offstage()
                                                      ],
                                                    )
                                                        : detailController.eventsreponseModel.value.allReservation![index].user != null
                                                        ?
                                                    detailController
                                                        .eventsreponseModel
                                                        .value
                                                        .allReservation![
                                                    index]
                                                        .user!
                                                        .image != null
                                                        ?
                                                        CommonImageView(
                                                          url: detailController
                                                              .eventsreponseModel
                                                              .value
                                                              .allReservation![
                                                          index]
                                                              .user!
                                                              .image
                                                              .toString(),
                                                          radius: BorderRadius.circular(100),
                                                          height:
                                                          getSize(
                                                              40.00),
                                                          width: getSize(
                                                              40.00),
                                                        )
                                                        : CommonImageView(
                                                      svgPath:
                                                      ImageConstant
                                                          .imgUser,
                                                      height:
                                                      getSize(
                                                          40.00),
                                                      width: getSize(
                                                          40.00),
                                                    )
                                                        : CommonImageView(
                                                      svgPath:
                                                      ImageConstant
                                                          .imgUser,
                                                      height: getSize(
                                                          40.00),
                                                      width: getSize(
                                                          40.00),
                                                    ),

                                                    /*CircleAvatar(
                                                radius: 17.5,
                                                backgroundImage: index ==
                                                        (detailController.eventsreponseModel.value.eventReservations!.length >
                                                                4
                                                            ? 3
                                                            : detailController.eventsreponseModel.value.eventReservations!.length-
                                                                1)
                                                    ? AssetImage(ImageConstant
                                                        .imgRectangle79427X304)
                                                    : AssetImage(detailController.eventsreponseModel.value.eventReservations![index].user!.image
                                                        .toString()),
                                              ),*/
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: responsive.setWidth(3),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                  "${detailController.eventsreponseModel.value.allReservation!.length} ${detailController.eventsreponseModel.value.allReservation!.length > 1? "Members" : 'Member'} Going",
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle.txtPoppinsMedium14
                                                      .copyWith(
                                                      letterSpacing: 0.5)),
                                              SizedBox(
                                                width: responsive.setWidth(1),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(top: 3.0),
                                                child: Icon(
                                                  Icons.keyboard_arrow_down_sharp,
                                                  size: responsive.setTextScale(20),
                                                  color: ColorConstant.black900,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ):Container(),
                                detailController
                                    .eventsreponseModel
                                    .value
                                    .allReservation!
                                    .length>0?Divider():Container(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: responsive.setHeight(2.5),
                                      ),
                                      Text("Event Details",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsSemiBold16
                                              .copyWith(
                                              letterSpacing: 0.36,
                                              height: 1.00,
                                              fontSize: 14.5,
                                              fontWeight: FontWeight.w700)),
                                      SizedBox(
                                        height: responsive.setHeight(1),
                                      ),
                                      Linkify(
                                        onOpen: (link) async {
                                        Utils.launchUrls(link.url);
                                        },
                                        linkStyle: TextStyle(
                                            color: Color(0xFF7b68ee),
                                            fontSize: 13.5,
                                            fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
                                            height: 1.3,
                                            fontWeight: FontWeight.w400),
                                        text: '${detailController.eventsreponseModel.value.description}',
                                        style:TextStyle(
                                            color: ColorConstant.black900,
                                            fontSize: 13.5,
                                            fontFamily: Platform.isIOS
                                                ? 'SF Pro Display'
                                                : 'Roboto',
                                            height: 1.3,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: responsive.setHeight(3.5),
                                      ),
                                      detailController.eventsreponseModel.value.type == 10 && detailController.eventsreponseModel.value.lat != '' &&  detailController.eventsreponseModel.value.long != '' ?
                                      Container(
                                        height: 200,
                                        child: GoogleMap(
                                          //onMapCreated: controller.onMapCreated,
                                          myLocationButtonEnabled: false,
                                          markers: detailController.markers!,
                                          onTap: (latLng) async {
                                            if(Platform.isIOS){
                                              Utils.launchUrls(detailController
                                                  .eventsreponseModel
                                                  .value
                                                  .location!);
                                            }
                                          },
                                          zoomGesturesEnabled: true,
                                          zoomControlsEnabled: true,
                                          initialCameraPosition: CameraPosition(
                                            target: detailController.center!,
                                            zoom: 11.0,
                                          ),
                                        ),
                                      ):Offstage(),
                                      SizedBox(
                                        height: responsive.setHeight(6),
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
                // Obx(() =>
                Positioned(
                  bottom: 0,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: ColorConstant.stickyBorderColor
                                .withOpacity(0.3),
                          ),
                        ),
                      ),
                      child: Obx(
                            () => GestureDetector(
                            onTap: () {
                              controller.updateStatus(detailController.eventsreponseModel.value);
                              HelperFunction.showBottomSheet(
                                redclrEndTask: false,
                                context,
                                bottomSheetHeight: responsive.setHeight(32),
                                spaceBetween: responsive.setHeight(4),
                                screenTitle: 'Event Status',
                                screenEndTask: "Done",
                                widget: ListView.builder(
                                  itemCount: controller.listIntrust.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (BuildContext context, int ind) {
                                    return ind == 3
                                        ? Container()
                                        : Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            controller.eventList[ind]
                                                .eventIntrust =
                                                detailController
                                                    .listIntrust[ind].id;
                                            controller.listIntrust[ind]
                                                .selected!.value = true;
                                            controller.eventsReservation(
                                                detailController.eventsreponseModel.value.id!,
                                                controller.eventList[ind]
                                                    .eventIntrust ==
                                                    10
                                                    ? 10
                                                    : controller
                                                    .eventList[ind]
                                                    .eventIntrust ==
                                                    20
                                                    ? 20
                                                    : 30,
                                                detailController.eventsreponseModel.value

                                            );
                                            if (detailController.eventsreponseModel.value.userReservation != null) {
                                              detailController.eventsreponseModel.value.userReservation!
                                                  .localStatusId!
                                                  .value =
                                              controller
                                                  .listIntrust[ind]
                                                  .id!;
                                              controller.eventList[ind].eventIntrust ==
                                                  10
                                                  ? detailController.eventsreponseModel.value
                                                  .localStatus
                                                  .value = 'Going'
                                                  : controller
                                                  .eventList[
                                              ind]
                                                  .eventIntrust ==
                                                  20
                                                  ?        detailController.eventsreponseModel.value
                                                  .localStatus
                                                  .value =
                                              'Interested' : controller.eventList[ind].eventIntrust ==
                                                  30
                                                  ?       detailController.eventsreponseModel.value
                                                  .localStatus
                                                  .value = "Can't Go"
                                                  : '';
                                            }
                                            print('index ====> $ind');
                                            controller.eventList
                                                .refresh();
                                            Get.back();
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                bottom: responsive
                                                    .setHeight(1),
                                                right: 20),
                                            child: Row(
                                              children: [
                                                CommonImageView(
                                                  imagePath:
                                                  detailController
                                                      .listIntrust[
                                                  ind]
                                                      .image,
                                                  height: responsive
                                                      .setHeight(4),
                                                ),
                                                SizedBox(
                                                  width: responsive
                                                      .setWidth(4),
                                                ),
                                                MyText(
                                                  title:
                                                  '${detailController.listIntrust[ind].name}',
                                                  //weight: 'Semi Bold',
                                                ),
                                                Spacer(),
                                                Obx(
                                                      () => controller
                                                      .listIntrust[
                                                  ind]
                                                      .selected! ==
                                                      true
                                                      ? Container(
                                                    margin:
                                                    getMargin(
                                                      //   top: 15,
                                                      right: 5,
                                                      //   bottom: 15,
                                                    ),
                                                    decoration:
                                                    AppDecoration
                                                        .outlineBluegray100
                                                        .copyWith(
                                                      borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder10,
                                                      border: Border
                                                          .all(
                                                        color: ColorConstant
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                      MainAxisSize
                                                          .min,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .center,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .start,
                                                      children: [
                                                        Container(
                                                          height:
                                                          getSize(
                                                            15.00,
                                                          ),
                                                          width:
                                                          getSize(
                                                            15.00,
                                                          ),
                                                          margin:
                                                          getMargin(
                                                            all: 1,
                                                          ),
                                                          decoration:
                                                          BoxDecoration(
                                                            color: ColorConstant
                                                                .primaryColor,
                                                            borderRadius:
                                                            BorderRadius.circular(
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
                                                    margin:
                                                    getMargin(
                                                      // top: 15,
                                                      right: 5,
                                                      // bottom: 15,
                                                    ),
                                                    decoration:
                                                    AppDecoration
                                                        .outlineBluegray100
                                                        .copyWith(
                                                      borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder10,
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                      MainAxisSize
                                                          .min,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .center,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .start,
                                                      children: [
                                                        Container(
                                                          height:
                                                          getSize(
                                                            15.00,
                                                          ),
                                                          width:
                                                          getSize(
                                                            15.00,
                                                          ),
                                                          margin:
                                                          getMargin(
                                                            all: 1,
                                                          ),
                                                          decoration:
                                                          BoxDecoration(
                                                            color: ColorConstant
                                                                .whiteA700,
                                                            borderRadius:
                                                            BorderRadius.circular(
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
                                        ),
                                        ind == 3 ? Offstage() : Divider(),
                                      ],
                                    );
                                  },
                                ),
                              );
                            },
                            child: Padding(
                                padding: const EdgeInsets.only(top: 10.0, left: 15 ,right: 15 ,bottom: 30),
                                child: controller.isLoading.value == false
                                    ?
                                Obx(() => Container(
                                  height: responsive.setHeight(6),
                                  width: responsive.setWidth(100),
                                  decoration: BoxDecoration(
                                      gradient:  detailController.eventsreponseModel.value.localStatus.value == 'Going' ? LinearGradient(
                                          colors: [
                                            ColorConstant
                                                .primaryColor,
                                            ColorConstant
                                                .primaryColor,
                                            ColorConstant
                                                .appPinkColor,
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          stops: const [
                                            0.05,
                                            0.3,
                                            0.95
                                          ])
                                          : null,
                                      color: detailController.eventsreponseModel.value
                                          .localStatus == ''
                                          ? Color(0xffF1F3F6)
                                          : detailController.eventsreponseModel.value
                                          .localStatus
                                          .value ==
                                          'Going'
                                          ? ColorConstant.appPinkColor
                                          : detailController.eventsreponseModel.value
                                          .localStatus
                                          .value ==
                                          'Interested'
                                          ? ColorConstant.primaryColor
                                          : ColorConstant.appPinkColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: responsive.setWidth(10),
                                      ),
                                      MyText(
                                        title: detailController.eventsreponseModel.value
                                            .localStatus == ''
                                            ? 'RSVP TO EVENT'
                                            : detailController.eventsreponseModel.value
                                            .localStatus
                                            .value
                                            .toUpperCase(),
                                        fontSize: 14,
                                        clr: detailController.eventsreponseModel.value
                                            .localStatus == ''
                                            ? ColorConstant.black900
                                            : ColorConstant.whiteA700,
                                        weight: 'Bold',
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.all(8.0),
                                        child: CommonImageView(
                                          svgPath: ImageConstant
                                              .imgVuesaxBoldArrowdown,
                                          color:  detailController.eventsreponseModel.value
                                              .localStatus == '' ?
                                          ColorConstant.gray350:ColorConstant.whiteA700,

                                        ),
                                      )
                                    ],
                                  ),
                                ))
                                    : Skeleton(
                                  switcholor: true,
                                  width: double.infinity,
                                  height: 50,
                                  cornerRadius: 5,
                                ))),
                      )),
                ),
                // )
              ],
            );
          },
        )));
  }

  // make a function for url launcher and call it on ontap of the button
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  onTapImgArrowleft() {
    Get.back();
  }

  onTapImgHiconBold() {
    Get.toNamed(AppRoutes.eventDetailsScreen);
  }

  onTapColumnlanguage() {
    Get.toNamed(AppRoutes.goingMembersScreen);
  }
}
