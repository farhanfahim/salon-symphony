import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:keyboard_actions/external/platform_check/platform_check.dart';
import 'package:salon_symphony/Shared_prefrences/app_prefrences.dart';
import 'package:salon_symphony/data/ExtraPayLoad.dart';
import 'package:salon_symphony/presentation/chat_module/chat_constants.dart';
import 'package:salon_symphony/presentation/document_detail_screen/controller/document_detail_controller.dart';
import 'package:salon_symphony/presentation/employee_dicrectry_details_screen/controller/employee_dicrectry_details_controller.dart';
import 'package:salon_symphony/presentation/flashcards_one_screen/controller/flashcards_one_controller.dart';
import 'package:salon_symphony/presentation/goal_details_active_screen/controller/goal_details_active_controller.dart';
import 'package:salon_symphony/presentation/home_events_details_screen/controller/home_events_details_controller.dart';
import 'package:salon_symphony/presentation/my_profile_screen/controller/my_profile_controller.dart';
import 'package:salon_symphony/presentation/notification_screen/controller/notification_controller.dart';
import 'package:salon_symphony/presentation/quizzes_details_one_screen/controller/quizzes_details_one_controller.dart';
import 'package:salon_symphony/presentation/request_detail_time_off_screen/controller/request_dtail_time_off_controller.dart';
import 'package:salon_symphony/presentation/resource_details_screen/controller/resource_details_controller.dart';
import 'package:salon_symphony/presentation/rewards_screen/controller/rewards_controller.dart';
import 'package:salon_symphony/presentation/settings_onboarding_checklist_details_screen/controller/settings_onboarding_checklist_details_controller.dart';
import 'package:salon_symphony/presentation/start_survey_screen/start_survey_controller.dart';
import 'package:salon_symphony/presentation/task_details_screen/controller/task_details_controller.dart';
import 'package:uni_links/uni_links.dart';

import 'core/app_export.dart';
import 'core/utils/utils.dart';
import 'data/services/myHttpOverrides.dart';
import 'presentation/chat_module/chat_strings.dart';
import 'presentation/notification_all/controller/notification_all_controller.dart';
import 'presentation/start_survey_screen/start_survey_screen.dart';

/// Define a top-level named handler which background/terminated messages will
/// call.
///
/// To verify things are working, check out the native platform logs.
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print('Handling a background message ${message.notification}');

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FlutterError.onError = (errorDetails) {
  //   FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
  // };
  // FirebaseCrashlytics.instance.crash();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    HttpOverrides.global = MyHttpOverrides();
    runApp(MyApp());
  });

  // inti fcm & notifications services (awesome notifications)
  // await FcmHelper.initFcm();

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  channel = const AndroidNotificationChannel(
    '1', // id
    // 'high_importance_channel', // id
    "Symphony", // title
    description: 'This channel is used for important notifications.',
    // description
    importance: Importance.high,
  );

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  if (PlatformCheck.isAndroid) {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('notif_icon');
    var initializationSettings = InitializationSettings(
        android:
            initializationSettingsAndroid /*, iOS: initializationSettingsIOS*/);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (value) => onSelectNotification(value));
  }

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
}

Future<void> onSelectNotification(dynamic map1) async {
  print("Clicked");
  print("HERERERE12312312312312311");
  var argumentsMap = Map<String, dynamic>();
  dynamic arguments;
  String? newRouteName;
  bool isNewRouteSameAsCurrent = false;
  argumentsMap.clear();
  print(map1.runtimeType);
  print(map1);

  Map<String, dynamic> mapDecoded = jsonDecode(map1);

  print(mapDecoded.runtimeType);
  print(mapDecoded);

  var map = mapDecoded.containsKey('payload')
      ? jsonDecode(mapDecoded['payload'])
      : mapDecoded;

  var payload = ExtraPayload.fromJson(map);

  print(payload.toJson());

  print(payload.toJson());

  print("HERERERE12312312312312311");

  // if (payload.type != null && payload.refId != null) {
  //   if (payload.type == 160) {
  //     if (payload.isGroupChat == '0') {
  //       Map<String, dynamic> map = {
  //         ChatConstants.documentId: payload.refId.toString(),
  //         ChatConstants.userId: payload.fromId.toString(),
  //         ChatConstants.threadName: payload.fromName,
  //         ChatConstants.fromCreation: false,
  //         ChatConstants.fromGroup: false,
  //       };
  //       Get.toNamed(AppRoutes.chattingView, arguments: map);
  //     } else {
  //       Map<String, dynamic> map = {
  //         ChatConstants.documentId: payload.refId.toString(),
  //         ChatConstants.userId: payload.fromId.toString(),
  //         ChatConstants.threadName: payload.fromName,
  //         ChatConstants.fromCreation: false,
  //         ChatConstants.fromGroup: true,
  //       };
  //       Get.toNamed(AppRoutes.chattingView, arguments: map);
  //     }
  //   }
  //   if (payload.type != 100) {
  //     if (payload.notifiable_id == payload.refId && payload.type == 90) {
  //       Get.toNamed(AppRoutes.myProfileScreen);
  //     } else {
  //       navigateToScreens(int.parse(payload.type!.toString()), payload.refId!);
  //       Notification_All_Controller notiController2 =
  //           Get.put(Notification_All_Controller());
  //       notiController2.markSingleRead(payload.id!);
  //     }
  //   } else {
  //     Get.toNamed(AppRoutes.notificationNoLinkScreen, arguments: {
  //       'id': payload.id,
  //     });
  //     Notification_All_Controller notiController2 =
  //         Get.put(Notification_All_Controller());
  //     notiController2.markSingleRead(payload.id!);
  //   }
  // }
  if (payload.refId != null && payload.type != null) {
    print(payload.type.runtimeType);

    if (payload.type == 160) {
      if (payload.isGroupChat == '0') {
        Map<String, dynamic> map = {
          ChatConstants.documentId: payload.refId.toString(),
          ChatConstants.userId: payload.fromId.toString(),
          ChatConstants.threadName: payload.fromName,
          ChatConstants.fromCreation: false,
          ChatConstants.fromGroup: false,
        };
        Get.toNamed(AppRoutes.chattingView, arguments: map);
      } else {
        Map<String, dynamic> map = {
          ChatConstants.documentId: payload.refId.toString(),
          ChatConstants.userId: payload.fromId.toString(),
          ChatConstants.threadName: payload.fromName,
          ChatConstants.fromCreation: false,
          ChatConstants.fromGroup: true,
        };
        Get.toNamed(AppRoutes.chattingView, arguments: map);
      }
    } else {
      if (payload.type != 100) {
        if (payload.notifiable_id == payload.refId && payload.type == 90) {
          if (!isNewRouteSameAsCurrent){
            Get.toNamed(AppRoutes.myProfileScreen);
          }
          Get.delete<MyProfileController>();
          Get.offAndToNamed(AppRoutes.myProfileScreen);
        } else {
          if (payload.type == 10) {
            argumentsMap.clear();
            argumentsMap = {
              'id': payload.refId!,
            };
            Get.delete<ResourceDetailsController>();
            arguments = argumentsMap;
            newRouteName = AppRoutes.resourceDetailsScreen;
          } else if (payload.type == 20) {
            argumentsMap.clear();

            argumentsMap = {
              "index": 0,
              'id': payload.refId!,
            };
            Get.delete<HomeEventsDetailsController>();

            arguments = argumentsMap;
            newRouteName = AppRoutes.homeEventsDetailsScreen;
          } else if (payload.type == 30) {
            argumentsMap.clear();
            argumentsMap = {
              'id': payload.refId!,
            };
            Get.delete<TaskDetailsController>();
            arguments = argumentsMap;
            newRouteName = AppRoutes.taskDetailsScreen;
          } else if (payload.type == 40) {

            argumentsMap.clear();
            Get.delete<GoalDetailsActiveController>();

            argumentsMap = {
              'requestId': payload.refId!,
            };

            arguments = argumentsMap;
            newRouteName = AppRoutes.goalDetailsActiveScreen;
          } else if (payload.type == 50) {
            argumentsMap.clear();
            Get.delete<DocumentsDetailController>();

            argumentsMap = {
              'id': payload.refId!,
            };

            arguments = argumentsMap;
            newRouteName = AppRoutes.documentDetail;
          } else if (payload.type == 60) {
            argumentsMap.clear();

            argumentsMap = {
              'id': payload.refId!,
            };
            Get.delete<StartSurveyController>();

            arguments = argumentsMap;
            newRouteName = AppRoutes.StartSurvey;
          } else if (payload.type == 70) {
            argumentsMap.clear();
            Get.delete<FlashcardsOneController>();

            argumentsMap = {
              'id': payload.refId!,
            };

            arguments = argumentsMap;
            newRouteName = AppRoutes.flashcardsOneScreen;
          } else if (payload.type == 80) {
            argumentsMap.clear();
            Get.delete<QuizzesDetailsOneController>();

            argumentsMap = {
              'id': payload.refId!,
            };

            arguments = argumentsMap;
            newRouteName = AppRoutes.quizzesDetailsScreen;
          } else if (payload.type == 90) {
            argumentsMap.clear();

            argumentsMap = {
              'id': payload.refId!,
              'name': 'Employee Directory',
            };
            Get.delete<EmployeeDicrectryDetailsController>();

            arguments = argumentsMap;
            newRouteName = AppRoutes.employeeDicrectryDetailsScreen;
          }  else if (payload.type == 110) {
            argumentsMap.clear();

            argumentsMap = {
              'requestId': payload.refId!,
            };
            Get.delete<RequestDetailsTimeOffController>();
            arguments = argumentsMap;
            newRouteName = AppRoutes.requestDetailsTimeOffScreen;
          } else if (payload.type == 120) {
            argumentsMap.clear();
            Get.delete<SettingsOnboardingChecklistDetailsController>();
            argumentsMap = {
              'id': payload.refId!,
            };
            arguments = argumentsMap;
            newRouteName = AppRoutes.settingsOnboardingChecklistDetailsScreen;
          } else if (payload.type == 130) {
            Get.delete<RewardsController>();

            newRouteName = AppRoutes.rewardsScreen;
          }
          Get.until((route) {
            if (route.settings.name == newRouteName) {
              isNewRouteSameAsCurrent = true;
            }
            return true;
          });

          if (!isNewRouteSameAsCurrent) {
            print("Here ----->1");
            Get.toNamed(newRouteName!, arguments: arguments);
          } else {
            print("Here ----->2");
            Get.offAndToNamed(newRouteName!,arguments: arguments);
          }
          Notification_All_Controller notiController2 =
          Get.put(Notification_All_Controller());
          notiController2.markSingleRead(payload.id!);
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

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppPreferences _appPreferences = AppPreferences();

  @override
  void initState() {
    // initUniLinks();
    initializeFB();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print('message=====> $message');
      _appPreferences
          .getAccessToken(prefName: AppPreferences.prefAccessToken)
          .then((value) async {
        if (value!.isNotEmpty || value != null) {
          NotificationController notiController =
              Get.put(NotificationController());
          notiController.getNotificationsCount();
        }
      });
      var map12 = (message.notification);
      //

      if (map12 != null) {
        flutterLocalNotificationsPlugin.show(
            int.parse(channel.id),
            // 1,
            map12.title,
            map12.body,
            NotificationDetails(
              iOS: IOSNotificationDetails(),
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                icon: 'notif_icon',
              ),
            ),
            payload: PlatformCheck.isAndroid
                ? jsonEncode(message.data)
                : null); // _appPreferences.setNotification(loggedIn: true);

        // print('message.data.containsKey(payload) ${message.data}');
        // print('message.data.containsKey(payload) ${message.data.containsKey('payload')}');
        var map = message.data.containsKey('payload')
            ? jsonDecode(message.data['payload'])
            : message.data;

        // var payload = ExtraPayload(refId: ref_id, type: type, notifiable_id: notifiable_id, link: link, title: title, message: mess, userName: user_name, fromId: from_id, fromName: form_name);
        var payload = ExtraPayload.fromJson(map);

        print(payload.toJson());
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print('A new onMessageOpenedApp event was published!====>');
      print(message.data);
      var argumentsMap = Map<String, dynamic>();
      dynamic arguments;
      String? newRouteName;
      bool isNewRouteSameAsCurrent = false;
      var map = message.data.containsKey('payload')
          ? jsonDecode(message.data['payload'])
          : message.data;
      var payload = ExtraPayload.fromJson(map);
      print(payload.toJson());

      if (payload.refId != null && payload.type != null) {
        print(payload.type.runtimeType);
        // if (payload.type == 10) {
        //   newRouteName = AppRoutes.resourceDetailsScreen;
        // } else if (payload.type == 20) {
        //   newRouteName = AppRoutes.homeEventsDetailsScreen;
        // } else if (payload.type == 30) {
        //   newRouteName = AppRoutes.taskDetailsScreen;
        // } else if (payload.type == 40) {
        //   newRouteName = AppRoutes.goalDetailsActiveScreen;
        // } else if (payload.type == 50) {
        //   newRouteName = AppRoutes.documentDetail;
        // } else if (payload.type == 60) {
        //   newRouteName = AppRoutes.StartSurvey;
        // } else if (payload.type == 70) {
        //   newRouteName = AppRoutes.flashcardsOneScreen;
        // } else if (payload.type == 80) {
        //   newRouteName = AppRoutes.quizzesDetailsOneScreen;
        // } else if (payload.type == 90) {
        //   newRouteName = AppRoutes.employeeDicrectryDetailsScreen;
        // }  else if (payload.type == 110) {
        //   newRouteName = AppRoutes.requestDetailsTimeOffScreen;
        // } else if (payload.type == 120) {
        //   newRouteName = AppRoutes.settingsOnboardingChecklistDetailsScreen;
        // } else if (payload.type == 130) {
        //   newRouteName = AppRoutes.rewardsScreen;
        // }
        // Get.until((route) {
        //   if (route.settings.name == newRouteName) {
        //     isNewRouteSameAsCurrent = true;
        //   }
        //   return true;
        // });
        //
        // if (!isNewRouteSameAsCurrent) {
        //   Get.toNamed(newRouteName!);
        // } else {
        //   Get.offAllNamed(newRouteName!);
        // }
        ///
        if (payload.type == 160) {
          if (payload.isGroupChat == '0') {
            Map<String, dynamic> map = {
              ChatConstants.documentId: payload.refId.toString(),
              ChatConstants.userId: payload.fromId.toString(),
              ChatConstants.threadName: payload.fromName,
              ChatConstants.fromCreation: false,
              ChatConstants.fromGroup: false,
            };
            Get.toNamed(AppRoutes.chattingView, arguments: map);
          } else {
            Map<String, dynamic> map = {
              ChatConstants.documentId: payload.refId.toString(),
              ChatConstants.userId: payload.fromId.toString(),
              ChatConstants.threadName: payload.fromName,
              ChatConstants.fromCreation: false,
              ChatConstants.fromGroup: true,
            };
            Get.toNamed(AppRoutes.chattingView, arguments: map);
          }
        } else {
          if (payload.type != 100) {
            if (payload.notifiable_id == payload.refId && payload.type == 90) {
              if (!isNewRouteSameAsCurrent){
                Get.toNamed(AppRoutes.myProfileScreen);
              }
                Get.offAndToNamed(AppRoutes.myProfileScreen);
            } else {
              if (payload.type == 10) {
                argumentsMap.clear();

                argumentsMap = {
                  'id': payload.refId!,
                };

                arguments = argumentsMap;
                newRouteName = AppRoutes.resourceDetailsScreen;
              } else if (payload.type == 20) {
                argumentsMap.clear();

                argumentsMap = {
                  "index": 0,
                  'id': payload.refId!,
                };

                arguments = argumentsMap;
                newRouteName = AppRoutes.homeEventsDetailsScreen;
              } else if (payload.type == 30) {
                argumentsMap.clear();

                argumentsMap = {
                  'id': payload.refId!,
                };

                arguments = argumentsMap;
                newRouteName = AppRoutes.taskDetailsScreen;
              } else if (payload.type == 40) {
                argumentsMap.clear();

                argumentsMap = {
                  'requestId': payload.refId!,
                };

                arguments = argumentsMap;
                newRouteName = AppRoutes.goalDetailsActiveScreen;
              } else if (payload.type == 50) {
                argumentsMap.clear();

                argumentsMap = {
                  'id': payload.refId!,
                };

                arguments = argumentsMap;
                newRouteName = AppRoutes.documentDetail;
              } else if (payload.type == 60) {
                argumentsMap.clear();

                argumentsMap = {
                  'id': payload.refId!,
                };

                arguments = argumentsMap;
                newRouteName = AppRoutes.StartSurvey;
              } else if (payload.type == 70) {
                argumentsMap.clear();

                argumentsMap = {
                  'id': payload.refId!,
                };

                arguments = argumentsMap;
                newRouteName = AppRoutes.flashcardsOneScreen;
              } else if (payload.type == 80) {
                argumentsMap.clear();

                argumentsMap = {
                  'id': payload.refId!,
                };

                arguments = argumentsMap;
                newRouteName = AppRoutes.quizzesDetailsScreen;
              } else if (payload.type == 90) {
                argumentsMap.clear();

                argumentsMap = {
                  'id': payload.refId!,
                  'name': 'Employee Directory',
                };

                arguments = argumentsMap;
                newRouteName = AppRoutes.employeeDicrectryDetailsScreen;
              }  else if (payload.type == 110) {
                argumentsMap.clear();

                argumentsMap = {
                  'requestId': payload.refId!,
                };

                arguments = argumentsMap;
                newRouteName = AppRoutes.requestDetailsTimeOffScreen;
              } else if (payload.type == 120) {
                argumentsMap.clear();

                argumentsMap = {
                  'id': payload.refId!,
                };

                arguments = argumentsMap;
                newRouteName = AppRoutes.settingsOnboardingChecklistDetailsScreen;
              } else if (payload.type == 130) {
                newRouteName = AppRoutes.rewardsScreen;
              }
              Get.until((route) {
                if (route.settings.name == newRouteName) {
                  isNewRouteSameAsCurrent = true;
                }
                return true;
              });

              if (!isNewRouteSameAsCurrent) {
                print("Here------> 11");

                Get.toNamed(newRouteName!, arguments: arguments);
              } else {
                print("Here-----> 22");
                Get.offAndToNamed(newRouteName!,arguments: arguments);
              }
              // navigateToScreens(int.parse(payload.type!.toString()), payload.refId!);
              Notification_All_Controller notiController2 =
                  Get.put(Notification_All_Controller());
              notiController2.markSingleRead(payload.id!);
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
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // disable font size
      builder: EasyLoading.init(),
      // showSemanticsDebugger: true,
      translations: AppLocalization(),
      locale: Get.deviceLocale,
      //for setting localization strings
      fallbackLocale: Locale('en', 'US'),
      title: 'salon_symphony',
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
    );
  }

  Future<void> initializeFB() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    messaging.getToken().then((token) {
      print("FCM TOKEN: $token");
    });
  }

  Future<void> initUniLinks() async {
    try {
      String? initialLink = await getInitialLink();
      if (initialLink != null) {
        handleDeepLink(initialLink);
      }
      // Listen for incoming deep links while the app is running
      linkStream.listen(
        (String? link) => handleDeepLink(link!),
        onError: (error) {
          print('Error listening to link stream: $error');
        },
      );
    } on PlatformException {
      // Handle exception if unable to get the initial deep link
    }
  }

  void handleDeepLink(String link) {
    if (link != null) {
      Uri? url;
      String? route;
      dynamic arguments;

      url = Uri.parse(link);

      print("${url.queryParameters}");

      if (url.queryParameters.containsKey('taskid')) {
        arguments = {
          'id': url.queryParameters['taskid'],
        };
        route = AppRoutes.taskDetailsScreen;
      } else if (url.queryParameters.containsKey('resourceId')) {
        arguments = {
          'id': url.queryParameters['resourceId'],
        };
        route = AppRoutes.resourceDetailsScreen;
      } else if (url.queryParameters.containsKey('requestId')) {
        arguments = {
          'requestId': url.queryParameters['requestId'],
          'type': url.queryParameters['type'],
          'status': int.parse(url.queryParameters['status']!),
        };
        route = AppRoutes.requestDetailsTimeOffScreen;
      } else if (url.queryParameters.containsKey('eventId')) {
        arguments = {
          'id': url.queryParameters['eventId'],
          'index': int.parse(url.queryParameters['index']!),
        };
        route = AppRoutes.homeEventsDetailsScreen;
      } else if (url.queryParameters.containsKey('goalsId')) {
        arguments = {
          'requestId': url.queryParameters['goalsId'],
          'type': int.parse(url.queryParameters['type']!),
          'userStatusId': url.queryParameters['userStatusId'],
        };
        route = AppRoutes.goalDetailsActiveScreen;
      } else if (url.queryParameters.containsKey('flashCardsId')) {
        arguments = {
          'id': url.queryParameters['flashCardsId'],
          'pos': int.parse(url.queryParameters['pos']!),
        };
        route = AppRoutes.flashcardsOneScreen;
      } else if (url.queryParameters.containsKey('docId')) {
        arguments = {
          'id': int.parse(url.queryParameters['docId']!),
        };
        route = AppRoutes.documentDetail;
      } else if (url.queryParameters.containsKey('profileId')) {
        arguments = {
          'id': url.queryParameters['profileId'],
          'name': url.queryParameters['name']!.replaceAll('_', ' '),
        };
        route = AppRoutes.employeeDicrectryDetailsScreen;
      }
      if (route != null) {
        Get.toNamed(route, arguments: arguments);
      }
    }
  }
}

void navigateToScreens(int type, Object id) {
  switch (type) {
    case 10:
      {
        Get.toNamed(AppRoutes.resourceDetailsScreen, arguments: {
          'id': id,
        });
      }
      break;

    case 20:
      {
        Get.toNamed(AppRoutes.homeEventsDetailsScreen, arguments: {
          "index": 0,
          "id": id,
        });
      }
      break;
    case 30:
      {
        Get.toNamed(AppRoutes.taskDetailsScreen, arguments: {
          'id': id,
        });
      }
      break;
    case 40:
      {
        Get.toNamed(AppRoutes.goalDetailsActiveScreen, arguments: {
          //   'type': AppConstant.MISSED,
          "requestId": id,
          //  "userStatusId": controller.arrOfCustom[index].userStatus!.id
        });
      }
      break;
    case 50:
      {
        Get.toNamed(AppRoutes.documentDetail, arguments: {'id': id});
      }
      break;
    case 60:
      {
        Get.toNamed(AppRoutes.StartSurvey, arguments: {'id': id});
      }
      break;
    case 70:
      {
        Get.toNamed(AppRoutes.flashcardsOneScreen, arguments: {'id': id});
      }
      break;
    case 80:
      {
        Get.toNamed(AppRoutes.quizzesDetailsScreen, arguments: {
          "id": id,
        });
      }
      break;
    case 90:
      {
        Get.toNamed(AppRoutes.employeeDicrectryDetailsScreen, arguments: {
          'id': id,
          'name': 'Employee Directory',
        });
      }
      break;
    case 100:
      {
        print("nothing to navigate");
      }
      break;
    case 110:
      {
        Get.toNamed(AppRoutes.requestDetailsTimeOffScreen,
            arguments: {"requestId": id});
      }
      break;
    case 120:
      {
        Get.toNamed(AppRoutes.settingsOnboardingChecklistDetailsScreen,
            arguments: {"id": id});
      }
      break;
    case 150:
      {
        Get.toNamed(AppRoutes.rewardsScreen);
      }
      break;

    default:
      {
        print("nothing to navigate");
      }
      break;
  }
}
