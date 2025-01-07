import 'package:audioplayers/audioplayers.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/services.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/core/utils/responsive.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import 'package:salon_symphony/presentation/resource_details_screen/widgets/action_item_widget.dart';
import 'package:salon_symphony/presentation/resource_details_screen/widgets/audio_player.dart';
import 'package:salon_symphony/widgets/custom_text.dart';
import 'package:salon_symphony/widgets/response_binding_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

import '../../core/utils/app_constant.dart';
import '../../core/utils/helper_functions.dart';
import '../../widgets/error_widget.dart';
import '../../widgets/widgetSkeleton.dart';
import '../../widgets/widgets_shimmer.dart';
import '../resource_library_page/controller/resource_library_controller.dart';
import 'controller/audio_player_controller.dart';
import 'controller/resource_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_button.dart';
import 'package:salon_symphony/widgets/custom_icon_button.dart';

class ResourceDetailsScreen extends StatelessWidget {
  // Map<String, dynamic> map;
  ResourceDetailsController controller = Get.put(ResourceDetailsController());
  // AudioController audioController = Get.put(AudioController());
  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return BaseviewScreen(
      basicAppBar: true,
      basicAppTrailingIcon: ImageConstant.imgMenuIcon,
      screenName: 'Resource Details',
      sidePadding: false,
      showBottomBar: false,
      backgroundColor: ColorConstant.backgroundColor,
      basicAppTrailingIconOnTap: () {
        HelperFunction.showBottomSheet(context,
            screenTitle: 'Resource Options',
            redclrEndTask: false,
            screenEndTask: 'Done',
            bottomSheetHeight: 200,
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    String deepLink = '${AppConstant.shareBaseUrl}/resources/details/${controller.resourcesReponseModel.value.data!.id!}';
                    // String deepLink = '${AppConstant.shareBaseUrl}?resourceId=${controller.resourcesReponseModel.value.data!.id!}';
                    await Clipboard.setData(
                        ClipboardData(text: deepLink));
                    Utils.share(deepLink);
                    Utils.showToast('Copied to clipboard', false);
                    Get.back();
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
                      Text('Share resource',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: getFontSize(
                              16,
                            ),
                            letterSpacing: 0.5,
                            fontFamily: Platform.isIOS
                                ? 'SF Pro Display'
                                : 'Roboto',
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
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
                            fontFamily: Platform.isIOS
                                ? 'SF Pro Display'
                                : 'Roboto',
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                ),
              ],
            ));
      },
      child: Obx(() =>  ResponseBindingWidget(
        apiCallStatus: controller.apiCallStatus.value,
        loadingWidget: () {
          return resourceDetailShimmer(context);
        },
        errorWidget: () {
          return RecordDeletedWidget();
        },
        successWidget: () {
          return Column(
            children: [
              Expanded(
                child: Container(
                  width: size.width,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (controller.resourcesReponseModel.value.data!.type == 30 || controller.resourcesReponseModel.value.data!.link_type == 20)
                          Stack(
                            children: [
                              Container(
                                width: responsive.setWidth(100),
                                height: responsive.setHeight(25),
                                child: CommonImageView(
                                  url: controller.resourcesReponseModel
                                      .value.data!.image,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ],
                          ),
                        if(controller.resourcesReponseModel.value.data!.link_type != 20)
                          if (controller.resourcesReponseModel.value.data!.type == 10)
                            FlickVideoPlayer(
                              flickManager: controller.flickManager =
                                  FlickManager(
                                    videoPlayerController: controller.videoPlayerController!,
                                    autoPlay: false,
                                  ),

                              preferredDeviceOrientationFullscreen: [
                                // DeviceOrientation.portraitUp,
                                DeviceOrientation.landscapeLeft,
                                DeviceOrientation.landscapeRight,
                              ],
                              wakelockEnabled: true,
                                flickVideoWithControls: FlickVideoWithControls(
                                  controls: IconTheme(
                                      data: IconThemeData(color: Colors.white),
                                      child: FlickPortraitControls(
                                        progressBarSettings: FlickProgressBarSettings(
                                          // bufferedColor: Colors.blueGrey.withOpacity(0.2),
                                          // playedColor: Colors.red,
                                          // handleColor: Colors.red,
                                          // backgroundColor: Colors.black
                                        ),
                                      )))
                            ),
                        if(controller.resourcesReponseModel.value.data!.link_type != 20)
                          if (controller.resourcesReponseModel.value.data!.type == 20 )
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 20),
                                  Obx(() =>  AudioPlayerWidget(
                                      audioUrl:  controller.resourcesReponseModel.value.data!.link!
                                  ),)
                                ],
                              ),
                            ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: responsive.setHeight(2),
                              ),
                              Wrap(
                                children: controller.resourcesReponseModel
                                    .value.data!.tags!
                                    .map((item) => MyText(
                                  title:
                                  ' ${item.name!}${controller.resourcesReponseModel.value.data!.tags!.indexOf(item) == controller.resourcesReponseModel.value.data!.tags!.length - 1 ? '' : ','}',
                                  fontSize: 11,
                                  weight: 'Regular',
                                  clr: ColorConstant
                                      .deepPurpleA201,
                                ))
                                    .toList()
                                    .cast<Widget>(),
                              ),
                              SizedBox(
                                height: responsive.setHeight(1),
                              ),
                              MyText(
                                title: controller.resourcesReponseModel
                                    .value.data!.name!,
                                fontSize: responsive.setTextScale(22),
                                line: 2,
                                weight: 'Bold',
                                letterSpacing: 0.5,
                                // toverflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: responsive.setHeight(1),
                              ),
                              Row(
                                children: [
                                  MyText(
                                    title:
                                    '${controller.resourcesReponseModel.value.data!.type == 30 ? 'PDF' : controller.resourcesReponseModel.value.data!.type == 10 ? 'VIDEO' : 'AUDIO'}  ',
                                    fontSize: responsive.setTextScale(12),
                                    toverflow: TextOverflow.ellipsis,
                                    clr: ColorConstant.hintTextColor,
                                  ),
                                  Icon(
                                    Icons.circle,
                                    size: responsive.setHeight(0.4),
                                    color: ColorConstant.hintTextColor,
                                  ),
                                  MyText(
                                    title:
                                    '  Posted on ${Utils.formatDate(controller.resourcesReponseModel.value.data!.updatedAt!)}',
                                    fontSize: responsive.setTextScale(12),
                                    toverflow: TextOverflow.ellipsis,
                                    clr: ColorConstant.hintTextColor,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: responsive.setHeight(2),
                              ),
                              Divider(),
                              SizedBox(
                                height: responsive.setHeight(2),
                              ),
                              MyText(
                                title: 'Description',
                                fontSize: responsive.setTextScale(15),
                                weight: 'Semi Bold',
                                toverflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: responsive.setHeight(1),
                              ),
                              MyText(
                                title: controller.resourcesReponseModel.value.data!.description != "" ? controller.resourcesReponseModel.value.data!.description! : 'No description available',
                                fontSize: responsive.setTextScale(14),
                                letterSpacing: 0.5,
                                // clr: ColorConstant.hintTextColor,
                              ),
                              SizedBox(
                                height: responsive.setHeight(5),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: responsive.setHeight(10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffAF5F6F8),
                  border: Border(
                    top: BorderSide(
                      color: ColorConstant.gray301,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    if (controller.resourcesReponseModel.value.data!.type == 30 || controller.resourcesReponseModel.value.data!.link_type == 20)
                      GestureDetector(
                          onTap: () async {

                            Utils.launchUrls(controller.resourcesReponseModel.value.data!.link!);
                          },
                          child: CustomButton(
                              width: 343,
                              text: controller.resourcesReponseModel.value.data!.link_type == 20 && controller.resourcesReponseModel.value.data!.type == 10 ? "Watch Video": controller.resourcesReponseModel.value.data!.link_type == 20 && controller.resourcesReponseModel.value.data!.type == 30 ? "View Resource" :controller.resourcesReponseModel.value.data!.link_type == 20 && controller.resourcesReponseModel.value.data!.type == 20 ? "View Resource": "Download",
                              prefixWidget:
                              controller.resourcesReponseModel.value.data!.link_type == 20 ?Offstage():
                              Padding(
                                padding:
                                const EdgeInsets.only(right: 8.0),
                                child: CommonImageView(
                                  svgPath: ImageConstant.download_icon,
                                  fit: BoxFit.cover,
                                  height: responsive.setHeight(2),
                                  color: ColorConstant.whiteA700,
                                ),
                              ),
                              margin: getMargin(
                                  left: 16,
                                  top: 15,
                                  right: 16,
                                  bottom: 30),
                              padding: ButtonPadding.PaddingAll18,
                              fontStyle:
                              ButtonFontStyle.PoppinsSemiBold16)),
                  ],
                ),
              )
            ],
          );
        },
      ),)

    );
  }
}
