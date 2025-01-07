import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:intl/intl.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/core/utils/image_list.dart';
import 'package:salon_symphony/core/utils/picker_type.dart';
import 'package:salon_symphony/presentation/dashboard/controllers/dashboard_controller.dart';
import 'package:salon_symphony/presentation/edit_profile_screen/models/edit_profile_model.dart';
import 'package:flutter/material.dart';
import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/common/media_upload_controller.dart';
import '../../../core/utils/dummy_content.dart';
import '../../../core/utils/utils.dart';
import '../../../data/models/GetPostionListingModel.dart';
import '../../../data/models/loginResponseModel.dart';
import '../../../data/models/myProfileResponseModel.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '../../../widgets/animatedButton.dart';
import '../../chat_module/firestore_controller.dart';
import '../../home_screen/controller/home_controller.dart';
import '../../my_profile_screen/controller/my_profile_controller.dart';
import '../../profile_specialities/model/specialites_response_model.dart';

class EditProfileController extends GetxController {
  HomeController homeController = Get.find();
  DashboardController dashboardController = Get.find();
  Rx<TextEditingController> nameController = TextEditingController().obs;

  Rx<TextEditingController> emailController = TextEditingController().obs;

  Rx<TextEditingController> positionController = TextEditingController().obs;

  Rx<TextEditingController> locationController = TextEditingController().obs;

  Rx<TextEditingController> mobileNoController = TextEditingController().obs;

  Rx<TextEditingController> hireDateController = TextEditingController().obs;

  Rx<TextEditingController> schoolController = TextEditingController().obs;

  Rx<TextEditingController> bioController = TextEditingController().obs;

  Rx<TextEditingController> relationController = TextEditingController().obs;
  MediaUploadController mediaUploadController = Get.put(MediaUploadController());
  Rx<EditProfileModel> editProfileModelObj = EditProfileModel().obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<TextEditingController> dobController = TextEditingController().obs;
  Rx<TextEditingController> facebookUrlController = TextEditingController().obs;
  Rx<TextEditingController> instagramUrlController =
      TextEditingController().obs;
  Rx<TextEditingController> tiktokUrlController = TextEditingController().obs;
  Rx<TextEditingController> portfolioUrlController =
      TextEditingController().obs;

  Rx<User> user = User().obs;
  Rx<bool> imageUploaded = false.obs;

  FocusNode? fullNameNode = FocusNode();
  FocusNode? emailNode = FocusNode();
  FocusNode? positionNode = FocusNode();
  FocusNode? hireDateNode = FocusNode();
  FocusNode? locationNode = FocusNode();
  FocusNode? phoneNode = FocusNode();
  FocusNode? schoolNode = FocusNode();
  FocusNode? bioNode = FocusNode();
  FocusNode? relationNode = FocusNode();
  FocusNode? dobNode = FocusNode();
  FocusNode? facebookNode = FocusNode();
  FocusNode? instagramNode = FocusNode();
  FocusNode? tiktokNode = FocusNode();
  FocusNode? portfolioNode = FocusNode();

  dynamic size;
  Rx<int>? positionId;
  Rx<int>? relationId;
  bool formSubmitted = false;
  RxBool isFormCompleted = false.obs;
  RxBool isCertificateUploading = false.obs;
  AppPreferences _appPreferences = AppPreferences();
  final animatedButtonController = AnimatedButtonController();
  RxBool isInternetAvailable = true.obs;
  RxList<ImageList> listOfImages = RxList<ImageList>();
  RxBool isApiCalling = false.obs;
  RxList<String> selectedInterest = List<String>.empty().obs;
  Rx<CertificatesResponseData> certificateModel =
      CertificatesResponseData().obs;
  RxList<CertificatesResponseData> certificate =
      List<CertificatesResponseData>.empty().obs;
  RxList<int> selectedInterestId = List<int>.empty().obs;
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  String amzFilePath = '';
  String amzCertificateFilePath = '';
  Rxn<File> pickedImage = Rxn<File>();
  MyProfileController profileController = Get.find();
  Rx<MyProfileResponseModel> myProfileResponseModelObj = MyProfileResponseModel().obs;
  String hireDate = "";
  String dobDate = "";
  String? profileImageURl;
  String? certificatesURl;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  Rx<bool> isPostApiCalling = false.obs;
  final RegExp phoneNumberRegExp = RegExp(
    r'^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9][0-8][0-9])\s*\)|([2-9][0-8][0-9]))\s*(?:[.-]?\s*)?)?([2-9][0-9]{2})\s*(?:[.-]?\s*)?([0-9]{4})$',
  );
  final urlRegex = RegExp(
      r'^(http(s)?:\/\/)?[^\s(["<,>]*\.[^\s[",><]*$'); // Regular expression pattern to validate URLs

  void checkForm() {
    if (nameController.value.text.isEmpty ||
        mobileNoController.value.text.isEmpty ||
        emailController.value.text.isEmpty ||
        positionController.value.text.isEmpty ||
        locationController.value.text.isEmpty ||
        hireDateController.value.text.isEmpty ||
        dobController.value.text.isEmpty ) {
      isFormCompleted.value = false;
    } else {
      isFormCompleted.value = true;
    }
  }

  void fullNameValidate(context) {
    if (!nameController.value.text.trim().contains(' ')) {
      Utils.showToast('Please enter your full name', true);
    }
  }

  void validate(context) {
    formSubmitted = true;
    Utils.hideKeyboard(context);
    final formState = formKey.currentState;
    if (isFormCompleted.value == true || listOfImages.value.isNotEmpty ) {
      // formState.save();
      uploadMedia();
      // animatedButtonController.reset();

    } else {
      animatedButtonController.reset();
    }
  }

  @override
  void onReady() {
    super.onReady();
    arrOfRelation.forEach((element) {
      element.selected!.value = false;
    });
    arrOfPosition.forEach((element) {
      element.selected!.value = false;
    });
    _appPreferences.getUserDetail().then((value) async {
      user.value = User.fromJson(jsonDecode(value!));
      print(value);
    });
    myProfileResponseModelObj = profileController.myProfileResponseModelObj;
    prePopulateData();
    getPositionListing();
  }


  prePopulateData() async {
    if (myProfileResponseModelObj.value.data != null) {
      mobileNoController.value.text =
          "${myProfileResponseModelObj.value.data!.phone != null ? myProfileResponseModelObj.value.data!.phone : ""}";
      nameController.value.text =
          "${myProfileResponseModelObj.value.data!.name != null ? myProfileResponseModelObj.value.data!.name : ""}";
      emailController.value.text =
          "${myProfileResponseModelObj.value.data!.email != null ? myProfileResponseModelObj.value.data!.email : ""}";
      schoolController.value.text =
          "${myProfileResponseModelObj.value.data!.school != null ? myProfileResponseModelObj.value.data!.school : ""}";
      bioController.value.text =
          "${myProfileResponseModelObj.value.data!.bio != null ? myProfileResponseModelObj.value.data!.bio : ""}";
      portfolioUrlController.value.text =
          "${myProfileResponseModelObj.value.data!.portfolio != null ? myProfileResponseModelObj.value.data!.portfolio : ""}";
      tiktokUrlController.value.text =
          "${myProfileResponseModelObj.value.data!.tiktok != null ? myProfileResponseModelObj.value.data!.tiktok : ""}";
      instagramUrlController.value.text =
          "${myProfileResponseModelObj.value.data!.instagram != null ? myProfileResponseModelObj.value.data!.instagram : ""}";
      facebookUrlController.value.text =
          "${myProfileResponseModelObj.value.data!.facebook != null ? myProfileResponseModelObj.value.data!.facebook : ""}";
      locationController.value.text =
          "${myProfileResponseModelObj.value.data!.location != null ? myProfileResponseModelObj.value.data!.location!.name : ""}";
      if (myProfileResponseModelObj.value.data!.hireDate != null) {
        hireDateController.value.text = Utils.getFormatedDate(
            myProfileResponseModelObj.value.data!.hireDate);
        hireDate = Utils.getFormatedDateForApi(
            myProfileResponseModelObj.value.data!.hireDate);
      }

      if (myProfileResponseModelObj.value.data!.dob != null) {
        dobController.value.text =
            Utils.getFormatedDate(myProfileResponseModelObj.value.data!.dob!);
        dobDate = Utils.getFormatedDateForApi(
            myProfileResponseModelObj.value.data!.dob);
      }
      if (myProfileResponseModelObj.value.data!.certificates != null) {
        certificate.value = myProfileResponseModelObj.value.data!.certificates!;
      }
    }
  }

  RxList<RelationModel> arrOfRelation = DummyContent.relation2.obs;
  RxList<dataModel> arrOfPosition = <dataModel>[].obs;

  updateItem(int index) {
    for (var item in arrOfPosition) {
      item.selected = false.obs;
    }
    arrOfPosition[index].selected = true.obs;
    arrOfPosition.refresh();
    checkForm();
  }

  updateItem2(int index) {
    for (var item in arrOfRelation) {
      item.selected = false.obs;
    }
    arrOfRelation[index].selected = true.obs;
    arrOfRelation.refresh();
    checkForm();
  }

  Future<dynamic> getPositionListing() async {

    Utils.check().then((value) async {
      if (value) {
        isApiCalling.value = true;
        await BaseClient.get(Constants.GetPositionListing,
            onSuccess: (response) {
              isApiCalling.value = false;
          GetPostionListingModel positionListingModel =
              GetPostionListingModel.fromJson(response.data);
          positionListingModel.data!
              .map((e) => arrOfPosition
                  .add(dataModel(name: e.name, id: e.id, selected: false.obs)))
              .toList();

          print('response.data ===== > ${response.data}');

          if (myProfileResponseModelObj.value != null) {

            for (var item in arrOfPosition) {
              if (item.name == myProfileResponseModelObj.value.data!.position!.name) {
                item.selected = true.obs;
                positionController.value.text = item.name.toString();
                arrOfPosition.refresh();
                checkForm();
              }
            }

            for (var item in arrOfRelation) {
              if (myProfileResponseModelObj.value.data!.relationshipId !=
                  null) {
                if (item.id ==
                    myProfileResponseModelObj.value.data!.relationshipId) {
                  item.selected = true.obs;
                  relationController.value.text = item.name.toString();
                  arrOfRelation.refresh();
                  checkForm();
                }
              }
            }

            if (myProfileResponseModelObj.value.data!.specialities != null) {
              for (var item
                  in myProfileResponseModelObj.value.data!.specialities!) {
                selectedInterest.add(item.name!);
                selectedInterestId.add(item.id!);
                selectedInterest.refresh();
              }
            }
          }
          return true;
        }, onError: (error) {
              isApiCalling.value = false;
          ApiException apiException = error;

          print(apiException.message);

          BaseClient.handleApiError(error);

          apiCallStatus = ApiCallStatus.error;

          return false;
        }, headers: {
          'Accept': 'application/json',
        }, queryParameters: null);
      } else {
        animatedButtonController.reset();
        Utils.showToast('Check your internet connection', true);
      }
    });
  }

  selectAge(context, bool isDob) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 8),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
                primary: ColorConstant.primaryColor, onSurface: Colors.black),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: ColorConstant.primaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    isAdult(picked, context, isDob);
    checkForm();
  }

  void isAdult(birthDateString, context, bool? isDob) {
    print(birthDateString);
    if (isDob == true) {
      saveInfo(context);
      dobController.value.text =
          Utils.getFormatedDate(birthDateString.toString());
      dobDate = DateFormat('yyyy-MM-dd').format(birthDateString);
      checkForm();
    } else {
      saveInfo(context);
      hireDateController.value.text =
          Utils.getFormatedDate(birthDateString.toString());
      hireDate = DateFormat('yyyy-MM-dd').format(birthDateString);
      checkForm();
    }
  }

  void saveInfo(context) {
    final formState = formKey.currentState;
    if (formSubmitted == true) {
      if (formState!.validate()) {
        formState.save();
        checkForm();
        // then do something
      }
    }
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

  onTapAddCertificate() async {
    isCertificateUploading.value = true;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['pdf', 'doc'],
    );
    if (result != null) {
      uploadCertificatesS3(result.files.single.path!);
    } else {
      isCertificateUploading.value = false;
    }
  }

  Uint8List convertFileToBytes(String path) {
    return Uint8List.fromList(File(path).readAsBytesSync());
  }

  // Future<dynamic> onTapBtntf() async {
  //   print(imageUploaded.value);
  //   imageUploaded.value = false;
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
  void onTapBtntf(PickerType pickerType, BuildContext context) async {
    var pickedMediaList = await Utils.mediaPicker(
      context: context,
      pickerType: pickerType,
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

  Future<dynamic> uploadCertificate() async {
    await _appPreferences.isPreferenceReady;

    var userId;
    _appPreferences.getUserId().then((value1) {
      userId = value1;
    });

    Utils.check().then((value) async {
      if (value) {
        // *) perform api call
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.post(Constants.AddCertificate,
              onSuccess: (response) async {
            isCertificateUploading.value = false;
            certificateModel.value = CertificatesResponseData.fromJson(response.data['data']);
            print("farhan here");
            print(certificateModel.value.toJson());
            certificate.add(certificateModel.value);
            certificate.refresh();
          }, onError: (error) {
            print(error);
            BaseClient.handleApiError(error);
            isCertificateUploading.value = false;
            apiCallStatus = ApiCallStatus.error;
          }, headers: {
            'Authorization': 'Bearer ${value}',
            'Accept': 'application/json',
          }, data: {
            'certificate': certificatesURl,
            'size': size.toString(),
            'user_id': userId,
          });
        });
      } else {
        Utils.showToast('No internet connection', true);
      }
    });
  }

  Future<dynamic> removeCertificate(int id) async {
    await _appPreferences.isPreferenceReady;

    var userId;
    _appPreferences.getUserId().then((value1) {
      userId = value1;
    });

    Utils.check().then((value) async {
      if (value) {
        // *) perform api call
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.delete(
            Constants.AddCertificate + "/$id",
            onSuccess: (response) async {},
            onError: (error) {
              print(error);
              BaseClient.handleApiError(error);
              apiCallStatus = ApiCallStatus.error;
            },
            headers: {
              'Authorization': 'Bearer ${value}',
              'Accept': 'application/json',
            },
          );
        });
      } else {
        Utils.showToast('No internet connection', true);
      }
    });
  }


  void callApi() async {
    await _appPreferences.isPreferenceReady;

    var userId;
    _appPreferences.getUserId().then((value1) {
      userId = value1;
    });
    _firebaseMessaging.getToken().then((token) async {
      isPostApiCalling.value = true;
      _appPreferences
        .getAccessToken(prefName: AppPreferences.prefAccessToken)
        .then((value) async {
      await BaseClient.put(Constants.updateProfile + "/${userId}",
          onSuccess: (response) async {
        isPostApiCalling.value = false;
        profileController.myProfileResponseModelObj.value =
            MyProfileResponseModel.fromJson(response.data);
        MyProfileResponseModel responseModel =
            MyProfileResponseModel.fromJson(response.data);
        print('[ PROFILE UPDATE RESPONSE ===> ${responseModel.toJson()}]');
        FirestoreController.instance.updateUserData(responseModel,token!);
        await _appPreferences.isPreferenceReady;
        _appPreferences.setUserDetails(
            data: jsonEncode(responseModel.data));
        homeController.user.value.name = responseModel.data!.name;
        dashboardController.user.value.image = responseModel.data!.image;
        homeController.user.refresh();
        dashboardController.user.refresh();
        animatedButtonController.reset();
        Get.back(result: true);
      }, onError: (error) {
        print(error);
        isPostApiCalling.value = false;
        animatedButtonController.reset();
        BaseClient.handleApiError(error);
        apiCallStatus = ApiCallStatus.error;
      }, headers: {
        'Authorization': 'Bearer $value',
        'Accept': 'application/json',
      }, data: {
        'phone': mobileNoController.value.text != null
            ? mobileNoController.value.text
            : "",
        'name':
            nameController.value.text != null ? nameController.value.text : "",
        'email': emailController.value.text != null
            ? emailController.value.text
            : "",
        'position_id': arrOfPosition
            .where((element) => element.selected!.value == true)
            .first
            .id,
        'address': locationController.value.text != null
            ? locationController.value.text
            : "",
        'relationship_id': relationController.value.text.isNotEmpty ? arrOfRelation.where((element) => element.selected!.value == true).first.id : "",
        'hire_date': hireDate.isNotEmpty ? hireDate : "",
        'dob': dobDate.isNotEmpty ? dobDate : "",
        'bio': bioController.value.text != null ? bioController.value.text : "",
        'school': schoolController.value.text != null
            ? schoolController.value.text
            : "",
        'portfolio': portfolioUrlController.value.text != null
            ? portfolioUrlController.value.text
            : "",
        'tiktok': tiktokUrlController.value.text != null
            ? tiktokUrlController.value.text
            : "",
        'instagram': instagramUrlController.value.text != null
            ? instagramUrlController.value.text
            : "",
        'facebook': facebookUrlController.value.text != null
            ? facebookUrlController.value.text
            : "",
        'specialities': selectedInterestId,
        if (listOfImages.isNotEmpty) "image": profileImageURl,
      });
    });
    });
  }

  void uploadMedia(){
    Utils.check().then((value) async {
      if (value) {
        if(listOfImages.isNotEmpty) { //upload profile image if not empty
          mediaUploadController.s3SignedUrlAPI(
              filePath: listOfImages[0].image!.path,
              title: "Profile Photo",
              isShowLoader: false,
              onDone: (url) async {
                print(url);
                profileImageURl = url;
                callApi();

              });
        }
        else {
          callApi();

        }
      } else {
        Utils.showToast('No Internet Connection', true);
      }
    });
  }


  void uploadCertificatesS3(String path){
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
                uploadCertificate();
              });


            });
      } else {
        Utils.showToast('No Internet Connection', true);
      }
    });
  }
}
