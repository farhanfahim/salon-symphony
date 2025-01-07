import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/base_client.dart';
import '../../../widgets/animatedButton.dart';
import '/core/app_export.dart';
import 'package:salon_symphony/presentation/forgot_password_screen/models/forgot_password_model.dart';

class ForgotPasswordController extends GetxController {
  Rx<ForgotPasswordModel> forgotPasswordModelObj = ForgotPasswordModel().obs;

  GlobalKey<FormState> formKey = new GlobalKey();

  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  final animatedButtonController = AnimatedButtonController();
  PhoneNumber initialPhone = PhoneNumber(isoCode: 'US');
  Rx<TextEditingController> mobileNoController = TextEditingController().obs;
  FocusNode? mobileNoNode = FocusNode();
  RxBool isFormCompleted = false.obs;
  @override
  void onReady() {
    super.onReady();
  }
  final maskFormatter = MaskTextInputFormatter(
    mask: '###-###-####',
    filter: {"#": RegExp(r'[0-9]')},
  );


  void forgetPassword(context){
    Utils.hideKeyboard(context);
    final formState = formKey.currentState;
    if (formState!.validate()) {
      formState.save();
      forgetPasswordAPI();
    }
    else{
      animatedButtonController.reset();
    }
  }

  checkForm(){
    if(mobileNoController.value.text.isEmpty ){
      isFormCompleted.value = false;
      print("isFormCompleted.value ${isFormCompleted.value}"  );
    }else{
      isFormCompleted.value = true;
      print("isFormCompleted.value ${isFormCompleted.value}"  );
    }
  }


  Future<dynamic> forgetPasswordAPI() async {

    if (formKey.currentState!.validate()) {


      Utils.check().then((value) async {
        if (value) {
          // *) perform api call
          await BaseClient.post(
              Constants.forgetPasswordApiUrl,
              onSuccess: (response) async {
                animatedButtonController.reset();
                Get.toNamed(AppRoutes.otpVerificationScreen);
                Utils.showToast(response.data['message'], false);
              },
              onError: (error) {
                print(error);
                BaseClient.handleApiError(error);
                animatedButtonController.reset();
                apiCallStatus = ApiCallStatus.error;
              },
              data: {
                'phone': "+1"+maskFormatter.getUnmaskedText(),

              }
          );
        } else {
          Utils.showToast('No internet connection', true);
        }
      });

    } else {
      animatedButtonController.reset();
    }
  }



  @override
  void onClose() {
    super.onClose();
  }
}
