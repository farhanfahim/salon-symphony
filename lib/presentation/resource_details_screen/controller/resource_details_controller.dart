import 'package:audioplayers/audioplayers.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:salon_symphony/presentation/resource_details_screen/controller/audio_player_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/utils.dart';
import '../../../data/models/resourseDetailModel.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '/core/app_export.dart';
import 'package:salon_symphony/presentation/resource_details_screen/models/resource_details_model.dart';

class ResourceDetailsController extends GetxController {
  var map = Get.arguments;
  Rx<ResourceDetailsModel> resourceDetailsModelObj = ResourceDetailsModel().obs;
  AppPreferences _appPreferences = AppPreferences();
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.loading.obs;
  RxList<ResourceDetailData>? resourcesApiList = List<ResourceDetailData>.empty().obs;
  RxList<Tags>? tagsList = List<Tags>.empty().obs;
  Rx<GetResourceDetailResponseModel> resourcesReponseModel = GetResourceDetailResponseModel().obs;
  AudioPlayer audioPlayer = AudioPlayer();
  FlickManager? flickManager;
  // AudioController audioController = Get.put(AudioController());
  VideoPlayerController? videoPlayerController;
  Rx<bool> isAPiCalling = false.obs;
  var userId;
  @override
  void onInit() {
    super.onInit();
    // getUserId();
    getResourceDetails();
  }

  Future<void> getUserId() async {
    await _appPreferences.isPreferenceReady;

    _appPreferences.getUserId().then((value1) {
      userId = value1;
    });
  }

  @override
  void onClose() {
    super.onClose();
    audioPlayer.stop();
    videoPlayerController!.dispose();
    // audioController.audioPlayer.stop();
    // audioController.audioPlayer.dispose();
  }

  Future<dynamic> getResourceDetails() async {
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
        isAPiCalling.value = true;
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.get(
              Constants.GetResources + '/${map['id']}',
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                isAPiCalling.value = false;
                resourceViewStatusApi();
                resourcesReponseModel.value = GetResourceDetailResponseModel.fromJson(response.data);
                // resourcesApiList!.value = resourcesReponseModel.value.data;
                videoPlayerController = VideoPlayerController.network(resourcesReponseModel.value.data!.link!);
                print('resourcesReponseModel.value.data!.link_type=-======> ${resourcesReponseModel.value.data!.link_type}');
                // if (resourcesReponseModel.value.data!.type == 20 || resourcesReponseModel.value.data!.type == 0) {
                // audioController.initAudio(resourcesReponseModel.value.data!.link!);
                // }
                return true;
              },
              headers: {
                'Authorization': 'Bearer $value',
                'Accept': 'application/json',
              },
              onError: (error) {
                ApiException apiException = error;
                isAPiCalling.value = false;
                print(apiException.message);

                BaseClient.handleApiError(error);

                apiCallStatus.value = ApiCallStatus.error;

                return false;
              },
              queryParameters: null
          );
        });
      } else {
        Utils.showToast('Check your internet connection', true);
      }
    });
  }


  Future<dynamic> resourceViewStatusApi () async {
    await _appPreferences.isPreferenceReady;

    var userId;
    _appPreferences.getUserId().then((value1) {
      userId = value1;
    });
    var salonId;
    _appPreferences.getSalonId().then((value1) {
      salonId = value1;
    });

    Utils.check().then((value) async {
      if (value) {
        // *) perform api call
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.post(
              Constants.ResourceViewStatus,
              onSuccess: (response) async {
                // apiCallStatus.value = ApiCallStatus.success;
                print(response.data);
              }, onError: (error) {
                print(error);
                BaseClient.handleApiError(error);
                // apiCallStatus.value = ApiCallStatus.error;
              }, headers: {
                'Authorization': 'Bearer ${value}',
                'Accept': 'application/json',
              },
              data: {
                'salon_resource_id': map['id'],
                'user_id': userId,
                'salon_id': salonId,
              });
        });
      } else {
        Utils.showToast('No internet connection', true);
      }
    });
  }

  Future<void> launchUrls() async {
    Uri url = Uri.parse(resourcesReponseModel.value.data!.link!);
    if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}




}
