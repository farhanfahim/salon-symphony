import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:intl/intl.dart';
import 'package:salon_symphony/Shared_prefrences/app_prefrences.dart';
import 'package:salon_symphony/core/utils/responsive.dart';
import 'package:salon_symphony/data/models/GetPostionListingModel.dart';
import 'package:salon_symphony/data/services/api_call_status.dart';
import 'package:salon_symphony/data/services/api_exceptions.dart';
import 'package:salon_symphony/data/services/base_client.dart';
import 'package:salon_symphony/widgets/animatedButton.dart';

import '../../../core/utils/app_constant.dart';
import '../../../core/utils/dummy_content.dart';
import '../../../core/utils/helper_functions.dart';
import '../../../core/utils/utils.dart';
import '../../../data/models/loginResponseModel.dart';
import '../../../widgets/custom_text.dart';
import '../../chat_module/firestore_controller.dart';
import '/core/app_export.dart';
import 'package:salon_symphony/presentation/sign_up_account_setup_screen/models/sign_up_account_setup_model.dart';
import 'package:flutter/material.dart';

class SignUpAccountSetupController extends GetxController {
  Rx<SignUpAccountSetupModel> signUpAccountSetupModelObj =
      SignUpAccountSetupModel().obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final animatedButtonController = AnimatedButtonController();
  AppPreferences appPreferences = AppPreferences();

  Rx<TextEditingController>fullnameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confPasswordController =
      TextEditingController().obs;
  Rx<TextEditingController> positionController = TextEditingController().obs;
  Rx<TextEditingController> schoolController = TextEditingController().obs;
  Rx<TextEditingController> hireDateController = TextEditingController().obs;
  Rx<TextEditingController> dobController = TextEditingController().obs;
  RxList<dataModel> arrOfOptions = <dataModel>[].obs;
  FocusNode? fullnameNode = FocusNode();
  FocusNode? emailNode = FocusNode();
  FocusNode? passwordNode = FocusNode();
  FocusNode? confPasswordNode = FocusNode();
  FocusNode? positionNode = FocusNode();
  FocusNode? schoolNode = FocusNode();
  FocusNode? hireDateNode = FocusNode();
  FocusNode? dobNode = FocusNode();

  RxBool checkbox = false.obs;
  Rx<bool> showPassword = false.obs;
  Rx<bool> showConfPassword = false.obs;
  bool formSubmitted = false;
  AppPreferences _appPreferences = AppPreferences();
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  String dobDate = "";
  RxBool isFormCompleted = false.obs;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  checkForm() {
    if (fullnameController.value.text.isEmpty ||
        passwordController.value.text.isEmpty ||
        confPasswordController.value.text.isEmpty ||
        positionController.value.text.isEmpty ||
        emailController.value.text.isEmpty ||
        dobController.value.text.isEmpty) {
      isFormCompleted.value = false;
    } else {
      isFormCompleted.value = true;
    }
  }

  selectAge(context, bool isDob) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isDob == true ? DateTime(2000, 8) : DateTime.now(),
      firstDate: DateTime(1900, 8),
      lastDate: isDob == true ? DateTime(2020, 8) : DateTime.now(),
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
    } else {
      saveInfo(context);
      hireDateController.value.text =
          Utils.getFormatedDate(birthDateString.toString());
    }
    print('DOB=====>'+dobController.value.text);
    saveInfo(context);
  }

  void saveInfo(context) {
    final formState = formKey.currentState;
    if (formSubmitted == true) {
      if (formState!.validate()) {
        formState.save();
        // then do something
      }
    }
  }



  updateItem(int index) {
    for (var item in arrOfOptions) {
      item.selected = false.obs;
    }
    arrOfOptions[index].selected = true.obs;
    arrOfOptions.refresh();
    checkForm();
  }

  void selectPosition(context) {
    Responsive responsive = Responsive();
    responsive.setContext(context);
    HelperFunction.showBottomSheet(
      context,
      redclrEndTask: false,
      isScrollControlled: true,
      bottomSheetHeight:responsive.setHeight(80),
      // spaceBetween: responsive.setHeight(4),
      screenTitle: 'Select Position',
      screenEndTask: "Done",
      widget: Obx(() => Padding(
        padding:  EdgeInsets.only(top: responsive.setHeight(1.5)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListView.builder(
                    itemCount: arrOfOptions.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var data = arrOfOptions[index];
                      // print('count ${arrOfOptions[1].selected!.value}');
                      return InkWell(
                        onTap: () {
                          positionController.value.text = data.name.toString();
                          saveInfo(context);
                          updateItem(index);
                          Get.back();
                          print(arrOfOptions.where((element) => element.selected!.value == true).first.id);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: responsive.setHeight(3.5),right: 20),
                          child: Row(
                            children: [
                              MyText(title: '${data.name}'),
                              Spacer(),
                              arrOfOptions[index].selected!.value == true
                                  ? Container(
                                      margin: getMargin(
                                        //   top: 15,
                                        right: 5,
                                        //   bottom: 15,
                                      ),
                                      decoration:
                                          AppDecoration.outlineBluegray100.copyWith(
                                        borderRadius: BorderRadiusStyle.roundedBorder10,
                                        border: Border.all(
                                          color: ColorConstant.primaryColor,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: getSize(
                                              15.00,
                                            ),
                                            width: getSize(
                                              15.00,
                                            ),
                                            margin: getMargin(
                                              all: 1,
                                            ),
                                            decoration: BoxDecoration(
                                              color: ColorConstant.primaryColor,
                                              borderRadius: BorderRadius.circular(
                                                getHorizontalSize(
                                                  50,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      margin: getMargin(
                                        // top: 15,
                                        right: 5,
                                        // bottom: 15,
                                      ),
                                      decoration:
                                          AppDecoration.outlineBluegray100.copyWith(
                                        borderRadius: BorderRadiusStyle.roundedBorder10,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: getSize(
                                              15.00,
                                            ),
                                            width: getSize(
                                              15.00,
                                            ),
                                            margin: getMargin(
                                              all: 1,
                                            ),
                                            decoration: BoxDecoration(
                                              color: ColorConstant.whiteA700,
                                              borderRadius: BorderRadius.circular(
                                                getHorizontalSize(
                                                  50,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
            ),
          ],
        ),
      )),
    );
  }


  Future<dynamic> accountDetails(Map<String, dynamic> map) async {
    // make a get call
    print('map ${map}');
    await _appPreferences.isPreferenceReady;
    var salonId;
    _appPreferences.getSalonId().then((value1) {
      salonId = value1;
      print('salonId====>${salonId}');
    });
    Utils.check().then((value) async {
      if (value) {
        _firebaseMessaging.getToken().then((token) async {
// btnController.start();
          await BaseClient.post(
              Constants.AccountDetailApiUrl,
              onSuccess: (response) async {
                animatedButtonController.reset();

                // Utils.showToast(response.data['message'], false);
                LoginData loginResponseModel = LoginData.fromJson(response.data['data']);
                print('[ LOGIN RESPONSE ===> ${loginResponseModel.toJson()}]');
                _appPreferences.setUserDetails(data: jsonEncode(loginResponseModel.user!));
                _appPreferences.setUserId(userId:loginResponseModel.user!.id!.toString() );
                FirestoreController.instance.saveUserData(loginResponseModel.user!.id!,loginResponseModel.user!.name,loginResponseModel.user!.email,loginResponseModel.user!.image,loginResponseModel.user!.positionId, loginResponseModel.user!.salonId, token);
                // _appPreferences.setSalonId(salonId: loginResponseModel.user!.salonId!.toString());
                _appPreferences.setAccessToken(token: loginResponseModel.accessToken!.token!);
                print('token====>${loginResponseModel.accessToken!.token!}');
                _appPreferences.getAccessToken(prefName: AppPreferences.prefAccessToken).then((value) async {
                  print('token====>${value}');
                });

                if (passwordController.value.text != confPasswordController.value.text) {
                  Utils.showToast('Password and Confirm Password does not match', true);
                } else {
                  Get.toNamed(AppRoutes.signUpAccountSetupAddPhotoScreen, arguments: {
                    'phone': map['phone'],
                    'position_id': arrOfOptions.where((element) => element.selected!.value == true).first.id,
                    'dob':dobDate.isNotEmpty?dobDate:"",
                    'school': schoolController.value.text.trim(),
                    'name': fullnameController.value.text,
                    'password': passwordController.value.text,
                    'password_confirmation': confPasswordController.value.text,
                    'role_id': 3,
                    'salon_id': salonId
                  });
                }
              },
              onError: (error) {
                print(error);
                animatedButtonController.reset();
                BaseClient.handleApiError(error);
                apiCallStatus = ApiCallStatus.error;
              },
              data: {
                'device_token': token,
                'device_type': (Platform.isIOS) ? 'ios' : 'android',
                'name': fullnameController.value.text,
                'email': emailController.value.text,
                'password': passwordController.value.text,
                'password_confirmation': confPasswordController.value.text,
                'phone': map['phone'],
                'position_id': arrOfOptions.where((element) => element.selected!.value == true).first.id,
                'dob':dobDate.isNotEmpty?dobDate:"",
                // 'school': schoolController.value.text.trim(),
                'role_id': map['role_id'],
                'salon_id': salonId,
                'location_id': map['location_id'],
                'hire_date': map['hire_date'],
              }

          );
        });
      } else {
        Utils.showToast('No internet connection',true);
      }
    });
  }



  Future<dynamic> getPositionListing ()async{
    Utils.check().then((value) async {
      if (value) {
        var response1 =  await BaseClient.get(
            Constants.GetPositionListing,
            onSuccess: (response) {
              GetPostionListingModel positionListingModel = GetPostionListingModel.fromJson(response.data);
              positionListingModel.data!.map((e) =>
                  arrOfOptions.add(dataModel(name: e.name, id: e.id, selected: false.obs))).toList();

              print('response.data ===== > ${response.data}');
              return true;
            },

            onError: (error) {
              ApiException apiException = error;

              print(apiException.message);

              BaseClient.handleApiError(error);

              apiCallStatus = ApiCallStatus.error;

              return false;
            },
            headers: {
              'Accept': 'application/json',
            },
            queryParameters : null

        );
      } else {
        animatedButtonController.reset();
        Utils.showToast('Check your internet connection', true);
      }
    });
  }




  void createAccount(context, Map<String, dynamic> map) {
    formSubmitted = true;
    Utils.hideKeyboard(context);
    final formState = formKey.currentState;
    if (formState!.validate()) {
      formState.save();
      accountDetails(map);
      // if (passwordController.value.text != confPasswordController.value.text) {
      //   // btnController.stop();
      //   Utils.showToast('Password and Confirm Password does not match', true);
      // } else {
      //   Get.toNamed(AppRoutes.signUpAccountSetupAddPhotoScreen);
      // }
    }
    else{
      animatedButtonController.reset();
    }
  }

  void fullNameValidate (context) {
    if (!fullnameController.value.text.trim().contains(' ')){
      Utils.showToast('Please enter your full name', true);
    }
    // else if (fullnameController.value.text.trim().length < 2) {
    //   Utils.showToast('Please enter your full name', true);
    // }
    // else {
    //   Utils.hideKeyboard(context);
    // }
  }



  @override
  void onReady() {
    super.onReady();
    getPositionListing();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
