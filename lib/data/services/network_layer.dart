import 'package:dio/dio.dart';

import 'package:get/get.dart';
import 'package:salon_symphony/core/app_export.dart';

import '../../Shared_prefrences/app_prefrences.dart';


class Network {
  static Dio dio = new Dio();

  static AppPreferences _appPreferences = AppPreferences();

  static Dio getDio() {

    dio.options.headers['Accept'] = "application/json";
    dio.options.connectTimeout = (120*1000) as Duration?;
    dio.options.receiveTimeout = (120*1000) as Duration?;

    dio.interceptors.add(InterceptorsWrapper(onError: (error, _) async {
      print(error.response?.statusCode);

      await _appPreferences.getAppPreferences().isPreferenceReady;

      if (error.response?.statusCode == 401) {

       await _appPreferences.getAppPreferences().clearPreference();

       Get.offAllNamed(AppRoutes.signInScreen);
      }
      // return error.response;
    }));

    dio.options;
    return dio;
  }
}