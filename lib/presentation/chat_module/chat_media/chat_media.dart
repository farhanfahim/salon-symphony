import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/presentation/chat_module/chat_strings.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/responsive.dart';
import '../chat_constants.dart';
import 'controller/chat_media_controller.dart';

class ChatMedia extends StatelessWidget {
  Responsive responsive = Responsive();
  ChatMediaController controller = Get.put(ChatMediaController( ));

  @override
  Widget build(BuildContext context) { 
    responsive.setContext(context);
    return   Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        Obx(() => controller.chatMediaList.length>0?GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.all(5),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
          ),
          itemCount: controller.chatMediaList.length,
          itemBuilder: (context, index) {

            return GestureDetector(
              onTap: () {
                controller.onTapItem(controller.chatMediaList[index].thumbnail,index);
              },
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  CommonImageView(
                    radius: BorderRadius.circular(5),
                    width:double.maxFinite, height:double.maxFinite,
                    url: controller.chatMediaList[index].thumbnail,
                    fit: BoxFit.cover,
                  ),
                  Visibility(
                    visible:
                    controller.chatMediaList[index].mediaType == ChatStrings.messageTypeVideo,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 2,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                        ),
                        gradient: LinearGradient(
                            colors: [
                              Colors.black38,
                              Colors.black12.withOpacity(0.1),
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: const [
                              0.7,
                              0.9,
                            ],
                            tileMode: TileMode.clamp),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: CommonImageView(
                              width: 20,
                              height: 20,
                              svgPath: ImageConstant.video_icon,color: ColorConstant.whiteA702,),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            );
          },
        )
            :Expanded(
              child: SizedBox(
          width: double.maxFinite,
          child: Center(
              child: Text(
                  ChatConstants.noMediaFound,
                  style: AppStyle.txtPoppinsSemiBold16.copyWith(
                    height: 1.50,
                    letterSpacing: 0.5,
                  )
              ),
          ),
        ),
            ),)

      ],
    );
  }
}
