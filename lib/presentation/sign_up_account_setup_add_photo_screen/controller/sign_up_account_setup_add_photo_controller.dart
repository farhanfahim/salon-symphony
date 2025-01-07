import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:salon_symphony/core/common/media_upload_controller.dart';
import 'package:salon_symphony/core/utils/image_list.dart';
import 'package:salon_symphony/core/utils/picker_type.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import 'package:salon_symphony/data/services/api_call_status.dart';
import 'package:salon_symphony/data/services/base_client.dart';
import 'package:salon_symphony/widgets/animatedButton.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/dummy_content.dart';
import '../../../data/models/loginResponseModel.dart';
import '../../../data/models/myProfileResponseModel.dart';
import '../../chat_module/firestore_controller.dart';
import '/core/app_export.dart';
import 'package:salon_symphony/presentation/sign_up_account_setup_add_photo_screen/models/sign_up_account_setup_add_photo_model.dart';

class SignUpAccountSetupAddPhotoController extends GetxController {
  Rx<SignUpAccountSetupAddPhotoModel> signUpAccountSetupAddPhotoModelObj =
      SignUpAccountSetupAddPhotoModel().obs;

  var map = Get.arguments;
  final animatedButtonController = AnimatedButtonController();
  PageController pageController = PageController(initialPage: 0);
  RxList<dataModel2> intrests = DummyContent.intrests.obs;

  MediaUploadController mediaUploadController = Get.put(MediaUploadController());
  TextEditingController yourSelfController = TextEditingController();
  TextEditingController yourSchoolController = TextEditingController();
  RxList<ImageList> listOfImages = RxList<ImageList>();
  FocusNode? yourSelfNoNode = FocusNode();
  FocusNode? yourSchoolNoNode = FocusNode();
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  String amzFilePath = '';
  Rxn<File> pickedImage = Rxn<File>();
  RxInt pageIndex = 0.obs;
  String? profileImageURl;

  AppPreferences _appPreferences = AppPreferences();

  Uint8List convertFileToBytes(String path) {
    return Uint8List.fromList(File(path).readAsBytesSync());
  }

  // Future<dynamic> onTapBtntf() async {
  //   await PermissionManager.askForPermission(Permission.camera);
  //   await PermissionManager.askForPermission(Permission.storage);
  //   List<String?>? imageList = [];
  //   //TODO: Permission - use imageList for using selected images
  //   await FileManager().showModelSheetForImage(getImages: (value) async {
  //     imageList = value;
  //     pickedImage.value = File(imageList![0]!);
  //     print(pickedImage.value!.path);
  //   });
  // }


  void onTapBtntf(PickerType pickerType, BuildContext context, GalleryMode mode, int count) async {
    var pickedMediaList = await Utils.mediaPicker(
      context: context,
      pickerType: pickerType,
      galleryMode: mode,
      count: count,
    );

    if (pickedMediaList != null && pickedMediaList.isNotEmpty) {
      for (var media in pickedMediaList) {
        if (media.path != null) {
          if (listOfImages.isNotEmpty) {
            listOfImages.clear();
            print(File(media.path!));
            listOfImages.add(ImageList(image: File(media.path!)));
          } else {
           listOfImages.add(ImageList(image: File(media.path!)));
          }

          // controller.mediaCount.value = controller.mediaCount.value - 1;
        }
      }
    }
  }



  Future<dynamic> UploadPhotoApi() async {
    // make a get call
    print('map ${map}');
    await _appPreferences.isPreferenceReady;
    var userId;
    _appPreferences.getUserId().then((value1) {
      userId = value1;
    });

    Utils.check().then((value) async {
      if (value) {
        _firebaseMessaging.getToken().then((token) async {

          _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.put(Constants.updateProfile + "/$userId",
              onSuccess: (response) async {
            animatedButtonController.reset();
            MyProfileResponseModel loginResponseModel = MyProfileResponseModel.fromJson(response.data);
            FirestoreController.instance.updateUserData(loginResponseModel, token!);
            print('[ PROFILE UPDATE RESPONSE ===> ${loginResponseModel.toJson()}]');

            await _appPreferences.isPreferenceReady;
            _appPreferences.setUserDetails(
                data: jsonEncode(loginResponseModel.data));

            Utils.showToast(response.data['message'], false);
            Get.toNamed(AppRoutes.onboardingSpecialities,arguments: map);
          }, onError: (error) {
            print(error);
            animatedButtonController.reset();
            BaseClient.handleApiError(error);
            apiCallStatus = ApiCallStatus.error;
          }, headers: {
            'Authorization': 'Bearer $value',
            'Accept': 'application/json',
          }, data: {
            'phone': map['phone'],
            'name': map['name'],
            "image": profileImageURl,
          });
        });
        });
      } else {
        Utils.showToast('No internet connection', true);
      }
    });
  }

  void uploadMedia() {
    Utils.check().then((value) async {
      if (value) {
        mediaUploadController.s3SignedUrlAPI(
            filePath: listOfImages[0].image!.path,
            title: "Profile Photo",
            isShowLoader: false,
            onDone: (url) async {
              print(url);
              profileImageURl = url;

              UploadPhotoApi();
            });
      } else {
        Utils.showToast("No internet connection", true);
      }
    });
  }
}
