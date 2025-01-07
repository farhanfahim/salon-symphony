
import 'package:salon_symphony/presentation/home_events_all_page/binding/home_events_all_binding.dart';
import 'package:salon_symphony/presentation/home_events_all_page/controller/home_events_all_controller.dart';
import 'package:salon_symphony/presentation/home_events_all_page/home_events_all_page.dart';
import 'package:salon_symphony/presentation/notification_nolink_screen/binding/notification_nolink_binding.dart';
import 'package:salon_symphony/presentation/notification_nolink_screen/notification_nolink_screen.dart';
import 'package:salon_symphony/presentation/splash_one_screen/splash_one_screen.dart';
import 'package:salon_symphony/presentation/splash_one_screen/binding/splash_one_binding.dart';
import 'package:salon_symphony/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:salon_symphony/presentation/sign_in_screen/binding/sign_in_binding.dart';
import 'package:salon_symphony/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:salon_symphony/presentation/forgot_password_screen/binding/forgot_password_binding.dart';
import 'package:salon_symphony/presentation/otp_verification_screen/otp_verification_screen.dart';
import 'package:salon_symphony/presentation/otp_verification_screen/binding/otp_verification_binding.dart';
import 'package:salon_symphony/presentation/create_new_password_screen/create_new_password_screen.dart';
import 'package:salon_symphony/presentation/create_new_password_screen/binding/create_new_password_binding.dart';
import 'package:salon_symphony/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:salon_symphony/presentation/sign_up_screen/binding/sign_up_binding.dart';
import 'package:salon_symphony/presentation/sign_up_account_setup_screen/sign_up_account_setup_screen.dart';
import 'package:salon_symphony/presentation/sign_up_account_setup_screen/binding/sign_up_account_setup_binding.dart';
import 'package:salon_symphony/presentation/sign_up_account_setup_add_photo_screen/sign_up_account_setup_add_photo_screen.dart';
import 'package:salon_symphony/presentation/sign_up_account_setup_add_photo_screen/binding/sign_up_account_setup_add_photo_binding.dart';
import 'package:salon_symphony/presentation/postition_screen/postition_screen.dart';
import 'package:salon_symphony/presentation/postition_screen/binding/postition_binding.dart';
import 'package:salon_symphony/presentation/notification_screen/notification_screen.dart';
import 'package:salon_symphony/presentation/notification_screen/binding/notification_binding.dart';
import 'package:salon_symphony/presentation/home_search_screen/home_search_screen.dart';
import 'package:salon_symphony/presentation/home_search_screen/binding/home_search_binding.dart';
import 'package:salon_symphony/presentation/my_profile_screen/my_profile_screen.dart';
import 'package:salon_symphony/presentation/my_profile_screen/binding/my_profile_binding.dart';
import 'package:salon_symphony/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:salon_symphony/presentation/edit_profile_screen/binding/edit_profile_binding.dart';
import 'package:salon_symphony/presentation/my_profile_one_screen/my_profile_one_screen.dart';
import 'package:salon_symphony/presentation/my_profile_one_screen/binding/my_profile_one_binding.dart';
import 'package:salon_symphony/presentation/home_empty_container_screen/home_empty_container_screen.dart';
import 'package:salon_symphony/presentation/home_empty_container_screen/binding/home_empty_container_binding.dart';
import 'package:salon_symphony/presentation/home_screen/home_screen.dart';
import 'package:salon_symphony/presentation/home_screen/binding/home_binding.dart';
import 'package:salon_symphony/presentation/home_events_details_screen/home_events_details_screen.dart';
import 'package:salon_symphony/presentation/home_events_details_screen/binding/home_events_details_binding.dart';
import 'package:salon_symphony/presentation/resource_details_screen/resource_details_screen.dart';
import 'package:salon_symphony/presentation/resource_details_screen/binding/resource_details_binding.dart';
import 'package:salon_symphony/presentation/going_members_screen/going_members_screen.dart';
import 'package:salon_symphony/presentation/going_members_screen/binding/going_members_binding.dart';
import 'package:salon_symphony/presentation/filter_screen/filter_screen.dart';
import 'package:salon_symphony/presentation/filter_screen/binding/filter_binding.dart';
import 'package:salon_symphony/presentation/report_screen/report_screen.dart';
import 'package:salon_symphony/presentation/report_screen/binding/report_binding.dart';
import 'package:salon_symphony/presentation/event_details_screen/event_details_screen.dart';
import 'package:salon_symphony/presentation/event_details_screen/binding/event_details_binding.dart';
import 'package:salon_symphony/presentation/event_option_screen/event_option_screen.dart';
import 'package:salon_symphony/presentation/event_option_screen/binding/event_option_binding.dart';
import 'package:salon_symphony/presentation/filter_two_screen/filter_two_screen.dart';
import 'package:salon_symphony/presentation/filter_two_screen/binding/filter_two_binding.dart';
import 'package:salon_symphony/presentation/filter_six_screen/filter_six_screen.dart';
import 'package:salon_symphony/presentation/filter_six_screen/binding/filter_six_binding.dart';
import 'package:salon_symphony/presentation/quizzes_details_screen/quizzes_details_screen.dart';
import 'package:salon_symphony/presentation/quizzes_details_screen/binding/quizzes_details_binding.dart';
import 'package:salon_symphony/presentation/quizzes_details_one_screen/quizzes_details_one_screen.dart';
import 'package:salon_symphony/presentation/quizzes_details_one_screen/binding/quizzes_details_one_binding.dart';
import 'package:salon_symphony/presentation/filter_three_screen/filter_three_screen.dart';
import 'package:salon_symphony/presentation/filter_three_screen/binding/filter_three_binding.dart';
import 'package:salon_symphony/presentation/flashcards_one_screen/flashcards_one_screen.dart';
import 'package:salon_symphony/presentation/flashcards_one_screen/binding/flashcards_one_binding.dart';
import 'package:salon_symphony/presentation/flashcards_screen/flashcards_screen.dart';
import 'package:salon_symphony/presentation/flashcards_screen/binding/flashcards_binding.dart';
import 'package:salon_symphony/presentation/add_time_off_request_screen/add_time_off_request_screen.dart';
import 'package:salon_symphony/presentation/add_time_off_request_screen/binding/add_time_off_request_binding.dart';
import 'package:salon_symphony/presentation/schedule_requests_change_days_screen/schedule_requests_change_days_screen.dart';
import 'package:salon_symphony/presentation/schedule_requests_change_days_screen/binding/schedule_requests_change_days_binding.dart';
import 'package:salon_symphony/presentation/schedule_requests_change_shifts_screen/schedule_requests_change_shifts_screen.dart';
import 'package:salon_symphony/presentation/schedule_requests_change_shifts_screen/binding/schedule_requests_change_shifts_binding.dart';
import 'package:salon_symphony/presentation/chang_shift_timing_screen/chang_shift_timing_screen.dart';
import 'package:salon_symphony/presentation/chang_shift_timing_screen/binding/chang_shift_timing_binding.dart';
import 'package:salon_symphony/presentation/filter_four_screen/filter_four_screen.dart';
import 'package:salon_symphony/presentation/filter_four_screen/binding/filter_four_binding.dart';
import 'package:salon_symphony/presentation/filter_five_screen/filter_five_screen.dart';
import 'package:salon_symphony/presentation/filter_five_screen/binding/filter_five_binding.dart';
import 'package:salon_symphony/presentation/more_settings_screen/more_settings_screen.dart';
import 'package:salon_symphony/presentation/more_settings_screen/binding/more_settings_binding.dart';
import 'package:salon_symphony/presentation/more_settings_change_password_screen/more_settings_change_password_screen.dart';
import 'package:salon_symphony/presentation/more_settings_change_password_screen/binding/more_settings_change_password_binding.dart';
import 'package:salon_symphony/presentation/more_settings_faqs_screen/more_settings_faqs_screen.dart';
import 'package:salon_symphony/presentation/more_settings_faqs_screen/binding/more_settings_faqs_binding.dart';
import 'package:salon_symphony/presentation/more_settings_terms_conditions_one_screen/more_settings_terms_conditions_one_screen.dart';
import 'package:salon_symphony/presentation/more_settings_terms_conditions_one_screen/binding/more_settings_terms_conditions_one_binding.dart';
import 'package:salon_symphony/presentation/more_settings_terms_conditions_screen/more_settings_terms_conditions_screen.dart';
import 'package:salon_symphony/presentation/more_settings_terms_conditions_screen/binding/more_settings_terms_conditions_binding.dart';
import 'package:salon_symphony/presentation/settings_onboarding_checklist_screen/settings_onboarding_checklist_screen.dart';
import 'package:salon_symphony/presentation/settings_onboarding_checklist_screen/binding/settings_onboarding_checklist_binding.dart';
import 'package:salon_symphony/presentation/settings_onboarding_checklist_details_screen/settings_onboarding_checklist_details_screen.dart';
import 'package:salon_symphony/presentation/settings_onboarding_checklist_details_screen/binding/settings_onboarding_checklist_details_binding.dart';
import 'package:salon_symphony/presentation/add_new_rererral_screen/add_new_rererral_screen.dart';
import 'package:salon_symphony/presentation/add_new_rererral_screen/binding/add_new_rererral_binding.dart';
import 'package:salon_symphony/presentation/report_one_screen/report_one_screen.dart';
import 'package:salon_symphony/presentation/report_one_screen/binding/report_one_binding.dart';
import 'package:salon_symphony/presentation/filter_seven_screen/filter_seven_screen.dart';
import 'package:salon_symphony/presentation/filter_seven_screen/binding/filter_seven_binding.dart';
import 'package:salon_symphony/presentation/filter_ten_screen/filter_ten_screen.dart';
import 'package:salon_symphony/presentation/filter_ten_screen/binding/filter_ten_binding.dart';
import 'package:salon_symphony/presentation/filter_eleven_screen/filter_eleven_screen.dart';
import 'package:salon_symphony/presentation/filter_eleven_screen/binding/filter_eleven_binding.dart';
import 'package:salon_symphony/presentation/start_survey_screen/binding/start_survey_binding.dart';
import 'package:salon_symphony/presentation/start_survey_screen/start_survey_screen.dart';
import 'package:salon_symphony/presentation/survey_screen/survey_screen.dart';
import 'package:salon_symphony/presentation/survey_screen/binding/survey_binding.dart';
import 'package:salon_symphony/presentation/education_tracking_details_screen/education_tracking_details_screen.dart';
import 'package:salon_symphony/presentation/education_tracking_details_screen/binding/education_tracking_details_binding.dart';
import 'package:salon_symphony/presentation/add_add_education_tracking_screen/add_add_education_tracking_screen.dart';
import 'package:salon_symphony/presentation/add_add_education_tracking_screen/binding/add_add_education_tracking_binding.dart';
import 'package:salon_symphony/presentation/employee_dicrectry_screen/employee_dicrectry_screen.dart';
import 'package:salon_symphony/presentation/employee_dicrectry_screen/binding/employee_dicrectry_binding.dart';
import 'package:salon_symphony/presentation/employee_dicrectry_details_screen/employee_dicrectry_details_screen.dart';
import 'package:salon_symphony/presentation/employee_dicrectry_details_screen/binding/employee_dicrectry_details_binding.dart';
import 'package:salon_symphony/presentation/filter_sixteen_screen/filter_sixteen_screen.dart';
import 'package:salon_symphony/presentation/filter_sixteen_screen/binding/filter_sixteen_binding.dart';
import 'package:salon_symphony/presentation/announcements_screen/announcements_screen.dart';
import 'package:salon_symphony/presentation/announcements_screen/binding/announcements_binding.dart';
import 'package:salon_symphony/presentation/goal_details_active_screen/goal_details_active_screen.dart';
import 'package:salon_symphony/presentation/goal_details_active_screen/binding/goal_details_active_binding.dart';
import 'package:salon_symphony/presentation/documents_screen/documents_screen.dart';
import 'package:salon_symphony/presentation/documents_screen/binding/documents_binding.dart';
import 'package:salon_symphony/presentation/rewards_screen/rewards_screen.dart';
import 'package:salon_symphony/presentation/rewards_screen/binding/rewards_binding.dart';
import 'package:salon_symphony/presentation/filter_thirteen_screen/filter_thirteen_screen.dart';
import 'package:salon_symphony/presentation/filter_thirteen_screen/binding/filter_thirteen_binding.dart';
import 'package:salon_symphony/presentation/filter_fourteen_screen/filter_fourteen_screen.dart';
import 'package:salon_symphony/presentation/filter_fourteen_screen/binding/filter_fourteen_binding.dart';
import 'package:salon_symphony/presentation/filter_twelve_screen/filter_twelve_screen.dart';
import 'package:salon_symphony/presentation/filter_twelve_screen/binding/filter_twelve_binding.dart';
import 'package:salon_symphony/presentation/filter_eight_screen/filter_eight_screen.dart';
import 'package:salon_symphony/presentation/filter_eight_screen/binding/filter_eight_binding.dart';
import 'package:salon_symphony/presentation/goal_status_screen/goal_status_screen.dart';
import 'package:salon_symphony/presentation/goal_status_screen/binding/goal_status_binding.dart';
import 'package:salon_symphony/presentation/filter_nine_screen/filter_nine_screen.dart';
import 'package:salon_symphony/presentation/filter_nine_screen/binding/filter_nine_binding.dart';
import 'package:salon_symphony/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:salon_symphony/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';
import 'package:salon_symphony/presentation/task_details_screen/task_details_screen.dart';
import 'package:salon_symphony/presentation/web_view_screen/views/web_view_screen_view.dart';

import '../presentation/add_scheduale_screen/add_schedule_screen.dart';
import '../presentation/add_scheduale_screen/binding/add_schedule_binding.dart';
import '../presentation/chat_module/add_member/add_member.dart';
import '../presentation/chat_module/chat_media/chat_media.dart';
import '../presentation/chat_module/chat_media_all/chat_media_all.dart';
import '../presentation/chat_module/chatting_view/chatting_view.dart';
import '../presentation/chat_module/create_chat/create_chat.dart';
import '../presentation/chat_module/create_group_chat/binding/create_group_binding.dart';
import '../presentation/chat_module/group_info/group_info.dart';
import '../presentation/chat_module/image_view/image_view.dart';
import '../presentation/chat_module/video_view/video_view.dart';
import '../presentation/coverage_team_list/coverage_teme_list.dart';
import '../presentation/create_annual_goal_screen/binding/create_annual_goal_binding.dart';
import '../presentation/create_annual_goal_screen/create_annual_goal_screen.dart';
import '../presentation/create_custom_goal_screen/binding/create_custom_goal_binding.dart';
import '../presentation/create_custom_goal_screen/create_custom_goal_screen.dart';
import '../presentation/chat_module/create_group_chat/create_group_chat_screen.dart';
import '../presentation/create_monthly_goal_screen/binding/create_monthly_goal_binding.dart';
import '../presentation/create_monthly_goal_screen/create_monthly_goal_screen.dart';
import '../presentation/create_weekly_goal_screen/binding/create_weekly_goal_binding.dart';
import '../presentation/create_weekly_goal_screen/create_weekly_goal_screen.dart';
import '../presentation/dashboard/views/dashboard_view.dart';
import '../presentation/document_detail_screen/bindings/document_detail_binding.dart';
import '../presentation/document_detail_screen/document_detail_screen.dart';
import '../presentation/edit_time_request/edit_time_request.dart';
import '../presentation/education_tracking/binding.dart';
import '../presentation/education_tracking/education_tracking_screen.dart';
import '../presentation/flashcard_complete_screen/binding/flashcard_complete_binding.dart';
import '../presentation/flashcard_complete_screen/flashcard_complete_screen.dart';
import '../presentation/onboardingSpecialities/onboarding_specialities.dart';
import '../presentation/profile_specialities/profile_specialities.dart';
import '../presentation/quiz_quiz_perfect_score_screen/binding/quiz_quiz_perfect_score_binding.dart';
import '../presentation/quiz_quiz_perfect_score_screen/quiz_quiz_perfect_score_screen.dart';
import '../presentation/quizzes_all_screen/binding/quizzes_all_binding.dart';
import '../presentation/quizzes_all_screen/quizzes_all_screen.dart';
import '../presentation/quizzes_screen/binding/quizzes_binding.dart';
import '../presentation/quizzes_screen/quizzes_screen.dart';
import '../presentation/request_detail_time_off_screen/binding/request_detail_time_off_binding.dart';
import '../presentation/request_detail_time_off_screen/request_detail_time_off_screen.dart';
import '../presentation/schedule_request_all_page/schedule_request_all_page.dart';
import '../presentation/search_screen/binding/searchBilding.dart';
import '../presentation/search_screen/search_screen.dart';
import '../presentation/survey_complete_screen/binding/survey_complete_binding.dart';
import '../presentation/survey_complete_screen/survey_complete_screen.dart';
import '../presentation/survey_details_screen/binding/survey_details_binding.dart';
import '../presentation/survey_details_screen/survey_details_screen.dart';
import '../presentation/task_details_screen/binding/task_details_binding.dart';
import '../presentation/time_request/add_time_request.dart';

class AppRoutes {
  static String splashOneScreen = '/splash_one_screen';

  static String signInScreen = '/sign_in_screen';

  static String forgotPasswordScreen = '/forgot_password_screen';

  static String otpVerificationScreen = '/otp_verification_screen';
  static String addScheduleScreeen = '/add_schedule_screen';

  static String createNewPasswordScreen = '/create_new_password_screen';

  static String signUpScreen = '/sign_up_screen';

  static String signUpAccountSetupScreen = '/sign_up_account_setup_screen';
  static String notificationNoLinkScreen = '/notification_nolink_screen';
  static String educationTrackingScreen = '/education_tracking_screen';

  static String signUpAccountSetupAddPhotoScreen =
      '/sign_up_account_setup_add_photo_screen';

  static String signUpAccountSetupAddedPhotoScreen =
      '/sign_up_account_setup_added_photo_screen';

  static String signUpAccountSetupSelectInterestsScreen =
      '/sign_up_account_setup_select_interests_screen';

  static String signUpAccountSetupSelectedInterestsScreen =
      '/sign_up_account_setup_selected_interests_screen';

  static String signUpAccountSetupAddBioScreen =
      '/sign_up_account_setup_add_bio_screen';

  static String postitionScreen = '/postition_screen';

  static String eventDetailsGoingScreen = '/event_details_going_screen';

  static String eventDetailsCanTGoScreen = '/event_details_can_t_go_screen';

  static String eventDetailsInterestedScreen =
      '/event_details_interested_screen';

  static String notificationScreen = '/notification_screen';

  static String homeSearchScreen = '/home_search_screen';

  static String myProfileScreen = '/my_profile_screen';

  static String editProfileScreen = '/edit_profile_screen';

  static String imageView = "/image_view.dart";

  static String chatMediaAll = "/chat_media_all.dart";

  static String videoView = "/video_view.dart";

  static String myProfileOneScreen = '/my_profile_one_screen';

  static String homeEmptyContainerScreen = '/home_empty_container_screen';
  static String createChat = '/create_chat';

  static String homeScreen = '/home_screen';

  static String homeEventsDetailsScreen = '/home_events_details_screen';

  static String resourceDetailsScreen = '/resource_details_screen';

  static String goingMembersScreen = '/going_members_screen';

  static String eventOptionOneScreen = '/event_option_one_screen';

  static String filterScreen = '/filter_screen';

  static String taskDetailsScreen = '/task_details_screen';


  static String reportScreen = '/report_screen';

  static String eventDetailsScreen = '/event_details_screen';

  static String eventOptionScreen = '/event_option_screen';

  static String chattingView = '/chatting_view';

  static String chatNewChatTwoScreen = '/chat_new_chat_two_screen';

  static String chatNewChatByLocationScreen =
      '/chat_new_chat_by_location_screen';

  static String chatNewGroupScreen = '/chat_new_group_screen';

  static String chatGroupChatTwoScreen = '/chat_group_chat_two_screen';

  static String chatGroupChatInfoScreen = '/chat_group_chat_info_screen';

  static String chatGroupChatMediaScreen = '/chat_group_chat_media_screen';

  static String chatNewChatOneScreen = '/chat_new_chat_one_screen';

  static String chatNewChatScreen = '/chat_new_chat_screen';

  static String chatNewGroupOneScreen = '/chat_new_group_one_screen';

  static String chatGroupChatScreen = '/chat_group_chat_screen';

  static String chatGroupChatOneScreen = '/chat_group_chat_one_screen';

  static String chatMediaScreen = '/chat_media_screen';

  static String chatNewChatThreeScreen = '/chat_new_chat_three_screen';

  static String filterTwoScreen = '/filter_two_screen';

  static String eventOptionTwoScreen = '/event_option_two_screen';

  static String filterSixScreen = '/filter_six_screen';


  static String quizzesAllScreen = '/quizzes_all_screen';

  static String quizzesScreen = '/quizzes_screen';

  static String quizzesDetailsScreen = '/quizzes_details_screen';
  static String createGroupChat = '/create_group_chat_screen';
  static String groupInfo = '/group_info';
  static String addMember = '/add_member';

  static String quizzesDetailsOneScreen = '/quizzes_details_one_screen';

  static String quizzesDetailsTwoScreen = '/quizzes_details_two_screen';

  static String quizzesDetailsThreeScreen = '/quizzes_details_three_screen';

  static String quizQuizPerfectScoreScreen = '/quiz_quiz_perfect_score_screen';

  static String filterThreeScreen = '/filter_three_screen';

  static String flashcardsOneScreen = '/flashcards_one_screen';

  static String flashcardsScreen = '/flashcards_screen';

  static String requestDeclinedScreen = '/request_declined_screen';

  static String addTimeOffRequestScreen = '/add_time_off_request_screen';
  static String addTimeRequestScreen = '/add_time_request';
  static String requestDetailsTimeOffScreen = '/request_details_time_off_screen';

  static String scheduleRequestAllPage = '/schedule_request_all_page';
  static String scheduleRequestsChangeDaysScreen = '/schedule_requests_change_days_screen';

  static String scheduleRequestsChangeShiftsScreen =
      '/schedule_requests_change_shifts_screen';

  static String changShiftTimingScreen = '/chang_shift_timing_screen';

  static String filterFourScreen = '/filter_four_screen';

  static String filterFiveScreen = '/filter_five_screen';

  static String moreSettingsScreen = '/more_settings_screen';

  static String moreSettingsChangePasswordScreen =
      '/more_settings_change_password_screen';

  static String moreSettingsFaqsScreen = '/more_settings_faqs_screen';

  static String moreSettingsTermsConditionsOneScreen =
      '/more_settings_terms_conditions_one_screen';

  static String moreSettingsTermsConditionsScreen =
      '/more_settings_terms_conditions_screen';

  static String settingsOnboardingChecklistScreen =
      '/settings_onboarding_checklist_screen';

  static String settingsOnboardingChecklistDetailsScreen =
      '/settings_onboarding_checklist_details_screen';

  static String editTimeRequest = '/edit_time_request';
  static String addNewRererralScreen = '/add_new_rererral_screen';
  static String coverageTimeList = '/coverage_time_list';
  static String documentDetail = '/document_detail_screen';

  static String reportOneScreen = '/report_one_screen';

  static String filterSevenScreen = '/filter_seven_screen';

  static String filterTenScreen = '/filter_ten_screen';

  static String filterElevenScreen = '/filter_eleven_screen';

  static String surveyScreen = '/survey_screen';


  static String surveyDetailsThreeScreen = '/survey_details_three_screen';

  static String surveyDetailsScreen = '/survey_details_screen';
  static String StartSurvey = '/Start_survey_screen';
  static String surveyCompleteScreen = '/survey_complete_screen';
  static String flashcardCompleteScreen = '/flashcard_complete_screen';

  static String surveyDetailsOneScreen = '/survey_details_one_screen';

  static String educationTrackingDetailsScreen =
      '/education_tracking_details_screen';


  static String addAddEducationTrackingScreen =
      '/add_add_education_tracking_screen';

  static String employeeDicrectryScreen = '/employee_dicrectry_screen';
  static String searchScreen = '/search_screen';

  static String employeeDicrectryDetailsScreen =
      '/employee_dicrectry_details_screen';

  static String chatGroupChatThreeScreen = '/chat_group_chat_three_screen';

  static String createGroupScreen = '/create_group_screen';

  static String filterSixteenScreen = '/filter_sixteen_screen';


  static String announcementsScreen = '/announcements_screen';
  static String homeAllScreen = '/home_events_all_page';

  static String goalDetailsDoneScreen = '/goal_details_done_screen';

  static String goalDetailsMissedScreen = '/goal_details_missed_screen';

  static String goalDetailsActiveScreen = '/goal_details_active_screen';

  static String goalsCreateGoalScreen = '/goals_create_goal_screen';
  static String createWeeklyGoalScreen = '/create_weekly_goal_screen';
  static String createMonthlyGoalScreen = '/create_monthly_goal_screen';
  static String createAnnualGoalScreen = '/create_annual_goal_screen';
  static String createCustomGoalScreen = '/create_custom_goal_screen';

  static String documentsScreen = '/documents_screen';

  static String rewardsScreen = '/rewards_screen';

  static String filterThirteenScreen = '/filter_thirteen_screen';

  static String filterFourteenScreen = '/filter_fourteen_screen';

  static String filterTwelveScreen = '/filter_twelve_screen';

  static String filterEightScreen = '/filter_eight_screen';

  static String goalStatusScreen = '/goal_status_screen';

  static String filterNineScreen = '/filter_nine_screen';

  static String profileSpecialities = '/Profile_specialities';
  static String onboardingSpecialities = '/onboarding_specialities';

  static String appNavigationScreen = '/app_navigation_screen';

  static String initialRoute = '/initialRoute';

  //added by arsalan

  static String dashboardRoute = '/dashboardScreen';

  static String webViewRoute = '/webViewScreen';


  static List<GetPage> pages = [
    GetPage(
      name: splashOneScreen,
      page: () => SplashOneScreen(),
      bindings: [
        SplashOneBinding(),
      ],
    ),
    GetPage(
      name: signUpScreen,
      page: () => SignUpScreen(),
      bindings: [
        SignUpBinding(),
      ],
    ),
    GetPage(
      name: signInScreen,
      page: () => SignInScreen(),
      bindings: [
        SignInBinding(),
      ],
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      bindings: [
        ForgotPasswordBinding(),
      ],
    ),
    GetPage(
      name: otpVerificationScreen,
      page: () => OtpVerificationScreen(),
      bindings: [
        OtpVerificationBinding(),
      ],
    ),
    GetPage(
      name: addScheduleScreeen,
      page: () => AddScheduleScreen(),
      bindings: [
        AddScheduleBinding(),
      ],
    ),
    GetPage(
      name: createNewPasswordScreen,
      page: () => CreateNewPasswordScreen(),
      bindings: [
        CreateNewPasswordBinding(),
      ],
    ),
    GetPage(
      name: signUpAccountSetupScreen,
      page: () => SignUpAccountSetupScreen(map: Get.arguments,),
      bindings: [
        SignUpAccountSetupBinding(),
      ],
    ),
    GetPage(
      name: educationTrackingScreen,
      page: () => EducationTrackingScreen(),
      bindings: [
        EducationTrackingBinding(),
      ],
    ),
 GetPage(
      name: taskDetailsScreen,
      page: () => TaskDetailsScreen(),
      bindings: [
        TaskDetailsBinding(),
      ],
    ),


    GetPage(
      name: signUpAccountSetupAddPhotoScreen,
      page: () => SignUpAccountSetupAddPhotoScreen(map: Get.arguments,),
      bindings: [
        SignUpAccountSetupAddPhotoBinding(),
      ],
    ),
    GetPage(
      name: postitionScreen,
      page: () => PostitionScreen(),
      bindings: [
        PostitionBinding(),
      ],
    ),
    GetPage(
      name: notificationScreen,
      page: () => NotificationScreen(),
      bindings: [
        NotificationBinding(),
      ],
    ),
    GetPage(
      name: homeSearchScreen,
      page: () => HomeSearchScreen(),
      bindings: [
        HomeSearchBinding(),
      ],
    ),
    GetPage(
      name: myProfileScreen,
      page: () => MyProfileScreen(),
      bindings: [
        MyProfileBinding(),
      ],
    ),
    GetPage(
      name: editProfileScreen,
      page: () => EditProfileScreen(),
      bindings: [
        EditProfileBinding(),
      ],
    ),
    GetPage(
      name: videoView,
      page: () => VideoView(),
    ),
    GetPage(
      name: imageView,
      page: () => ImageView(),
    ),

    GetPage(
      name: chatMediaAll,
      page: () => ChatMediaAll(),
    ),

    GetPage(
      name: myProfileOneScreen,
      page: () => MyProfileOneScreen(),
      bindings: [
        MyProfileOneBinding(),
      ],
    ),
    GetPage(
      name: homeEmptyContainerScreen,
      page: () => HomeEmptyContainerScreen(),
      bindings: [
        HomeEmptyContainerBinding(),
      ],
    ),
    GetPage(
      name: createChat,
      page: () => CreateChat(),
    ),    GetPage(

      name: notificationNoLinkScreen,
      page: () => NotificationNoLinkScreen(),
      bindings: [
        NotificationNoLinkBinding(),
      ],
    ),

    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: homeEventsDetailsScreen,
      page: () => HomeEventsDetailsScreen(),
      bindings: [
        HomeEventsDetailsBinding(),
      ],
    ),
    GetPage(
      name: resourceDetailsScreen,
      page: () => ResourceDetailsScreen(),
      bindings: [
        ResourceDetailsBinding(),
      ],
    ),
    GetPage(
      name: goingMembersScreen,
      page: () => GoingMembersScreen(),
      bindings: [
        GoingMembersBinding(),
      ],
    ),

    GetPage(
      name: filterScreen,
      page: () => FilterScreen(),
      bindings: [
        FilterBinding(),
      ],
    ),
    GetPage(
      name: reportScreen,
      page: () => ReportScreen(),
      bindings: [
        ReportBinding(),
      ],
    ),
    GetPage(
      name: eventDetailsScreen,
      page: () => EventDetailsScreen(),
      bindings: [
        EventDetailsBinding(),
      ],
    ),
    GetPage(
      name: eventOptionScreen,
      page: () => EventOptionScreen(),
      bindings: [
        EventOptionBinding(),
      ],
    ),
    GetPage(
      name: chattingView,
      page: () => ChattingView(),
    ),

    GetPage(
      name: filterTwoScreen,
      page: () => FilterTwoScreen(),
      bindings: [
        FilterTwoBinding(),
      ],
    ),
    GetPage(
      name: filterSixScreen,
      page: () => FilterSixScreen(),
      bindings: [
        FilterSixBinding(),
      ],
    ),
    GetPage(
      name: quizzesScreen,
      page: () => QuizzesScreen(),
      bindings: [
        QuizzesBinding(),
      ],
    ),

    GetPage(
      name: quizQuizPerfectScoreScreen,
      page: () => QuizQuizPerfectScoreScreen(),
      bindings: [
        QuizQuizPerfectScoreBinding(),
      ],
    ),


    GetPage(
      name: quizzesAllScreen,
      page: () => QuizzesAllScreen(),
      bindings: [
        QuizzesAllBinding(),
      ],
    ),
    GetPage(
      name: quizzesDetailsScreen,
      page: () => QuizzesDetailsScreen(),
      bindings: [
        QuizzesDetailsBinding(),
      ],
    ),
    GetPage(
      name: createGroupChat,
      page: () => CreateGroupChatScreen(),
      bindings: [
        CreateGroupBinding(),
      ],
    ),
    GetPage(
      name: groupInfo,
      page: () => GroupInfo(),

    ),
    GetPage(
      name: addMember,
      page: () => AddMember(),

    ),

    GetPage(
      name: quizzesDetailsOneScreen,
      page: () => QuizzesDetailsOneScreen(),
      bindings: [
        QuizzesDetailsOneBinding(),
      ],
    ),
    GetPage(
      name: filterThreeScreen,
      page: () => FilterThreeScreen(),
      bindings: [
        FilterThreeBinding(),
      ],
    ),
    GetPage(
      name: flashcardsOneScreen,
      page: () => FlashcardsOneScreen(),
      bindings: [
        FlashcardsOneBinding(),
      ],
    ),
    GetPage(
      name: flashcardsScreen,
      page: () => FlashcardsScreen(),
      bindings: [
        FlashcardsBinding(),
      ],
    ),
    GetPage(
      name: addTimeOffRequestScreen,
      page: () => AddTimeOffRequestScreen(),
      bindings: [
        AddTimeOffRequestBinding(),
      ],
    ),
    GetPage(
      name: addTimeRequestScreen,
      page: () => AddTimeRequest(),
    ),
    GetPage(
      name: requestDetailsTimeOffScreen,
      page: () => RequestDetailsTimeOffScreen(),
      bindings: [
        RequestDetailsTimeOffBinding(),
      ],
    ),


    GetPage(
      name: scheduleRequestsChangeDaysScreen,
      page: () => ScheduleRequestsChangeDaysScreen(),
      bindings: [
        ScheduleRequestsChangeDaysBinding(),
      ],
    ),
    GetPage(
      name: scheduleRequestAllPage,
      page: () => ScheduleRequestAllPage(),

    ),

    GetPage(
      name: scheduleRequestsChangeShiftsScreen,
      page: () => ScheduleRequestsChangeShiftsScreen(),
      bindings: [
        ScheduleRequestsChangeShiftsBinding(),
      ],
    ),
    GetPage(
      name: changShiftTimingScreen,
      page: () => ChangShiftTimingScreen(),
      bindings: [
        ChangShiftTimingBinding(),
      ],
    ),
    GetPage(
      name: filterFourScreen,
      page: () => FilterFourScreen(),
      bindings: [
        FilterFourBinding(),
      ],
    ),

    GetPage(
      name: filterFiveScreen,
      page: () => FilterFiveScreen(),
      bindings: [
        FilterFiveBinding(),
      ],
    ),
    GetPage(
      name: moreSettingsScreen,
      page: () => MoreSettingsScreen(),
      bindings: [
        MoreSettingsBinding(),
      ],
    ),
    GetPage(
      name: moreSettingsChangePasswordScreen,
      page: () => MoreSettingsChangePasswordScreen(),
      bindings: [
        MoreSettingsChangePasswordBinding(),
      ],
    ),
    GetPage(
      name: moreSettingsFaqsScreen,
      page: () => MoreSettingsFaqsScreen(),
      bindings: [
        MoreSettingsFaqsBinding(),
      ],
    ),
    GetPage(
      name: moreSettingsTermsConditionsOneScreen,
      page: () => MoreSettingsTermsConditionsOneScreen(),
      bindings: [
        MoreSettingsTermsConditionsOneBinding(),
      ],
    ),
    GetPage(
      name: moreSettingsTermsConditionsScreen,
      page: () => MoreSettingsTermsConditionsScreen(),
      bindings: [
        MoreSettingsTermsConditionsBinding(),
      ],
    ),
    GetPage(
      name: settingsOnboardingChecklistScreen,
      page: () => SettingsOnboardingChecklistScreen(),
      bindings: [
        SettingsOnboardingChecklistBinding(),
      ],
    ),
    GetPage(
      name: settingsOnboardingChecklistDetailsScreen,
      page: () => SettingsOnboardingChecklistDetailsScreen(),
      bindings: [
        SettingsOnboardingChecklistDetailsBinding(),
      ],
    ),
    GetPage(
      name: addNewRererralScreen,
      page: () => AddNewRererralScreen(),
      bindings: [
        AddNewRererralBinding(),
      ],
    ),
    GetPage(
      name: editTimeRequest,
      page: () => EditTimeRequest(),
    ),

    GetPage(
      name: coverageTimeList,
      page: () => CoverageTeamListScreen(),

    ),
    GetPage(
      name: documentDetail,
      page: () => DocumentDetailScreen(),
      bindings: [
        DocumentDetailBinding(),
      ],
    ),


    GetPage(
      name: reportOneScreen,
      page: () => ReportOneScreen(),
      bindings: [
        ReportOneBinding(),
      ],
    ),
    GetPage(
      name: filterSevenScreen,
      page: () => FilterSevenScreen(),
      bindings: [
        FilterSevenBinding(),
      ],
    ),
    GetPage(
      name: filterTenScreen,
      page: () => FilterTenScreen(),
      bindings: [
        FilterTenBinding(),
      ],
    ),
    GetPage(
      name: filterElevenScreen,
      page: () => FilterElevenScreen(),
      bindings: [
        FilterElevenBinding(),
      ],
    ),
    GetPage(
      name: surveyScreen,
      page: () => SurveyScreen(),
      bindings: [
        SurveyBinding(),
      ],
    ),
    GetPage(
      name: surveyDetailsScreen,
      page: () => SurveyDetailsScreen(),
      bindings: [
        SurveyDetailsBinding(),
      ],
    ),
    GetPage(
      name: StartSurvey,
      page: () => StartSurveyScreen(),
      bindings: [
        StartSurveyBinding(),
      ],
    ),
    GetPage(
      name: flashcardCompleteScreen,
      page: () => FlashcardCompleteScreen(),
      bindings: [
        FlashcardCompleteBinding(),
      ],
    ),

    GetPage(
      name: surveyCompleteScreen,
      page: () => SurveyComplete(),
      bindings: [
        SurveyCompleteBinding(),
      ],
    ),
    GetPage(
      name: educationTrackingDetailsScreen,
      page: () => EducationTrackingDetailsScreen(),
      bindings: [
        EducationTrackingDetailsBinding(),
      ],
    ),
    GetPage(
      name: addAddEducationTrackingScreen,
      page: () => AddAddEducationTrackingScreen(),
      bindings: [
        AddAddEducationTrackingBinding(),
      ],
    ),
    GetPage(
      name: employeeDicrectryScreen,
      page: () => EmployeeDicrectryScreen(),
      bindings: [
        EmployeeDicrectryBinding(),
      ],
    ),
    GetPage(
      name: employeeDicrectryDetailsScreen,
      page: () => EmployeeDicrectryDetailsScreen(map: Get.arguments,),
      bindings: [
        EmployeeDicrectryDetailsBinding(),
      ],
    ),
    GetPage(
      name: searchScreen,
      page: () => SearchScreen(),
      bindings: [
        SearchBinding(),
      ],
    ),
    GetPage(
      name: filterSixteenScreen,
      page: () => FilterSixteenScreen(),
      bindings: [
        FilterSixteenBinding(),
      ],
    ),

    GetPage(
      name: announcementsScreen,
      page: () => AnnouncementsScreen(),
      bindings: [
        AnnouncementsBinding(),
      ],
    ),

    GetPage(
      name: homeAllScreen,
      page: () => HomeEventsAllPage(),
      bindings: [
        HomeEventsAllBinding(),
      ],
    ),

    GetPage(
      name: goalDetailsActiveScreen,
      page: () => GoalDetailsActiveScreen(),
      bindings: [
        GoalDetailsActiveBinding(),
      ],
    ),

    GetPage(
      name: createWeeklyGoalScreen,
      page: () => CreateWeeklyGoalScreen(),
      bindings: [
        CreateWeeklyGoalBinding(),
      ],
    ),

    GetPage(
      name: createMonthlyGoalScreen,
      page: () => CreateMonthlyGoalScreen(),
      bindings: [
        CreateMonthlyGoalBinding(),
      ],
    ),

    GetPage(
      name: createAnnualGoalScreen,
      page: () => CreateAnnualGoalScreen(),
      bindings: [
        CreateAnnualGoalBinding(),
      ],
    ),

    GetPage(
      name: createCustomGoalScreen,
      page: () => CreateCustomGoalScreen(),
      bindings: [
        CreateCustomGoalBinding(),
      ],
    ),

    GetPage(
      name: documentsScreen,
      page: () => DocumentsScreen(),
      bindings: [
        DocumentsBinding(),
      ],
    ),
    GetPage(
      name: rewardsScreen,
      page: () => RewardsScreen(),
      bindings: [
        RewardsBinding(),
      ],
    ),
    GetPage(
      name: filterThirteenScreen,
      page: () => FilterThirteenScreen(),
      bindings: [
        FilterThirteenBinding(),
      ],
    ),
    GetPage(
      name: filterFourteenScreen,
      page: () => FilterFourteenScreen(),
      bindings: [
        FilterFourteenBinding(),
      ],
    ),
    GetPage(
      name: filterTwelveScreen,
      page: () => FilterTwelveScreen(),
      bindings: [
        FilterTwelveBinding(),
      ],
    ),
    GetPage(
      name: filterEightScreen,
      page: () => FilterEightScreen(),
      bindings: [
        FilterEightBinding(),
      ],
    ),
    GetPage(
      name: goalStatusScreen,
      page: () => GoalStatusScreen(),
      bindings: [
        GoalStatusBinding(),
      ],
    ),
    GetPage(
      name: profileSpecialities,
      page: () => ProfileSpecialities(),
    ),
    GetPage(
      name: onboardingSpecialities,
      page: () => OnboardingSpecialities(map: Get.arguments,),
    ),

    GetPage(
      name: filterNineScreen,
      page: () => FilterNineScreen(),
      bindings: [
        FilterNineBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashOneScreen(),
      bindings: [
        SplashOneBinding(),
      ],
    ),
    //  added by arsalan
    GetPage(
      name: dashboardRoute,
      page: () => DashboardScreen(),
    ),
    GetPage(
      name: webViewRoute,
      page: () => WebViewScreenView(),
    ),
  ];
}
