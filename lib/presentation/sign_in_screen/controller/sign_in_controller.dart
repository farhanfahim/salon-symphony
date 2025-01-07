import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:salon_symphony/data/models/loginResponseModel.dart';
import 'package:salon_symphony/data/services/api_exceptions.dart';
import 'package:salon_symphony/data/services/base_client.dart';
import 'package:salon_symphony/widgets/animatedButton.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/app_constant.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../domain/facebookauth/facebook_auth_helper.dart';
import '../../../domain/googleauth/google_auth_helper.dart';
import '../../chat_module/firestore_controller.dart';
import '/core/app_export.dart';
import 'package:salon_symphony/presentation/sign_in_screen/models/sign_in_model.dart';
import 'package:flutter/material.dart';

class SignInController extends GetxController {

  Rx<SignInModel> signInModelObj = SignInModel().obs;
  GlobalKey<FormState> formKey = new GlobalKey();
  GlobalKey<FormState> formKey2 = new GlobalKey();
  final animatedButtonController = AnimatedButtonController();
  Rx<bool> showPassword = true.obs;
  Rx<bool> buttonEnable = false.obs;

  PhoneNumber initialPhone = PhoneNumber(isoCode: 'US');

  Rx<TextEditingController> mobileNoController = TextEditingController().obs;

  Rx<TextEditingController> passwordController = TextEditingController().obs;
  final maskFormatter = MaskTextInputFormatter(
    mask: '###-###-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  FocusNode? passwordNode = FocusNode();
  FocusNode? mobileNoNode = FocusNode();


  final isTextFieldValid = false.obs;

  RxBool isFormCompleted = false.obs;

  AppPreferences _appPreferences = AppPreferences();

  // api call status
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  RxBool isloading = false.obs;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;





  checkForm(){
    if(mobileNoController.value.text.isEmpty ||
        passwordController.value.text.isEmpty){
      isFormCompleted.value = false;
      print("isFormCompleted.value ${isFormCompleted.value}"  );
    }else{
      isFormCompleted.value = true;
      print("isFormCompleted.value ${isFormCompleted.value}"  );
    }
  }


  void signIn(context){
    Utils.hideKeyboard(context);
    final formState = formKey.currentState;
    if (formState!.validate()) {
      formState.save();
      loginAPI();
    }
    else{
      animatedButtonController.reset();
    }
  }


  onTapTxtDonthaveana() {
    Get.toNamed(AppRoutes.signUpScreen);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }



  Future<dynamic> loginAPI() async {

    if (formKey.currentState!.validate()) {
      isloading.value = true;

      Utils.check().then((value) async {
        if (value) {
          _firebaseMessaging.getToken().then((token) async{
            print('[ FIREBASE TOKEN ====> $token]');
            // *) perform api call
            await BaseClient.post(
                Constants.LoginApiUrl,
                onSuccess: (response) async {
                  animatedButtonController.reset();
                  LoginData loginResponseModel = LoginData.fromJson(response.data['data']);
                  print('[ LOGIN RESPONSE ===> ${loginResponseModel.toJson()}]');
                  FirestoreController.instance.saveUserData(loginResponseModel.user!.id!,loginResponseModel.user!.name,loginResponseModel.user!.email,loginResponseModel.user!.image,loginResponseModel.user!.positionId, loginResponseModel.user!.salonId, token);
                  FirestoreController.instance.updateUserDataLogin(loginResponseModel,token!);
                  await _appPreferences.isPreferenceReady;
                  _appPreferences.setUserDetails(data: jsonEncode(loginResponseModel.user!));
                  _appPreferences.setUserId(userId:loginResponseModel.user!.id!.toString() );
                  _appPreferences.setSalonId(salonId:loginResponseModel.user!.salonId.toString() );
                  _appPreferences.setAccessToken(token: loginResponseModel.accessToken!.token!);
                  Get.offAllNamed(AppRoutes.dashboardRoute);
                  Utils.showToast(response.data['message'], false);
                },
                onError: (error) {
                  print(error);
                  BaseClient.handleApiError(error);
                  animatedButtonController.reset();
                  apiCallStatus = ApiCallStatus.error;
                },
                data: {
                  'device_token': token,
                  'device_type': (Platform.isIOS) ? 'ios' : 'android',
                  'role_id': AppConstant.USER,
                  'password': passwordController.value.text,
                  'phone': "+1"+maskFormatter.getUnmaskedText(),

                }
            );
          });
        } else {
         Utils.showToast('No internet connection', true);
        }
      });

    } else {
      animatedButtonController.reset();
    }
  }









}
