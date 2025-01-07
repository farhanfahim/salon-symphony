import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/base_client.dart';
import '../../forgot_password_screen/controller/forgot_password_controller.dart';
import '/core/app_export.dart';
import '../../../data/services/api_call_status.dart';
import '../../../widgets/animatedButton.dart';
import '../models/otp_verification_model.dart';

class OtpVerificationController extends GetxController {
  Rx<OtpVerificationModel> otpVerificationModelObj = OtpVerificationModel().obs;
  ForgotPasswordController forgotPasswordController = Get.find();
// api call status
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  RxBool isloading = false.obs;
  final animatedButtonController = AnimatedButtonController();

  @override
  void onReady() {
    super.onReady();
  }

  TextEditingController otp = TextEditingController(text: "");
  FocusNode? passCodeNode = FocusNode();

  Rx<String>? otpCode = "".obs;
  RxInt sec = 15.obs;
  RxBool showTimer = false.obs;

  RxBool isFormCompleted = false.obs;
  RxBool otpValidation = false.obs;

  checkForm(context){

    if(otp.text.length < 4){
      isFormCompleted.value = false;
      print("isFormCompleted.value ${isFormCompleted.value}"  );
    }else{
      isFormCompleted.value = true;
      print("isFormCompleted.value ${isFormCompleted.value}"  );
    }

  }


  void countDown() {
    print(sec.value);
    showTimer.value = true;
    if (sec.value != 0) {
      Timer.periodic(Duration(seconds: 1), (timer) {
        if (sec != 0) {
          sec = sec - 1;
        } else {
          showTimer.value = false;
          timer.cancel();
        }
      });
    } else {
      sec = 15.obs;
      countDown();
    }
  }

  Future<dynamic> verifyOtpAPI() async {
   isloading.value = true;

   Utils.check().then((value) async {
    if (value) {
     // *) perform api call
     await BaseClient.post(Constants.verifyOtpApiUrl,
         onSuccess: (response) async {
          animatedButtonController.reset();
          Get.offAllNamed(AppRoutes.createNewPasswordScreen);
          Utils.showToast(response.data['message'], false);
         }, onError: (error) {
          print(error);
          BaseClient.handleApiError(error);
          animatedButtonController.reset();
          apiCallStatus = ApiCallStatus.error;
         }, data: {
          'phone': "+1"+forgotPasswordController.maskFormatter.getUnmaskedText(),
          'otp_code': otp.value.text,
         });
    } else {
     Utils.showToast('No internet connection', true);
    }
   });
  }

  Future<dynamic> resendOtpAPI() async {
    isloading.value = true;

    Utils.check().then((value) async {
      if (value) {
        // *) perform api call
        await BaseClient.post(Constants.resendOtpApiUrl,
            onSuccess: (response) async {
            }, onError: (error) {
              print(error);
              BaseClient.handleApiError(error);
              apiCallStatus = ApiCallStatus.error;
            }, data: {
              'phone': forgotPasswordController.mobileNoController.value.text,
            });
      } else {
        Utils.showToast('No internet connection', true);
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
