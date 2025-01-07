import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/presentation/chat_module/chatting_view/widget/chat_message_tile.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/utils/color_constant.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../widgets/common_image_view.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/skeleton.dart';
import '../../chat_strings.dart';
import '../controller/chatting_view_controller.dart';

class ChattingTile extends StatelessWidget {
  ChattingTile({
    Key? key,
    required this.type,
    required this.userId,
    required this.senderId,
    required this.text,
    required this.image,
    required this.video,
    required this.pdf,
    required this.time,
    required this.fromGroup,
    this.onTimeTap,
  }) : super(key: key);

  final int type;
  final int userId;
  final int senderId;
  final String text;
  final String image;
  final String video;
  final String pdf;
  final String time;
  final bool fromGroup;
  final Function()? onTimeTap;

  final _fireStore = FirebaseFirestore.instance;

  Responsive responsive = Responsive();
  ChattingViewController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    bool isSender = false;
    isSender = userId == senderId;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: Row(
        crossAxisAlignment: isSender==false && fromGroup ? CrossAxisAlignment.start : CrossAxisAlignment.start,
        mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          isSender || type == ChatStrings.messageTypeMemberAddedLeave
              ? const SizedBox()
              : StreamBuilder<DocumentSnapshot>(
              stream: controller.getUser(senderId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ClipRRect(
                    borderRadius:
                    BorderRadius.circular(100),
                    child: snapshot.requireData.get(ChatStrings.image)!=""?CommonImageView(
                        width:35,
                        height:35,
                        fit: BoxFit.cover,
                        url: snapshot.requireData.get(ChatStrings.image)):CommonImageView(
                      svgPath: ImageConstant.imgUser,
                      height:35,
                      width: 35,
                      fit: BoxFit.cover,
                    ),
                  );
                } else {
                  return Container(width: responsive.setHeight(3.3),height: responsive.setHeight(3.3),);
                }
              }),
          SizedBox(
            width: 10,
          ),

          type == ChatStrings.messageTypeMemberAddedLeave
              ? Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    text,
                  ),
                )
              ],
            ),
          )
              : Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: !isSender && fromGroup,
                    child: StreamBuilder<DocumentSnapshot>(
                        stream: controller.getUser(senderId),
                        builder: (context, snapshot) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 1,left: 2),
                            child: Text(
                              snapshot.hasData ? snapshot.requireData.get(ChatStrings.name) : "",
                            ),
                          );
                        }),
                  ),
                  type == ChatStrings.messageTypeImage || type == ChatStrings.messageTypeVideo || type == ChatStrings.messageTypeDoc
                      ? GestureDetector(
                      onTap: () {
                        print(pdf);
                        if(type == ChatStrings.messageTypeDoc) {
                          /// todo open doc
                          if (pdf != "") {
                            launch(pdf);
                          }
                        } else if(image != ""){
                          if (type == ChatStrings.messageTypeImage) {
                            if (image != "") {
                              Map<String, dynamic> map = {ChatStrings.imageUrl: image};
                              Get.toNamed(AppRoutes.imageView,arguments: map);
                            }
                          } else if (type == ChatStrings.messageTypeVideo) {
                            Map<String, dynamic> map = {ChatStrings.videoUrl: video};
                            Get.toNamed(AppRoutes.videoView,arguments: map);
                          }
                        }

                      },
                      child: type == ChatStrings.messageTypeDoc? Icon(
                        Icons.picture_as_pdf_rounded
                      )
                          : type == ChatStrings.messageTypeVideo?Stack(
                        alignment: Alignment.center,
                        children: [
                          image == ""
                              ? Skeleton(
                            width: 150,
                            height: 150,
                            cornerRadius: 20,
                            switcholor: true,
                          ) :CommonImageView(
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                              radius: BorderRadius.circular(20),
                              url: image),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorConstant.primaryColor.withOpacity(0.5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: CommonImageView(
                                svgPath: ImageConstant.video_play_icon,color: ColorConstant.whiteA702,),
                            ),
                          ),
                        ],
                      )
                          :image == ""
                          ? Skeleton(
                        width: 150,
                        height: 150,
                        cornerRadius: 20,
                        switcholor: true,
                      )
                          : CommonImageView(
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                          radius: BorderRadius.circular(20),
                          url: image)
                  )
                      : ChatMessageTile(
                    text: text,
                    isSender: isSender,
                  ),

                  // Container(
                  //   margin: isSender ? EdgeInsets.only(left: 50) : EdgeInsets.only(right: 50),
                  //   decoration: BoxDecoration(
                  //     color: isSender ? Color(0xff7B68EE) : Color(0xffF0F0F0),
                  //     borderRadius: BorderRadius.only(
                  //       bottomLeft: Radius.circular(18),
                  //       bottomRight: Radius.circular(18),
                  //       topLeft: Radius.circular(18),
                  //       topRight: Radius.circular(18),
                  //     ),
                  //   ),
                  //   padding: const EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
                  //   child: Linkify(
                  //     text: text,
                  //     onOpen: (link) async {
                  //       final url = link.url;
                  //       if (url.startsWith('SalonSymphony://share')) {
                  //         print('hammad');
                  //         // Handle custom logic here for SalonSymphony URL
                  //         // For example, you can navigate to a specific screen in your app.
                  //         // Make sure you have implemented the necessary navigation logic.
                  //         // Here's a sample using the `url_launcher` package:
                  //         if (await canLaunch(url)) {
                  //           await launch(url);
                  //         } else {
                  //           throw 'Could not launch $url';
                  //         }
                  //       } else {
                  //         // Handle other URLs using the default URL handling logic.
                  //         // For example, open web URLs in a browser.
                  //         if (await canLaunch(link.url)) {
                  //           await launch(link.url);
                  //         } else {
                  //           throw 'Could not launch $link';
                  //         }
                  //       }
                  //     },
                  //     style: TextStyle(
                  //       color: isSender ? ColorConstant.whiteA700 : ColorConstant.blackColor,
                  //       fontSize: responsive.setTextScale(16),
                  //       fontFamily: Platform.isIOS ? 'SF Pro Display' : 'Roboto',
                  //     ),
                  //   ),
                  // ),

                // TIMESTAMP REMOVED ON 06-10-2023 (CR)

                  // SizedBox(height: 5,),
                  // MyText(
                  //   title:
                  //   time,
                  //   fontSize: responsive.setTextScale(10),
                  //   clr: ColorConstant.gray600,
                  // ),
                  SizedBox(height: 5,),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          isSender==false  || type == ChatStrings.messageTypeMemberAddedLeave
              ? const SizedBox()
              : StreamBuilder<DocumentSnapshot>(
              stream: controller.getUser(senderId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ClipRRect(
                    borderRadius:
                    BorderRadius.circular(100),
                    child: snapshot.requireData.get(ChatStrings.image)!=""?CommonImageView(
                        width:35,
                        height:35,
                        fit: BoxFit.cover,
                        url: snapshot.requireData.get(ChatStrings.image)):CommonImageView(
                      svgPath: ImageConstant.imgUser,
                      height:35,
                      width: 35,
                      fit: BoxFit.cover,
                    ),
                  );
                } else {
                  return Container(width: responsive.setHeight(3.3),height: responsive.setHeight(3.3),);
                }
              }),
        ],
      ),
    );
  }
}
