import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import 'package:salon_symphony/data/services/api_exceptions.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/dummy_content.dart';
import '../../../data/models/eventsListModel.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/base_client.dart';
import '/core/app_export.dart';
import 'package:salon_symphony/presentation/home_events_details_screen/models/home_events_details_model.dart';
import 'package:flutter/material.dart';

class HomeEventsDetailsController extends GetxController {
  TextEditingController groupFiftyController = TextEditingController();
var map = Get.arguments;
  Rx<HomeEventsDetailsModel> homeEventsDetailsModelObj =
      HomeEventsDetailsModel().obs;

  RxList<dataModel3> listIntrust = List<dataModel3>.empty().obs;
  Rx<String> statusValue = ''.obs;
  AppPreferences _appPreferences = AppPreferences();
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  Rx<EventsData> eventsreponseModel = EventsData().obs;
  RxList<EventsData>? eventsApiList = List<EventsData>.empty().obs;
  Set<Marker>? markers ;
  LatLng? center ;
  var userID;
  getCurrentUserid() async {
    await _appPreferences.isPreferenceReady;
    _appPreferences.getUserId().then((value1) {
      userID = value1;
      print("user id is $userID");
    });
  }
  Future<dynamic> getEvents() async {
    print('map====>${map}');
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
        _appPreferences.getAccessToken(prefName: AppPreferences.prefAccessToken).then((value) async {
          await BaseClient.get(
              Constants.EventsListing +'/${map['id']}',
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                eventsreponseModel.value = EventsData.fromJson(response.data['data']);
                  if (eventsreponseModel.value.userReservation != null) {
                    print('eventsreponseModel.value.userReservation!.status!====>${eventsreponseModel.value.userReservation!.status!}');
                    eventsreponseModel.value.localStatus.value = eventsreponseModel.value.userReservation!.status!;
                    eventsreponseModel.value.userReservation!.localStatusId!.value  = eventsreponseModel.value.userReservation!.statusId! ;
                  }
                  if(eventsreponseModel.value.type == 10 && eventsreponseModel.value.lat != '' && eventsreponseModel.value.long != ''){
                    markers = {
                      Marker(
                        markerId: MarkerId('1'),
                        position: LatLng(double.parse(eventsreponseModel.value.lat), double.parse(eventsreponseModel.value.long)),
                        infoWindow: InfoWindow(
                          title: eventsreponseModel.value.address,
                          onTap: () {
                            print("Info window tapped");
                          },
                        ),
                        icon: BitmapDescriptor.defaultMarker,
                      ),
                    };
                    center = LatLng(double.parse(eventsreponseModel.value.lat), double.parse(eventsreponseModel.value.long));

                  }
                  // print("type =======> ${eventsreponseModel.value.lat.runtimeType}");
               // eventsApiList!.value = eventsreponseModel.value.data!.data!;
                // print(eventsreponseModel.value);
                print(eventsreponseModel.value.name);
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
            'user_id': userId,
          });
        });


      } else {
        Utils.showToast('Check your internet connection', true);
      }
    });
  }


  @override
  void onReady() {
    listIntrust.value = DummyContent.eventIntrust;
    getEvents();
    getCurrentUserid();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    groupFiftyController.dispose();
  }
}
