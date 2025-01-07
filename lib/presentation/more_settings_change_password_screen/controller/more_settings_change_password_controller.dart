import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/base_client.dart';
import '../../../widgets/animatedButton.dart';
import '/core/app_export.dart';
import 'package:salon_symphony/presentation/more_settings_change_password_screen/models/more_settings_change_password_model.dart';
import 'package:flutter/material.dart';

class MoreSettingsChangePasswordController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  FocusNode passwordNode = new FocusNode();
  Rx<TextEditingController> newPasswordController = TextEditingController().obs;
  FocusNode newPasswordNode = new FocusNode();
  Rx<TextEditingController> confirmPasswordController =
      TextEditingController().obs;
  FocusNode confirmPasswordNode = new FocusNode();
  Rx<MoreSettingsChangePasswordModel> moreSettingsChangePasswordModelObj =
      MoreSettingsChangePasswordModel().obs;

  Rx<bool> isShowPassword = false.obs;

  Rx<bool> isShowPassword1 = false.obs;

  Rx<bool> isShowPassword2 = false.obs;

  AppPreferences _appPreferences = AppPreferences();
  RxBool isFormCompleted = false.obs;

  // api call status
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  RxBool isloading = false.obs;
  final animatedButtonController = AnimatedButtonController();

  @override
  void onReady() {
    super.onReady();
  }

  checkForm() {
    if (passwordController.value.text.isEmpty ||
        newPasswordController.value.text.isEmpty ||
        confirmPasswordController.value.text.isEmpty) {
      isFormCompleted.value = false;
    } else {
      isFormCompleted.value = true;
    }
  }

  void changePassword(context) {
    Utils.hideKeyboard(context);
    final formState = formKey.currentState;
    if (formState!.validate()) {
      formState.save();
      if (passwordController.value.text.isNotEmpty) {
        if (newPasswordController.value.text.isNotEmpty) {
          if (confirmPasswordController.value.text.isNotEmpty) {
            if (newPasswordController.value.text !=
                confirmPasswordController.value.text) {
              // btnController.stop();
              Utils.showToast(
                  'New password and Confirm password do not match', true);
              animatedButtonController.reset();
            } else {
              changePasswordAPI();
            }
          } else {
            Utils.showToast('Confirmation password cannot be empty', true);
          }
        } else {
          Utils.showToast('New password cannot be empty', true);
        }
      } else {
        Utils.showToast('Password cannot be empty', true);
      }
    } else {
      animatedButtonController.reset();
    }
  }

  Future<dynamic> changePasswordAPI() async {
    isloading.value = true;
    await _appPreferences.isPreferenceReady;
    Utils.check().then((value) async {
      if (value) {
        // *) perform api call

        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.post(
            Constants.changePasswordApiUrl,
            onSuccess: (response) async {
              animatedButtonController.reset();

              Utils.showToast('Password Updated Successfully', false);
              Get.back();
            },
            onError: (error) {
              animatedButtonController.reset();
              print(error);
              BaseClient.handleApiError(error);

              apiCallStatus = ApiCallStatus.error;
            },
            data: {
              'current_password': passwordController.value.text,
              'password': newPasswordController.value.text,
              'password_confirmation': confirmPasswordController.value.text,
            },
            headers: {
              'Authorization': 'Bearer $value',
              'Accept': 'application/json',
            },
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
