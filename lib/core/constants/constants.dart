class Constants {
  //static const baseUrl = 'https://jsonplaceholder.typicode.com'
  // static const baseUrl = 'http://18.224.191.201:8002/';


  // static const baseUrl = 'https://salon-symphony.tekstagearea.com/api/v1/';
  // static const baseUrl = 'https://salon-symphony-client.tekstagearea.com/api/v1/';
  // static const baseUrl = 'https://salon_adonis_qa.tekstagearea.com/api/v1/';
  static const baseUrl = 'https://api.mysalonsymphony.com/api/v1/';
  static const preSignedBaseUrl = 'https://s3-presigned-svc.tekstagearea.com/api/v1/';
  static const REPORT_A_PROBLEM = 'https://support.mysalonsymphony.com/hc/en-us/requests/new?ticket_form_id=16845001250715';
  //S3 presigned url
  static const preSignedUrl = '${preSignedBaseUrl}files';
  static const preSignedHeaderValue = "dy4KagrXutADoa6PkF2L";

  static const SignUpApiUrl = baseUrl + 'user-invitations/check-status';
  static const AccountDetailApiUrl = baseUrl + 'register';
  static const LoginApiUrl = baseUrl + 'login';
  static const GetPositionListing = baseUrl + 'positions/list';
  static const OnBoardingTasksListing = baseUrl + 'onboarding-tasks';
  static const UserOnBoardingTasks = baseUrl + 'user-onboarding-tasks';
  static const EventsListing = baseUrl + 'events';
  static const QuizQuestionAnswers = baseUrl + 'quiz-questions-answers';
  static const SurveyQuestionAnswers = baseUrl + 'survey-questions-answers';
  static const QuizAnswers = baseUrl + 'user-quiz-answers';
  static const SurveyAnswers = baseUrl + 'survey-answers';
  static const Quizzes = baseUrl + 'quizzes';
  static const users = baseUrl + 'users';
  static const forgetPasswordApiUrl = baseUrl + 'forgot-password';
  static const verifyOtpApiUrl = baseUrl + 'verify-otp';
  static const resendOtpApiUrl = baseUrl + 'resend-otp';
  static const resetPasswordApiUrl = baseUrl + 'reset-password';
  static const changePasswordApiUrl = baseUrl + 'change-password';
  static const TermsAndConditionApiUrl = baseUrl + 'page-by-slug/terms-and-conditions';
  static const PrivacyPolicyApiUrl = baseUrl + 'page-by-slug/privacy-policy';
  static const logoutApiUrl = baseUrl + 'logout-user';
  static const faqApiUrl = baseUrl + 'faqs';
  static const updateProfile = baseUrl + 'users';
  static const specialities = baseUrl + 'specialities';
  static const GetUserSchedules = baseUrl + 'user-schedules';
  static const UserSchedule = baseUrl + 'user-schedule';
  static const AddCertificate = baseUrl + 'user-certificates';
  static const MarkAllClear = baseUrl + 'mark-all-clear';
  static const GetCategories = baseUrl + 'categories';
  static const EventsReservation = baseUrl + 'event-reservations';
  static const GetTasks = baseUrl + 'tasks';
  static const NOTIFICATIONS = baseUrl + 'notifications';
  static const TasksCount = baseUrl + 'tasks-count';
  static const GetUnreadCount = baseUrl + 'get-unread-count';
  static const GetQuizzesListing = baseUrl + 'quizzes';
  static const UpdateTaskStatus = baseUrl + 'task-details';
  static const GetResources = baseUrl + 'salon-resources';
  static const AskToCancelTask = baseUrl + 'task-cancel-requests';
  static const ResourceViewStatus = baseUrl + 'user-resources-views';
  static const userRequest = baseUrl + 'user-requests';
  static const userHoursCount = baseUrl + 'user-hours-count';
  static const MarkAllRead = baseUrl + 'mark-all-read';
  static const MarkSingleRead = baseUrl + 'mark-read';
  static const goals = baseUrl + 'goals';
  static const userGoals = baseUrl + 'user-goals';
  static const categories = baseUrl + 'categories';
  static const flashcards = baseUrl + 'flashcards';
  static const flashcardScores = baseUrl + 'flashcard-scores';
  static const flashcardResult = baseUrl + 'flashcard-result';
  static const constants = baseUrl + 'constants';
  static const userReports = baseUrl + 'user-reports';
  static const rewards = baseUrl + 'user-rewards';
  static const salonDocs = baseUrl + 'salon-documents';
  static const userDocView = baseUrl + 'user-document-views';
  static const userReferrals = baseUrl + 'user-referrals';
  static const Surveys = baseUrl + 'surveys';
  static const SurveyDetail = baseUrl + 'surveys/';
  static const GetTeams = baseUrl + 'salon-team/';
  static const Search = baseUrl + 'search';
}