import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:salon_symphony/core/utils/dummy_content.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/app_constant.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '../../start_survey_screen/start_survey_screen.dart';
import '../../task_details_screen/task_details_screen.dart';
import '/core/app_export.dart';
import 'package:salon_symphony/presentation/settings_onboarding_checklist_screen/models/settings_onboarding_checklist_model.dart';
import 'package:flutter/material.dart';

class SettingsOnboardingChecklistController extends GetxController {
  TextEditingController group37764Controller = TextEditingController();
  RxList<quizModel> arrOfOptions = List<quizModel>.empty().obs;
  TextEditingController group37766Controller = TextEditingController();

  Rx<SettingsOnboardingChecklistModel> settingsOnboardingChecklistModelObj =
      SettingsOnboardingChecklistModel().obs;

  Rx<int> indicatorCount = 0.obs;
  RxString radioGroup = "".obs;
  AppPreferences _appPreferences = AppPreferences();
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  final PagingController<int, OnboardingChecklistData> pagingController1 =
      PagingController(firstPageKey: 1);
  Rx<bool> isApiCalling = false.obs;
  Rx<SettingsOnboardingChecklistModel> onBoardingCheckListResponseModel =
      SettingsOnboardingChecklistModel().obs;
  int currentPage = 1;
  int totalPages = 0;
  RxString radioGroup1 = "".obs;
  RxString radioGroup2 = "".obs;



  @override
  void onInit() {
    super.onInit();
    pagingController1.addPageRequestListener((pageKey) {
      print(pageKey);
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    print("olalala");
    try {
      getOnBoardingChecklist();
    } catch (error) {
      pagingController1.error = error;
    }
  }

  @override
  void onClose() {
    super.onClose();
    group37764Controller.dispose();
    group37766Controller.dispose();
  }

  Future<dynamic> getOnBoardingChecklist() async {
    await _appPreferences.isPreferenceReady;
    var userId;
    _appPreferences.getUserId().then((value1) {
      userId = value1;
      print('userId====>${userId}');
    });
    var salonId;
    _appPreferences.getSalonId().then((value1) {
      salonId = value1;
      print('salonId====>${salonId}');
    });
    Utils.check().then((value) async {
      if (value) {
        isApiCalling.value = true;
        apiCallStatus.value = ApiCallStatus.loading;
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          var response1 = await BaseClient.get(Constants.OnBoardingTasksListing,
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                isApiCalling.value = false;
                onBoardingCheckListResponseModel.value =
                    SettingsOnboardingChecklistModel.fromJson(response.data);

                totalPages = onBoardingCheckListResponseModel
                    .value.data!.meta!.lastPage!;
                print('Last Page: $totalPages');
                print('Current Page: $currentPage');
                final isNotLastPage = currentPage + 1 <= totalPages;
                if (!isNotLastPage) {
                  print('Last Page Reached');
                  pagingController1.appendLastPage(
                      onBoardingCheckListResponseModel.value.data!.data!);
                } else {
                  currentPage = currentPage + 1;
                  print('New Current Page: $currentPage');
                  pagingController1.appendPage(
                      onBoardingCheckListResponseModel.value.data!.data!,
                      currentPage);
                }
                return true;
              },
              headers: {
                'Authorization': 'Bearer $value',
                'Accept': 'application/json',
              },
              onError: (error) {
                ApiException apiException = error;
                print(apiException.message);

                BaseClient.handleApiError(error);

                apiCallStatus.value = ApiCallStatus.error;

                return false;
              },
              queryParameters: {
                'is_paginated': 1,
                'page': currentPage,
                'per_page': 3,
                'salon_id': salonId,
                'user_id': userId,
                'order-column':'id',
                'order' :'desc'
              });
        });
      } else {
        Utils.showToast('Check your internet connection', true);
      }
    });
  }

  Future<dynamic> getOnBoardingTask({required String taskId}) async {
    await _appPreferences.isPreferenceReady;
    var userId;
    _appPreferences.getUserId().then((value1) {
      userId = value1;
      print('userId====>${userId}');
    });
    var salonId;
    _appPreferences.getSalonId().then((value1) {
      salonId = value1;
      print('salonId====>${salonId}');
    });
    Utils.check().then((value) async {
      if (value) {
        isApiCalling.value = true;
        apiCallStatus.value = ApiCallStatus.loading;
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          var response1 = await BaseClient.get('${Constants.OnBoardingTasksListing}/$taskId',
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                isApiCalling.value = false;
                OnboardingChecklistData item = OnboardingChecklistData.fromJson(response.data['data']);

                print("link");
                print(item.link);
                print("item.name");
                print(item.name);
                print("item.linkType");
                print(item.linkType);
                print("item.linkCategory");
                print(item.linkCategory);
                print("item.linkId");
                print(item.linkId);
                print("item.categoryId");
                print(item.categoryId);

                if (item.linkType == AppConstant.NOLINK) {
                  Get.toNamed(AppRoutes.settingsOnboardingChecklistDetailsScreen, arguments: {"id": item.id});
                  // controller.currentPage = 1;
                  // controller.pagingController1.refresh();
                } else if (item.linkType == AppConstant.EXTERNALLINK) {
                  Utils.launchUrls(item.link);
                } else {
                  Utils.navigateToScreens(item.linkCategory,item.linkId );
                }
                return true;
              },
              headers: {
                'Authorization': 'Bearer $value',
                'Accept': 'application/json',
              },
              onError: (error) {
                ApiException apiException = error;
                print(apiException.message);

                BaseClient.handleApiError(error);

                apiCallStatus.value = ApiCallStatus.error;

                return false;
              },);
        });
      } else {
        Utils.showToast('Check your internet connection', true);
      }
    });
  }

  void updateHireCheckListStatus(int index, int status, int taskId) async {
    print("api itted");
    Utils.check().then((value) async {
      if (value) {
        await _appPreferences.isPreferenceReady;
        RxList<int> users = List<int>.empty().obs;

        var userId;
        _appPreferences.getUserId().then((value1) {
          userId = value1;
          users.value.add(int.parse(userId));
        });
        var salonId;
        _appPreferences.getSalonId().then((value1) {
          salonId = value1;
        });

        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.post(Constants.UserOnBoardingTasks,
              onSuccess: (response) async {
            print("Api is successed");
            pagingController1.itemList![index].userStatus!.value = status;
          }, onError: (error) {
            BaseClient.handleApiError(error);
            apiCallStatus.value = ApiCallStatus.error;
          }, headers: {
            'Authorization': 'Bearer $value',
            'Accept': 'application/json',
          }, data: {
            'status': status,
            'onboarding_task_id': taskId,
            'user_id': userId,
          });
        });
      } else {
        Utils.showToast('No internet connection', true);
      }
    });
  }

}
