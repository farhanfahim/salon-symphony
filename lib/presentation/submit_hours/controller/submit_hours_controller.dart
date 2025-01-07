import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/presentation/education_tracking/controller/education_tracking_controller.dart';
import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/common/media_upload_controller.dart';
import '../../../core/utils/app_constant.dart';
import '../../../core/utils/dummy_content.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/base_client.dart';
import '../../../widgets/animatedButton.dart';
import '../../../widgets/custom_dialog_toast_message.dart';
import '../../add_add_education_tracking_screen/controller/add_add_education_tracking_controller.dart';
import '../../request_detail_time_off_screen/controller/request_dtail_time_off_controller.dart';
import '../../request_pending_page/controller/request_pending_controller.dart';

class SubmitHoursController extends GetxController{
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  MediaUploadController mediaUploadController = Get.put(MediaUploadController());
  Rx<TextEditingController> classnameController = TextEditingController().obs;
  Rx<TextEditingController> educationController = TextEditingController().obs;
  RxList<PaymentModel> arrOfOptions = DummyContent.payments.obs;
  Rx<TextEditingController> classNotesController = TextEditingController().obs;
  Rx<TextEditingController> classDateController = TextEditingController().obs;
  Rx<TextEditingController> timeControllerSubmit = TextEditingController().obs;
  Rx<TextEditingController> uploadCertificates = TextEditingController().obs;
  Rx<int> hour = 0.obs;
  Rx<int> min = 0.obs;
  RxBool isEditing= false.obs;

  AddAddEducationTrackingController controllerMap = Get.find<AddAddEducationTrackingController>();


  FocusNode? classnameNode = FocusNode();
  FocusNode? educationNode = FocusNode();
  FocusNode? submitDateNode = FocusNode();
  FocusNode? timeNode = FocusNode();
  FocusNode? uploadNode = FocusNode();
  FocusNode? notesNode = FocusNode();
  FocusNode? eventNode = FocusNode();
  FocusNode? nodeNode = FocusNode();
  FocusNode? commentsNode = FocusNode();

  RxList<quizModel> arrOfOptions2 = DummyContent.filterDataList.obs;

  DateTime? startDateTime;
  RequestPendingController requestPendingController = Get.put(RequestPendingController());
  EducationTrackingController educationTrackingController = Get.put(EducationTrackingController());
  Rx<String> startTime = "".obs;

  var fileName = ''.obs;

  AppPreferences _appPreferences = AppPreferences();
  final animatedButtonController = AnimatedButtonController();
  RxBool isInternetAvailable = true.obs;
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  Rx<bool> formSubmitted = false.obs;
  FilePickerResult? result;
  String amzCertificateFilePath='';
  RxBool isCertificateUploading = false.obs;
  String classDate = "";
  String? certificatesURl;
  late RequestDetailsTimeOffController controller;

  String shortenFileName(String fileName, int maxLength) {
    if (fileName.length <= maxLength) {
      return fileName;
    } else {
      final extension = fileName.substring(fileName.lastIndexOf('.'));
      final basename = fileName.substring(0, fileName.length - extension.length);
      final shortenedName = basename.substring(0, maxLength - 3);
      return '$shortenedName...$extension';
    }
  }

  @override
  void onReady() {
    super.onReady();

    if(controllerMap.map["isEditing"]==true && controllerMap.map["Type"]==AppConstant.EDUCATION_REQUEST){
       isEditing.value= true;
      prePopulateData();
    }


  }

  prePopulateData(){
     controller = Get.find<RequestDetailsTimeOffController>();
    if(controller.requestData!.value.className!=null){
       classnameController.value.text = controller.requestData!.value.className!;
       educationController.value.text = controller.requestData!.value.educator!;
       classDate = controller.requestData!.value.date!;
       classDateController.value.text = Utils.getFormatedDate(controller.requestData!.value.date!);
        timeControllerSubmit.value.text = controller.requestData!.value.hour!;
       startTime.value = controller.requestData!.value.hour!;
       classNotesController.value.text = controller.requestData!.value.comments!;
       uploadCertificates.value.text = controller.requestData!.value.attachment!=null?controller.requestData!.value.attachment!:"";


    }
    formSubmitted.value = true;
  }



  onTapAddCertificate() async {

     result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['pdf', 'doc'],
    );

     if(result!=null){
         String fileName = result!.files.single.path!
             .split('/')
             .last;

       uploadCertificates.value.text =  fileName;
     }


  }

  getFileSize(String filepath, int decimals) async {
    var file = File(filepath);
    int bytes = await file.length();
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + ' ' + suffixes[i];
  }

  Uint8List convertFileToBytes(String path){
    return Uint8List.fromList(File(path).readAsBytesSync());
  }



  void saveInfo(context) {
    final formState = formKey.currentState;
    Utils.hideKeyboard(context);
    if (classnameController.value.text.isNotEmpty ||
        educationController.value.text.isNotEmpty ||
        classDateController.value.text.isNotEmpty ||
        classNotesController.value.text.isNotEmpty ||
        timeControllerSubmit.value.text.isNotEmpty) {
      if (formState!.validate()) {
        formState.save();
        // callRequestEducationApi();
        uploadCertificatesS3();
      } else {
        animatedButtonController.reset();
      }
    }
  }

  void callRequestEducationApi() async {
    Utils.check().then((value) async {
      if (value) {

        await _appPreferences.isPreferenceReady;

        var userId;
        _appPreferences.getUserId().then((value1) {
          userId = value1;
        });
        var salonId;
        _appPreferences.getSalonId().then((value1) {
          salonId = value1;
        });
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.post(Constants.userRequest,
              onSuccess: (response) async {
                requestPendingController.arrOfTimeRequest.clear();
                requestPendingController.arrOfScheduleRequest.clear();
                requestPendingController.arrOfEducationRequest.clear();
                requestPendingController.getRequest();
                animatedButtonController.reset();
                educationTrackingController.pagingController.refresh();
                Get.dialog(CustomAlertToastDialog(title:"Request Submitted!",bodyCenter:true,image: ImageConstant.dialogImage,
                    body:"You'll receive a notification as soon as a manager responds to this request.",ontap: (){
                  Get.back(result: true);
                  Get.back(result: true);
                }));
                // Get.back(result: true);
              }, onError: (error) {
                print(error);
                animatedButtonController.reset();
                BaseClient.handleApiError(error);
                apiCallStatus = ApiCallStatus.error;
              }, headers: {
                'Authorization': 'Bearer $value',
                'Accept': 'application/json',
              }, data: {
                'type': AppConstant.EDUCATION_REQUEST,
                'sub_type': AppConstant.HOURS,
                'salon_id': salonId,
                'user_id': userId,
                'class': classnameController.value.text,
                'educator': educationController.value.text,
                'hour': startTime.value,
                'comments': classNotesController.value.text,
                'date': classDate.isNotEmpty ? classDate : "",
                'attachment': certificatesURl,
              });
        });
      } else {
        Utils.showToast('No internet connection', true);
      }
    });
  }

  void callEditRequestEducationApi() async {
    Utils.check().then((value) async {
      if (value) {

        await _appPreferences.isPreferenceReady;

        var userId;
        _appPreferences.getUserId().then((value1) {
          userId = value1;
        });
        var salonId;
        _appPreferences.getSalonId().then((value1) {
          salonId = value1;
        });
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.put(Constants.userRequest+"/${controller.requestData!.value.id}",
              onSuccess: (response) async {
                requestPendingController.arrOfTimeRequest.clear();
                requestPendingController.arrOfScheduleRequest.clear();
                requestPendingController.arrOfEducationRequest.clear();
                requestPendingController.getRequest();
                animatedButtonController.reset();
                educationTrackingController.pagingController.refresh();
                Get.back(result: true);
              }, onError: (error) {
                print(error);
                animatedButtonController.reset();
                BaseClient.handleApiError(error);
                apiCallStatus = ApiCallStatus.error;
              }, headers: {
                'Authorization': 'Bearer $value',
                'Accept': 'application/json',
              }, data: {
                'type': AppConstant.EDUCATION_REQUEST,
                'sub_type': AppConstant.HOURS,
                'salon_id': salonId,
                'user_id': userId,
                'class': classnameController.value.text,
                'educator': educationController.value.text,
                'hour': startTime.value,
                'comments': classNotesController.value.text,
                'date': classDate.isNotEmpty ? classDate : "",
                'attachment': certificatesURl,
              });
        });
      } else {
        Utils.showToast('No internet connection', true);
      }
    });
  }


  void uploadCertificatesS3(){
    Utils.check().then((value) async {
      if (value) {
        if( result!= null) { //upload profile image if not empty
          mediaUploadController.s3SignedUrlAPI(
              filePath: result!.files.single.path!,
              title: "Certificate",
              onDone: (url) async {
                print(url);
                certificatesURl = url;

                callRequestEducationApi();
              });
        }
        else {
          if(controllerMap.map["isEditing"]==true){
            callEditRequestEducationApi();
          }else{
            callRequestEducationApi();
          }

        }
      } else {
        Utils.showToast('No Internet Connection', true);
      }
    });
  }


  selectAge(context,bool isDob) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 8),
      lastDate: DateTime(3000, 8),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
                primary: ColorConstant.primaryColor,
                onSurface: Colors.black
            ),
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
    isAdult(picked,context,isDob);
  }

  void isAdult(birthDateString,context,bool? isDob) {
    print(birthDateString);
    if(isDob == true) {
      classDateController.value.text =
          Utils.getFormatedDate(birthDateString.toString());
      classDate = DateFormat('yyyy-MM-dd').format(birthDateString);


      print(classDateController.value.text);
    }}



}