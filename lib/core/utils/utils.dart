import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:intl/intl.dart';
import 'package:salon_symphony/core/constants/constants.dart';
import 'package:salon_symphony/core/utils/app_constant.dart';
import 'package:salon_symphony/core/utils/color_constant.dart';
import 'package:salon_symphony/core/utils/picker_type.dart';
import 'package:salon_symphony/core/utils/responsive.dart';
import 'package:salon_symphony/core/utils/size_utils.dart';
import 'package:salon_symphony/presentation/chat_module/chat_constants.dart';

// import 'package:jiffy/jiffy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../presentation/settings_onboarding_checklist_screen/controller/settings_onboarding_checklist_controller.dart';
import '../../presentation/start_survey_screen/start_survey_screen.dart';
import '../../routes/app_routes.dart';
import '../../widgets/custom_toast.dart';
import 'helper_functions.dart';

class Utils {
  static bool validateEmail(String email) {
    if (email.isEmpty) {
      CustomToast().showToast("Email can not be empty", true);
      return false;
    } else if (!email.isEmail) {
      CustomToast().showToast("Email format is not correct", true);
      return false;
    }
    return true;
  }
  static Future<void> share(String url) async {
    await FlutterShare.share(
        title: AppConstant.APP_NAME,
        text: AppConstant.SHARE_DESC,
        linkUrl: url,
        chooserTitle: AppConstant.SHARE);
  }
  static void hideKeyBoard(BuildContext context) {
    FocusScope.of(context)
        .requestFocus(FocusNode()); //DateFormat('MMM/dd/yyyy').format(date);
  }

  static bool validatePassword(String password) {
    if (password.isEmpty) {
      CustomToast().showToast("Password can not be empty", true);
      return false;
    } else if (password.length < 8) {
      CustomToast().showToast("Password must be 8 characters long", true);
      return false;
    }
    return true;
  }

  static Future<void> reportProblem() async {
    Uri url = Uri.parse(Constants.REPORT_A_PROBLEM);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  static Future<void>  navigateToScreens(int type, Object id) async {
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
          Get.toNamed(AppRoutes.StartSurvey,arguments: {'id': id});
        }
        break;
      case 70:
        {
          Get.toNamed(AppRoutes.flashcardsOneScreen,arguments: {'id': id});
        }
        break;
      case 80:
        {
          Get.toNamed(AppRoutes.quizzesDetailsScreen,arguments: {
            "id":id,
          });
        }
        break;
      case 90:
        {
          Get.toNamed(AppRoutes.employeeDicrectryDetailsScreen,arguments: {
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
              arguments: {
                "requestId": id});
        }
        break;
      case 120:
        {
          Get.toNamed(AppRoutes.settingsOnboardingChecklistDetailsScreen, arguments: {"id": id});
        }
        break;
      case 150:
        {
          Get.toNamed(AppRoutes.rewardsScreen);
        }
        break;
      case 160:
        {
          Map<String, dynamic> map = {
            ChatConstants.userId: id,
            ChatConstants.threadName: "user",
            ChatConstants.fromCreation: true,
            ChatConstants.fromGroup: false,
          };
          Get.toNamed(AppRoutes.chattingView, arguments: map);
          // Get.toNamed(AppRoutes.settingsOnboardingChecklistDetailsScreen, arguments: {"id": id});
        }
        break;

      default:
        {
          print("nothing to navigate");
        }
        break;
    }
  }

  static void handleDeepLink(String link) {
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

  static  void handleDeepLink2(String link) {
    if (link != null) {
      Uri? url;
      String? route;
      dynamic arguments;
      print("splash state");
      url = Uri.parse(link);
      print("${url.queryParameters}");
      if(url.queryParameters.containsKey('taskid')) {
        arguments = {
          'id': url.queryParameters['taskid'],
        };
        route = AppRoutes.taskDetailsScreen;

      } else if(url.queryParameters.containsKey('resourceId')) {
        arguments = {
          'id': url.queryParameters['resourceId'],
        };
        route = AppRoutes.resourceDetailsScreen;
      }else if (url.queryParameters.containsKey('requestId')) {
        arguments = {
          'requestId': url.queryParameters['requestId'],
          'type': url.queryParameters['type'],
          'status': int.parse(url.queryParameters['status']!),
        };
        route = AppRoutes.requestDetailsTimeOffScreen;
      }else if (url.queryParameters.containsKey('eventId')) {
        arguments = {
          'id': url.queryParameters['eventId'],
          'index': int.parse(url.queryParameters['index']!),
        };
        route = AppRoutes.homeEventsDetailsScreen;
      }else if (url.queryParameters.containsKey('goalsId')) {
        arguments = {
          'requestId': url.queryParameters['goalsId'],
          'type': int.parse(url.queryParameters['type']!),
          'userStatusId': url.queryParameters['userStatusId'],
        };
        route = AppRoutes.goalDetailsActiveScreen;
      }else if (url.queryParameters.containsKey('flashCardsId')) {
        arguments = {
          'id': url.queryParameters['flashCardsId'],
          // 'pos': int.parse(url.queryParameters['pos']!),
        };
        route = AppRoutes.flashcardsOneScreen;
      }else if (url.queryParameters.containsKey('docId')) {
        arguments = {
          'id': int.parse(url.queryParameters['docId']!),
        };
        route = AppRoutes.documentDetail;
      }else if (url.queryParameters.containsKey('profileId')) {
        arguments = {
          'id': url.queryParameters['profileId'],
          'name': url.queryParameters['name']!.replaceAll('_', ' '),

        };
        route = AppRoutes.employeeDicrectryDetailsScreen;
      }else if (url.queryParameters.containsKey('quizId')) {
        arguments = {
          'id': url.queryParameters['quizId'],
        };
        route = AppRoutes.quizzesDetailsScreen;
      }else if (url.queryParameters.containsKey('surveyId')) {
        arguments = {
          'id': url.queryParameters['surveyId'],
        };
        route = AppRoutes.StartSurvey;
      }
      if (route != null) {
        Get.toNamed(route, arguments: arguments);
      }
    }
  }

  static RegExp phoneNumberRegExp = RegExp(
    r'^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9][0-8][0-9])\s*\)|([2-9][0-8][0-9]))\s*(?:[.-]?\s*)?)?([2-9][0-9]{2})\s*(?:[.-]?\s*)?([0-9]{4})$',
  );


  static Future<List<Media>?> mediaPicker({
    PickerType pickerType = PickerType.gallery,
    CameraMimeType cameraMimeType = CameraMimeType.photo,
    GalleryMode galleryMode = GalleryMode.image,
    int count = 1,
    required BuildContext context,
  }) async {
    // var permissionResult = pickerType == PickerType.camera
    // ? await MediaPermissionHandler.requestCameraPermission()
    // : await MediaPermissionHandler.requestGalleryPermission();

    List<Media> mediaList = [];

    if (true) {
      if (pickerType == PickerType.gallery) {
        mediaList = await ImagePickers.pickerPaths(
          selectCount: count,
          galleryMode: galleryMode,
          cropConfig: CropConfig(enableCrop: true),
          showCamera: true,
        );
      } else if (pickerType == PickerType.camera) {
        var cameraMedia = await ImagePickers.openCamera(
          cameraMimeType: cameraMimeType,
          cropConfig: CropConfig(enableCrop: true),
        );
        mediaList.add(cameraMedia!);
      }

      return mediaList;
    }
  }


  static Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }


  static Future<void> clearLocalStorage() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.clear();
  }

  static String getTime(DateTime dateTime) {
    var xxx = DateFormat("hh:mm a").format(dateTime);
    return xxx.toString();
  }

  static String getDay(DateTime dateTime) {
    var xxx = DateFormat("MMM d").format(dateTime);
    return xxx.toString();
  }

  static Future<void> cupertinoTimePicker(BuildContext context, Function(DateTime) onConfirm)async{
    DatePicker.showTime12hPicker(context,

        theme: DatePickerTheme(

          backgroundColor: ColorConstant.whiteA700,
          cancelStyle: TextStyle(color: ColorConstant.black900),
          itemStyle: TextStyle(color: ColorConstant.black900),
          //  containerHeight: 20.0.h,
        ),
        showTitleActions: true,
        onChanged: (date) {
          print('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
        },
        onConfirm: onConfirm,
        currentTime: DateTime.now());
  }
  // static Future<Map> getUserInfo() async {
  //   SharedPreferences storage=await SharedPreferences.getInstance();
  //   String? id=storage.getString(LocalDBKeys.USERID);
  //   String? token=storage.getString(LocalDBKeys.TOKEN);
  //
  //   return {
  //     "token": token,
  //     "id": id,
  //   };
  // }

  // 07: 00 am
  static String timeFormator(date) {  // 07: 00 am
    var time = TimeOfDay.fromDateTime(date);
    print(time.hourOfPeriod);
    print(time.minute);
    print(time.period.name);
    return '${time.hourOfPeriod < 10 ? '0${time.hourOfPeriod}' : time.hourOfPeriod} : ${time.minute < 10 ? '0${time.minute}' : time.minute} ${time.period.name}';
  }

  static String timeAgoSinceDateChat(DateTime dateTime, {bool numericDates = true}) {
    try {
      final date2 = DateTime.now().toLocal();
      final difference = date2.difference(dateTime);

      if (difference.inSeconds < 5) {
        return 'Just now';
      } else if (difference.inSeconds <= 60) {
        return '${difference.inSeconds}s';
      } else if (difference.inMinutes <= 1) {
        return (numericDates) ? '1 min' : 'A minute ago';
      } else if (difference.inMinutes <= 60) {
        return '${difference.inMinutes} min';
      } else if (difference.inHours <= 1) {
        return (numericDates) ? '1h' : 'An hour ago';
      } else if (difference.inHours <= 24) {
        return '${difference.inHours}h';
      } else if (difference.inDays <= 1) {
        return  'Yesterday' ;
      } else if (difference.inDays <= 6) {
        return '${difference.inDays} days ago';
      } else if ((difference.inDays / 7).ceil() <= 1) {
        return (numericDates) ? '1w' : 'Last week';
      } else if ((difference.inDays / 7).ceil() <= 4) {
        return '${(difference.inDays / 7).ceil()}w';
      } else if ((difference.inDays / 30).ceil() <= 1) {
        return (numericDates) ? '1m' : 'Last month';
      } else if ((difference.inDays / 30).ceil() <= 30) {
        return '${(difference.inDays / 30).ceil()}m';
      } else if ((difference.inDays / 365).ceil() <= 1) {
        return (numericDates) ? '1y' : 'Last year';
      }
      return '${(difference.inDays / 365).floor()}yrs';
    } catch (e) {
      return "";
    }
  }

  static void dropDownAndroidBottomSheet(
      {required BuildContext context,
      double? height,
      required bool? value,
      dynamic list,
      required Function(int) onItemTap}) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: height ?? MediaQuery.of(context).size.height * 0.29,
            child: Column(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 5.0),
                    width: 100.0,
                    height: 8.0,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: Container(
                    //height: MediaQuery.of(context).size.height * 0.10,
                    child: ListView.builder(
                        itemCount: list.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return dropDownItem(context,
                            list[index], () {
                            onItemTap(index);
                          },value!);
                        }),
                  ),
                ),
              ],
            ),
          );
        });
  }

  static Widget dropDownItem(BuildContext bc, String name, Function() onTap, bool value,) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new ListTile(
              leading: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: value
                            ? ColorConstant.primaryColor
                            : Color(0xFFC5C9D1),
                        width: 1.0)),
                padding: EdgeInsets.all(1.0),
                child: Container(
                  height: 15.0,
                  width: 15.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: value
                          ? ColorConstant.primaryColor
                          : Colors.transparent),
                ),
              ),
              title: new Text(
                name,
              ),
              onTap: onTap),
          // divider(),
        ],
      ),
    );
  }

  // May 26, 07: 00 am
  // static String timeFormatorWithDate( String date){
  //   var a = DateTime.parse(date);
  //   var time = TimeOfDay.fromDateTime(a);
  //   var b = new DateFormat('MMM dd, hh:mm').format(a);
  //   print(time.hourOfPeriod);
  //   print(time.minute);
  //   print(time.period.name);
  //   return b.toString();
  // }

  // May 26, 07: 00 am
  // static String timeFormatorWithDate2( String date){
  //   var a = DateTime.parse(date);
  //   var time = TimeOfDay.fromDateTime(a);
  //   var b = new DateFormat('MMM dd, hh:mm aa').format(a);
  //   print(time.hourOfPeriod);
  //   print(time.minute);
  //   print(time.period.name);
  //   return b.toString();
  // }

  static void hideKeyboard(context) {
    FocusScope.of(context).unfocus();
  }

  static void showToast(String body, bool error) {
    CustomToast().showToast(body, error);
  }
  static void  launchUrls(String link) async {
    Uri url = Uri.parse(link);
    print('url=====> $url');
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
  static String getMonth(date) {
    DateTime dt = DateTime.parse(date);
    String formattedDate = DateFormat('dd MMM').format(dt);
    return formattedDate;
  }

  static String getFormatedDate(String date) {
    // DateTime dateTime = DateTime.parse(date);
    // String formattedDate = DateFormat.MMMM().add_d().add_y().format(dateTime);
    final DateFormat formatter = DateFormat('MMM d, y');
    final String formattedDate = formatter.format(DateTime.parse(date));
    return formattedDate;
  }

  static String getFormatedDateForApi(String time) {
    DateTime tempDate = new DateFormat("yyyy-MM-ddTHH:mm:ss.SSSZ").parse(
        time);
    return DateFormat("yyyy-MM-dd").format(tempDate);
  }
  static String getFormatedDateHome(DateTime time) {
    // DateTime tempDate = new DateFormat("yyyy-MM-ddTHH:mm:ss.SSSZ").parse(
    //     time);
    return DateFormat('MMMM d, y').format(time);
  }
  static String getCurrentDay() {
    final now = DateTime.now();
    final formatter = DateFormat('EEEE'); // 'EEEE' will format the day as a full weekday name
    return formatter.format(now);
  }
  static String getFormatedDateForEvents(String time) {
    try{
      DateTime tempDate = new DateFormat("yyyy-MM-dd").parse(
          time);
      return DateFormat('E, MMM d').format(tempDate).toUpperCase();
    }catch(e){
      print("Error parsing date time: $e");
      return "";
    }

  }

  static String getFormatedShortDateForApi(String time) {
    DateTime tempDate = new DateFormat("yyyy-MM-dd").parse(
        time);
    return DateFormat("yyyy-MM-dd").format(tempDate);
  }

  static String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    DateFormat formatter = DateFormat("MMM d, yyyy");
    String formattedDate = formatter.format(dateTime);
    return formattedDate;
  }
  static String taskFormatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    DateFormat formatter = DateFormat("MMM d");
    String formattedDate = formatter.format(dateTime);
    return formattedDate;
  }
  static Future<void> launchInWebViewWithJavaScript(String url) async {
    if (await canLaunch(url)) {
      print('url=====> $url');
      await launch(
        url,
        forceSafariVC: true,
        // forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  static DateTime convertTime(String time, int defaultValue) {
    try {
      DateTime tempDate = new DateFormat("HH:mm a").parse(time);
      print('tempDate.minute  ==> ${tempDate.minute}');
      return tempDate;
    } catch (e) {
      return DateTime.now();
    }
  }


  void weeklyExample(context,title) {
    Responsive responsive = Responsive();
    responsive.setContext(context);
    HelperFunction.showBottomSheet(
      context,
      bottomSheetHeight:  responsive.setHeight(100),
      spaceBetween: responsive.setHeight(4),
      screenTitle: title,
      screenEndTask: 'Done',
      widget: Container(
        width: size.width,
        child: SingleChildScrollView(
          child: Container(
            height: getVerticalSize(
              610.00,
            ),
            width: size.width,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: getVerticalSize(
                      612.00,
                    ),
                    width: size.width,

                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Container(
                        width: getHorizontalSize(
                          343.00,
                        ),
                        margin: getMargin(
                          left: 1,
                          top: 23,
                          right: 1,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Example #1 (Dollar Target):",
                                style: TextStyle(
                                  color: ColorConstant.primaryColor,
                                  fontSize: getFontSize(
                                    14,
                                  ),
                                   fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                  fontWeight: FontWeight.w300,
                                  height: 1.50,
                                ),
                              ),
                              TextSpan(
                                text: r" Assume your Weekly goal is $2,000 in service sales and your week ends on Saturday.  ",
                                style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(
                                    14,
                                  ),
                                   fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                  fontWeight: FontWeight.w400,
                                  height: 1.50,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          // width: getHorizontalSize(
                          //   272.00,
                          // ),
                          margin: getMargin(
                            left: 14,
                            top: 25,
                            right: 14,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "lbl_goal_name2".tr,
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                       fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w600,
                                      height: 1.86,
                                    ),
                                  ),


                                  Text(
                                    r" $2k Weekly Service Sales",
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                       fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w400,
                                      height: 1.50,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Measure every:',
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                       fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w600,
                                      height: 1.86,
                                    ),
                                  ),


                                  Text(
                                    " Saturday",
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                       fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w400,
                                      height: 1.50,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Repeats:',
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                       fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w600,
                                      height: 1.86,
                                    ),
                                  ),


                                  Text(
                                    " Forever ",
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                       fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w400,
                                      height: 1.50,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Target Type:',
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                       fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w600,
                                      height: 1.86,
                                    ),
                                  ),


                                  Text(
                                    " Dollar Amount  ",
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                       fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w400,
                                      height: 1.50,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Target Value:',
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                       fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w600,
                                      height: 1.86,
                                    ),
                                  ),


                                  Text(
                                    r" $2,000",
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                       fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w400,
                                      height: 1.50,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 20,),
                      Container(
                        width: getHorizontalSize(
                          333.00,
                        ),
                        height: 1,
                        color: ColorConstant.gray200,
                      ),
                      Container(
                        width: getHorizontalSize(
                          333.00,
                        ),
                        margin: getMargin(
                          left: 1,
                          top: 24,
                          right: 10,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Example #2 (Number Target):',
                                style: TextStyle(
                                  color: ColorConstant.primaryColor,
                                  fontSize: getFontSize(
                                    14,
                                  ),
                                   fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                  fontWeight: FontWeight.w300,
                                  height: 1.50,
                                ),
                              ),
                              TextSpan(
                                text: " Assume your goal is to sell 10 add-on treatment services each week of the next 3 months and your week ends on Saturday.",
                                style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(
                                    14,
                                  ),
                                   fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                  fontWeight: FontWeight.w400,
                                  height: 1.50,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          // width: getHorizontalSize(
                          //   // 246.00,
                          // ),
                          margin: getMargin(
                            left: 14,
                            top: 25,
                            right: 14,
                          ),
                          child:  Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "lbl_goal_name2".tr,
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                       fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w600,
                                      height: 1.86,
                                    ),
                                  ),


                                  Text(
                                    " 10 Add-On Treatments",
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                       fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w400,
                                      height: 1.50,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Measure every:',
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                       fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w600,
                                      height: 1.86,
                                    ),
                                  ),


                                  Text(
                                    " Saturday",
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                       fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w400,
                                      height: 1.50,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Repeats:',
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                       fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w600,
                                      height: 1.86,
                                    ),
                                  ),


                                  Text(
                                    " For 3 Months ",
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                       fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w400,
                                      height: 1.50,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Target Type:',
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                       fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w600,
                                      height: 1.86,
                                    ),
                                  ),


                                  Text(
                                    " Number  ",
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                       fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w400,
                                      height: 1.50,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Target Value:',
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                       fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w600,
                                      height: 1.86,
                                    ),
                                  ),


                                  Text(
                                    " 10  ",
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                       fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                      fontWeight: FontWeight.w400,
                                      height: 1.50,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
