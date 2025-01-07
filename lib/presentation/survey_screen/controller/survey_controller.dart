import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/dummy_content.dart';
import '../../../core/utils/utils.dart';
import '../../../data/models/getSurveyListing.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '/core/app_export.dart';
import 'package:salon_symphony/presentation/survey_screen/models/survey_model.dart';
import 'package:flutter/material.dart';

class SurveyController extends GetxController {
  TextEditingController searchFieldController = TextEditingController();
  Rx<SurveyModel> surveyModelObj = SurveyModel().obs;
  RxList<quizModel> arrOfOptions = DummyContent.filterDataList.obs;
  TextEditingController searchController = new TextEditingController();
  RxList<GetSurveyListingData>? surveyData = List<GetSurveyListingData>.empty().obs;
  final PagingController<int, GetSurveyListingData> pagingController = PagingController(firstPageKey: 1);
  AppPreferences _appPreferences = AppPreferences();
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  Rx<GetSurveyListingModel> surveyModel = GetSurveyListingModel().obs;
  int currentPage = 1;
  int totalPages = 0;

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      print(pageKey);
      _fetchPage(pageKey);
    });
  }
  Future<void> _fetchPage(int pageKey) async {
    try {
      getSurveys();
    } catch (error) {
      pagingController.error = error;
    }
  }

  Future <dynamic> getSurveys() async{
    await _appPreferences.isPreferenceReady;
    var userID;
    _appPreferences.getUserId().then((value1) {
      userID = value1;
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
              Constants.Surveys,
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                surveyModel.value = GetSurveyListingModel.fromJson(response.data);
                surveyData!.value = surveyModel.value.data!.data!;
                print(response.data);
                totalPages = surveyModel.value.data!.meta!.lastPage!;
                print('Last Page: $totalPages');
                print('Current Page: $currentPage');
                final isNotLastPage = currentPage + 1 <= totalPages;
                if (!isNotLastPage) {
                  print('Last Page Reached');
                  pagingController.appendLastPage(surveyData!.value);
                } else {
                  currentPage = currentPage + 1;
                  print('New Current Page: $currentPage');
                  pagingController.appendPage(surveyData!.value, currentPage);
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
                'Authorization': 'Bearer $value',
                'Accept': 'application/json',
              },
              queryParameters : {
                'is_paginated': 1,
                'salon_id': salonID,
                'viewed_user_id': userID,
                'page': currentPage,
                'platform':'mobile'
              }

          );
        });

      } else {
        Utils.showToast('No internet connection',true);
      }
    });
  }

}