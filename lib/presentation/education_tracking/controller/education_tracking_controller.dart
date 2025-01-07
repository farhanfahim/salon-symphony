import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/core/utils/app_constant.dart';
import 'package:salon_symphony/presentation/education_tracking/model/education_response_model.dart';
import 'package:salon_symphony/presentation/education_tracking/model/hours_count_model.dart';
import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';

class EducationTrackingController extends GetxController {

  RxBool isInternetAvailable = true.obs;
  AppPreferences _appPreferences = AppPreferences();
  Rx<EducationResponseModel> educationResponseModel = EducationResponseModel().obs;
  Rx<EducationHoursCount> educationHoursCount = EducationHoursCount().obs;
  Rx<int> totalPages = 0.obs;
  Rx<int> currentPage = 1.obs;
  RxBool isApiCalling = false.obs;
  RxBool isApiCalling2 = false.obs;
  PagingController<int, EducationData> pagingController = PagingController(firstPageKey: 1);
  Rx<Object> totalHours = Object().obs;


  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      print(pageKey);
      fetchPage(pageKey);
    });
    getTotalHours();
  }



  Future<void> fetchPage(int pageKey) async {
    try {
      getHoursApi();
    } catch (error) {
      pagingController.error = error;
    }
  }



  void getHoursApi() async {

    Utils.check().then((value) async {
      if (value) {
        isApiCalling.value = true;
        isInternetAvailable.value = true;
        var userId;
        _appPreferences.getUserId().then((value1) {
          userId = value1;
        });
        var salonId;
        _appPreferences.getSalonId().then((value1) {
          salonId = value1;
        });
        _appPreferences.getAccessToken(prefName: AppPreferences.prefAccessToken).then((value) async {
          print('Tokeeeen ====> $value');
          await BaseClient.get(Constants.userRequest,
              onSuccess: (response) {
                isApiCalling.value = false;
                educationResponseModel.value = EducationResponseModel.fromJson(response.data['data']);

                totalPages.value = educationResponseModel.value.meta!.lastPage!;
                print('Last Page: $totalPages');

                final isNotLastPage = currentPage.value + 1 <= totalPages.value;
                print('_currentPage $currentPage');
                print('isNotLastPage $isNotLastPage');

                if (!isNotLastPage) {

                  pagingController.appendLastPage(educationResponseModel.value.data!);
                } else {
                  final nextPageKey = currentPage.value + 1;
                  currentPage.value = currentPage.value + 1;

                  print('New Page: $totalPages');
                  pagingController.appendPage(educationResponseModel.value.data!, nextPageKey);
                }

                // for (var item in pagingController.itemList!){
                //   if(item.type == 20){//approved
                //     if(item.hour!=null){//approved
                //       totalHours.value+=double.parse(item.hour!);
                //     }
                //   }
                //
                // }

                return true;
              },
              headers: {
                'Authorization':
                'Bearer $value',
                'Accept': 'application/json',
              },
              onError: (error) {
                isApiCalling.value = false;
                ApiException apiException = error;
                print(apiException.message);

                BaseClient.handleApiError(error);

                return false;
              },
              queryParameters: {
                'is_paginated': 1,
                'page': currentPage.value,
                'salon_id': salonId,
                'user_id': userId,
                'platform':'mobile',
                'type': AppConstant.EDUCATION_REQUEST,
              });});

      } else {
        Utils.showToast('Check your internet connection', true);
      }
    });
  }


  void getTotalHours() async {
    Utils.check().then((value) async {
      if (value) {
        isApiCalling2.value = true;
        isInternetAvailable.value = true;
        _appPreferences.getAccessToken(prefName: AppPreferences.prefAccessToken).then((value) async {
          print('Tokeeeen ====> $value');
          await BaseClient.get(Constants.userHoursCount,
              onSuccess: (response) {
                isApiCalling2.value = false;
                educationHoursCount.value = EducationHoursCount.fromJson(response.data);
                // if(educationHoursCount.value.data!.totalApprovedHours != null){
                //   totalHours.value = educationHoursCount.value.data!.totalApprovedHours!;
                //   print('Total Hours ======>: ${educationHoursCount.value.data!.totalApprovedHours!.runtimeType}');
                // }

                return true;
              },
              headers: {
                'Authorization': 'Bearer $value',
                'Accept': 'application/json',
              },
              onError: (error) {
                isApiCalling2.value = false;
                ApiException apiException = error;
                print(apiException.message);
                BaseClient.handleApiError(error);

                return false;
              },
              queryParameters: null
              );
        });

      } else {
        Utils.showToast('Check your internet connection', true);
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
