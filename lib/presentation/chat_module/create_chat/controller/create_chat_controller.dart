import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_symphony/presentation/chat_module/chat_constants.dart';
import 'package:salon_symphony/presentation/coverage_team_list/models/user_list_response_model.dart';
import '../../../../Shared_prefrences/app_prefrences.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/dummy_content.dart';
import '../../../../core/utils/utils.dart';
import '../../../../data/services/api_call_status.dart';
import '../../../../data/services/api_exceptions.dart';
import '../../../../data/services/base_client.dart';

class CreateChatController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Rx<UserListResponseModel>? userListResponseModel = UserListResponseModel().obs;
  AppPreferences _appPreferences = AppPreferences();
  RxBool isInternetAvailable = true.obs;
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  RxList<UserData> arrOfUsers = List<UserData>.empty().obs;
  RxList<createChatModel> arrOfOptions = DummyContent.createChatData.obs;

  @override
  void onReady() {
    super.onReady();
    getUsers();
  }

  Future <dynamic> getUsers() async{

    await _appPreferences.isPreferenceReady;

    var salonID;
    _appPreferences.getSalonId().then((value1) {
      salonID = value1;
    });

    var userID;
    _appPreferences.getUserId().then((value1) {
      userID = value1;
    });

    Utils.check().then((value) async {
      if (value) {

        apiCallStatus.value = ApiCallStatus.loading;
        _appPreferences.getAccessToken(prefName: AppPreferences.prefAccessToken).then((value) async {

          await BaseClient.get(
              Constants.users,
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                userListResponseModel!.value = UserListResponseModel.fromJson(response.data);

                if(userListResponseModel!.value.data!.isEmpty){
                  apiCallStatus.value = ApiCallStatus.empty;
                }else{
                  arrOfUsers.add(UserData(id: -1,name:"",email:"",phone:"",image:"",isSelected: false.obs));

                  arrOfUsers.addAll(userListResponseModel!.value.data!);

                }


              },

              onError: (error) {
                ApiException apiException = error;

                print(apiException.message);

                BaseClient.handleApiError(error);

                apiCallStatus.value = ApiCallStatus.error;

                return false;
              },
              headers: {
                'Authorization':
                'Bearer $value',
                'Accept': 'application/json',
              },
              queryParameters : {
                'is_paginated': 0,
                'salon_id': salonID,
                'mobile_user_id': userID,
                'order-column': "name",
                'order': "asc",
              }

          );
        });

      } else {
        Utils.showToast(ChatConstants.noInternetConnection,true);
      }
    });
  }

}


