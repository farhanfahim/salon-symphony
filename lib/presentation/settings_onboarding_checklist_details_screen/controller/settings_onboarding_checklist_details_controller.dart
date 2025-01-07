import '../../../Shared_prefrences/app_prefrences.dart';

import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '../../settings_onboarding_checklist_screen/controller/settings_onboarding_checklist_controller.dart';
import '../../settings_onboarding_checklist_screen/models/settings_onboarding_checklist_model.dart';
import '/core/app_export.dart';
import 'package:salon_symphony/presentation/settings_onboarding_checklist_details_screen/models/settings_onboarding_checklist_details_model.dart';

class SettingsOnboardingChecklistDetailsController extends GetxController {
  Rx<SettingsOnboardingChecklistDetailsModel>settingsOnboardingChecklistDetailsModelObj = SettingsOnboardingChecklistDetailsModel().obs;
  AppPreferences _appPreferences = AppPreferences();
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  Rx<OnboardingChecklistData2> SingleResponse = OnboardingChecklistData2().obs;
  SettingsOnboardingChecklistController onboardingChecklistController = Get.find();
  Map<String, dynamic> map = Get.arguments;
  @override
  void onReady() {
    super.onReady();

  }

  @override
  void onInit() {
  super.onInit();
  print("salman is here");
  print(map);
  getOnBoardingChecklistSingle();

  }

  @override
  void onClose() {
    super.onClose();
  }



  Future<dynamic> getOnBoardingChecklistSingle() async {
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
          var response1 = await BaseClient.get(
              Constants.OnBoardingTasksListing+"/${map["id"]}",
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                settingsOnboardingChecklistDetailsModelObj.value =SettingsOnboardingChecklistDetailsModel.fromJson(response.data);
                SingleResponse.value=settingsOnboardingChecklistDetailsModelObj.value.data!;
                print("im here");
                print(SingleResponse.value);
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
              }, queryParameters: null);
        });


      } else {
        Utils.showToast('Check your internet connection', true);
      }
    });
  }

  void updateHireCheckListStatus(int status,int taskId) async {

    Utils.check().then((value) async {
      if (value) {
        await _appPreferences.isPreferenceReady;
        RxList<int> users = List<int>.empty().obs;

        var userId;
        _appPreferences.getUserId().then((value1) {
          userId = value1;
          users.value.add(int.parse(userId));
        });
        var salonId;
        _appPreferences.getSalonId().then((value1) {
          salonId = value1;
        });

        _appPreferences.getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.post(Constants.UserOnBoardingTasks,
              onSuccess: (response) async {
                onboardingChecklistController.currentPage = 1;
                onboardingChecklistController.pagingController1.refresh();
             Get.back();
               // pagingController1.itemList![index].userStatus!.value=status;
              },
              onError: (error) {
                BaseClient.handleApiError(error);
                apiCallStatus.value = ApiCallStatus.error;
              }, headers: {
                'Authorization': 'Bearer $value',
                'Accept': 'application/json',
              }, data: {
                'status': status,
                'onboarding_task_id': taskId,
                'user_id': userId,

              });
        });
      } else {
        Utils.showToast('No internet connection', true);
      }
    });
  }
}
