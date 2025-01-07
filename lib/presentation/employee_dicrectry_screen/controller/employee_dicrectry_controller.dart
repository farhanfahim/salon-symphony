import 'package:salon_symphony/data/services/api_exceptions.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/utils.dart';
import '../../../data/models/getTeamsListModel.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/base_client.dart';
import '/core/app_export.dart';
import 'package:salon_symphony/presentation/employee_dicrectry_screen/models/employee_dicrectry_model.dart';
import 'package:flutter/material.dart';

class EmployeeDicrectryController extends GetxController {
  TextEditingController searchController = new TextEditingController();

  Rx<EmployeeDicrectryModel> employeeDicrectryModelObj =
      EmployeeDicrectryModel().obs;

  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  Rx<int> searchIndex = 0.obs;
  RxList<TeamsListingUsers> arrOfUsers = List<TeamsListingUsers>.empty().obs;
  Rx<GetTeamsListing>? userListResponseModel = GetTeamsListing().obs;
  AppPreferences _appPreferences = AppPreferences();

  RxList<String> alphabetList = [
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y','Z', '#'
  ].obs;

  void setSearchIndex(String searchLetter) {
    searchIndex.value = arrOfUsers.indexWhere((element) => element.name![0].toUpperCase() == searchLetter);
    print(searchLetter);
    print(searchIndex.value);
    if (searchIndex.value >= 0) itemScrollController.scrollTo(index: searchIndex.value, duration: const Duration(milliseconds: 300));

  }
  Future <dynamic> getUsers() async{

    await _appPreferences.isPreferenceReady;
     var userId;
    _appPreferences.getUserId().then((value1) {
      userId = value1;
    });
    var salonID;
    _appPreferences.getSalonId().then((value1) {
      salonID = value1;
    });

    Utils.check().then((value) async {
      if (value) {

        apiCallStatus.value = ApiCallStatus.loading;
        _appPreferences.getAccessToken(prefName: AppPreferences.prefAccessToken).then((value) async {

          await BaseClient.get(
              Constants.GetTeams +salonID,
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                userListResponseModel!.value = GetTeamsListing.fromJson(response.data);
                arrOfUsers.value = userListResponseModel!.value.data!.users!;


                if(arrOfUsers.isEmpty){
                  apiCallStatus.value = ApiCallStatus.empty;
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
                'order-column': "name",
                'order': "asc",
                'viewed_user_id': userId
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
