
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:salon_symphony/data/models/getQuizListModel.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/dummy_content.dart';
import '../../../core/utils/utils.dart';
import '../../../data/models/categoryModel.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '/core/app_export.dart';
import 'package:flutter/material.dart';

class QuizzesAllController extends GetxController with GetSingleTickerProviderStateMixin{

  RxList<quizFilter> arrOfOptions = DummyContent.quizData.obs;
  final PagingController<int, QuizData> pagingController = PagingController(firstPageKey: 1);
  AppPreferences _appPreferences = AppPreferences();
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  Rx<GetQuizListResponseModel> quizResponseModel = GetQuizListResponseModel().obs;
  RxList<QuizData>? quizApiList = List<QuizData>.empty().obs;
  RxList<Tags>? tagsList = List<Tags>.empty().obs;
  RxBool isLoaded = false.obs;
  RxBool selected = false.obs;
  int currentPage = 1;
  int totalPages = 0;
  RxList<Tab> tabs = List<Tab>.empty().obs;
  TabController? tabController;
  RxInt selectedIndex = 0.obs;
  int? selectedCategoryId;
  RxInt? selectedFilter = 0.obs;
  Rx<CategoryResponseModel> categoryResponseModel = CategoryResponseModel().obs;

  @override
  void onInit() {
    super.onInit();
    tabs.add(Tab(text: "All"));
    pagingController.addPageRequestListener((pageKey) {
      print(pageKey);
      _fetchPage(pageKey);
    });
    getCategories();
  }

  Future<void> _fetchPage(int pageKey) async {
    print("salman api is hitted.");
    try {
      getQuizzes();
    } catch (error) {
      pagingController.error = error;
    }
  }
  @override
  void onClose() {
    tabController!.dispose();
    super.onClose();
  }


  updateQuizItem(int index) {
    for (var item in arrOfOptions) {
      item.selected = false.obs;
    }
    arrOfOptions[index].selected = true.obs;
    print(arrOfOptions[index].status);
    selectedFilter!.value = arrOfOptions[index].status!;
    currentPage = 1;
    if (arrOfOptions[index].status != 0) {
      print('selectedFilter!.value ====>${selectedFilter!.value}');
    }
    pagingController.refresh();
    arrOfOptions.refresh();
  }

  Future<dynamic> getCategories() async {
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
        apiCallStatus.value = ApiCallStatus.loading;
        isLoaded.value = false;
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.get(
              Constants.GetCategories,
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                isLoaded.value = true;
                categoryResponseModel.value =
                    CategoryResponseModel.fromJson(response.data);
                // tabs.add(Tab(text: "All"));
                print(categoryResponseModel.value);
                tabs.addAll(categoryResponseModel.value.data!
                    .map((e) => Tab(text: e.name!))
                    .toList());
                print('tabs.length ====> ${tabs.length}');
                tabController = TabController(length: tabs.length, vsync: this);
                // tabController!.addListener(() {
                //   selectedIndex = tabController!.index.obs;
                //   if (selectedIndex.value == 0) {
                //     selectedCategoryId = null;
                //     pagingController.refresh();
                //     quizApiList!.clear();
                //   } else {
                //     selectedCategoryId = categoryResponseModel
                //         .value.data![selectedIndex.value -1].id!;
                //     pagingController.refresh();
                //     quizApiList!.clear();
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
                isLoaded.value = false;
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

  Future<dynamic> getQuizzes() async {

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
        apiCallStatus.value = ApiCallStatus.loading;
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
              await BaseClient.get(Constants.GetQuizzesListing,
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                // isLoaded.value = true;
                print("salman has reached here");
                quizResponseModel.value = GetQuizListResponseModel.fromJson(response.data);
                print("salman has reached there");
                quizApiList!.value = quizResponseModel.value.data!.data!;
                print(quizResponseModel.value);
                quizApiList!.forEach((element) {
                  tagsList!.addAll(element.tags!);
                });
                totalPages = quizResponseModel.value.data!.meta!.lastPage!;

                print('Last Page: $totalPages');
                print('Current Page: $currentPage');

                final isNotLastPage = currentPage + 1 <= totalPages;

                if (!isNotLastPage) {
                  print('Last Page Reached');
                  pagingController.appendLastPage(quizApiList!.value);
                } else {
                  currentPage = currentPage + 1;
                  print('New Current Page: $currentPage');
                  pagingController.appendPage(quizApiList!.value, currentPage);
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
                'page':currentPage,
                'platform':'mobile',
                'salon_id': salonId,
                if (selectedFilter!.value != 0)
                  'viewed_user_status': selectedFilter!.value,
                'viewed_user_id': userId,
                'category_id': selectedCategoryId,
              });
        });
      } else {
        Utils.showToast('Check your internet connection', true);
      }
    });
  }









}
