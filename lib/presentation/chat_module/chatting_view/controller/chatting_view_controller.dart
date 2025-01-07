import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:intl/intl.dart';
import 'package:salon_symphony/core/utils/app_constant.dart';
import 'package:salon_symphony/core/utils/image_list.dart';
import 'package:salon_symphony/core/utils/picker_type.dart';
import 'package:salon_symphony/presentation/chat_module/chatting_view/models/report_response_model.dart';
import 'package:uuid/uuid.dart';
import '../../../../Shared_prefrences/app_prefrences.dart';
import '../../../../core/common/media_upload_controller.dart';
import '../../../../core/utils/dummy_content.dart';
import '../../../../core/utils/utils.dart';
import '../../../../data/models/loginResponseModel.dart';
import '../../../../data/services/api_call_status.dart';
import '../../../../data/services/api_exceptions.dart';
import '../../../../data/services/base_client.dart';
import '../../../../widgets/cutom_dialog.dart';
import '../../../dashboard/controllers/dashboard_controller.dart';
import '../../chat_constants.dart';
import '../../chat_strings.dart';
import '../../firestore_controller.dart';
import '../models/chat_detail.dart';
import '../models/chatting_model.dart';
import '/core/app_export.dart';
import 'package:flutter/material.dart';

class ChattingViewController extends GetxController {
  Map<String, dynamic> map = Get.arguments;
  Rx<TextEditingController> messageController = TextEditingController().obs;

  final ScrollController scrollController = ScrollController();
  DashboardController dashboardController = Get.find();
  RxList messagesList = DummyContent.Chating.obs;
  RxList bottomSheet = DummyContent.chatBottomData.obs;
  RxBool showToday = false.obs;
  RxBool sendIcon = false.obs;
  RxString myUserId = "".obs;
  RxString userId = "".obs;
  RxString documentId = "".obs;
  RxBool isBlocked = false.obs;
  RxBool hideMessageField = false.obs;
  RxString screenName = "".obs;
  RxString blockMessage = "".obs;
  RxBool fromGroup = false.obs;
  AppPreferences _appPreferences = AppPreferences();
  Rx<ChatDetail>? chatDetail = ChatDetail().obs;
  RxList<ChattingModel> chatList = List<ChattingModel>.empty().obs;
  RxList<ChattingModel> chatListFiltered = List<ChattingModel>.empty().obs;
  RxList<ChattingModel> newList = List<ChattingModel>.empty().obs;
  RxList<File> pickedImage = List<File>.empty().obs;
  MediaUploadController mediaUploadController = Get.put(MediaUploadController());
  Rx<ReportResponseModel> reportResponseModel = ReportResponseModel().obs;
  RxList<ReportData>? arrOfReportList = List<ReportData>.empty().obs;
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  RxList<ImageList> listOfImages = RxList<ImageList>();
  RxBool isCertificateUploading = false.obs;
  RxBool isInternetAvailable = true.obs;
  RxBool userNotFound = false.obs;
  String? certificatesURl;
  final _uuid = const Uuid();
  Rx<User> user = User().obs;
  checkForm() {
    if (messageController.value.text.isEmpty) {
      sendIcon.value = false;
    } else {
      sendIcon.value = true;
    }
  }

  @override
  void onReady() {
    super.onReady();
 print("map=====>>>>> $map");
    if (map[ChatConstants.threadName] != null) {
      screenName.value = map[ChatConstants.threadName];
    }

    if (map[ChatConstants.userId] != null) {
      userId.value = map[ChatConstants.userId];
    }

    if (map[ChatConstants.documentId] != null) {
      documentId.value = map[ChatConstants.documentId];
    }

    if (map[ChatConstants.isBlocked] != null) {
      isBlocked.value = map[ChatConstants.isBlocked];
    }

    if (map[ChatConstants.fromGroup] == true) {
      fromGroup.value = map[ChatConstants.fromGroup];
      bottomSheet[0].name.value = "";
      bottomSheet[1].name.value = "";
      bottomSheet[3].name.value = ChatConstants.leaveGroup;
    }else{
      bottomSheet[0].name.value = ChatConstants.reportUser;
      bottomSheet[1].name.value = ChatConstants.blockUser;
      bottomSheet[3].name.value = "";
    }

    _appPreferences.getUserId().then((userID) {
      myUserId.value = userID;
      if (documentId.value.isEmpty && !fromGroup.value) {
        getDocumentId(userId.value);
      } else {
        observeChatData();
        markMessagesRead();
      }
    });

    getReportApi();



  }


  uploadDocument() async {
    isCertificateUploading.value = true;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['pdf', 'doc'],
    );
    if (result != null) {
      sendMediaMessage(ChatConstants.document,ChatStrings.messageTypeDoc, File(result.files.single.path!));
      // uploadDocumentsToS3(result.files.single.path!);
    } else {
      isCertificateUploading.value = false;
    }
  }


  void uploadDocumentsToS3(String path){
    Utils.check().then((value) async {
      if (value) {
        mediaUploadController.s3SignedUrlAPI(
            filePath: path,
            title: "Certificates",
            onDone: (url) async {
              print(url);
              certificatesURl = url;
              getFileSize(path,2).then((value){
                size = value;
                // uploadCertificate();
              });


            });
      } else {
        Utils.showToast('No Internet Connection', true);
      }
    });
  }
  getFileSize(String filepath, int decimals) async {
    var file = File(filepath);
    int bytes = await file.length();
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
        ' ' +
        suffixes[i];
  }

  Future<dynamic> getReportApi() async {
    Utils.check().then((value) async {
      if (value) {
        isInternetAvailable.value = true;
        apiCallStatus.value = ApiCallStatus.loading;
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          print('Tokeeeen ====> $value');
          await BaseClient.get(Constants.constants,
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                reportResponseModel.value =
                    ReportResponseModel.fromJson(response.data['data']);
                arrOfReportList!.value = reportResponseModel.value.data!;

                return true;
              },
              headers: {
                'Authorization': 'Bearer $value',
                'Accept': 'application/json',
              },
              onError: (error) {
                ApiException apiException = error;
                print(apiException.message);

                BaseClient.handleApiError(error);

                apiCallStatus.value = ApiCallStatus.error;

                return false;
              },
              queryParameters: {
                'is_paginated': 1,
                'type': AppConstant.reportType,
                'is_active': 1,
              });
        });
      } else {
        Utils.showToast('Check your internet connection', true);
      }
    });
  }

  Future<dynamic> reportUserApi(reason) async {
    Utils.check().then((value) async {
      if (value) {
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.post(Constants.userReports,
              onSuccess: (response) async {
            Utils.showToast(ChatConstants.userReported, false);
          }, onError: (error) {
            print(error);
            BaseClient.handleApiError(error);
          }, headers: {
            'Authorization': 'Bearer $value',
            'Accept': 'application/json',
          }, data: {
            'report_reason': reason,
            'instance_type': AppConstant.instanceType,
            'instance_id': userId.value,
            'user_id': myUserId.value,
          });
        });
      } else {
        Utils.showToast(ChatConstants.noInternetConnection, true);
      }
    });
  }

  sendMessage(String message, String url, int type, String thumbnail) {
    if (documentId.isEmpty) {
      getDocumentId(userId.value);
    }
    FirestoreController.instance.saveMsgToChatRoom(
        chatDetail!.value,
        documentId.isNotEmpty ? documentId.value : null,
        myUserId.value,
        fromGroup.value == true ? "" : userId.value,
        message,
        type,
        url,
        thumbnail,mediaUploadController,
        File(""));

    messageController.value.text = "";
    messageController.value.text.isEmpty
        ? sendIcon.value = false
        : sendIcon.value = true;

    if (fromGroup.value) {
      readGroupFirebaseChat();
    }
    try {
      scrollController.animateTo(
        scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
      );
    } catch (e) {}
  }

  sendMediaMessage(String message,int type,File filePath) async {
    if (documentId.isEmpty) {
      getDocumentId(userId.value);
    }
   await FirestoreController.instance.saveMsgToChatRoom(
        chatDetail!.value,
        documentId.isNotEmpty ? documentId.value : null,
        myUserId.value,
        fromGroup.value == true ? "" : userId.value,
        message,
        type,
        "",
        "",
        mediaUploadController,
        filePath);

    messageController.value.text = "";
    messageController.value.text.isEmpty
        ? sendIcon.value = false
        : sendIcon.value = true;

    if (fromGroup.value) {
      readGroupFirebaseChat();
    }
    try {
      scrollController.animateTo(
        scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
      );
    } catch (e) {}
  }

  getDocumentId(String userId) async {
    List<int> ids = [int.parse(myUserId.value), int.parse(userId)];

    FirebaseFirestore.instance
        .collection(ChatStrings.chatsCollectionReference)
        .where(ChatStrings.userIds, arrayContainsAny: ids)
        .where(ChatStrings.isGroupChat, isEqualTo: false)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        for (var doc in value.docs) {
          var idsFromJson = doc.get(ChatStrings.userIds);

          List<int> idsList = List<int>.from(idsFromJson);
          Function unOrdDeepEq =
              const DeepCollectionEquality.unordered().equals;

          if (unOrdDeepEq(idsList, ids) == true) {
            documentId.value = doc.id;
            observeChatData();
            markMessagesRead();
            break;
          }
        }
      } else {
        return "";
      }
      return documentId;
    });
  }

  Future<Stream<List<ChattingModel>>> getChatMessages() async {
    final StreamController<List<ChattingModel>> c = StreamController<
        List<ChattingModel>>();
    if(documentId.value.isNotEmpty) {
      print('Deleted Message Ids ====> ${chatDetail?.value.deletedMessageIds}');
      String deletedMessageId = chatDetail?.value.deletedMessageIds
          ?.where((element) => int.parse(myUserId.value) == element.id)
          .first
          .deletedMessageId ?? "";



      FirebaseFirestore.instance
          .collection(ChatStrings.chatsCollectionReference)
          .doc(documentId.value)
          .collection(ChatStrings.threadsCollectionReference)
          .orderBy(ChatStrings.createdAt, descending: false)
          .snapshots()
          .listen((chatListSnapshot) {
        chatList.clear();

        for (var chatMessageDocument in chatListSnapshot.docs) {
          chatList.add(ChattingModel(
            id: chatMessageDocument[ChatStrings.id],
            type: chatMessageDocument[ChatStrings.messageType],
            userId: int.parse(myUserId.value),
            senderId: chatMessageDocument[ChatStrings.senderId],
            text: chatMessageDocument[ChatStrings.text],
            image: chatMessageDocument[ChatStrings.imageUrl],
            video: chatMessageDocument[ChatStrings.videoUrl],
            pdf: chatMessageDocument[ChatStrings.pdfUrl],
            time: chatMessageDocument[ChatStrings.createdAt],
          ));
        }

        RxInt? index;
        RxInt? count = 0.obs;

        if (chatList.isNotEmpty) {
          for (var item in chatList) {
            count.value++;
            if (item.id == deletedMessageId) {
              index = count.value.obs;
              print("count ${count.value}");
              break;
            }
          }
        }

        ///If index is not -1
        ///Get messages before index
        if (index != null) {
          chatList.value = chatList.sublist(index.value, chatList.length);
        }
        c.add(chatList);
      });

      if (fromGroup.value) {
        readGroupFirebaseChat();
      }
    }

    return c.stream;
  }

  Future<void> blockUnBlockUser() async {
    if (documentId.isNotEmpty) {

      var chatDetail = await FirebaseFirestore.instance
          .collection(ChatStrings.chatsCollectionReference)
          .doc(documentId.value)
          .get();

      List<dynamic> blockedStatuses =
      chatDetail.get(ChatStrings.blockedStatuses);
      for (var blockedStatus in blockedStatuses) {

        if (blockedStatus[ChatStrings.id] != int.parse(myUserId.value)) {
          ///Setting isBLocked to true

          if(isBlocked.value){
            isBlocked.value = false;
            hideMessageField.value = false;
            blockedStatus[ChatStrings.isBlocked] = isBlocked.value;
            bottomSheet[1].name.value = ChatConstants.unBlockUser;
          }else{
            isBlocked.value = true;
            hideMessageField.value = true;
            blockedStatus[ChatStrings.isBlocked] = isBlocked.value;
            bottomSheet[1].name.value = ChatConstants.blockUser;
          }
          break;
        }
      }
      await FirebaseFirestore.instance
          .collection(ChatStrings.chatsCollectionReference)
          .doc(documentId.value)
          .update({
        ChatStrings.blockedStatuses: blockedStatuses,
      });
    }
  }

  onTapDelete() {
    Get.dialog(CustomModelSheet(
        title: ChatConstants.delete,
        msg: ChatConstants.areYouSureYouWantToDelete,
        showOkButton: false,
        onTapYes: () {
          deleteFirebaseChat();
        },
        onTapNo: () {
          Get.back();
        }));
  }

  onTapLeaveGroup() async {

    Utils.check().then((value) async {
      if(value) {
        var list;
        await FirebaseFirestore.instance.collection(
            ChatStrings.chatsCollectionReference).doc(documentId.value)
            .get()
            .then((data) async {
          list = data[ChatStrings.userIds];
          list.removeWhere((element) => element == int.parse(myUserId.value));

          _appPreferences.getUserDetail().then((value) async {
            user.value = User.fromJson(jsonDecode(value!));
            await FirebaseFirestore.instance.collection(
                ChatStrings.chatsCollectionReference)
                .doc(documentId.value)
                .update({
              ChatStrings.adminId: data[ChatStrings.adminId] ==
                  int.parse(myUserId.value)
                  ? list.length > 1 ? list[0] : -1
                  : data[ChatStrings.adminId],
              ChatStrings.userIds: FieldValue.arrayRemove(
                  [int.parse(myUserId.value)]),
              ChatStrings.deletedStatuses: FieldValue.arrayRemove([{
                ChatStrings.id: int.parse(myUserId.value),
                ChatStrings.isDeleted: false,
              }
              ]),
              ChatStrings.updatedAt: FieldValue.serverTimestamp(),
              ChatStrings.lastMessage: "${user.value.name} left the group",
            });

            await FirebaseFirestore.instance
                .collection(ChatStrings.chatsCollectionReference)
                .doc(documentId.value)
                .collection(ChatStrings.threadsCollectionReference)
                .add({
              ChatStrings.imageUrl: "",
              ChatStrings.videoUrl: "",
              ChatStrings.pdfUrl: "",
              ChatStrings.messageType: ChatStrings.messageTypeMemberAddedLeave,
              ChatStrings.senderId: int.parse(myUserId.value),
              ChatStrings.text: "${user.value.name} left the group",
              ChatStrings.createdAt: FieldValue.serverTimestamp(),
              ChatStrings.id: _uuid.v1(),
            });

          });


          FirestoreController.instance.updateGroupMessageDeleted(documentId.value);
          navigateBack();
        });
      }else{
        Utils.showToast(ChatConstants.noInternetConnection, true);
      }
    });
  }

  void observeChatData() {
    if (documentId.isNotEmpty) {
      FirebaseFirestore.instance
          .collection(ChatStrings.chatsCollectionReference)
          .doc(documentId.value)
          .snapshots()
          .listen((chatDetailSnapshot) {
        chatDetail!.value = ChatDetail.fromJson(chatDetailSnapshot.data()!);
        if (fromGroup.value == false) {
          updateBottomSheetOnBlock();
          messageTextFieldStatus();
        }else{
          restrictUserOnRemovedByAdmin();
        }
      });
    }
  }

  Future<void> updateBottomSheetOnBlock() async {

    var chatDetail = await FirebaseFirestore.instance
        .collection(ChatStrings.chatsCollectionReference)
        .doc(documentId.value)
        .get();

    List<dynamic> blockedStatuses =
    chatDetail.get(ChatStrings.blockedStatuses);
    ///Setting block/unblock to bottom sheet
    for (var blockedStatus in blockedStatuses) {
      if (blockedStatus[ChatStrings.id] != int.parse(myUserId.value)) {
        isBlocked.value = blockedStatus[ChatStrings.isBlocked];
        if (isBlocked.value) {
          bottomSheet[1].name.value = ChatConstants.unBlockUser;
        } else {
          bottomSheet[1].name.value = ChatConstants.blockUser;
        }
        break;
      }
    }


  }

  Future<void> messageTextFieldStatus() async {

    var chatDetail = await FirebaseFirestore.instance
        .collection(ChatStrings.chatsCollectionReference)
        .doc(documentId.value)
        .get();

    List<dynamic> blockedStatuses =
    chatDetail.get(ChatStrings.blockedStatuses);
    for (var blockedStatus in blockedStatuses) {
      if (blockedStatus[ChatStrings.id] != int.parse(myUserId.value) && blockedStatus[ChatStrings.isBlocked]) {
        hideMessageField.value = blockedStatus[ChatStrings.isBlocked];
        blockMessage.value = "You blocked $screenName";
        break;
      }else if (blockedStatus[ChatStrings.id] == int.parse(myUserId.value) && blockedStatus[ChatStrings.isBlocked]) {
        hideMessageField.value = blockedStatus[ChatStrings.isBlocked];
        blockMessage.value = "You are blocked by $screenName";
        break;
      }else{
        blockMessage.value = "";
        hideMessageField.value = false;
      }
    }


  }

  void restrictUserOnRemovedByAdmin() {
    userNotFound.value = false;
    if(!chatDetail!.value.userIds!.contains(int.parse(myUserId.value))){
      userNotFound.value = true;
    }
  }

  void markMessagesRead() async {
    if (documentId.isNotEmpty) {
      final CollectionReference threadsCollection = FirebaseFirestore.instance
          .collection(ChatStrings.chatsCollectionReference)
          .doc(documentId.value)
          .collection(ChatStrings.threadsCollectionReference);

      final WriteBatch batch = FirebaseFirestore.instance.batch();

      final QuerySnapshot querySnapshot = await threadsCollection
          .where(ChatStrings.senderId, isNotEqualTo: int.parse(myUserId.value))
          .get();

      // Update each document in the batch
      querySnapshot.docs.forEach((DocumentSnapshot document) {
        batch.update(document.reference, {ChatStrings.isRead: true});
      });

      await batch.commit();
    }
  }

  void deleteFirebaseChat() async {
    if (chatList.isNotEmpty) {
      if(fromGroup.value) {
        var chatDetail = await FirebaseFirestore.instance
            .collection(ChatStrings.chatsCollectionReference)
            .doc(documentId.value)
            .get();

        List<dynamic> deletedStatuses =
        chatDetail.get(ChatStrings.deletedStatuses);
        for (var deletedStatus in deletedStatuses) {
          if (deletedStatus[ChatStrings.id] == int.parse(myUserId.value)) {
            ///Setting isDeleted to true
            deletedStatus[ChatStrings.isDeleted] = fromGroup.value?false:true;
            break;
          }
        }

        List<dynamic> groupMessageDeletedStatuses =
        chatDetail.get(ChatStrings.groupMessageStatuses);
        for (var deletedStatus in groupMessageDeletedStatuses) {
          if (deletedStatus[ChatStrings.id] == int.parse(myUserId.value)) {
            ///Setting isDeleted to true
            deletedStatus[ChatStrings.isGroupMessageDeleted] = true;
            break;
          }
        }

        List<dynamic> deletedIds = chatDetail.get(ChatStrings.deletedMessagesIds);
        for (var deletedId in deletedIds) {
          if (deletedId[ChatStrings.id] == int.parse(myUserId.value)) {
            ///Setting message id in deleted ids: ${chatList.first.id}")
            deletedId[ChatStrings.deletedMessageId] = chatList.last.id;
            break;
          }
        }

        await FirebaseFirestore.instance
            .collection(ChatStrings.chatsCollectionReference)
            .doc(documentId.value)
            .update({
          ChatStrings.deletedStatuses: deletedStatuses,
          ChatStrings.deletedMessagesIds: deletedIds,
          ChatStrings.groupMessageStatuses: groupMessageDeletedStatuses,
        });
      }
      else{
        var chatDetail = await FirebaseFirestore.instance
            .collection(ChatStrings.chatsCollectionReference)
            .doc(documentId.value)
            .get();

        List<dynamic> deletedStatuses =
        chatDetail.get(ChatStrings.deletedStatuses);
        for (var deletedStatus in deletedStatuses) {
          if (deletedStatus[ChatStrings.id] == int.parse(myUserId.value)) {
            ///Setting isDeleted to true
            deletedStatus[ChatStrings.isDeleted] = fromGroup.value?false:true;
            break;
          }
        }

        List<dynamic> deletedIds = chatDetail.get(ChatStrings.deletedMessagesIds);
        for (var deletedId in deletedIds) {
          if (deletedId[ChatStrings.id] == int.parse(myUserId.value)) {
            ///Setting message id in deleted ids: ${chatList.first.id}")
            deletedId[ChatStrings.deletedMessageId] = chatList.last.id;
            break;
          }
        }

        await FirebaseFirestore.instance
            .collection(ChatStrings.chatsCollectionReference)
            .doc(documentId.value)
            .update({
          ChatStrings.deletedStatuses: deletedStatuses,
          ChatStrings.deletedMessagesIds: deletedIds,
        });
      }
      navigateBack();
    } else {
      navigateBack();
    }
  }

  void navigateBack(){
    if (map[ChatConstants.fromCreation]) {
      if (fromGroup.value) {
        Get.back();///pop up
        Get.back();///bottom sheet
        Get.back();///chat screen
        Get.back();///select group member screen
        Get.back();///create chat screen
      }
      else {
        Get.back();///pop up
        Get.back();///bottom sheet
        Get.back();///chat screen
        Get.back();///create chat screen
      }
    } else {
      Get.back();///pop up
      Get.back();///bottom sheet
      Get.back();///chat screen
    }
  }

  void readGroupFirebaseChat() async {
    print(int.parse(myUserId.value));
    var chatDetail = await FirebaseFirestore.instance
        .collection(ChatStrings.chatsCollectionReference)
        .doc(documentId.value)
        .get();
    List<dynamic> readStatuses = chatDetail.get(ChatStrings.readStatuses);
    for (var readStatus in readStatuses) {
      if (readStatus[ChatStrings.id] == int.parse(myUserId.value)) {
        ///Setting isRead to true
        readStatus[ChatStrings.isRead] = true;
        break;
      }
    }
    await FirebaseFirestore.instance
        .collection(ChatStrings.chatsCollectionReference)
        .doc(documentId.value)
        .update({
      ChatStrings.readStatuses: readStatuses,
    });
  }

  // Future<dynamic> onTapCamera(context) async {
  //   await PermissionManager.askForPermission(Permission.camera);
  //   await PermissionManager.askForPermission(Permission.storage);
  //   List<String?>? imageList = [];
  //   //TODO: Permission - use imageList for using selected images
  //   await FileManager().showModelSheetForMedia(data: (value, type) async {
  //     imageList = value;
  //     for(var item in imageList!){
  //       pickedImage.add(File(item!)) ;
  //     }
  //     pickedImage.refresh();
  //     uploadMedia(context, type);
  //   });
  // }

  void onTapCamera(PickerType pickerType, BuildContext context, GalleryMode mode, int count) async {
    List<Media>? pickedMediaList = await Utils.mediaPicker(
      context: context,
      pickerType: pickerType,
      galleryMode: mode,
      count: count,
    );

    listOfImages.clear();
    if (pickedMediaList != null && pickedMediaList.isNotEmpty) {
      Future.forEach(pickedMediaList, (Media? media) async {
        if (media != null && media.path != null) {
          await uploadMedia(context,media);

        }
      });
    }

    // if (pickedMediaList != null && pickedMediaList.isNotEmpty) {
    //   for (var media in pickedMediaList) {
    //     if (media.path != null) {
    //       uploadMedia(context,media);
    //       // controller.mediaCount.value = controller.mediaCount.value - 1;
    //     }
    //   }
    // }
  }


  Future<void> uploadMedia(context,Media media) async {
    Utils.hideKeyBoard(context);
    await Utils.check().then((value) async {
      if (value) {

        if (media.galleryMode == GalleryMode.video) {
          await sendMediaMessage(ChatConstants.video,
              ChatStrings.messageTypeVideo,File(media.path!));
        }else{
          await sendMediaMessage(ChatConstants.image,
              ChatStrings.messageTypeImage,File(media.path!));
        }
      } else {
        Utils.showToast(ChatConstants.noInternetConnection, true);
      }
    });
  }

  getUser(int senderID) {
    return FirebaseFirestore.instance
        .collection(ChatStrings.usersCollectionReference)
        .doc(senderID.toString())
        .snapshots();
  }

  List<dynamic> addDatesInNewList() {
    List<dynamic> _returnList;
    List<dynamic> _newData = addChatDateInSnapshot(chatList);
    _returnList = List<dynamic>.from(_newData.reversed);
    return _returnList;
  }

  List<dynamic> addChatDateInSnapshot(
      List<ChattingModel> snapshot) {
    List<dynamic> _returnList = [];

    RxString currentDate = "".obs;

    for (ChattingModel item in snapshot) {
      var format = DateFormat('EEEE, MMM d, yyyy');
      var date = item.time!=null?item.time!.toDate(): DateTime.now();
      if (currentDate.value.isEmpty) {
        currentDate.value = format.format(date);
        _returnList.add(date);
      }

      if (currentDate.value == format.format(date)) {
        _returnList.add(item);
      } else {
        currentDate.value = format.format(date);
        _returnList.add( item.time!=null?item.time!.toDate(): DateTime.now());
        _returnList.add(item);
      }
    }
    return _returnList;
  }

  bool isDateToday(DateTime date) {
    final now = DateTime.now();
    final inputDate = DateTime(date.year, date.month, date.day);

    return now.year == inputDate.year &&
        now.month == inputDate.month &&
        now.day == inputDate.day;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
