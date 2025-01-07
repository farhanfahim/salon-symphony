import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:salon_symphony/Shared_prefrences/app_prefrences.dart';
import 'package:salon_symphony/data/models/loginResponseModel.dart';
import 'package:salon_symphony/data/services/api_exceptions.dart';
import 'package:salon_symphony/data/services/base_client.dart';
import 'package:salon_symphony/widgets/animatedButton.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/utils/helper_functions.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/utils/utils.dart';
import '../../../data/models/invitationSignupModel.dart';
import '../../../data/models/userInvitaionModel.dart';
import '../../../data/services/api_call_status.dart';
import '../../../widgets/custom_text.dart';
import '/core/app_export.dart';
import 'package:flutter/material.dart';

class SignUpController extends GetxController {
  final animatedButtonController = AnimatedButtonController();
  final RoundedLoadingButtonController btnController = RoundedLoadingButtonController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Rx<TextEditingController> mobileNoController = TextEditingController().obs;
  TextEditingController passCodeController = TextEditingController();
  final maskFormatter = MaskTextInputFormatter(
    mask: '###-###-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  FocusNode? mobileNoNode = FocusNode();
  FocusNode? passCodeNode = FocusNode();

  PhoneNumber initialPhone = PhoneNumber(isoCode: 'US');


  // FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  AppPreferences _appPreferences = AppPreferences();

  TextEditingController otp = TextEditingController(text: "");


  Rx<String>? otpCode = "".obs;
  RxBool otpValidation = false.obs;

  RxBool isFormCompleted = false.obs;

  ApiCallStatus apiCallStatus = ApiCallStatus.holding;


 checkForm(context){

   if(mobileNoController.value.text.isEmpty ||
       otp.text.length < 4){
     isFormCompleted.value = false;
     print("isFormCompleted.value ${isFormCompleted.value}"  );
   }else{
     isFormCompleted.value = true;
     print("isFormCompleted.value ${isFormCompleted.value}"  );
   }

}

  void validateOtp(context){
    Utils.hideKeyboard(context);
    if(otp.text.length == 4){
      otpValidation.value = false;
    }else{
      otpValidation.value = true;
    }
  }



  void needHelpBottomSheet(context){
    Responsive responsive = Responsive();
    responsive.setContext(context);
    HelperFunction.showBottomSheet(
      context,
      bottomSheetHeight: responsive.setHeight(38),
      spaceBetween: responsive.setHeight(4),
      redclrEndTask: false,
      screenEndTask: 'Done',
      screenTitle:
      'Account Help',
      widget: Padding(
        padding: const EdgeInsets.only(right: 20.0,top: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "All members must be invited to Salon Symphony by a registered organization. If you received an invitation via SMS, please enter the verification code sent to your device. For further assistance, contact your manager or email our support team at ",
                      style: TextStyle(
                          color: ColorConstant.black900,
                          fontSize: getFontSize(14),
                          fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                          height: 1.90),),
                  TextSpan(
                      text: " ",
                      style: TextStyle(
                          color: Color(0xff7B68EE),
                          fontSize: getFontSize(14),
                          fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',

                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                          height: 1.90)),
                  TextSpan(
                      text: "help@salonsymphonysoftware.com.",
                      style: TextStyle(
                          color: Color(0xff7B68EE),
                          fontSize: getFontSize(14),
                          fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                          height: 1.90),
                    recognizer: TapGestureRecognizer()
                      ..onTap = ()
                        async {
                          String email = Uri.encodeComponent("help@salonsymphonysoftware.com");
                          String subject = Uri.encodeComponent("Need Help");
                          print(subject); //output: Hello%20Flutter
                          Uri mail = Uri.parse("mailto:$email?subject=$subject");
                          if (await launchUrl(mail)) {
                            // Successfully launched url
                            //email app opened
                          }else{
                            //email app is not opened
                          }
                          // // Android: Will open mail app or show native picker.
                          // // iOS: Will open mail app if single mail app found.
                          // var result = await OpenMailApp.openMailApp(
                          //   nativePickerTitle: 'Select email app to open',
                          // );
                          //
                          // // If no mail apps found, show error
                          // if (!result.didOpen && !result.canOpen) {
                          //   Utils.showToast('No mail app installed.', true);
                          //   // iOS: if multiple mail apps found, show dialog to select.
                          //   // There is no native intent/default app system in iOS so
                          //   // you have to do it yourself.
                          // } else if (!result.didOpen && result.canOpen) {
                          //   showDialog(
                          //     context: context,
                          //     builder: (_) {
                          //       return MailAppPickerDialog(
                          //         mailApps: result.options,
                          //       );
                          //     },
                          //   );
                          // }
                        }

                  ),

                ]),
                textAlign: TextAlign.left)

            // Color(0xff7B68EE),
          ],
        ),
      )
    );
  }
  void showNoMailAppsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Open Mail App"),
          content: Text("No mail apps installed"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
  void _launchMailApp() async {
    // Check if any mail app is installed
    var result =  await OpenMailApp.openMailApp(
      nativePickerTitle: 'Select email app to open',
    );

    if (!result.didOpen && !result.canOpen) {
      // Open the default mail app
      await OpenMailApp.openMailApp();
    } else {
      // Handle the case where no mail app is installed
      // You can show a message to the user or provide an alternative action
      print("No mail app installed");
    }
  }

  double getFontSize(double size) {
    // Your implementation for determining the font size
    return size;
  }
  Rx<LoginResponseModel?> userDetails = LoginResponseModel().obs;
  AppPreferences appPreferences = AppPreferences();


  Future<dynamic> signUp() async {
    // make a get call
    Utils.check().then((value) async {
      if (value) {
      var response1 =  await BaseClient.get(
    Constants.SignUpApiUrl,
        onSuccess: (response) async {
          animatedButtonController.reset();
          // userDetails.value = LoginResponseModel.fromJson(response.data['data']);
          UserInvitationModel user = UserInvitationModel.fromJson(response.data);
          // appPreferences.setProfileData(data: jsonEncode(userDetails.value));
          await _appPreferences.isPreferenceReady;
          _appPreferences.setSalonId(salonId: user.data!.salonId!.toString());
          print('salonId  ===== > ${user.data!.salonId!.toString()}');
          print('response ===== > ${response.data}');

          var map = {
            'phone': "+1"+maskFormatter.getUnmaskedText(),
            'role_id' : user.data!.roleId,
            'location_id' : user.data!.location!.id,
            'hire_date' : user.data!.hireDate,
          };
            Get.offAllNamed(AppRoutes.signUpAccountSetupScreen , arguments: map);

          return true;
        },

        onError: (error) {
          animatedButtonController.reset();
          ApiException apiException = error;

          print(apiException.message);

          BaseClient.handleApiError(error);

          apiCallStatus = ApiCallStatus.error;

          return false;
        },
          headers: {
            'Accept': 'application/json',
          },
        queryParameters : {
          'phone': "+1"+maskFormatter.getUnmaskedText(),
          'passcode': otp.value.text.trim(),
        }

    );
      } else {
        animatedButtonController.reset();
        Utils.showToast('Check your internet connection', true);
      }
    });
  }


  void singUpForm(context){
    Utils.hideKeyboard(context);
    final formState = formKey.currentState;
    if (formState!.validate() /*&& otp.text.length == 4*/) {
      formState.save();
      signUp();
    }
    else{
      animatedButtonController.reset();
    }
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
