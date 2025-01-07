import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:salon_symphony/core/utils/app_constant.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/dummy_content.dart';
import '../../../core/utils/utils.dart';
import '../../../data/models/TaskResponseModel.dart';
import '../../../data/models/TaskResponseModel.dart' as task;
import '../../../data/models/eventsListModel.dart';
import '../../../data/models/getQuizListModel.dart';
import '../../../data/models/getSurveyListing.dart';
import '../../../data/models/paginatedMembersModel.dart';
import '../../../data/models/resourcesResponseModel.dart';
import '../../../data/models/task_data_model.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '../../documents_screen/models/documents_model.dart';
import '../../flashcards_screen/models/flashcards_response_model.dart';
import 'package:salon_symphony/data/models/getQuizListModel.dart' as tagss;
import '../../goals_missed_page/models/goal_response_model.dart';
import '/core/app_export.dart';

class SearchScrenController extends GetxController
    with SingleGetTickerProviderMixin {
  Rx<TextEditingController> searchController = TextEditingController().obs;
  TabController? tabController;
  RxInt selectedIndex = 0.obs;
  RxBool isLoaded = false.obs;
  AppPreferences _appPreferences = AppPreferences();
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  RxList<ResourceData>? resourcesApiList = List<ResourceData>.empty().obs;
  Rx<GetResourceResponseModel> resourcesReponseModel =
      GetResourceResponseModel().obs;
  Rx<DocumentResponseModel>? documentResponseModel =
      DocumentResponseModel().obs;
  Rx<EventsListing> eventsreponseModel = EventsListing().obs;
  RxList<MembersData> arrOfUsers = List<MembersData>.empty().obs;
  Rx<GetTaskResponseModel> tasksResponseModel = GetTaskResponseModel().obs;
  Rx<Task> taskDataModel = Task().obs;
  Rx<PaginatedMembersModel>? userListResponseModel =
      PaginatedMembersModel().obs;
  RxList<PagedTaskData>? taskDataList = List<PagedTaskData>.empty().obs;
  RxList<EventsData>? eventsApiList = List<EventsData>.empty().obs;
  RxList<GetSurveyListingData>? surveyData =
      List<GetSurveyListingData>.empty().obs;
  RxList<dataModel3> listIntrust = List<dataModel3>.empty().obs;
  RxList<QuizData>? quizApiList = List<QuizData>.empty().obs;
  RxList<tagss.Tags>? tagsList = List<tagss.Tags>.empty().obs;
  Rx<GoalResponseModel>? goalResponseModel = GoalResponseModel().obs;
  Rx<GetSurveyListingModel> surveyModel = GetSurveyListingModel().obs;
  Rx<FlashCardResponseModel>? flashCardResponseModel =
      FlashCardResponseModel().obs;
  Rx<GetQuizListResponseModel> quizResponseModel =
      GetQuizListResponseModel().obs;
  RxList<GoalData> goalsDataList = List<GoalData>.empty().obs;
  RxList<GoalData> arrOfWeekly = List<GoalData>.empty().obs;
  RxList<GoalData> arrOfMonthly = List<GoalData>.empty().obs;
  RxList<GoalData> arrOfAnnual = List<GoalData>.empty().obs;
  RxList<GoalData> arrOfCustom = List<GoalData>.empty().obs;
  final PagingController<int, dynamic> resourcesController =
      PagingController(firstPageKey: 1);
  final PagingController<int, EventsData> eventsPagingController =
      PagingController(firstPageKey: 1);
  final PagingController<int, QuizData> quizPagingController =
      PagingController(firstPageKey: 1);
  final PagingController<int, PagedTaskData> taskPagingController =
      PagingController(firstPageKey: 1);
  final PagingController<int, GetSurveyListingData> pagingControllerSurvey =
      PagingController(firstPageKey: 1);
  final PagingController<int, FlashCardData> pagingFlashcardController =
      PagingController(firstPageKey: 1);
  final PagingController<int, MembersData> pagingControllerUsers =
      PagingController(firstPageKey: 1);
  final PagingController<int, DocumentData> docController =
      PagingController(firstPageKey: 1);
  int currentPageResources = 1;
  int totalPagesResources = 0;
  int currentPageEvents = 1;
  int totalPagesEvents = 0;
  int currentPageQuiz = 1;
  int totalPagesQuiz = 0;
  int currentPageTask = 1;
  int totalPagesTask = 0;
  int currentPageSurvey = 1;
  int totalPagesSurvey = 0;
  int currentPageFlash = 1;
  int totalPagesFlash = 0;
  int currentPageUsers = 1;
  int totalPagesUsers = 0;
  int currentPageDoc = 1;
  int totalPagesDoc = 0;
  Rx<int> moduleType = 10.obs;
  Rx<bool> goalsApiCalling = false.obs;
  Rx<bool> resourcesAPiCalling = false.obs;
  Rx<bool> eventsApiCalling = false.obs;
  Rx<bool> quizApiCalling = false.obs;
  Rx<bool> taskApiCalling = false.obs;
  Rx<bool> surveyApiCalling = false.obs;
  Rx<bool> flashCardApiCalling = false.obs;
  Rx<bool> usersApiCalling = false.obs;
  Rx<bool> docApiCalling = false.obs;
  RxBool isApiCalling = false.obs;
  RxBool showCancel = false.obs;
  RxBool isAbsorbing = false.obs;
  RxInt currentPage = 1.obs;
  RxInt totalPages = 0.obs;

  @override
  void onInit() {
    tabController = TabController(length: 9, vsync: this);
    resourcesController.addPageRequestListener((pageKey) {
      print(pageKey);
      _fetchPage(pageKey);
    });
    eventsPagingController.addPageRequestListener((pageKey) {
      print(pageKey);
      _fetchPage2(pageKey);
    });
    taskPagingController.addPageRequestListener((pageKey) {
      print(pageKey);
      _fetchPage3(pageKey);
    });
    pagingControllerSurvey.addPageRequestListener((pageKey) {
      print(pageKey);
      _fetchPageSurvey(pageKey);
    });
    pagingFlashcardController.addPageRequestListener((pageKey) {
      print(pageKey);
      _fetchPageFlash(pageKey);
    });
    pagingControllerUsers.addPageRequestListener((pageKey) {
      print(pageKey);
      _fetchPageUsers(pageKey);
    });
    docController.addPageRequestListener((pageKey) {
      print(pageKey);
      _fetchPageDocs(pageKey);
    });
    quizPagingController.addPageRequestListener((pageKey) {
      print(pageKey);
      _fetchPageQuiz(pageKey);
    });
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      getSearchItems();
    } catch (error) {
      resourcesController.error = error;
    }
  }

  Future<void> _fetchPage2(int pageKey) async {
    try {
      getSearchItems();
    } catch (error) {
      eventsPagingController.error = error;
    }
  }

  Future<void> _fetchPage3(int pageKey) async {
    try {
      getSearchItems();
    } catch (error) {
      taskPagingController.error = error;
    }
  }

  Future<void> _fetchPageSurvey(int pageKey) async {
    try {
      getSearchItems();
    } catch (error) {
      pagingControllerSurvey.error = error;
    }
  }

  Future<void> _fetchPageFlash(int pageKey) async {
    try {
      getSearchItems();
    } catch (error) {
      pagingFlashcardController.error = error;
    }
  }

  Future<void> _fetchPageUsers(int pageKey) async {
    try {
      getSearchItems();
    } catch (error) {
      pagingControllerUsers.error = error;
    }
  }

  Future<void> _fetchPageDocs(int pageKey) async {
    try {
      getSearchItems();
    } catch (error) {
      docController.error = error;
    }
  }

  Future<void> _fetchPageQuiz(int pageKey) async {
    try {
      getSearchItems();
    } catch (error) {
      quizPagingController.error = error;
    }
  }

  Future<dynamic> getSearchItems() async {
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
        print('MY API IS CALLING HERE ===========> ===>>>> >>>>>>>>>>>>>>');
        apiCallStatus.value = ApiCallStatus.loading;
        isAbsorbing.value = true;
        goalsApiCalling.value = true;
        resourcesAPiCalling.value = true;
        eventsApiCalling.value = true;
        quizApiCalling.value = true;
        taskApiCalling.value = true;
        surveyApiCalling.value = true;
        flashCardApiCalling.value = true;
        usersApiCalling.value = true;
        docApiCalling.value = true;
        isApiCalling.value = true;
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.get(Constants.Search,
              onSuccess: (response) {
                isAbsorbing.value = false;
                switch (moduleType.value) {
                  case 10:
                    apiCallStatus.value = ApiCallStatus.success;
                    resourcesAPiCalling.value = false;
                    resourcesReponseModel.value =
                        GetResourceResponseModel.fromJson(response.data);
                    resourcesApiList!.value =
                        resourcesReponseModel.value.data!.data!;
                    print(response.data);
                    totalPagesResources =
                        resourcesReponseModel.value.data!.meta!.lastPage!;

                    print('Last Page: $totalPagesResources');
                    print('Current Page: $currentPageResources');

                    final isNotLastPage =
                        currentPageResources + 1 <= totalPagesResources;

                    if (!isNotLastPage) {
                      print('Last Page Reached');
                      resourcesController
                          .appendLastPage(resourcesApiList!.value);
                    } else {
                      currentPageResources = currentPageResources + 1;
                      print('New Current Page: $currentPageResources');
                      resourcesController.appendPage(
                          resourcesApiList!.value, currentPageResources);
                    }
                    break;
                  case 20:
                    apiCallStatus.value = ApiCallStatus.success;
                    eventsApiCalling.value = false;
                    eventsreponseModel.value =
                        EventsListing.fromJson(response.data);
                    eventsApiList!.value = eventsreponseModel.value.data!.data!;
                    print(eventsreponseModel.value);
                    eventsApiList!.forEach((element) {
                      if (element.userReservation != null) {
                        element.localStatus.value =
                            element.userReservation!.status!;
                        element.userReservation!.localStatusId!.value =
                            element.userReservation!.statusId!;
                        print(
                            'localStatusId====>${element.userReservation!.localStatusId!.value}');
                      }
                    });
                    // print(eventsreponseModel.value);
                    print("Got events response ${eventsApiList?.length}");

                    totalPagesEvents =
                        eventsreponseModel.value.data!.meta!.lastPage!;

                    print('Last Page: $totalPagesEvents');
                    print('Current Page: $currentPageEvents');

                    final isNotLastPage =
                        currentPageEvents + 1 <= totalPagesEvents;

                    if (!isNotLastPage) {
                      print('Last Page Reached');
                      eventsPagingController
                          .appendLastPage(eventsApiList!.value);
                    } else {
                      currentPageEvents = currentPageEvents + 1;
                      print('New Current Page: $currentPageEvents');
                      eventsPagingController.appendPage(
                          eventsApiList!.value, currentPageEvents);
                    }
                    break;
                  case 30:
                    apiCallStatus.value = ApiCallStatus.success;
                    taskApiCalling.value = false;
                    taskDataModel.value = Task.fromJson(response.data['data']);
                    // print('response.data======>  ${response.data}');
                    taskDataList!.value = taskDataModel.value.data!;
                    totalPagesTask = taskDataModel.value.meta!.lastPage!;

                    print('Last Page: $totalPagesTask');
                    print('Current Page: $currentPageTask');

                    final isNotLastPage = currentPageTask + 1 <= totalPagesTask;

                    if (!isNotLastPage) {
                      print('Last Page Reached');
                      taskPagingController.appendLastPage(taskDataList!.value);
                    } else {
                      currentPageTask = currentPageTask + 1;
                      print('New Current Page: $currentPageTask');
                      taskPagingController.appendPage(
                          taskDataList!.value, currentPageTask);
                    }
                    break;
                  case 40:
                    apiCallStatus.value = ApiCallStatus.success;
                    goalsApiCalling.value = false;
                    goalResponseModel!.value = GoalResponseModel.fromJson(response.data);
                    goalsDataList.value = goalResponseModel!.value.data!;
                    for (var item in goalResponseModel!.value.data!) {
                      if (item.type == AppConstant.WEEKLY) {
                        arrOfWeekly.add(item);
                      } else if (item.type == AppConstant.MONTHLY) {
                        arrOfMonthly.add(item);
                      } else if (item.type == AppConstant.ANNUALLY) {
                        arrOfAnnual.add(item);
                      } else if (item.type == AppConstant.CUSTOM) {
                        arrOfCustom.add(item);
                      }
                    }
                    arrOfWeekly.refresh();
                    arrOfMonthly.refresh();
                    arrOfAnnual.refresh();
                    arrOfCustom.refresh();
                    break;
                  case 50:
                    apiCallStatus.value = ApiCallStatus.success;
                    docApiCalling.value = false;
                    documentResponseModel!.value =
                        DocumentResponseModel.fromJson(response.data['data']);

                    totalPagesDoc =
                        documentResponseModel!.value.meta!.lastPage!;
                    print('Last Page: $totalPagesDoc');

                    final isNotLastPage = currentPageDoc + 1 <= totalPagesDoc;
                    print('_currentPage $currentPageDoc');
                    print('isNotLastPage $isNotLastPage');

                    if (!isNotLastPage) {
                      docController
                          .appendLastPage(documentResponseModel!.value.data!);
                    } else {
                      final nextPageKey = currentPageDoc + 1;
                      currentPageDoc = currentPageDoc + 1;

                      print('New Page: $totalPagesDoc');
                      docController.appendPage(
                          documentResponseModel!.value.data!, nextPageKey);
                    }
                    for (var item in docController.itemList!) {
                      item.localStatus!.value = item.viewStatus!;
                    }
                    break;
                  case 60:
                    apiCallStatus.value = ApiCallStatus.success;
                    print('Survey =====>');
                    surveyApiCalling.value = false;
                    // apiCallStatus.value = ApiCallStatus.success;
                    surveyModel.value =
                        GetSurveyListingModel.fromJson(response.data);
                    surveyData!.value = surveyModel.value.data!.data!;
                    print(response.data);
                    totalPagesSurvey = surveyModel.value.data!.meta!.lastPage!;
                    print('Last Page: $totalPagesSurvey');
                    print('Current Page: $currentPageSurvey');
                    final isNotLastPage =
                        currentPageSurvey + 1 <= totalPagesSurvey;
                    if (!isNotLastPage) {
                      print('Last Page Reached');
                      pagingControllerSurvey.appendLastPage(surveyData!.value);
                    } else {
                      currentPageSurvey = currentPageSurvey + 1;
                      print('New Current Page: $currentPageSurvey');
                      pagingControllerSurvey.appendPage(
                          surveyData!.value, currentPageSurvey);
                    }
                    break;
                  case 70:
                    apiCallStatus.value = ApiCallStatus.success;
                    flashCardApiCalling.value = false;
                    isApiCalling.value = false;

                    flashCardResponseModel!.value =
                        FlashCardResponseModel.fromJson(response.data['data']);

                    totalPagesFlash =
                        flashCardResponseModel!.value.meta!.lastPage!;
                    print('Last Page: $totalPagesFlash');

                    final isNotLastPage =
                        currentPageFlash + 1 <= totalPagesFlash;
                    print('_currentPage $currentPageFlash');
                    print('isNotLastPage $isNotLastPage');
                    for (var item in flashCardResponseModel!.value.data!) {
                      item.localUserFlashcardStatus!.value =
                          item.userFlashcardStatus!;
                      for (var item2 in item.flashcardElements!) {
                        if (item2.userScore != null) {
                          item2.localUserScore.value = item2.userScore!;
                        }
                      }
                    }

                    if (!isNotLastPage) {
                      pagingFlashcardController
                          .appendLastPage(flashCardResponseModel!.value.data!);
                    } else {
                      final nextPageKey = currentPageFlash + 1;
                      currentPageFlash = currentPageFlash + 1;

                      print('New Page: $totalPagesFlash');
                      pagingFlashcardController.appendPage(
                          flashCardResponseModel!.value.data!, nextPageKey);
                    }
                    break;
                  case 80:
                    apiCallStatus.value = ApiCallStatus.success;
                    quizApiCalling.value = false;

                    /// quiz work will be done here
                    quizResponseModel.value =
                        GetQuizListResponseModel.fromJson(response.data);
                    print("salman has reached there");
                    quizApiList!.value = quizResponseModel.value.data!.data!;
                    print(quizResponseModel.value);
                    quizApiList!.forEach((element) {
                      tagsList!.addAll(element.tags!);
                    });
                    totalPagesQuiz =
                        quizResponseModel.value.data!.meta!.lastPage!;

                    print('Last Page: $totalPagesQuiz');
                    print('Current Page: $currentPageQuiz');

                    final isNotLastPage = currentPageQuiz + 1 <= totalPagesQuiz;

                    if (!isNotLastPage) {
                      print('Last Page Reached');
                      quizPagingController.appendLastPage(quizApiList!.value);
                    } else {
                      currentPageQuiz = currentPageQuiz + 1;
                      print('New Current Page: $currentPageQuiz');
                      quizPagingController.appendPage(
                          quizApiList!.value, currentPageQuiz);
                    }
                    return true;
                    break;
                  case 90:
                    apiCallStatus.value = ApiCallStatus.success;
                    usersApiCalling.value = false;
                    userListResponseModel!.value = PaginatedMembersModel.fromJson(response.data);
                    arrOfUsers.value = userListResponseModel!.value.data!.data!;
                    totalPagesUsers = userListResponseModel!.value.data!.meta!.lastPage!;
                    print('Last Page: $totalPagesUsers');
                    print('Current Page: $currentPageUsers');
                    final isNotLastPage = currentPageUsers + 1 <= totalPagesUsers;
                    if (!isNotLastPage) {
                      print('Last Page Reached');
                      pagingControllerUsers.appendLastPage(arrOfUsers.value);
                    } else {
                      currentPageUsers = currentPageUsers + 1;
                      print('New Current Page: $currentPageUsers');
                      pagingControllerUsers.appendPage(
                          arrOfUsers.value, currentPageUsers);
                    }
                    break;
                }
                apiCallStatus.value = ApiCallStatus.success;
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
                'is_paginated': moduleType.value == AppConstant.GOALS ? 0 : 1,
                'page': moduleType.value == AppConstant.RESOURCES
                    ? currentPageResources
                    : moduleType.value == AppConstant.FLASHCARDS
                        ? currentPageFlash
                        : moduleType.value == AppConstant.DOCUMENTS
                            ? currentPageDoc
                            : moduleType.value == AppConstant.SURVEY
                                ? currentPageSurvey
                                : moduleType.value == AppConstant.QUIZ
                                    ? currentPageQuiz
                                    : moduleType.value == AppConstant.MEMBERS
                                        ? currentPageUsers
                                        : moduleType.value == AppConstant.EVENTS
                                            ? currentPageEvents
                                            : moduleType.value == AppConstant.TASKS
                                                ? currentPageTask
                                                : null,
                'salon_id': salonId,
                'module': moduleType.value,
                'user_id': userId,
                'keyword': searchController.value.text,
                if (moduleType.value == AppConstant.FLASHCARDS)
                  'viewed_user_id': userId,
                if (moduleType.value == AppConstant.FLASHCARDS)
                  'status': AppConstant.ACTIVE,
              });
        });
      } else {
        Utils.showToast('Check your internet connection', true);
      }
    });
  }

  Future<dynamic> updateStatus(int status, int docId) async {
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
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((token) async {
          await BaseClient.put(Constants.salonDocs + "/$docId",
              headers: {
                'Authorization': 'Bearer $token',
                'Accept': 'application/json',
              },
              onSuccess: (response) async {}, onError: (error) {
            print(error);
            // show error message to user
            BaseClient.handleApiError(error);

            Utils.showToast(error.toString(), true);
          }, data: {
            "status": status,
            'salon_id': salonId,
          });
        });
      } else {
        Utils.showToast('No internet connection', true);
      }
    });
  }

  void changeModuleType(int index) {
    switch (index) {
      case 0:
        moduleType.value = AppConstant.RESOURCES;
        print(moduleType.value);
        break;
      case 1:
        moduleType.value = AppConstant.EVENTS;
        print(moduleType.value);
        break;
      case 2:
        moduleType.value = AppConstant.TASKS;
        print(moduleType.value);
        break;
      case 3:
        moduleType.value = AppConstant.GOALS;
        print(moduleType.value);
        break;
      case 4:
        moduleType.value = AppConstant.DOCUMENTS;
        print(moduleType.value);
        break;
      case 5:
        moduleType.value = AppConstant.SURVEY;
        print(moduleType.value);
        break;
      case 6:
        moduleType.value = AppConstant.FLASHCARDS;
        print(moduleType.value);
        break;
      case 7:
        moduleType.value = AppConstant.QUIZ;
        print(moduleType.value);
        break;
      case 8:
        moduleType.value = AppConstant.MEMBERS;
        print(moduleType.value);
        break;
      default:
        moduleType.value = AppConstant.RESOURCES;
        print(moduleType.value);
    }
  }
}
