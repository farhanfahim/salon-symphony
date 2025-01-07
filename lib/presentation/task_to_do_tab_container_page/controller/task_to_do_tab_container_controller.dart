import 'package:salon_symphony/Shared_prefrences/app_prefrences.dart';

import '../../../core/utils/dummy_content.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '../models/task_count.dart';
import '/core/app_export.dart';
import 'package:salon_symphony/presentation/task_to_do_tab_container_page/models/task_to_do_tab_container_model.dart';
import 'package:flutter/material.dart';

class TaskToDoTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TaskToDoTabContainerController(this.taskToDoTabContainerModelObj);
  RxList<quizModel> arrOfOptions = List<quizModel>.empty().obs;
  TextEditingController searchFieldController = TextEditingController();
  Rx<TaskCount> tasksCountModel = TaskCount().obs;
  AppPreferences _appPreferences = AppPreferences();
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  Rx<TaskToDoTabContainerModel> taskToDoTabContainerModelObj;
  RxBool isInternetAvailable = true.obs;
  late TabController group156Controller =
      Get.put(TabController(vsync: this, length: 3));

  @override
  void onReady() {
    super.onReady();
    getTasksCount();
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


  Future<dynamic> getTasksCount() async {
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
        isInternetAvailable.value = true;
        _appPreferences.getAccessToken(prefName: AppPreferences.prefAccessToken).then((value) async {
          await BaseClient.get(
              Constants.TasksCount,
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                tasksCountModel.value = TaskCount.fromJson(response.data);
                print('getTasksCount');
                print(tasksCountModel.value.data!.done);
                print(response.data);

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
              }, queryParameters: null
          );
        });


      } else {
        Utils.showToast('Check your internet connection', true);
        isInternetAvailable.value = false;
      }
    });
  }

}
