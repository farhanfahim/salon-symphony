import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salon_symphony/core/utils/responsive.dart';
import 'package:salon_symphony/presentation/chat_module/chat_strings.dart';
import '../../../core/utils/utils.dart';
import '../../../widgets/widgets_shimmer.dart';
import '../chat_constants.dart';
import '../chat_page/widgets/chat_item_widget.dart';
import 'controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

// ignore_for_file: must_be_immutable
class ChatPage extends StatelessWidget {
  ChatController controller = Get.put(ChatController());

  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return Container(
      color: ColorConstant.whiteA702,
      child: FutureBuilder<String>(
        ///Future for fetching user id
        future: controller.appPreferences.getUserId(),
        builder: (context, userIdSnapshot) {
          if (userIdSnapshot.hasData) {
            int userId = int.parse(userIdSnapshot.requireData);


            return Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: StreamBuilder<QuerySnapshot>(
                ///Stream for my chats
                ///Get chats:
                ///1. Me exist
                ///2. Check group check boolean
                stream: FirebaseFirestore.instance
                    .collection(ChatStrings.chatsCollectionReference)
                    .where(ChatStrings.deletedStatuses, arrayContains: {
                  ChatStrings.id: userId,
                  ChatStrings.isDeleted: false,
                })
                    .orderBy(ChatStrings.updatedAt, descending: true)
                    .snapshots(),
                builder: (context, chatListSnapshot) {
                  if (chatListSnapshot.hasData) {
                    return chatListSnapshot.requireData.size == 0
                        ? Center(
                        child: GestureDetector(
                          child: Text(
                            ChatConstants.noChatFound,
                          ),
                        ))
                        : ListView.builder(
                      itemCount: chatListSnapshot.requireData.size,
                      itemBuilder: (context, index) {
                        var chatDocument = chatListSnapshot.requireData.docs[index];

                        int? otherUserId;

                        ///Get other user id only for single chat
                        if (!chatListSnapshot.requireData.docs[index].get(ChatStrings.isGroupChat)) {
                          otherUserId = chatDocument.get(ChatStrings.userIds).where((id) => id != userId).single;
                        }

                        return StreamBuilder<DocumentSnapshot>(

                          ///Stream to get user info against user id if one-to-one chat
                          ///User details for:
                          ///1. Name
                          ///2. Image
                            stream: chatListSnapshot.requireData.docs[index].get(ChatStrings.isGroupChat)
                                ? null
                                : FirebaseFirestore.instance.collection(ChatStrings.usersCollectionReference).doc(otherUserId.toString()).snapshots(),
                            builder: (context, userSnapshot) {
                              ///If group chat
                              if (chatListSnapshot.requireData.docs[index].get(ChatStrings.isGroupChat)) {
                                controller.getGroupReadStatus(chatDocument.get(ChatStrings.readStatuses));
                                controller.getGroupMessageDeleteStatus(chatDocument.get(ChatStrings.groupMessageStatuses));

                                return ChatItemWidget(
                                   true,
                                   false,
                                   0.obs,
                                   chatDocument.get(ChatStrings.image) == null
                                      ? ""
                                      : chatDocument.get(ChatStrings.image),
                                   chatDocument.get(ChatStrings.name),
                                  controller.groupMessageDelete!.value==1?ChatConstants.noMessage:chatDocument.get(ChatStrings.lastMessage),
                                   chatDocument[ChatStrings.updatedAt] == null
                                      ? ""
                                      : Utils.timeAgoSinceDateChat(((chatDocument[ChatStrings.updatedAt]) as Timestamp).toDate()),
                                  controller.read!=null?controller.read!:0.obs,
                                   () {
                                     Map<String, dynamic> map = {
                                       ChatConstants.documentId: chatListSnapshot.data?.docs[index].id,
                                       ChatConstants.threadName: chatDocument.get(ChatStrings.name),
                                       ChatConstants.fromGroup: true,
                                       ChatConstants.fromCreation: false,
                                     };

                                     Get.toNamed(AppRoutes.chattingView,arguments:map);

                                  },
                                );
                              }

                              ///If one-to-one chat
                              ///Check if user data is fetched then show widget
                              if (userSnapshot.hasData) {

                                return StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection(ChatStrings.chatsCollectionReference)
                                      .doc(chatDocument.id)
                                      .collection(ChatStrings.threadsCollectionReference)
                                      .where(ChatStrings.senderId, isNotEqualTo: userId)
                                      .where(ChatStrings.isRead, isEqualTo: false)
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    controller.getBlockedStatus(chatDocument.get(ChatStrings.blockedStatuses));
                                    return ChatItemWidget(
                                     false,
                                     false,
                                      controller.blocked!=null?controller.blocked!:0.obs,
                                      userSnapshot.requireData.get(ChatStrings.image),
                                      userSnapshot.requireData.get(ChatStrings.name),
                                      chatDocument.get(ChatStrings.lastMessage),
                                       chatDocument[ChatStrings.updatedAt] == null
                                          ? ""
                                          : Utils.timeAgoSinceDateChat(((chatDocument[ChatStrings.updatedAt]) as Timestamp).toDate()),
                                       snapshot.hasData ? snapshot.requireData.size.obs : 0.obs,
                                       () {

                                         Map<String, dynamic> map = {
                                           ChatConstants.documentId: chatListSnapshot.data?.docs[index].id,
                                           ChatConstants.threadName: userSnapshot.requireData.get(ChatStrings.name),
                                           ChatConstants.fromGroup: false,
                                           ChatConstants.fromCreation: false,
                                           ChatConstants.userId:  userSnapshot.requireData.get(ChatStrings.id),
                                         };

                                         Get.toNamed(AppRoutes.chattingView,arguments:map);
                                      },
                                    );
                                  },
                                );
                              } else {
                                return showShimmer();
                              }
                            });
                      },
                    );
                  } else {
                    return showShimmer();
                  }
                },
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

}
