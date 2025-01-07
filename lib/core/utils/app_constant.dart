

import 'dart:io';

class AppConstant {

  //Deeplink base url
  // static String shareBaseUrl = 'https://api.mysalonsymphony.com';
  static const shareBaseUrl = 'https://mysalonsymphony.com';
  static String APP_NAME = 'SalonSymphony';
  static String SHARE_DESC = 'Salon Symphony App link';
  static String SHARE = 'Share';

  static int EDUCATION_REQUEST = 10;
  static int TIME_OFF_REQUEST = 20;
  static int SCHEDULE_REQUEST = 30;
  static int EDUCATION_REIMBURSEMENT = 40;


  static int CHANGE_DAY = 160;
  static int CHANGE_SHIFT = 150;



  static int NO = 10;
  static int YES = 20;

  static int UN_VIEWED = 10;
  static int VIEWED = 20;


  static int AVAILABLITY = 20;
  static String USER = "3";


  static int HOURS = 10;
  static int REIMBURSEMENT = 20;

  static int INACTIVE = 20;

  static int ACTIVE = 10;
  static int ACHIEVED = 20;
  static int MISSED = 30;

  static int REQUEST_PENDING = 10;
  static int REQUEST_DECLINE = 30;
  static int REQUEST_APPROVED = 20;

  static int PENDING = 10;
  static int APPROVED = 20;

  static int LEARNING = 10;
  static int KNOWN = 20;


  static int WEEKLY = 10;
  static int MONTHLY = 20;
  static int ANNUALLY = 30;
  static int CUSTOM = 40;


  static int NOLINK = 10;
  static int INTERNALLINK = 30;
  static int EXTERNALLINK = 20;


  // hire checklist navigations.







  static int DOLLAR = 10;
  static int PERCENTAGE = 20;
  static int NUMBERIC = 30;

  static int STARTED = 10;
  static int COMPLETED = 20;
  static int NOT_STARTED = 30;

  static int STILL_LEARNING = 10;
  static int TOTALY_KNOW = 20;

  static String   TODO = 'TO DO';
  static String   DONE = 'DONE';
  static String   OVERDUE = 'OVERDUE';
// tasks
  static int TASK_TODO = 10;
  static int TASK_OVERDUE = 20;
  static int TASK_DONE = 30;


 static int ISAPPROVED = 20;
 static int ISNOTAPPROVED = 10;
 static int ISPAGINATED = 1;
 static int TASKSTATUS = 10;

 //Search Module
 static int RESOURCES = 10;
 static int EVENTS = 20;
 static int TASKS = 30;
 static int GOALS = 40;
 static int DOCUMENTS = 50;
 static int SURVEY = 60;
 static int FLASHCARDS = 70;
 static int QUIZ = 80;
 static int MEMBERS = 90;
 static int ALERTS = 100;
 static int REQUESTS = 110;
 static int ONBOARDING = 120;

 static String   reportType = 'report-reasons';
 static String   instanceType = 'user';



 // route name
  static String GOALSSCREEN = 'goalScreen';
  static String SEARCHSCREEN = 'searchScreen';

  // NOTIFICATIONS
  static int RESOURCES_NOTI =10;
  static int EVENTS_NOTI= 20;
  static int TASKS_NOTI = 30;
  static int GOALS_NOTI = 40;
  static int DOCUMENTS_NOTI = 50;
  static int SURVEYS_NOTI = 60;
  static int FLASHCARDS_NOTI = 70;
  static int QUIZZES_NOTI = 80;
  static int MEMBERS_NOTI = 90;
  static int ALERTS_NOTI = 100;
  static int REQUESTS_NOTI = 110;
  static int ONBOARDING_NOTI = 120;

  // SURVEY SCREEN TYPE
 static int SINGLE_SELECT = 10;
 static int IMAGE_SELECT = 20;
 static int MULTI_SELECT = 30;
  static int STAR_RATING = 40;
  static int EMOJI_RAITING = 50;
  static int SHORT_ANSWER = 60;

  // route name
  static const String moduleResources = 'resources';
  static const String moduleEvents = 'events';
  static const String moduleGoals = 'goals';
  static const String moduleFlashcards = 'flashcards';
  static const String moduleTasks = 'tasks';
  static const String moduleSurveys = 'surveys';
  static const String moduleQuizzes = 'quizzes';
  static const String moduleRequests = 'requests';
  static const String moduleSettings = 'settings';
  static const String moduleTeam = 'team';
  static const String moduleTeamMembers = 'members';
  static const String moduleTeamDocs = 'docs';
  static const String moduleTeamOnboarding = 'onboarding';
}
