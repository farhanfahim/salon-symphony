import 'package:salon_symphony/presentation/otp_verification_screen/controller/otp_verification_controller.dart';

import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/base_client.dart';
import '../../../widgets/animatedButton.dart';
import '../../forgot_password_screen/controller/forgot_password_controller.dart';
import '../../otp_verification_screen/otp_verification_screen.dart';
import '/core/app_export.dart';
import 'package:salon_symphony/presentation/create_new_password_screen/models/create_new_password_model.dart';
import 'package:flutter/material.dart';

class CreateNewPasswordController extends GetxController {

  Rx<CreateNewPasswordModel> createNewPasswordModelObj =
      CreateNewPasswordModel().obs;

  GlobalKey<FormState> formKey = new GlobalKey();

  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> passwordConfController = TextEditingController().obs;

  FocusNode? passwordNode = FocusNode();
  FocusNode? passwordConfNode = FocusNode();

  RxBool showPassword = true.obs;
  RxBool showConfPassword = true.obs;

  ForgotPasswordController forgotPasswordController = Get.find();
  OtpVerificationController otpVerificationController = Get.find();
// api call status
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  RxBool isloading = false.obs;
  final animatedButtonController = AnimatedButtonController();
  RxBool isFormCompleted = false.obs;


  void changePassword(context){
    Utils.hideKeyboard(context);
    final formState = formKey.currentState;
    if (formState!.validate()) {
      formState.save();
      if(passwordController.value.text.isNotEmpty){
        if(passwordConfController.value.text.isNotEmpty){
          // btnController.stop();
          animatedButtonController.reset();

          if(passwordController.value.text != passwordConfController.value.text){
            // btnController.stop();
            animatedButtonController.reset();
            Utils.showToast(
                'Password and Confirm password do not match',
                true);
          }else{
            resetPasswordAPI();

          }
        }else{
          Utils.showToast(
              'Confirmation password cannot be empty',
              true);
        }
      }else{
        Utils.showToast(
            'Password cannot be empty',
            true);
      }
    }
    else{
      animatedButtonController.reset();
    }
  }



  checkForm(context){

    if(passwordController.value.text.isEmpty ||
        passwordConfController.value.text.isEmpty){
      isFormCompleted.value = false;
      print("isFormCompleted.value ${isFormCompleted.value}"  );
    }else{
      isFormCompleted.value = true;
      print("isFormCompleted.value ${isFormCompleted.value}"  );
    }

  }



  Future<dynamic> resetPasswordAPI() async {
    isloading.value = true;

    Utils.check().then((value) async {
      if (value) {
        // *) perform api call
        await BaseClient.post(Constants.resetPasswordApiUrl,
            onSuccess: (response) async {
              animatedButtonController.reset();

              Utils.showToast(
                  'Password Updated Successfully',
                  false);
              Get.offAllNamed(AppRoutes.signInScreen);
            }, onError: (error) {
              print(error);
              BaseClient.handleApiError(error);
              animatedButtonController.reset();
              apiCallStatus = ApiCallStatus.error;
            }, data: {
              'phone': "+1"+forgotPasswordController.maskFormatter.getUnmaskedText(),
              'otp_code': otpVerificationController.otp.value.text,
              'password': passwordController.value.text,
              'password_confirmation': passwordConfController.value.text,
            });
      } else {
        Utils.showToast('No internet connection', true);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
