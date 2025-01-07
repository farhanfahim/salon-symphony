import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '/core/app_export.dart';
import 'package:salon_symphony/presentation/documents_screen/models/documents_model.dart';

class DocumentsController extends GetxController {
  AppPreferences _appPreferences = AppPreferences();
  Rx<DocumentResponseModel>? documentResponseModel = DocumentResponseModel().obs;
  RxBool isInternetAvailable = true.obs;
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  Rx<int> totalPages = 0.obs;
  Rx<int> currentPage = 1.obs;
  RxBool isApiCalling = false.obs;
  PagingController<int, DocumentData> pagingController = PagingController(firstPageKey: 1);

  @override
  void onInit() {
    super.onInit();

    pagingController.addPageRequestListener((pageKey) {
      print(pageKey);
      fetchPage(pageKey);
    });
  }


  Future<void> fetchPage(int pageKey) async {
    try {
      getDocuments();
    } catch (error) {
      pagingController.error = error;
    }
  }


  void getDocuments() async {
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
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.get(Constants.salonDocs,
              onSuccess: (response) {
                isApiCalling.value = false;
                documentResponseModel!.value =
                    DocumentResponseModel.fromJson(response.data['data']);

                totalPages.value =
                documentResponseModel!.value.meta!.lastPage!;
                print('Last Page: $totalPages');

                final isNotLastPage = currentPage.value + 1 <= totalPages.value;
                print('_currentPage $currentPage');
                print('isNotLastPage $isNotLastPage');

                if (!isNotLastPage) {
                  pagingController
                      .appendLastPage(documentResponseModel!.value.data!);
                } else {
                  final nextPageKey = currentPage.value + 1;
                  currentPage.value = currentPage.value + 1;

                  print('New Page: $totalPages');
                  pagingController.appendPage(
                      documentResponseModel!.value.data!, nextPageKey);
                }
                for(var item in  pagingController.itemList!){
                  item.localStatus!.value = item.viewStatus!;
                }

                return true;
              },
              headers: {
                'Authorization': 'Bearer $value',
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
                'salon_id': salonId,
                'user_id': userId,
              });
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
