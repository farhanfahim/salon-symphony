import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:salon_symphony/data/models/task_data_model.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/constants/constants.dart';
import '../../../core/utils/utils.dart';
import '../../../data/models/TaskResponseModel.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '../../goals_achieved_page/controller/goals_achieved_controller.dart';
import '../../request_all_page/controller/request_all_controller.dart';

class TaskDoneController extends GetxController {


  Rx<Task> taskDataModel = Task().obs;
  final PagingController<int, PagedTaskData> pagingController = PagingController(firstPageKey: 1);


  AppPreferences _appPreferences = AppPreferences();
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  Rx<GetTaskResponseModel> tasksResponseModel = GetTaskResponseModel().obs;
  // make an empty list of type TaskData
  RxList<TasksData>? weeklyTask = List<TasksData>.empty().obs;
  RxList<TasksData>? biWeeklyTask = List<TasksData>.empty().obs;
  RxList<TasksData>? monthlyTask = List<TasksData>.empty().obs;
  RxList<TasksData>? oneTimeTask = List<TasksData>.empty().obs;
  RxList<PagedTaskData>? taskDataList = List<PagedTaskData>.empty().obs;
  int currentPage = 1;
  int totalPages = 0;


  @override
  void onReady() {
    pagingController.addPageRequestListener((pageKey) {
      print(pageKey);
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      getTasks();
    } catch (error) {
      pagingController.error = error;
    }
  }
  Future<dynamic> getTasks() async {
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
              Constants.GetTasks,
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                taskDataModel.value = Task.fromJson(response.data['data']);
                // print('response.data======>  ${response.data}');
                taskDataList!.value = taskDataModel.value.data!;
                totalPages = taskDataModel.value.meta!.lastPage!;

                print('Last Page: $totalPages');
                print('Current Page: $currentPage');

                final isNotLastPage = currentPage + 1 <= totalPages;

                if (!isNotLastPage) {
                  print('Last Page Reached');
                  pagingController.appendLastPage(taskDataList!.value);
                } else {
                  currentPage = currentPage + 1;
                  print('New Current Page: $currentPage');
                  pagingController.appendPage(taskDataList!.value, currentPage);
                }
                // taskList!.value.forEach((element) {
                //   element.data!.forEach((element2) {
                //     element2.userStatus!.localStatus!.value = element2
                //         .userStatus!.status!;
                //   });
                // });
                print(response.data);
                print('taskList!.value.length ===========>');
                print(taskDataList!.value.length);
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
            'page': currentPage,
            'salon_id': salonId,
            'user_id': userId,
            'platform': 'mobile',
            'task_status': 30,
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