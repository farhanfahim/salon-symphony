import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/app_constant.dart';
import '../../../core/utils/dummy_content.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '../../../widgets/animatedButton.dart';
import '../models/categoryModel.dart';
import '../models/flashcards_response_model.dart';
import '/core/app_export.dart';
import 'package:salon_symphony/presentation/flashcards_screen/models/flashcards_model.dart';
import 'package:flutter/material.dart';

class FlashcardsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TextEditingController searchFieldController = TextEditingController();
  RxList<quizModel> arrOfOptions = DummyContent.flashData.obs;
  TextEditingController searchController = new TextEditingController();

  RxBool isLoaded = false.obs;
  RxBool selected = false.obs;
  Rx<FlashcardsModel> flashcardsModelObj = FlashcardsModel().obs;

  RxList<Tab> tabs = List<Tab>.empty().obs;
  Rx<CategoryResponseModel>? categoryResponseModel = CategoryResponseModel().obs;
  Rx<FlashCardResponseModel>? flashCardResponseModel = FlashCardResponseModel().obs;
  AppPreferences _appPreferences = AppPreferences();
  final animatedButtonController = AnimatedButtonController();
  RxBool isInternetAvailable = true.obs;
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  Rx<int> selectedIndex = 0.obs;
  Rx<int>? selectedCategoryId;
  Rx<int>? selectedFilterId = 0.obs;
  int? selectedFilter;
  TabController? tabController;

  Rx<int> totalPages = 0.obs;
  Rx<int> currentPage = 1.obs;
  RxBool isApiCalling = false.obs;
  PagingController<int, FlashCardData> pagingController = PagingController(firstPageKey: 1);

  @override
  void onInit() {
    super.onInit();
    getCategories();
    tabs.add(Tab(text: "All"));
    updateQuizItem(0);
    pagingController.addPageRequestListener((pageKey) {
      print(pageKey);
      fetchPage(pageKey);
    });
  }

  Future<dynamic> getCategories() async {
    await _appPreferences.isPreferenceReady;
    Utils.check().then((value) async {
      if (value) {
        apiCallStatus.value = ApiCallStatus.loading;
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.get(Constants.categories,
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                categoryResponseModel!.value = CategoryResponseModel.fromJson(response.data);
                tabs.addAll(categoryResponseModel!.value.data!
                    .map((e) => Tab(text: e.name!))
                    .toList());

                tabController = TabController(length: tabs.length, vsync: this);
                // tabController!.addListener(() {
                //   selectedIndex.value = tabController!.index;
                //   if (selectedIndex.value == 0) {
                //     selectedCategoryId = null;
                //     pagingController.refresh();
                //   } else {
                //     selectedIndex.value--;
                //     selectedCategoryId = categoryResponseModel!
                //         .value.data![selectedIndex.value].id!.obs;
                //     pagingController.refresh();
                //   }
                // });

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
                'is_paginated': 0,
                'type': 10
              });
        });
      } else {
        Utils.showToast('Check your internet connection', true);
      }
    });
  }

  Future<void> fetchPage(int pageKey) async {
    try {
      getFlashCards();
    } catch (error) {
      pagingController.error = error;
    }
  }

  void getFlashCards() async {
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
          print('Tokeeeen ====> $value');
          await BaseClient.get(Constants.flashcards,
              onSuccess: (response) {
                isApiCalling.value = false;
                flashCardResponseModel!.value = FlashCardResponseModel.fromJson(response.data['data']);

                totalPages.value =
                    flashCardResponseModel!.value.meta!.lastPage!;
                print('Last Page: $totalPages');

                final isNotLastPage = currentPage.value + 1 <= totalPages.value;
                print('_currentPage $currentPage');
                print('isNotLastPage $isNotLastPage');
                for (var item in flashCardResponseModel!.value.data!) {
                  item.localUserFlashcardStatus!.value =
                      item.userFlashcardStatus!;
                  for (var item2 in item.flashcardElements!) {
                    if (item2.userScore != null) {
                      item2.localUserScore.value = item2.userScore!;
                    }
                  }
                }

                if (!isNotLastPage) {
                  pagingController
                      .appendLastPage(flashCardResponseModel!.value.data!);
                } else {
                  final nextPageKey = currentPage.value + 1;
                  currentPage.value = currentPage.value + 1;

                  print('New Page: $totalPages');
                  pagingController.appendPage(
                      flashCardResponseModel!.value.data!, nextPageKey);
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
                'viewed_user_id': userId,
                'page': currentPage.value,
                'platform':'mobile',
                if (selectedCategoryId != null)
                  'category_id': selectedCategoryId!.value,
                if (selectedFilterId!.value != 0)
                  'viewed_user_status': selectedFilterId!.value,
                'status': AppConstant.ACTIVE,
              });
        });
      } else {
        Utils.showToast('Check your internet connection', true);
      }
    });
  }

  updateQuizItem(int index) {
    for (var item in arrOfOptions) {
      item.selected = false.obs;
    }
    arrOfOptions[index].selected = true.obs;
    arrOfOptions.refresh();
    selectedFilterId!.value = arrOfOptions[index].id!;
    pagingController.refresh();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
