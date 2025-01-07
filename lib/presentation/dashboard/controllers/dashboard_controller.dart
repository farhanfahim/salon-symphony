import 'dart:convert';
import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import 'package:salon_symphony/data/ExtraPayLoad.dart';
import 'package:salon_symphony/presentation/notification_all/controller/notification_all_controller.dart';
import 'package:salon_symphony/routes/app_routes.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/app_constant.dart';
import '../../../data/models/loginResponseModel.dart';
import '../../../widgets/custom_bottom_bar.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart';
import '../../chat_module/chat_constants.dart';
import '../../settings_onboarding_checklist_screen/controller/settings_onboarding_checklist_controller.dart';
import '../../task_details_screen/controller/task_details_controller.dart';

class DashboardController extends GetxController {
  Rx<User> user = User().obs;

  AppPreferences _appPreferences = AppPreferences();

  PageController pageController = PageController();
  Rx<BottomBarEnum> type = BottomBarEnum.Home.obs;

  //top search
  TextEditingController productSearch = TextEditingController();
  TextEditingController favSearch = TextEditingController();
  TextEditingController storeSearch = TextEditingController();

  //pages detail
  RxInt selectedIndex = 0.obs;
  RxString screenName = ''.obs;
  RxBool isBasicAppBar = false.obs;
  RxBool chatIcon = false.obs;
  RxBool learnIcon = false.obs;
  RxBool menuIcon = false.obs;
  RxDouble mainTopPadding = 2.0.obs;

  RxList<updateStatus> task = [
    updateStatus(Id: 1, selected: true),
    updateStatus(Id: 2, selected: false),
    updateStatus(Id: 3, selected: false),
    updateStatus(Id: 4, selected: false),
  ].obs;

  late StreamSubscription _sub;

  @override
  void onInit() {
    super.onInit();
    initUniLinks();
    getImage();
    notificationsNaviagation();
  }

  Future<void> initUniLinks() async {
    try {
      String? initialLink = await getInitialLink();
      if(initialLink!=null){
        handleDeepLink(initialLink);
      }
      // Listen for incoming deep links while the app is running
      _sub = linkStream.listen((String? link) => handleDeepLink(link!),
        onError: (error) {
          print('Error listening to link stream: $error');
        },);
    } on PlatformException {
      // Handle exception if unable to get the initial deep link
    }
  }

  void handleDeepLink(String link) {
    if (link != null) {
      Uri? url;
      String? route;
      dynamic arguments;
      print("splash state");
      url = Uri.parse(link);

      String module = url.pathSegments.first;
      String moduleId = url.pathSegments.last;

      ///For 'Team' Module
      String? subModule;
      if(module == AppConstant.moduleTeam) {
        subModule = url.pathSegments[1];
      }

      switch(module) {
        case AppConstant.moduleTasks:
          arguments = {
            'id': moduleId,
          };
          route = AppRoutes.taskDetailsScreen;
          break;
        case AppConstant.moduleEvents:
          arguments = {
            'id': moduleId,
          };
          route = AppRoutes.homeEventsDetailsScreen;
          break;
        case AppConstant.moduleResources:
          arguments = {
            'id': moduleId,
          };
          route = AppRoutes.resourceDetailsScreen;
          break;
        case AppConstant.moduleFlashcards:
          arguments = {
            'id': moduleId,
          };
          route = AppRoutes.flashcardsOneScreen;
          break;
        case AppConstant.moduleGoals:
          arguments = {
            'requestId': moduleId,
          };
          route = AppRoutes.goalDetailsActiveScreen;
          break;
        case AppConstant.moduleQuizzes:
          arguments = {
            'id': moduleId,
          };
          route = AppRoutes.quizzesDetailsScreen;
          break;
        case AppConstant.moduleSurveys:
          arguments = {
            'id': moduleId,
          };
          route = AppRoutes.StartSurvey;
          break;
        case AppConstant.moduleRequests:
          arguments = {
            'requestId': moduleId,
          };
          route = AppRoutes.requestDetailsTimeOffScreen;
          break;
        case AppConstant.moduleTeam:
          if(subModule == AppConstant.moduleTeamMembers) {
            arguments = {
              'id': moduleId,
            };
            route = AppRoutes.employeeDicrectryDetailsScreen;
          } else if (subModule == AppConstant.moduleTeamDocs) {
            arguments = {
              'id': moduleId,
            };
            route = AppRoutes.documentDetail;
          } else if (subModule == AppConstant.moduleTeamOnboarding) {
            SettingsOnboardingChecklistController onboardingController = Get.put(SettingsOnboardingChecklistController());
            onboardingController.getOnBoardingTask(taskId: moduleId);
          }
          break;
        default:
          Utils.showToast('Unauthorized', true);
      }

      if (route != null) {
        Get.toNamed(route, arguments: arguments);
      }
    }
  }

  void getImage() {
    _appPreferences.getUserDetail().then((value) async {
      user.value = User.fromJson(jsonDecode(value!));
      print(value);
    });
  }

  void updateTaskStatus(id) {
    task.forEach((element) {
      if (element.Id == id) {
        element.selected = true;
      } else {
        element.selected = false;
      }
    });
    task.refresh();
  }

  void changePage(index) {
    pageController.jumpToPage(index);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> notificationsNaviagation() async {
    final RemoteMessage? remoteMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (remoteMessage != null) {
      print('here22======>');
      var map = remoteMessage.data.containsKey('payload')
          ? jsonDecode(remoteMessage.data['payload'])
          : remoteMessage.data;
      var payload = ExtraPayload.fromJson(map);
      if (payload.refId != null && payload.type != null) {
        if (payload.type == 160) {
          Map<String, dynamic> map = {
            ChatConstants.userId: payload.fromId.toString(),
            ChatConstants.threadName: payload.fromName,
            ChatConstants.fromCreation: true,
            ChatConstants.fromGroup: false,
          };
          Get.toNamed(AppRoutes.chattingView, arguments: map);
        }

        if (payload.type != 100) {
          if (payload.notifiable_id == payload.refId && payload.type == 90) {
            Get.toNamed(AppRoutes.myProfileScreen);
          }else{
            Utils.navigateToScreens(int.parse(payload.type!.toString()), payload.refId!);
          }
        } else {
          Get.toNamed(AppRoutes.notificationNoLinkScreen, arguments: {
            'id': payload.id,
          });
          Notification_All_Controller notiController2 = Get.put(Notification_All_Controller());
          notiController2.markSingleRead(payload.id!);
        }
      }
    }
  }
}
