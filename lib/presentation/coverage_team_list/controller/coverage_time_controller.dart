import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_symphony/presentation/coverage_team_list/models/user_list_response_model.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/constants/constants.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '../../../widgets/animatedButton.dart';

class CoverageTimeController extends GetxController {
  Map<String,dynamic> map = Get.arguments;
  TextEditingController searchController = TextEditingController();

  Rx<UserListResponseModel>? userListResponseModel = UserListResponseModel().obs;
  Rx<UserData>? selectedUser = UserData().obs;
  AppPreferences _appPreferences = AppPreferences();
  final animatedButtonController = AnimatedButtonController();
  RxBool isInternetAvailable = true.obs;
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  RxList<UserData> arrOfMembers = List<UserData>.empty().obs;
  RxList<UserData> arrOfTempUsers = List<UserData>.empty().obs;

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  Rx<int> searchIndex = 0.obs;

  RxList<String> alphabetList = [
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y','Z', '#'
  ].obs;

  void setSearchIndex(String searchLetter) {
    searchIndex.value = arrOfMembers.indexWhere((element) => element.name![0].toUpperCase() == searchLetter);
    if (searchIndex.value >= 0) itemScrollController.jumpTo(index: searchIndex.value);
  }

  void onVerticalDrag(int index) {

    itemScrollController.scrollTo(index: index, duration: const Duration(milliseconds: 300));

  }

  updateUser(int index) {
    for (var item in arrOfMembers) {
      item.isSelected!.value = false;
    }
    arrOfMembers[index].isSelected!.value = true;
    selectedUser!.value = arrOfMembers[index];
    arrOfMembers.refresh();
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
               arrOfMembers.value = userListResponseModel!.value.data!;


               if(arrOfMembers.isEmpty){
                 apiCallStatus.value = ApiCallStatus.empty;
               }
                for(var item in arrOfMembers){
                  if(item.id! == map['id']){
                    item.isSelected!.value = true;
                    selectedUser!.value = item;
                  }
                }
                return true;
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
        Utils.showToast('No internet connection',true);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    getUsers();
  }


}


