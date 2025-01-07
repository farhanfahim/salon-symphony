
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:salon_symphony/Shared_prefrences/app_prefrences.dart';
import 'package:salon_symphony/data/models/categoryModel.dart';
import 'package:salon_symphony/data/models/eventsListModel.dart';
import 'package:salon_symphony/data/services/base_client.dart';

import '../../../core/utils/dummy_content.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '/core/app_export.dart';
import 'package:salon_symphony/presentation/home_events_all_page/models/home_events_all_model.dart';

class HomeEventsAllController extends GetxController
    with SingleGetTickerProviderMixin {

  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  TextEditingController searchController = new TextEditingController();
  RxBool selected = false.obs;
  RxList<quizModel> arrOfOptions = List<quizModel>.empty().obs;
  RxList<eventDataModel> eventList = List<eventDataModel>.empty().obs;
  TabController? tabController;
  RxInt selectedIndex = 0.obs;
  int? selectedCategoryId;
  int? selectedFilter;
  AppPreferences _appPreferences = AppPreferences();
  Rx<EventsListing> eventsreponseModel = EventsListing().obs;
  Rx<CategoryResponseModel> categoryResponseModel = CategoryResponseModel().obs;
  Rx<UserReservation> userReservationModel = UserReservation().obs;
  RxList<dataModel3> listIntrust = List<dataModel3>.empty().obs;
  RxList<EventsData>? eventsApiList = List<EventsData>.empty().obs;
  RxList<Tab> tabs = List<Tab>.empty().obs;
  final PagingController<int, EventsData> pagingController1 = PagingController(firstPageKey: 1);
 Rx<bool> isApiCalling = false.obs;
  int currentPage = 1;
  int totalPages = 0;


  updateQuizItem(int index) {
    for (var item in arrOfOptions) {
      item.selected = false.obs;
    }
    arrOfOptions[index].selected = true.obs;
    selectedFilter = index == 0 ? null : index == 1 ? 0 : 1;
    pagingController1.refresh();
    // getEvents();
    arrOfOptions.refresh();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onInit() {
    tabs.add(Tab(text: "All"));
    eventList.value = DummyContent.EventsList;
    listIntrust.value = DummyContent.eventIntrust;
    arrOfOptions.add(quizModel(id: 1, name: "All Events", selected: false.obs));
    arrOfOptions
        .add(quizModel(id: 2, name: "Free Events", selected: false.obs));
    arrOfOptions
        .add(quizModel(id: 3, name: "Paid Events", selected: false.obs));

    pagingController1.addPageRequestListener((pageKey) {
      print(pageKey);
      _fetchPage(pageKey);
    });
    getCategories();
  }
  Future<void> _fetchPage(int pageKey) async {
    try {
      getEvents();
    } catch (error) {
      pagingController1.error = error;
    }
  }

  Future<dynamic> getEvents() async {

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
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          var response1 = await BaseClient.get(Constants.EventsListing,
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                isApiCalling.value = false;
                eventsreponseModel.value =
                    EventsListing.fromJson(response.data);
                eventsApiList!.value = eventsreponseModel.value.data!.data!;
                print(eventsreponseModel.value);
                eventsApiList!.forEach((element) {
                  element.localStatus.value = '';
                  if (element.userReservation != null) {
                    element.localStatus.value = element.userReservation!.status!;
                    element.userReservation!.localStatusId!.value  = element.userReservation!.statusId! ;
                    print('localStatusId====>${element.userReservation!.localStatusId!.value}');
                  }
                });
                totalPages = eventsreponseModel.value.data!.meta!.lastPage!;

                print('Last Page: $totalPages');
                print('Current Page: $currentPage');

                final isNotLastPage = currentPage + 1 <= totalPages;

                if (!isNotLastPage) {
                  print('Last Page Reached');
                  pagingController1.appendLastPage(eventsApiList!.value);
                } else {
                  currentPage = currentPage + 1;
                  print('New Current Page: $currentPage');
                  pagingController1.appendPage(eventsApiList!.value, currentPage);
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
                'per_page': 10,
                'salon_id': salonId,
                'user_id': userId,
                'category_id': selectedCategoryId,
                'price': selectedFilter,
              });
        });
      } else {
        Utils.showToast('Check your internet connection', true);
      }
    });
  }

  Future<dynamic> eventsReservation(int? eventId, int? statusId, int index) async {

    await _appPreferences.isPreferenceReady;

    var userId;
    _appPreferences.getUserId().then((value1) {
      userId = value1;
    });
    var salonId;
    _appPreferences.getSalonId().then((value1) {
      salonId = value1;
      print('salonId====>${salonId}');
    });
    Utils.check().then((value) async {
      if (value) {
        // *) perform api call
        // isLoading.value = true;
        _appPreferences.getAccessToken(prefName: AppPreferences.prefAccessToken).then((value) async {
          await BaseClient.post(
              Constants.EventsReservation,
              onSuccess: (response) async {
                apiCallStatus.value = ApiCallStatus.success;
                userReservationModel.value = UserReservation.fromJson(response.data['data']);
                eventsApiList![index].localStatus.value = userReservationModel.value.status!;
                userReservationModel.value.localStatusId!.value = userReservationModel.value.statusId!;
                eventsApiList![index].userReservation = userReservationModel.value;
                // print('localStatus====>${userReservationModel.value.localStatus!.value}');
                print('localStatusId====>${userReservationModel.value.localStatusId!.value}');
                print('status====>${ eventsApiList![index].userReservation!.status}');
                eventsApiList!.refresh();
                print(response.data);
                print(userReservationModel.value.toJson());
                return true;
              },
              onError: (error) {
                print(error);
                BaseClient.handleApiError(error);
                apiCallStatus.value = ApiCallStatus.error;
              },
              headers: {
                'Authorization': 'Bearer ${value}',
                'Accept': 'application/json',
              },
              data: {
                'user_id': userId,
                'event_id': eventId,
                'salon_id': salonId,
                'status_id': statusId,
              }
          );
        });


      } else {
        Utils.showToast('No internet connection', true);
      }
    });
  }


  updateStatus( EventsData data) {
    if(data.userReservation != null){
      int status = data.userReservation!.localStatusId!.value ;
      print(status);
      for (var item in listIntrust) {
        item.selected!.value = false;
      }
      if(status == 10){
        print('here1 ===>');
        print(listIntrust.length);
        data.userReservation!.localStatusId!.value = 10;
        listIntrust[0].selected!.value = true ;
      }
      else if ( status  == 20 ){
        print('here2 ===>');
        print(listIntrust.length);
        data.userReservation!.localStatusId!.value = 20;
        listIntrust[1].selected!.value = true ;
      }
      else if(status == 30){
        print('here3 ===>');
        print(listIntrust.length);
        data.userReservation!.localStatusId!.value = 30;
        listIntrust[2].selected!.value = true ;
      }
    }else {
      for (var item in listIntrust) {
        item.selected!.value = false;
      }
    }
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
                //    pagingController1.refresh();
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
                'type': 30,
              });
        });
      } else {
        Utils.showToast('Check your internet connection', true);
      }
    });
  }

  void setColor(int index) {
    selectedIndex.value = index;
    selectedIndex.refresh();
  }
}
