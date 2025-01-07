import 'package:salon_symphony/core/utils/responsive.dart';
import 'package:salon_symphony/presentation/chat_module/chat_constants.dart';
import '../controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

// ignore: must_be_immutable
class ChatItemWidget extends StatelessWidget {
  ChatItemWidget(this.isGroup,this.isOnline,this.isBlock,this.imageUrl,this.username,this.lastMessage,this.time,this.unReadMessages,this.onTap);

  bool isGroup;
  bool isOnline;
  RxInt isBlock = 0.obs;
  String imageUrl;
  String username;
  String lastMessage;
  String time;
  RxInt unReadMessages = 0.obs;
  VoidCallback onTap;

  Responsive responsive = Responsive();
  var controller = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            color: ColorConstant.whiteA702,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          25.00,
                        ),
                      ),
                      child: imageUrl.isNotEmpty?CommonImageView(
                        url: imageUrl,
                        height: getSize(
                          50.00,
                        ),
                        width: getSize(
                          50.00,
                        ),
                        fit: BoxFit.cover,
                      ):CommonImageView(
                        svgPath: ImageConstant.imgUser,
                        height: getSize(
                          50.00,
                        ),
                        width: getSize(
                          50.00,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: responsive.setWidth(3),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "$username ",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsMedium14.copyWith(
                                    fontSize: 15 / MediaQuery.of(context).textScaleFactor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),

                              unReadMessages.value != 0?Container(
                                  padding: getPadding(
                                    left: 7.5,
                                    top: 4,
                                    right: 7.5,
                                    bottom: 4,
                                  ),
                                  width: 12.0, // Set the width and height to be equal for a perfect circle
                                  height: 12.0,
                                  decoration: AppDecoration.txtFillPinkappPinkColor.copyWith(
                                    borderRadius: BorderRadius.circular(20), // Half of the width to create a circle
                                  ),
                                ):Container(),

                            ],
                          ),
                          Text(
                            isBlock.value != 0?
                            ChatConstants.blocked:lastMessage.isNotEmpty?
                            lastMessage:isGroup?ChatConstants.adminAddedYou :
                            ChatConstants.noMessage,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsRegular14Black900.copyWith(
                              height: 1.43,
                              color:  isBlock.value != 0?ColorConstant.gray500:ColorConstant.black900,
                              fontSize: 14 / MediaQuery.of(context).textScaleFactor,
                            ),
                          ),
                          SizedBox(
                            height: responsive.setHeight(0.2),
                          ),
                          Text(
                            time,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsRegular12Gray60087.copyWith(color:  ColorConstant.darkHintTextColor,
                              fontSize: 11 / MediaQuery.of(context).textScaleFactor,),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.maxFinite,height: 0.5,color: ColorConstant.stickyBorderColor,
          )
        ],
      ),
    );
  }
}
