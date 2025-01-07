import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:salon_symphony/core/utils/app_constant.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import 'package:salon_symphony/data/ExtraPayLoad.dart';
import 'package:salon_symphony/presentation/splash_one_screen/models/splash_one_model.dart';
import 'package:uni_links/uni_links.dart';

import '../../chat_module/chat_constants.dart';
import '../../settings_onboarding_checklist_screen/controller/settings_onboarding_checklist_controller.dart';
import '/core/app_export.dart';
import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/local_db_key.dart';

class SplashOneController extends GetxController {
  Rx<SplashOneModel> splashOneModelObj = SplashOneModel().obs;
  late StreamSubscription _sub;

  AppPreferences _appPreferences = AppPreferences();

  @override
  void onInit() {
    NextPage();
    super.onInit();
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

      // if(url.queryParameters.containsKey('taskid')) {
      //   arguments = {
      //     'id': url.queryParameters['taskid'],
      //   };
      //   route = AppRoutes.taskDetailsScreen;
      //
      // } else if(url.queryParameters.containsKey('resourceId')) {
      //   arguments = {
      //     'id': url.queryParameters['resourceId'],
      //   };
      //   route = AppRoutes.resourceDetailsScreen;
      // }else if (url.queryParameters.containsKey('requestId')) {
      //   arguments = {
      //     'requestId': url.queryParameters['requestId'],
      //     'type': url.queryParameters['type'],
      //     'status': int.parse(url.queryParameters['status']!),
      //   };
      //   route = AppRoutes.requestDetailsTimeOffScreen;
      // }else if (url.queryParameters.containsKey('eventId')) {
      //   arguments = {
      //     'id': url.queryParameters['eventId'],
      //     'index': int.parse(url.queryParameters['index']!),
      //   };
      //   route = AppRoutes.homeEventsDetailsScreen;
      // }else if (url.queryParameters.containsKey('goalsId')) {
      //   arguments = {
      //     'requestId': url.queryParameters['goalsId'],
      //     'type': int.parse(url.queryParameters['type']!),
      //     'userStatusId': url.queryParameters['userStatusId'],
      //   };
      //   route = AppRoutes.goalDetailsActiveScreen;
      // }else if (url.queryParameters.containsKey('flashCardsId')) {
      //   arguments = {
      //     'id': url.queryParameters['flashCardsId'],
      //   };
      //   route = AppRoutes.flashcardsOneScreen;
      // }else if (url.queryParameters.containsKey('docId')) {
      //   arguments = {
      //     'id': int.parse(url.queryParameters['docId']!),
      //   };
      //   route = AppRoutes.documentDetail;
      // }else if (url.queryParameters.containsKey('profileId')) {
      //   arguments = {
      //     'id': url.queryParameters['profileId'],
      //     'name': url.queryParameters['name']!.replaceAll('_', ' '),
      //
      //   };
      //   route = AppRoutes.employeeDicrectryDetailsScreen;
      // }else if (url.queryParameters.containsKey('quizId')) {
      //   arguments = {
      //     'id': url.queryParameters['quizId'],
      //   };
      //   route = AppRoutes.quizzesDetailsScreen;
      // }else if (url.queryParameters.containsKey('surveyId')) {
      //   arguments = {
      //     'id': url.queryParameters['surveyId'],
      //   };
      //   route = AppRoutes.StartSurvey;
      // }
      if (route != null) {
        Get.toNamed(route, arguments: arguments);
      }
    }
  }

  NextPage() {
    Timer(Duration(seconds: 3), () async {
      await _appPreferences.isPreferenceReady;
      _appPreferences.getAccessToken(prefName: AppPreferences.prefAccessToken).then((value) async {
        if (value == null || value.isEmpty) {
          Get.offAllNamed(AppRoutes.signUpScreen);
          print('here======>');

        }
        else {
        Get.offAllNamed(AppRoutes.dashboardRoute);
        // initUniLinks();
        }

      });
    });
  }
}
