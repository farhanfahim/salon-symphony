import 'dart:async';

import 'package:dio/dio.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:salon_symphony/data/models/categoryModel.dart';
import 'package:salon_symphony/data/models/resourcesResponseModel.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/dummy_content.dart';
import '../../../core/utils/helper_functions.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '../../../widgets/custom_text.dart';
import '/core/app_export.dart';
import 'package:flutter/material.dart';

class ResourceLibraryController extends GetxController with SingleGetTickerProviderMixin{
  // ResourceLibraryController(this.resourceLibraryModelObj);
  RxList<quizModel> arrOfOptions = List<quizModel>.empty().obs;
  TextEditingController searchFieldController = TextEditingController();
  RxList<courseCategory> coursesList = List<courseCategory>.empty().obs;
  RxList<String> arrOfOptions2 = List<String>.empty().obs;
  RxList<ResourceData>? resourcesApiList = List<ResourceData>.empty().obs;
  RxBool changeTab = true.obs;
  RxList<Tab> tabs = List<Tab>.empty().obs;
  TabController? tabController;
  RxInt selectedIndex = 0.obs;
  int? selectedCategoryId;
  int? selectedFilter;
  RxBool isLoaded = false.obs;
  AppPreferences _appPreferences = AppPreferences();
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  Rx<GetResourceResponseModel> resourcesReponseModel = GetResourceResponseModel().obs;
  final PagingController<int, ResourceData> pagingController1 = PagingController(firstPageKey: 1);
  Rx<CategoryResponseModel> categoryResponseModel = CategoryResponseModel().obs;
  RxList<Tags>? tagsList = List<Tags>.empty().obs;
  int currentPage = 1;
  int totalPages = 0;
  Rx<bool> isApiCalling = false.obs;
  RxBool isInternetAvailable = true.obs;

  @override
  void onInit() {
    super.onInit();
    tabs.add(Tab(text: "All"));
    pagingController1.addPageRequestListener((pageKey) {
      print(pageKey);
      _fetchPage(pageKey);
    });
    getCategories();

  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      getResourses();
    } catch (error) {
      pagingController1.error = error;
    }
  }

  void reportBottomSheet(context){
    Responsive responsive = Responsive();
    responsive.setContext(context);
    HelperFunction.showBottomSheet(
      context,
      bottomSheetHeight: DummyContent.reportData.length <= 2
          ? responsive.setHeight(20)
          : DummyContent.reportData.length == 3
          ? responsive.setHeight(25)
          : responsive.setHeight(100),
      spaceBetween: responsive.setHeight(4),
      redclrEndTask: true,
      screenTitle:
      'Report',
      widget: ListView.builder(
        itemCount: DummyContent.reportData.length,
        itemBuilder: (BuildContext context, int index) {
          var data = DummyContent.reportData[index];
          return GestureDetector(
            onTap: () {

              Get.back();
            },
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: responsive.setHeight(4)),
              child: GestureDetector(
                  onTap: () {

                    Get.back();
                  },
                  child: MyText(title: '${data.name}')),
            ),
          );
        },
      ),
    );
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
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.get(Constants.GetCategories,
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                categoryResponseModel.value =
                    CategoryResponseModel.fromJson(response.data);
                print(categoryResponseModel.value);
                tabs.addAll(categoryResponseModel.value.data!
                    .map((e) => Tab(text: e.name!))
                    .toList());
                print('tabs.length ====> ${tabs.length}');

                tabController = TabController(length: tabs.length, vsync: this);
                // tabController!.addListener(() {
                //   selectedIndex = tabController!.index.obs;
                //   if (selectedIndex.value == 0) {
                //     // eventsApiList!.clear();
                //     selectedCategoryId = null;
                //     currentPage=1;
                //     pagingController1.refresh();
                //   } else {
                //     // eventsApiList!.clear();
                //     selectedCategoryId = categoryResponseModel
                //         .value.data![selectedIndex.value -1].id!;
                //     currentPage=1;
                //     pagingController1.refresh();
                //
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
                'type': 10,
              });
        });
      } else {
        Utils.showToast('Check your internet connection', true);
      }
    });
  }

  Future<dynamic> getResourses() async {

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
        isInternetAvailable.value = true;
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
              await BaseClient.get(Constants.GetResources,
              onSuccess: (response) {
                isApiCalling.value = false;
                resourcesReponseModel.value =
                    GetResourceResponseModel.fromJson(response.data);
                resourcesApiList!.value = resourcesReponseModel.value.data!.data!;
                print(resourcesReponseModel.value);
                resourcesApiList!.forEach((element) {
                  tagsList!.addAll(element.tags!);
                });
                totalPages = resourcesReponseModel.value.data!.meta!.lastPage!;

                print('Last Page: $totalPages');
                print('Current Page: $currentPage');

                final isNotLastPage = currentPage + 1 <= totalPages;

                if (!isNotLastPage) {
                  print('Last Page Reached');
                  pagingController1.appendLastPage(resourcesApiList!.value);
                } else {
                  currentPage = currentPage + 1;
                  print('New Current Page: $currentPage');
                  pagingController1.appendPage(resourcesApiList!.value, currentPage);
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
                return false;
              },
              queryParameters: {
                'is_paginated': 1,
                'page':currentPage,
                'salon_id': salonId,
                'viewed_user_id': userId,
                'category_id': selectedCategoryId,
                'type': selectedFilter,
              });
        });
      } else {
        Utils.showToast('Check your internet connection', true);
        isInternetAvailable.value = false;
      }
    });
  }



  @override
  void onClose() {
    super.onClose();
    searchFieldController.dispose();
  }

  updateQuizItem(int index) {
    for (var item in arrOfOptions) {
      item.selected = false.obs;
    }
    arrOfOptions[index].selected = true.obs;
    arrOfOptions.refresh();
  }
}
