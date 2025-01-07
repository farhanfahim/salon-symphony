import 'dart:async';
import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import 'package:salon_symphony/data/models/eventsListModel.dart';
import 'package:salon_symphony/data/services/api_call_status.dart';
import 'package:salon_symphony/data/services/api_exceptions.dart';
import 'package:salon_symphony/data/services/base_client.dart';
import 'package:salon_symphony/presentation/home_events_all_page/controller/home_events_all_controller.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/dummy_content.dart';
import '../../../core/utils/helper_functions.dart';
import '../../../core/utils/responsive.dart';
import '../../../data/models/addScheduleModel.dart';
import '../../../widgets/custom_text.dart';
import '/core/app_export.dart';
import 'package:salon_symphony/presentation/home_screen/models/home_model.dart';
import 'package:salon_symphony/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import '../../../data/models/addScheduleModel.dart';

class HomeController extends GetxController {
  TextEditingController searchFieldController = TextEditingController();
  // HomeEventsAllController controller2 = Get.put(HomeEventsAllController());

  Completer<GoogleMapController> _controller = Completer();




  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;

  RxBool isInternetAvailable = true.obs;
  Rx<HomeModel> homeModelObj = HomeModel().obs;
  RxList<quizModel> arrOfOptions = List<quizModel>.empty().obs;
  Rx<BottomBarEnum> type = BottomBarEnum.Home.obs;
  RxList<eventDataModel> eventList = List<eventDataModel>.empty().obs;
  Rx<EventsListing> eventsreponseModel = EventsListing().obs;
  RxList<EventsData>? eventsApiList = List<EventsData>.empty().obs;

  RxList<String> arrOfOptions2 = List<String>.empty().obs;

  Rx<UserReservationUserModel> user = UserReservationUserModel().obs;
  Rx<UserReservation> userReservationModel = UserReservation().obs;
  RxList<dataModel3> listIntrust = List<dataModel3>.empty().obs;
  AppPreferences _appPreferences = AppPreferences();
  Rx<bool> isLoading = false.obs;
  @override
  void onReady() {
    _appPreferences.getUserDetail().then((value) async {
      user.value = UserReservationUserModel.fromJson(jsonDecode(value!));
      print(value);
    });
    eventList.value = DummyContent.EventsList;
    super.onReady();
    arrOfOptions.add(quizModel(id: 1, name: "All", selected: false.obs));
    arrOfOptions
        .add(quizModel(id: 1, name: "Live Events", selected: false.obs));
    arrOfOptions
        .add(quizModel(id: 1, name: "Free Events", selected: false.obs));
    arrOfOptions
        .add(quizModel(id: 1, name: "Virtual Events", selected: false.obs));
    arrOfOptions2.add("Share");
    arrOfOptions2.add("Copy Link");
    arrOfOptions2.add("Report");
    arrOfOptions2.refresh();
    listIntrust.value = DummyContent.eventIntrust;
    getEvents();

  }
  String getModifiedName(String fullName) {
    List<String> nameParts = fullName.split(' ');
    String modifiedName = nameParts.isNotEmpty ? nameParts[0] : fullName;
    return modifiedName;
  }
  void reportBottomSheet(context) {
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
      screenTitle: 'Report',
      widget: ListView.builder(
        itemCount: DummyContent.reportData.length,
        itemBuilder: (BuildContext context, int index) {
          var data = DummyContent.reportData[index];
          return GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: responsive.setHeight(3)),
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
        isInternetAvailable.value = true;
        print('object');
        apiCallStatus.value = ApiCallStatus.loading;
        isLoading.value = true;
        _appPreferences.getAccessToken(prefName: AppPreferences.prefAccessToken).then((value) async {
          var response1 = await BaseClient.get(
              Constants.EventsListing,
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                isLoading.value = false;
                eventsreponseModel.value = EventsListing.fromJson(response.data);
                eventsApiList!.value = eventsreponseModel.value.data!.data!;
                if(eventsApiList!.value.isEmpty){
                  apiCallStatus.value = ApiCallStatus.empty;
                }
                if (eventsApiList!.isNotEmpty) {
                  eventsApiList!.forEach((element) {
                    if (element.userReservation != null) {
                      element.localStatus.value = element.userReservation!.status!;
                      element.userReservation!.localStatusId!.value  = element.userReservation!.statusId! ;
                    }
                  });
                }


                print(eventsreponseModel.value);
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
              }, queryParameters: {
                'is_paginated': 1,
                'salon_id': salonId,
                'user_id': userId,
              });
        });


      } else {
        Utils.showToast('Check your internet connection', true);
        isInternetAvailable.value = false;

      }
    });
  }


  Future<dynamic> eventsReservation(int? eventId, int? statusId, EventsData item) async {

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
        isInternetAvailable.value = true;
        _appPreferences.getAccessToken(prefName: AppPreferences.prefAccessToken).then((value) async {
          await BaseClient.post(
              Constants.EventsReservation,
              onSuccess: (response) async {
                apiCallStatus.value = ApiCallStatus.success;
                userReservationModel.value = UserReservation.fromJson(response.data['data']);
                userReservationModel.value.localStatus!.value = userReservationModel.value.status!;
                // if(item !=null){
                //   item.localStatus.value = userReservationModel.value.status!;
                //   print('item.localStatus.value====>${item.localStatus.value}');
                //
                // }
                userReservationModel.value.localStatusId!.value = userReservationModel.value.statusId!;

                 item.userReservation = userReservationModel.value;
                 item.localStatus.value = userReservationModel.value.status!;
                eventsApiList!.refresh();
                print(response.data);
                // print(userReservationModel.value.toJson());

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
}
