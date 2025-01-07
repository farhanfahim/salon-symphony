import 'package:confetti/confetti.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/app_constant.dart';
import '../../../core/utils/utils.dart';
import '../../../data/models/TaskResponseModel.dart';
import '../../../data/models/task_data_model.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '../../taks_overdue/controller/task_overDue_controller.dart';
import '../../task_done/controller/task_done_controller.dart';
import '../../task_todo/controller/education_tracking_all_controller.dart';
import '/core/app_export.dart';
import 'package:salon_symphony/presentation/task_details_screen/models/task_details_model.dart';

class TaskDetailsController extends GetxController {
  Rx<TaskDetailsModel> taskDetailsModelObj = TaskDetailsModel().obs;
  SelectionPopupModel? selectedDropDownValue;
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  AppPreferences _appPreferences = AppPreferences();
  Rx<PagedTaskData> tasksResponseModel = PagedTaskData().obs;
  RxList<PagedTaskData>? taskDataList = List<PagedTaskData>.empty().obs;
  RxBool showCon = false.obs;
  RxBool showcancel = true.obs;
  EducationTrackingAllController todoController = Get.find();
  TaskOverDueController overdueController = Get.find();
  TaskDoneController doneController = Get.find();
  ConfettiController confettiController = ConfettiController();
   var  map = Get.arguments;

  @override
  void onReady() {
    super.onReady();
    getTasks();
  }

  RxList<updateStatus> task = [
    updateStatus(Id: 1, selected: true),
    updateStatus(Id: 2, selected: false),
    updateStatus(Id: 3, selected: false),
  ].obs;

  @override
  void onClose() {
    super.onClose();
  }

  void updateTaskStatus(id) {

    if(tasksResponseModel.value.userStatus!.localStatus!.value!=AppConstant.TASK_DONE){
      if(id==3){
        showCon.value=true;
        confettiController.play();
      }
      Future.delayed(const Duration(seconds: 3), () {

        showCon.value = false;
        confettiController.stop();


      });
    }

    task.forEach((element) {
      if (element.Id == id) {
        element.selected = true;
      } else {
        element.selected = false;
      }
    });
    task.refresh();
  }

  onSelected(dynamic value) {
    selectedDropDownValue = value as SelectionPopupModel;
    taskDetailsModelObj.value.dropdownItemList.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    taskDetailsModelObj.value.dropdownItemList.refresh();
  }

  Future<dynamic> updateTaskApi(
      {required int taskId, required int status}) async {
    await _appPreferences.isPreferenceReady;
    var userId;
    _appPreferences.getUserId().then((value1) {
      userId = value1;
      print('userId====>${userId}');
    });
    Utils.check().then((value) async {
      print('INTERNET AVAILABLE $value');
      if (value) {
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((token) async {
          await BaseClient.put(Constants.UpdateTaskStatus + '/$taskId',
              headers: {
                'Authorization': 'Bearer $token',
                'Accept': 'application/json',
              }, onSuccess: (response) async {
                todoController.currentPage = 1;
                overdueController.currentPage = 1;
                doneController.currentPage = 1;
                todoController.pagingController.refresh();
                overdueController.pagingController.refresh();
                doneController.pagingController.refresh();
                if(tasksResponseModel.value.type == 10 && status == AppConstant.TASK_DONE ){
                  showcancel.value = false;
                }else{
                  showcancel.value = true;
                }
            print(response.data);
            Utils.showToast('Task updated successfully!', false);
          }, onError: (error) {
            print(error);
            // show error message to user
            BaseClient.handleApiError(error);
            apiCallStatus.value = ApiCallStatus.error;
            Utils.showToast(error.toString(), true);
          }, data: {
            "status": status,
          });
        });
      } else {
        // isInternetAvailable.value = false;
        Utils.showToast('No internet connection', true);
      }
    });
  }

  Future<dynamic> askToCancel({required int taskId}) async {
    await _appPreferences.isPreferenceReady;

    var userId;
    _appPreferences.getUserId().then((value1) {
      userId = value1;
    });

    Utils.check().then((value) async {
      if (value) {
        // *) perform api call
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.post(Constants.AskToCancelTask,
            onSuccess: (response) async {

              print(response.data);
              Utils.showToast(response.data['message'], false);
              Get.back();
            }, onError: (error) {
              print(error);
              BaseClient.handleApiError(error);
              // apiCallStatus.value = ApiCallStatus.error;
          }, headers: {
            'Authorization': 'Bearer ${value}',
            'Accept': 'application/json',
          }, data: {
            'status': 10,
            'user_id': userId,
            'task_id': taskId,
          });
        });
      } else {
        Utils.showToast('No internet connection', true);
      }
    });
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
              Constants.GetTasks +'/${map['id']}',
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                tasksResponseModel.value = PagedTaskData.fromJson(response.data['data']);
                tasksResponseModel.value.userStatus!.localStatus!.value = tasksResponseModel.value.userStatus!.status!;
                print(response.data);
                print('taskList ================> ');
                print('Image ================> ${tasksResponseModel.value.assignee!.image}');
                print("tasksResponseModel.value.type ------> ${tasksResponseModel.value.userStatus!.status}");
                DateTime dateTime = DateTime.parse(tasksResponseModel.value.end!);
                if(tasksResponseModel.value.type == 10 && tasksResponseModel.value.userStatus!.status == 30 ){
                  showcancel.value = false;
                }
               // showcancel.value = dateTime.isAfter(DateTime.now());

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
                'user_id': userId,
              }
          );
        });


      } else {
        Utils.showToast('Check your internet connection', true);
      }
    });
  }


}

class updateStatus {
  int? Id;
  bool? selected;

  updateStatus({this.Id, this.selected});
}
