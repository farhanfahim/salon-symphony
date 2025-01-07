import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:salon_symphony/Shared_prefrences/app_prefrences.dart';
import 'package:salon_symphony/core/utils/app_constant.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import 'package:salon_symphony/data/services/api_call_status.dart';

import '../../../data/models/candidateReferralModel.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '/core/app_export.dart';
import 'package:salon_symphony/presentation/referral_pending_page/models/referral_pending_model.dart';

class ReferralPendingController extends GetxController {

  RxList<CandidateReferralData>? pendingData = List<CandidateReferralData>.empty().obs;
  final PagingController<int, CandidateReferralData> pagingController1 = PagingController(firstPageKey: 1);
  AppPreferences _appPreferences = AppPreferences();
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  Rx<CandidateReferralModel> candidateReferralModel = CandidateReferralModel().obs;
  int currentPage = 1;
  int totalPages = 0;

  @override
  void onInit() {
    super.onInit();
    pagingController1.addPageRequestListener((pageKey) {
      print(pageKey);
      _fetchPage(pageKey);
    });
  }
  Future<void> _fetchPage(int pageKey) async {
    try {
      getPendingReferrals();
    } catch (error) {
      pagingController1.error = error;
    }
  }
  Future <dynamic> getPendingReferrals() async{

    await _appPreferences.isPreferenceReady;
    var userID;
    _appPreferences.getUserId().then((value1) {
      userID = value1;
    });
    Utils.check().then((value) async {
      if (value) {

        apiCallStatus.value = ApiCallStatus.loading;
        _appPreferences.getAccessToken(prefName: AppPreferences.prefAccessToken).then((value) async {

          await BaseClient.get(
              Constants.userReferrals,
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                candidateReferralModel.value = CandidateReferralModel.fromJson(response.data);
                pendingData!.value = candidateReferralModel.value.data!.data!;
                print(response.data);
                totalPages = candidateReferralModel.value.data!.meta!.lastPage!;

                print('Last Page: $totalPages');
                print('Current Page: $currentPage');

                final isNotLastPage = currentPage + 1 <= totalPages;

                if (!isNotLastPage) {
                  print('Last Page Reached');
                  pagingController1.appendLastPage(pendingData!.value);
                } else {
                  currentPage = currentPage + 1;
                  print('New Current Page: $currentPage');
                  pagingController1.appendPage(pendingData!.value, currentPage);
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
                'is_paginated': AppConstant.ISPAGINATED,
                'is_approved': AppConstant.ISNOTAPPROVED,
                'user_id': userID,


              }

          );
        });

      } else {
        Utils.showToast('No internet connection',true);
      }
    });
  }




}
