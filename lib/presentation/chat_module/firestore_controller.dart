import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';
import 'package:salon_symphony/data/models/loginResponseModel.dart';
import 'package:uuid/uuid.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import '../../core/common/media_upload_controller.dart';
import '../../data/models/myProfileResponseModel.dart';
import 'chat_constants.dart';
import 'chat_strings.dart';
import 'chatting_view/models/chat_detail.dart';

class FirestoreController {
  static FirestoreController get instance => FirestoreController();

  Future<String> saveUserData(int? id, String? name, String? email, String? image,int? position,int? salonId, String? fcm_token) async {
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection(ChatStrings.usersCollectionReference)
        .where('id', isEqualTo: id.toString())
        .get();
    final List<DocumentSnapshot> documents = result.docs;

    try {
      if (documents.length == 0) {
        DocumentReference userDoc = FirebaseFirestore.instance
            .collection(ChatStrings.usersCollectionReference)
            .doc(id!.toString());
        FirebaseFirestore.instance
            .runTransaction((Transaction myTransaction) async {
          myTransaction.set(userDoc, {
            'id': id.toString(),
            'name': name,
            'email': email,
            'fcm_token': fcm_token,
            'online': false,
            'position': position,
            'salon_id': salonId,
            'image': image != null
                ? image
                : "",
          });
        });
      }
    } catch (ex) {
      print(ex);
    }

    return id!.toString();
  }

  Future<String> updateUserData(MyProfileResponseModel response , String fcm_token) async {
    DocumentReference doc = FirebaseFirestore.instance
        .collection(ChatStrings.usersCollectionReference)
        .doc(response.data!.id.toString());
    doc.get().then((docSnapshot) {
      if (docSnapshot.exists) {
        doc.update({
          'name': response.data!.name,
          'position': response.data!.positionId,
          'fcm_token': fcm_token,
          'image': response.data!.image != null
              ? response.data!.image!.isNotEmpty
                  ? response.data!.image
                  : ""
              : "",
        });
      }
    });
    return "";
  }
  Future<String> updateUserDataLogin(LoginData response , String fcm_token) async {
    DocumentReference doc = FirebaseFirestore.instance
        .collection(ChatStrings.usersCollectionReference)
        .doc(response.user!.id.toString());
    doc.get().then((docSnapshot) {
      if (docSnapshot.exists) {
        doc.update({
          'name': response.user!.name,
          'position': response.user!.positionId,
          'fcm_token': fcm_token,
          'image': response.user!.image != null
              ? response.user!.image!.isNotEmpty
                  ? response.user!.image
                  : ""
              : "",
        });
      }
    });
    return "";
  }

  Future chatStatus({String? userID, bool? onlineStatus}) async {
    await FirebaseFirestore.instance
        .collection(ChatStrings.usersCollectionReference)
        .doc(userID)
        .update({'online': onlineStatus});
  }

  Future saveMsgToChatRoom(
      ChatDetail chatDetail,
      String? _documentId,
      String myId,
      String userId,
      String? message,
      int messageType,
      String url,
      String thumbnail,
      MediaUploadController mediaUploadController,
      File? pickedImage) async {
    if (_documentId == null) {
      ///Create new chat
      var chatDocumentResult = await FirebaseFirestore.instance.collection(ChatStrings.chatsCollectionReference).add({
        ChatStrings.userIds: [int.parse(myId), int.parse(userId)], //user id list
        ChatStrings.deletedStatuses: [
          {
            ChatStrings.id: int.parse(myId), ///my user id
            ChatStrings.isDeleted: false,
          },
          {
            ChatStrings.id: int.parse(userId), ///other user id
            ChatStrings.isDeleted: false,
          }
        ],
        ChatStrings.deletedMessagesIds: [
          {
            ChatStrings.id: int.parse(myId), ///my user id
            ChatStrings.deletedMessageId: "",
          },
          {
            ChatStrings.id: int.parse(userId), ///other user id
            ChatStrings.deletedMessageId: "",
          }
        ],

        ChatStrings.readStatuses: [
          {
            ChatStrings.id: int.parse(myId), ///my user id
            ChatStrings.isRead: false,
          },
          {
            ChatStrings.id: int.parse(userId), ///other user id
            ChatStrings.isRead: false,
          }
        ],

        ChatStrings.blockedStatuses: [
          {
            ChatStrings.id: int.parse(myId), ///my user id
            ChatStrings.isBlocked: false,
          },
          {
            ChatStrings.id: int.parse(userId), ///other user id
            ChatStrings.isBlocked: false,
          }
        ],

        ChatStrings.groupMessageStatuses: [
          {
            ChatStrings.id: int.parse(myId), ///my user id
            ChatStrings.isGroupMessageDeleted: false,
          },
          {
            ChatStrings.id: int.parse(userId), ///other user id
            ChatStrings.isGroupMessageDeleted: false,
          }
        ],
        ChatStrings.createdAt: FieldValue.serverTimestamp(),
        ChatStrings.updatedAt: FieldValue.serverTimestamp(),
        ChatStrings.lastMessage: message,
        ChatStrings.isGroupChat: false, ///for group chat only
      });

      print("Chat document created: ${chatDocumentResult.id}");

      _documentId = chatDocumentResult.id;
    } else {
      ///Updating old chat with new messages
      List<DeletedStatus> deletedStatuses = chatDetail.deletedStatuses!;
      for (var deletedStatus in deletedStatuses) {
        deletedStatus.isDeleted = false;
      }

      ///Updating read status with new messages only group
      List<ReadStatus> readStatuses = chatDetail.readStatuses!;
      for (var readStatus in readStatuses) {
        readStatus.isRead = false;
      }

      ///Updating group delete message status with new messages only group
      List<GroupMessageStatuses> groupMessageStatuses = chatDetail.groupMessageStatuses!;
      for (var status in groupMessageStatuses) {
        status.isGroupMessageDeleted = false;
      }

      ///To Update delete status to false for all chat members
      FirebaseFirestore.instance.collection(ChatStrings.chatsCollectionReference).doc(_documentId).update({
        ChatStrings.updatedAt: FieldValue.serverTimestamp(),
        ChatStrings.lastMessage: message,
        ChatStrings.deletedStatuses: deletedStatuses.map((e) => e.toJson()).toList(),
        ChatStrings.readStatuses: readStatuses.map((e) => e.toJson()).toList(),
        ChatStrings.groupMessageStatuses: groupMessageStatuses.map((e) => e.toJson()).toList()
      }).then((value) => print("Chat document updated"));
    }

    ///Update thread everytime with new message
    final _uuid = const Uuid();

    var threadDocument = await FirebaseFirestore.instance
        .collection(ChatStrings.chatsCollectionReference)
        .doc(_documentId)
        .collection(ChatStrings.threadsCollectionReference)
        .add({
      ChatStrings.isRead: false,
      ChatStrings.imageUrl: "",
      ChatStrings.videoUrl: "",
      ChatStrings.pdfUrl: "",
      ChatStrings.messageType: messageType,
      ChatStrings.senderId: int.parse(myId),
      ChatStrings.text: message,
      ChatStrings.createdAt: FieldValue.serverTimestamp(),
      ChatStrings.id: _uuid.v1(),

    });
    print("Chat thread created: ${threadDocument.id}");

    print("Message sent");

    if (messageType == ChatStrings.messageTypeImage) {
      print("Message with image");
      try {
        ///uploading image/video to S3
        mediaUploadController.s3SignedUrlAPI(
            filePath: pickedImage!.path,
            title: ChatConstants.profilePhoto,
            isShowLoader: false,
            onDone: (url) async {
              threadDocument.update({
                ChatStrings.imageUrl: url,
              });
            });

      } catch (e) {
        print("Image or video uploading failed");
        threadDocument.delete();
      }
    }

    if (messageType == ChatStrings.messageTypeVideo) {
      print("Message with Video");
      try {
        ///uploading image/video to S3
        mediaUploadController.s3SignedUrlAPI(
            filePath: pickedImage!.path,
            title: ChatConstants.profilePhoto,
            isShowLoader: false,
            onDone: (url) async {
              var thumbnailFilePath = await VideoThumbnail.thumbnailFile(
                video: pickedImage.path,
                thumbnailPath: (await getTemporaryDirectory()).path,
                imageFormat: ImageFormat.PNG,
              );
              mediaUploadController.s3SignedUrlAPI(
                  filePath: thumbnailFilePath!,
                  title: ChatConstants.profilePhoto,
                  isShowLoader: false,
                  onDone: (thumbnail) async {
                    threadDocument.update({
                      ChatStrings.imageUrl: thumbnail,
                      ChatStrings.videoUrl: url,
                    });
                  });
            });


      } catch (e) {
        print("Image or video uploading failed");
        threadDocument.delete();
      }
    }

    if (messageType == ChatStrings.messageTypeDoc){
      /// upload doc to s3
      print("Message with doc");
      try {
        ///uploading to S3
        mediaUploadController.s3SignedUrlAPI(
            filePath: pickedImage!.path,
            title: ChatConstants.document,
            isShowLoader: false,
            onDone: (url) async {
              threadDocument.update({
                ChatStrings.pdfUrl: url,
              });
            });

      } catch (e) {
        print("Document uploading failed");
        threadDocument.delete();
      }

    }

  }

  updateGroupMessageDeleted(String documentId){
    List<GroupMessageStatuses> groupMessageStatuses = [];
    FirebaseFirestore.instance.collection(ChatStrings.chatsCollectionReference).doc(documentId).get().then((value) {



      for (var data in value[ChatStrings.groupMessageStatuses]) {
        groupMessageStatuses.add(GroupMessageStatuses(id:data['id'],isGroupMessageDeleted: false));
      }

      ///To Update delete status to false for all chat members
      FirebaseFirestore.instance.collection(ChatStrings.chatsCollectionReference).doc(documentId).update({
        ChatStrings.updatedAt: FieldValue.serverTimestamp(),
        ChatStrings.groupMessageStatuses: groupMessageStatuses.map((e) => e.toJson()).toList(),
      }).then((value) => print("Chat document updated"));
    });


  }

}
