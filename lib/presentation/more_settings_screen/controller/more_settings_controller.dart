import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:salon_symphony/presentation/chat_module/chat_strings.dart';
import 'package:salon_symphony/presentation/chat_module/firestore_controller.dart';
import 'package:salon_symphony/presentation/more_settings_screen/models/more_settings_model.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/utils.dart';
import '../../../data/models/loginResponseModel.dart';
import '../../../data/models/myProfileResponseModel.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/base_client.dart';
import '/core/app_export.dart';

class MoreSettingsController extends GetxController {
  Rx<MoreSettingsModel> moreSettingsModelObj = MoreSettingsModel().obs;
  AppPreferences _appPreferences = AppPreferences();
  RxBool isSelectedSwitch = false.obs;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  MyProfileResponseModel loginResponseModel = MyProfileResponseModel();
  Rx<User> user = User().obs;
  // api call status
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  RxBool isloading = false.obs;

  @override
  void onReady() {
    super.onReady();

    _appPreferences.getUserDetail().then((value) async {
      user.value = User.fromJson(jsonDecode(value!));
      isSelectedSwitch.value = user.value.pushNotification==1?true:false;
      print(value);
    });
  }

  Future<dynamic> logoutAPI() async {

   await _appPreferences.isPreferenceReady;
   Utils.check().then((value) async {
    if (value) {
      _firebaseMessaging.getToken().then((token) async{
        print('[ FIREBASE TOKEN ====> $token]');
     // *) perform api call
      EasyLoading.show(
          status: 'Please wait...', maskType: EasyLoadingMaskType.black);
      _appPreferences.getAccessToken(prefName: AppPreferences.prefAccessToken).then((value) async {
        await BaseClient.post(
            Constants.logoutApiUrl,
            onSuccess: (response2) async {
              DocumentReference doc = FirebaseFirestore.instance
                  .collection(ChatStrings.usersCollectionReference)
                  .doc(user.value.id.toString());
              doc.get().then((docSnapshot) {
                if (docSnapshot.exists) {
                  doc.update({
                    'name': user.value.name,
                    'position': user.value.positionId,
                    'fcm_token': '',
                    'image': user.value.image != null
                        ? user.value.image!.isNotEmpty
                        ? user.value.image
                        : ""
                        : "",
                  });
                }
              }).then((value) {
                EasyLoading.dismiss();
                _appPreferences.clearPreference();
                Get.offAllNamed(AppRoutes.signInScreen);
              });


            },
            onError: (error) {
              EasyLoading.dismiss();
              print(error);
              BaseClient.handleApiError(error);

              apiCallStatus = ApiCallStatus.error;
            },
            headers: {
              'Authorization': 'Bearer ${value}',
              'Accept': 'application/json',
            },
            data: {
              'device_token': token,
              'device_type': (Platform.isIOS) ? 'ios' : 'android',
            });
      });
      });

    } else {
     Utils.showToast('No internet connection', true);
    }
   });
  }

  void callUpdateUserApi() async {
    await _appPreferences.isPreferenceReady;

    var userId;
    _appPreferences.getUserId().then((value1) {
      userId = value1;
    });
    _appPreferences
        .getAccessToken(prefName: AppPreferences.prefAccessToken)
        .then((value) async {
      await BaseClient.put(Constants.updateProfile + "/${userId}",
          onSuccess: (response) async {
            MyProfileResponseModel responseModel = MyProfileResponseModel.fromJson(response.data);
            await _appPreferences.isPreferenceReady;
            _appPreferences.setUserDetails(
                data: jsonEncode(responseModel.data));
            Get.back(result: true);
          }, onError: (error) {
            print(error);
            BaseClient.handleApiError(error);
            apiCallStatus = ApiCallStatus.error;
          }, headers: {
            'Authorization': 'Bearer $value',
            'Accept': 'application/json',
          }, data: {
            'phone': user.value.phone,
            'name': user.value.name,
            'push_notification': isSelectedSwitch.value?1:0,
          });
    });
  }

  Future<dynamic> deleteUser() async {

    await _appPreferences.isPreferenceReady;
    Utils.check().then((value) async {
      if (value) {
        // *) perform api call

        EasyLoading.show(
            status: 'Please wait...', maskType: EasyLoadingMaskType.black);
        _appPreferences.getAccessToken(prefName: AppPreferences.prefAccessToken).then((value) async {
          await BaseClient.delete(
              Constants.users+"/${user.value.id}",
              onSuccess: (response) async {
                EasyLoading.dismiss();
                _appPreferences.clearPreference();
                Get.offAllNamed(AppRoutes.signInScreen);
              },
              onError: (error) {
                EasyLoading.dismiss();
                print(error);
                BaseClient.handleApiError(error);

                apiCallStatus = ApiCallStatus.error;
              },
              headers: {
                'Authorization': 'Bearer ${value}',
                'Accept': 'application/json',
              },
              data: {}
          );
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
