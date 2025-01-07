import 'package:salon_symphony/core/app_export.dart';

import 'image_constant.dart';

class DummyContent {
  static List<dataModel> positions = [
    dataModel(id: 1, name: 'Stylist',selected: false.obs),
    dataModel(id: 2, name: 'Barber',selected: false.obs),
    dataModel(id: 3, name: 'Manager',selected: false.obs),
    dataModel(id: 4, name: 'Esthetician',selected: false.obs),
    dataModel(id: 5, name: 'Receptionist',selected: false.obs),
    dataModel(id: 6, name: 'Guest Services',selected: false.obs),
    dataModel(id: 7, name: 'Nail Tech',selected: false.obs),
    dataModel(id: 8, name: 'Makeup Artist',selected: false.obs),
    dataModel(id: 9, name: 'Massage Therapist',selected: false.obs),
    dataModel(id: 10, name: 'Owner-Operator',selected: false.obs),
    dataModel(id: 11, name: 'Administrative',selected: false.obs),
    dataModel(id: 12, name: 'Other',selected: false.obs),
  ];
  static List<dataModelEdit> positionsEdit = [
    dataModelEdit(id: 1, name: 'Stylist',selected: false.obs),
    dataModelEdit(id: 2, name: 'Barber',selected: false.obs),
    dataModelEdit(id: 3, name: 'Manager',selected: false.obs),
    dataModelEdit(id: 4, name: 'Esthetician',selected: false.obs),
    dataModelEdit(id: 5, name: 'Receptionist',selected: false.obs),
    dataModelEdit(id: 6, name: 'Guest Services',selected: false.obs),
    dataModelEdit(id: 7, name: 'Nail Tech',selected: false.obs),
    dataModelEdit(id: 8, name: 'Makeup Artist',selected: false.obs),
    dataModelEdit(id: 9, name: 'Massage Therapist',selected: false.obs),
    dataModelEdit(id: 10, name: 'Owner-Operator',selected: false.obs),
    dataModelEdit(id: 11, name: 'Administrative',selected: false.obs),
    dataModelEdit(id: 12, name: 'Other',selected: false.obs),
  ];


  static List<ExperienceModel> experience = [
    ExperienceModel(id: 1, name: 'None',selected: false.obs),
    ExperienceModel(id: 2, name: '1 Year',selected: false.obs),
    ExperienceModel(id: 3, name: '2 Years',selected: false.obs),
    ExperienceModel(id: 4, name: '3 Years',selected: false.obs),
    ExperienceModel(id: 5, name: '4 Years',selected: false.obs),
    ExperienceModel(id: 6, name: '5 Years',selected: false.obs),
    ExperienceModel(id: 7, name: '6 Years',selected: false.obs),
    ExperienceModel(id: 8, name: '7+ Years',selected: false.obs),
    ExperienceModel(id: 9, name: 'Unsure',selected: false.obs),

  ];

  static List<DaysModel> days = [
    DaysModel(id: 1, name: 'Monday',selected: false.obs),
    DaysModel(id: 2, name: 'Tuesday',selected: false.obs),
    DaysModel(id: 3, name: 'Wednesday',selected: false.obs),
    DaysModel(id: 4, name: 'Thursday',selected: false.obs),
    DaysModel(id: 5, name: 'Friday',selected: false.obs),
    DaysModel(id: 6, name: 'Saturday',selected: false.obs),
    DaysModel(id: 7, name: 'Sunday',selected: false.obs),

  ];

  static List<LeaveModel> leaves = [
    LeaveModel(id: 70, name: 'Sick',selected: false.obs),
    LeaveModel(id: 80, name: 'Vacation',selected: false.obs),
    LeaveModel(id: 90, name: 'Personal',selected: false.obs),
    LeaveModel(id: 100, name: 'Education',selected: false.obs),
    LeaveModel(id: 110, name: 'FMLA',selected: false.obs),
    LeaveModel(id: 120, name: 'Medical',selected: false.obs),
    LeaveModel(id: 140, name: 'Bereavement',selected: false.obs),

  ];
  static List<PaymentModel> payments = [
    PaymentModel(id: 10, name: 'Cash',selected: false.obs),
    PaymentModel(id: 20, name: 'Check',selected: false.obs),
    PaymentModel(id: 30, name: 'Credit Card',selected: false.obs),
    PaymentModel(id: 40, name: 'Mobile Payment',selected: false.obs),
  ];

  static List<ForeverModel> forever = [
    ForeverModel(id: 10, name: 'Forever',selected: false.obs,des: 'Repeat this goal until deleted'),
    ForeverModel(id: 20, name: 'For 1 Month',selected: false.obs,des:'Repeats every week for one month'),
    ForeverModel(id: 30, name: 'For 3 Months',selected: false.obs,des:'Repeats every week for three months'),

  ];

  static List<ForeverModel> forever2 = [
    ForeverModel(id: 10, name: 'Forever',selected: false.obs,des: 'Repeat this goal until deleted'),
    ForeverModel(id: 30, name: 'For 3 Months',selected: false.obs,des:'Repeats every month for three months'),
    ForeverModel(id: 40, name: 'For 6 Months',selected: false.obs,des:'Repeats every month for six months'),

  ];
  static List<AmountModel> amount = [
    AmountModel(id: 10, name: 'Monetary',selected: false.obs,des: "Any dollar amount, ex. \$13.50 RPCT"),
    AmountModel(id: 20, name: 'Percentage',selected: false.obs,des:'Any percentage, ex. 85% client retention rate'),
    AmountModel(id: 30, name: 'Numerical',selected: false.obs,des:'Any number value, ex. 30 add-on treatments'),

  ];

  static List<AmountModel> amountMonthly = [
    AmountModel(id: 10, name: 'Monetary',selected: false.obs,des: "Any dollar amount, ex. \$13.50 RPCT"),
    AmountModel(id: 20, name: 'Percentage',selected: false.obs,des:'Any percentage, ex. 85% client retention rate'),
    AmountModel(id: 30, name: 'Numerical',selected: false.obs,des:'Any number value, ex. 30 add-on treatments'),

  ];

  static List<AmountModel> amountAnnual = [
    AmountModel(id: 10, name: 'Monetary',selected: false.obs,des: "Any dollar amount, ex. \$13.50 RPCT"),
    AmountModel(id: 20, name: 'Percentage',selected: false.obs,des:'Any percentage, ex. 85% client retention rate'),
    AmountModel(id: 30, name: 'Numerical',selected: false.obs,des:'Any number value, ex. 30 add-on treatments'),

  ];

  static List<AmountModel> amountCustom = [
    AmountModel(id: 10, name: 'Monetary',selected: false.obs,des: "Any dollar amount, ex. \$13.50 RPCT"),
    AmountModel(id: 20, name: 'Percentage',selected: false.obs,des:'Any percentage, ex. 85% client retention rate'),
    AmountModel(id: 30, name: 'Numerical',selected: false.obs,des:'Any number value, ex. 30 add-on treatments'),

  ];




  static List<AddRequestModel> addRequest = [
    AddRequestModel(id: 1, name: 'Time Off Request',selected: false.obs,des: "Like vocation, personal,sick time etc"),
    AddRequestModel(id: 2, name: 'Schedule Request',selected: false.obs,des:'Like schedule and shift changes'),
    AddRequestModel(id: 3, name: 'Education Request',selected: false.obs,des:'Like education hours and reimbursement'),

  ];
  static List<requestFilterModel> requestFilter = [
    requestFilterModel(id: 1, name: 'All',selected: false.obs),
    requestFilterModel(id: 1, name: 'Time',selected: false.obs),
    requestFilterModel(id: 2, name: 'Schedule',selected: false.obs),
    requestFilterModel(id: 3, name: 'Education',selected: false.obs),

  ];

  static List<RelationModel> relation = [
    RelationModel(id: 1, name: 'Friend',selected: false.obs),
    RelationModel(id: 2, name: 'Family',selected: false.obs),
    RelationModel(id: 3, name: 'Peer',selected: false.obs),
    RelationModel(id: 4, name: 'Others',selected: false.obs),

  ];

  static List<RelationModel> relation2 = [
    RelationModel(id: 10, name: 'Single',selected: false.obs),
    RelationModel(id: 20, name: 'Dating',selected: false.obs),
    RelationModel(id: 30, name: 'Engaged',selected: false.obs),
    RelationModel(id: 40, name: 'Married',selected: false.obs),
    RelationModel(id: 50, name: 'Hidden (hides relationship status)',selected: false.obs),

  ];

  static List<dataModel2> intrests = [
    dataModel2(id: 1, name: 'Balayage', selected: false),
    dataModel2(id: 2, name: 'Blonding', selected: false),
    dataModel2(id: 3, name: 'Blowouts', selected: false),
    dataModel2(id: 4, name: 'Braiding', selected: false),
    dataModel2(id: 5, name: 'Coloring', selected: false),
    dataModel2(id: 6, name: 'Cutting', selected: false),
    dataModel2(id: 7, name: 'Curly Hair', selected: false),
    dataModel2(id: 8, name: 'Extensions', selected: false),
    dataModel2(id: 9, name: 'Hightligts', selected: false),
    dataModel2(id: 10, name: 'Lashes', selected: false),
    dataModel2(id: 11, name: 'Layering', selected: false),
    dataModel2(id: 12, name: 'Makeup', selected: false),
    dataModel2(id: 13, name: 'Men Cuts', selected: false),
    dataModel2(id: 14, name: 'Textures', selected: false),
    dataModel2(id: 15, name: 'Waxing', selected: false),
    dataModel2(id: 16, name: 'Weddings', selected: false),
    dataModel2(id: 17, name: 'Extensions', selected: false),
    dataModel2(id: 18, name: 'Hightligts', selected: false),
    dataModel2(id: 19, name: 'Lashes', selected: false),
    dataModel2(id: 20, name: 'Layering', selected: false),
    dataModel2(id: 21, name: 'Makeup', selected: false),
    dataModel2(id: 22, name: 'Men Cuts', selected: false),
    dataModel2(id: 23, name: 'Textures', selected: false),
    dataModel2(id: 24, name: 'Waxing', selected: false),
    dataModel2(id: 25, name: 'Weddings', selected: false),
  ];

  static List<dataModel3> eventIntrust = [

    dataModel3(
        id: 10,
        name: 'Going',
        image: ImageConstant.imageGoingEmoji,
        selected: false.obs),
    dataModel3(
        id: 20,
        name: 'Interested',
        image: ImageConstant.imageInturstedEmoji,
        selected: false.obs),
    dataModel3(
        id: 30,
        name: 'Can’t Go',
        image: ImageConstant.imageCantGoEmoji,
        selected: false.obs),
    dataModel3(
        id: 40,
        name: 'RSVP',
        image: ImageConstant.imageGoingEmoji,
        selected: true.obs),
  ];

  static List<FAQ> FAQS = [
    FAQ(
        number: 1,
        header: 'Frequently Asked Question 1',
        desc:
            'This is dummy copy. It is not meant to be read. It has been placed here solely to demonstrate the look and feel of finished, typeset text. Only for show. He who searches for meaning here will be sorely ',
        visible: false),
    FAQ(
        number: 3,
        header: 'Frequently Asked Question 2',
        desc:
            'This is dummy copy. It is not meant to be read. It has been placed here solely to demonstrate the look and feel of finished, typeset text. Only for show. He who searches for meaning here will be sorely ',
        visible: false),
    FAQ(
        number: 4,
        header: 'Frequently Asked Question 3',
        desc:
            'This is dummy copy. It is not meant to be read. It has been placed here solely to demonstrate the look and feel of finished, typeset text. Only for show. He who searches for meaning here will be sorely ',
        visible: false),
    FAQ(
        number: 5,
        header: 'Frequently Asked Question 4',
        desc:
            'This is dummy copy. It is not meant to be read. It has been placed here solely to demonstrate the look and feel of finished, typeset text. Only for show. He who searches for meaning here will be sorely ',
        visible: false),
    FAQ(
        number: 6,
        header: 'Frequently Asked Question 5',
        desc:
            'This is dummy copy. It is not meant to be read. It has been placed here solely to demonstrate the look and feel of finished, typeset text. Only for show. He who searches for meaning here will be sorely ',
        visible: false),
    FAQ(
        number: 7,
        header: 'Frequently Asked Question 6',
        desc:
            'This is dummy copy. It is not meant to be read. It has been placed here solely to demonstrate the look and feel of finished, typeset text. Only for show. He who searches for meaning here will be sorely ',
        visible: false),
    FAQ(
        number: 8,
        header: 'Frequently Asked Question 7',
        desc:
            'This is dummy copy. It is not meant to be read. It has been placed here solely to demonstrate the look and feel of finished, typeset text. Only for show. He who searches for meaning here will be sorely ',
        visible: false),
    FAQ(
        number: 9,
        header:
            'Frequently Asked Question 8',
        desc:
            'This is dummy copy. It is not meant to be read. It has been placed here solely to demonstrate the look and feel of finished, typeset text. Only for show. He who searches for meaning here will be sorely ',
        visible: false),
  ];

  static List Notitfications = [
    Notifications(
      read: false,
      description: """Black Friday Sale""",
      heading: 'Erin Lipshutz',
      time: DateTime.now(),
      image: ImageConstant.imgRectangle141650X50,
      // redirect: AppRoutes.productDetailScreen,
    ),
    Notifications(
      read: false,
      heading: 'Arsal',
      description: 'Winter Friday Sale',
      time: DateTime.now(),
      image: ImageConstant.imgRectangle14162,
      // redirect: AppRoutes.productDetailScreen,
    ),
    Notifications(
      read: true,
      heading: 'Alex',
      description: 'Big Saver Sale',
      time: DateTime(
          DateTime.now().year, DateTime.now().month - 1, DateTime.now().day),
      image: ImageConstant.imgRectangle14163,
      // redirect: AppRoutes.productDetailScreen,
    ),
    Notifications(
      read: false,
      heading: 'Zinta',
      description: 'Walk, daily exercise, and low calories food to be taken...',
      time: DateTime(DateTime.now().year, DateTime.now().month - 5,
          DateTime.now().day - 5),
      image: ImageConstant.imgRectangle14164,
      // redirect: AppRoutes.productDetailScreen,
    ),
    Notifications(
      read: true,
      heading: 'Skylar Septimus',
      description: 'Walk, daily exercise, and low',
      time: DateTime(DateTime.now().year, DateTime.now().month - 2,
          DateTime.now().day - 3),
      image: ImageConstant.imgRectangle14165,
      // redirect: AppRoutes.productDetailScreen,
    ),
  ];
  //
  // static List Chating = [
  //   chat(
  //       senderId: '1',
  //       message: 'Hi! howw may i help u',
  //       profilePic: ImageConstant.imgLogosecretpixe,
  //       createdDate: '08:00 PM'),
  //   chat(
  //       senderId: '0',
  //       message: 'Hi! howw may i help u',
  //       profilePic: ImageConstant.imgBitmap,
  //       createdDate: '08:00 PM'),
  //   chat(
  //       senderId: '1',
  //       message: 'Hi! i am not able to visit',
  //       profilePic: ImageConstant.imgLogosecretpixe,
  //       createdDate: '08:05 PM'),
  //   chat(
  //       senderId: '1',
  //       message: 'kindly look into this',
  //       profilePic: ImageConstant.imgLogosecretpixe,
  //       createdDate: '08:06 PM'),
  //   chat(
  //       senderId: '0',
  //       message: 'Hi! i am not able to visit',
  //       profilePic: ImageConstant.imgBitmap,
  //       createdDate: '09:00 PM'),
  //   chat(
  //       senderId: '1',
  //       message: 'Hi! howw may i help u',
  //       profilePic: ImageConstant.imgLogosecretpixe,
  //       createdDate: '10:00 PM'),
  //   chat(
  //       senderId: '0',
  //       message: 'Hi! howw may i help u',
  //       profilePic: ImageConstant.imgBitmap,
  //       createdDate: '11:00 PM'),
  // ];


  static List<quizFilter> quizData = [
    quizFilter(id: 1, name: 'All Quizzes', selected: false.obs,status: 0),
    quizFilter(id: 3, name: 'Not Started', selected: false.obs,status: 10),
    quizFilter(id: 2, name: 'Low Scores', selected: false.obs,status: 30),
    quizFilter(id: 4, name: 'High Scores', selected: false.obs ,status: 20),
  ];
  static List<quizModel> flashData = [

    quizModel(id: 0, name: 'All Sets', selected: false.obs),
    quizModel(id: 10, name: 'Started', selected: false.obs),
    quizModel(id: 20, name: 'Completed', selected: false.obs),
    quizModel(id: 30, name: 'Not Started', selected: false.obs),
  ];

  static List<createChatModel> createChatData = [
    createChatModel(id: 1, name: 'Select Members',des: 'Create a custom group of selected members', selected: false.obs),
    createChatModel(id: 2, name: 'Select Positions', des: 'All members with  the same position title',selected: false.obs),
    createChatModel(id: 3, name: 'Select Locations',des: 'All members who work at the same location', selected: false.obs),
  ];

  static List<createChatModel> chatUsers = [
    createChatModel(id: 1, name: 'Gretchen Siphron',des: ImageConstant.imgRectangle14164, selected: false.obs),
    createChatModel(id: 1, name: 'Jakob Baptista',des: ImageConstant.imgRectangle1416, selected: false.obs),
    createChatModel(id: 1, name: 'Tiana Stanton',des: ImageConstant.imgRectangle18263, selected: false.obs),
    createChatModel(id: 1, name: 'Skylar Septimus',des: ImageConstant.imgRectangle854, selected: false.obs),
    createChatModel(id: 1, name: 'Kianna Schleifer',des: ImageConstant.imgRectangle853, selected: false.obs),
    createChatModel(id: 1, name: 'Terry Philips',des: ImageConstant.imgRectangle18263, selected: false.obs),
    createChatModel(id: 1, name: 'Emery Dias',des: ImageConstant.imgRectangle18263111X111, selected: false.obs),
    createChatModel(id: 1, name: 'Tiana Dorwart',des: ImageConstant.imgRectangle85180X343, selected: false.obs),
  ];

  static List<ReportModel> reportData = [
    ReportModel(id: 1, name: 'Copyright violation' ),
    ReportModel(id: 2, name: 'Harassment'),
    ReportModel(id: 3, name: 'Spam'),
    ReportModel(id: 4, name: 'Nudity'),
    ReportModel(id: 4, name: 'Violence'),
    ReportModel(id: 4, name: 'Suicide or self - injury'),
    ReportModel(id: 4, name: 'False Information'),
    ReportModel(id: 4, name: 'Hate Speech'),
    ReportModel(id: 4, name: 'Intellectual Property'),
  ];


  static List<ReportModelForChat> chatBottomData = [
    ReportModelForChat(id: 1, name: 'Report User'.obs ),
    ReportModelForChat(id: 2, name: 'Block User'.obs),
    ReportModelForChat(id: 3, name: 'Delete Chat'.obs),
    ReportModelForChat(id: 4, name: 'Leave Group'.obs),
    ReportModelForChat(id: 5, name: 'Report a Problem'.obs),
  ];

  static List<quizModel> filterDataList = [
    quizModel(id: 1, name: 'Dollar Target', selected: false.obs),
    quizModel(id: 2, name: 'Percent Target', selected: false.obs),
    quizModel(id: 3, name: 'Number Target', selected: false.obs),
  ];

  static List<goalsBottomSheet> goalsData = [
    goalsBottomSheet(subCatId: '1', subCatName: 'All', selected: false.obs),
    goalsBottomSheet(subCatId: '2', subCatName: 'Dollar Targets', selected: false.obs),
    goalsBottomSheet(subCatId: '3', subCatName: 'Percent Targets', selected: false.obs),
    goalsBottomSheet(subCatId: '4', subCatName: 'Number Targets', selected: false.obs),
  ];

  static List<createChatModel> purposeDataList = [
    createChatModel(id: 30, name: 'Tools & Supplies',des: 'Like gloves, shears, wax, etc.', selected: false.obs),
    createChatModel(id: 40, name: 'Travel & Accommodation', des: 'Like tolls, gas, hotels, airfare, etc.  ',selected: false.obs),
    createChatModel(id: 50, name: 'Meals & Entertainment',des: 'Like dinners, registration fees, etc.', selected: false.obs),
    createChatModel(id: 60, name: 'Education Costs',des: 'Like tuition, classes, conferences, etc.', selected: false.obs),
  ];

  static List<filter> FilterDate = [
    filter(categoryId: '1', categoryName: 'Categories', show: true, sub: [
      subCategory(subCatId: '1', subCatName: 'Grocery', selected: false),
      subCategory(subCatId: '2', subCatName: 'Fresh Food', selected: false),
      subCategory(subCatId: '3', subCatName: 'Electronics', selected: false),
      subCategory(subCatId: '4', subCatName: 'Mobiles', selected: false),
      subCategory(subCatId: '5', subCatName: 'Home & Livivg', selected: false),
      subCategory(subCatId: '6', subCatName: 'Style', selected: false),
    ]),
    filter(categoryId: '2', categoryName: 'Store Name', show: true, sub: [
      subCategory(subCatId: '1', subCatName: 'LuLu', selected: false),
      subCategory(subCatId: '2', subCatName: 'Carrefour', selected: false),
      subCategory(subCatId: '3', subCatName: 'Amazon', selected: false),
      subCategory(subCatId: '4', subCatName: 'Noon', selected: false),
    ]),
  ];

  static List<eventDataModel> EventsList = [
    eventDataModel(
      eventId: '1',
      eventName: 'Skincare Training Workshop',
      eventDate: 'MON, FEB 2 AT 9:30 AM EST',
      eventAddress: '151 Ocean View Blvd, Scarborough, ME',
      eventDetail:
          'This is dummy. It is not meant to be read. It is placed here solely to demonstrate the look and feel of finished typeset text....',
      eventTrainerName: 'Janell Geason',
      eventPic: ImageConstant.home_event_pic,
      eventType: 'Workshop',
      url: 'https://zoom.us.com/2387872382651729010261...',
      eventIntrust: 10,
      membersList: [
        memberModel(
            id: 1,
            name: 'Waliya',
            memberImage: ImageConstant.imgRectangle14166),
        memberModel(
            id: 2, name: 'Khaza', memberImage: ImageConstant.imgRectangle1416),
        memberModel(
            id: 3, name: 'Zinta', memberImage: ImageConstant.imgRectangle14169),
        memberModel(
            id: 4, name: 'Liza', memberImage: ImageConstant.imgRectangle14165),
        memberModel(
            id: 4, name: 'Arso', memberImage: ImageConstant.imgRectangle141610),
        memberModel(
            id: 1,
            name: 'Alan',
            memberImage: ImageConstant.imgRectangle14166),
        memberModel(
            id: 2, name: 'Khaza', memberImage: ImageConstant.imgRectangle1416),
        memberModel(
            id: 3, name: 'Zinta', memberImage: ImageConstant.imgRectangle14169),
        memberModel(
            id: 4, name: 'Liza', memberImage: ImageConstant.imgRectangle14165),
        memberModel(
            id: 5, name: 'Maddi', memberImage: ImageConstant.imgRectangle141610),
      ],
    ),




    eventDataModel(
      eventId: '2',
      eventName: 'Skincare Training Workshop',
      eventDate: 'MON, FEB 2 AT 9:30 AM EST',
      eventAddress: '151 Ocean View Blvd, Scarborough, ME',
      eventDetail:
      'This is dummy. It is not meant to be read. It is placed here solely to demonstrate the look and feel of finished typeset text....',
      eventTrainerName: 'Janell Geason',
      eventPic: ImageConstant.home_event_pic,
      url: 'https://zoom.us.com/2387872382651729010261...',
      eventType: 'Workshop',
      eventIntrust: 10,
      membersList: [
        memberModel(
            id: 1,
            name: 'Waliya',
            memberImage: ImageConstant.imgRectangle14166),
        memberModel(
            id: 2, name: 'Khaza', memberImage: ImageConstant.imgRectangle1416),
        memberModel(
            id: 3, name: 'Zinta', memberImage: ImageConstant.imgRectangle14169),
        memberModel(
            id: 4, name: 'Liza', memberImage: ImageConstant.imgRectangle14165),
        memberModel(
            id: 5, name: 'Arso', memberImage: ImageConstant.imgRectangle141610),
        memberModel(
            id: 1,
            name: 'Alan',
            memberImage: ImageConstant.imgRectangle14166),
        memberModel(
            id: 2, name: 'Khaza', memberImage: ImageConstant.imgRectangle1416),
        memberModel(
            id: 3, name: 'Zinta', memberImage: ImageConstant.imgRectangle14169),
        memberModel(
            id: 4, name: 'Liza', memberImage: ImageConstant.imgRectangle14165),
        memberModel(
            id: 5, name: 'Maddi', memberImage: ImageConstant.imgRectangle141610),
      ],
    ),





    eventDataModel(
      eventId: '2',
      eventName: 'Skincare Training Workshop',
      eventDate: 'MON, FEB 2 AT 9:30 AM EST',
      eventAddress: '151 Ocean View Blvd, Scarborough, ME',
      eventDetail:
      'This is dummy. It is not meant to be read. It is placed here solely to demonstrate the look and feel of finished typeset text....',
      eventTrainerName: 'Janell Geason',
      eventPic: ImageConstant.home_event_pic,
      url: 'https://zoom.us.com/2387872382651729010261...',
      eventType: 'Workshop',
      eventIntrust: 10,
      membersList: [
        memberModel(
            id: 1,
            name: 'Waliya',
            memberImage: ImageConstant.imgRectangle14166),
        memberModel(
            id: 2, name: 'Khaza', memberImage: ImageConstant.imgRectangle1416),
        memberModel(
            id: 3, name: 'Zinta', memberImage: ImageConstant.imgRectangle14169),
        memberModel(
            id: 4, name: 'Liza', memberImage: ImageConstant.imgRectangle14165),
        memberModel(
            id: 5, name: 'Arso', memberImage: ImageConstant.imgRectangle141610),
        memberModel(
            id: 1,
            name: 'Alan',
            memberImage: ImageConstant.imgRectangle14166),
        memberModel(
            id: 2, name: 'Khaza', memberImage: ImageConstant.imgRectangle1416),
        memberModel(
            id: 3, name: 'Zinta', memberImage: ImageConstant.imgRectangle14169),
        memberModel(
            id: 4, name: 'Liza', memberImage: ImageConstant.imgRectangle14165),
        memberModel(
            id: 5, name: 'Maddi', memberImage: ImageConstant.imgRectangle141610),
      ],
    )
  ];






  static List<courseCategory> coursesDate = [
    courseCategory(
        courseCategoryId: 0,
        courseCategoryName: 'All',
        selected: true,
        courses: [
          courseDataModel(
            id: '1',
            pic: ImageConstant.imgRectangle18274,
            Name: 'Introduction to Balayage Truncated',
            Detail:
                'No need to truncate the description here on any of the resource details pages. The full caption the Admin writes can appear here.',
            seen: false,
            date: 'Sep 24, 2022',
            fileSize: '11 MB',
            contentType: 10,
            type: 'WAXING',
          ),
          courseDataModel(
            id: '1',
            pic: ImageConstant.imgRectangle85180X343,
            Name: 'Balayage Coloring',
            Detail:
                'No need to truncate the description here on any of the resource details pages. The full caption the Admin writes can appear here.',
            seen: false,
            date: 'Sep 24, 2022',
            fileSize: '11 MB',
            contentType: 20,
            type: 'Color',
          ),
          courseDataModel(
            id: '1',
            pic: ImageConstant.imgRectangle18274,
            Name: 'Introduction to Balayage Truncated',
            Detail:
                'No need to truncate the description here on any of the resource details pages. The full caption the Admin writes can appear here.',
            seen: true,
            date: 'Nov 15, 2022',
            fileSize: '11 MB',
            contentType: 30,
            type: 'Color',
          ),
        ]),
    courseCategory(
        courseCategoryId: 1,
        courseCategoryName: 'Category 1',
        selected: false,
        courses: [
          courseDataModel(
            id: '1',
            pic: ImageConstant.imgRectangle18274,
            Name: 'Introduction to Balayage Truncated',
            Detail:
                'No need to truncate the description here on any of the resource details pages. The full caption the Admin writes can appear here.',
            seen: false,
            date: 'Sep 24, 2022',
            fileSize: '11 MB',
            contentType: 10,
            type: 'WAXING',
          ),
          courseDataModel(
            id: '1',
            pic: ImageConstant.imgRectangle85180X343,
            Name: 'Balayage Coloring',
            Detail:
                'No need to truncate the description here on any of the resource details pages. The full caption the Admin writes can appear here.',
            seen: false,
            date: 'Sep 24, 2022',
            fileSize: '11 MB',
            contentType: 20,
            type: 'Color',
          ),
          courseDataModel(
            id: '1',
            pic: ImageConstant.imgRectangle18274,
            Name: 'Introduction to Balayage Truncated',
            Detail:
                'No need to truncate the description here on any of the resource details pages. The full caption the Admin writes can appear here.',
            seen: true,
            date: 'Nov 15, 2022',
            fileSize: '11 MB',
            contentType: 30,
            type: 'Color',
          ),
        ]),
    courseCategory(
        courseCategoryId: 2,
        courseCategoryName: 'Category 2',
        selected: false,
        courses: [
          courseDataModel(
            id: '1',
            pic: ImageConstant.imgRectangle18274,
            Name: 'Introduction to Balayage Truncated',
            Detail:
                'No need to truncate the description here on any of the resource details pages. The full caption the Admin writes can appear here.',
            seen: false,
            date: 'Sep 24, 2022',
            fileSize: '11 MB',
            contentType: 10,
            type: 'WAXING',
          ),
          courseDataModel(
            id: '1',
            pic: ImageConstant.imgRectangle85180X343,
            Name: 'Balayage Coloring',
            Detail:
                'No need to truncate the description here on any of the resource details pages. The full caption the Admin writes can appear here.',
            seen: false,
            date: 'Sep 24, 2022',
            fileSize: '11 MB',
            contentType: 20,
            type: 'Color',
          ),
          courseDataModel(
            id: '1',
            pic: ImageConstant.imgRectangle18274,
            Name: 'Introduction to Balayage Truncated',
            Detail:
                'No need to truncate the description here on any of the resource details pages. The full caption the Admin writes can appear here.',
            seen: true,
            date: 'Nov 15, 2022',
            fileSize: '11 MB',
            contentType: 30,
            type: 'Color',
          ),
        ]),
    courseCategory(
        courseCategoryId: 3,
        courseCategoryName: 'Category 3',
        selected: false,
        courses: [
          courseDataModel(
            id: '1',
            pic: ImageConstant.imgRectangle18274,
            Name: 'Introduction to Balayage Truncated',
            Detail:
                'No need to truncate the description here on any of the resource details pages. The full caption the Admin writes can appear here.',
            seen: false,
            date: 'Sep 24, 2022',
            fileSize: '11 MB',
            contentType: 10,
            type: 'WAXING',
          ),
          courseDataModel(
            id: '1',
            pic: ImageConstant.imgRectangle85180X343,
            Name: 'Balayage Coloring',
            Detail:
                'No need to truncate the description here on any of the resource details pages. The full caption the Admin writes can appear here.',
            seen: false,
            date: 'Sep 24, 2022',
            fileSize: '11 MB',
            contentType: 20,
            type: 'Color',
          ),
          courseDataModel(
            id: '1',
            pic: ImageConstant.imgRectangle18274,
            Name: 'Introduction to Balayage Truncated',
            Detail:
                'No need to truncate the description here on any of the resource details pages. The full caption the Admin writes can appear here.',
            seen: true,
            date: 'Nov 15, 2022',
            fileSize: '11 MB',
            contentType: 30,
            type: 'Color',
          ),
        ]),
    courseCategory(
        courseCategoryId: 4,
        courseCategoryName: 'Category 4',
        selected: false,
        courses: [
          courseDataModel(
            id: '1',
            pic: ImageConstant.imgRectangle18274,
            Name: 'How to Apply Socolor Pre-Bonded: Virgin Application',
            Detail:
                'No need to truncate the description here on any of the resource details pages. The full caption the Admin writes can appear here.',
            seen: false,
            date: 'Sep 24, 2022',
            fileSize: '11 MB',
            contentType: 10,
            type: 'WAXING',
          ),
          courseDataModel(
            id: '1',
            pic: ImageConstant.imgRectangle85180X343,
            Name: 'Balayage Coloring',
            Detail:
                'No need to truncate the description here on any of the resource details pages. The full caption the Admin writes can appear here.',
            seen: false,
            date: 'Sep 24, 2022',
            fileSize: '11 MB',
            contentType: 20,
            type: 'Color',
          ),
          courseDataModel(
            id: '1',
            pic: ImageConstant.imgRectangle18274,
            Name: 'Introduction to Balayage Truncated',
            Detail:
                'No need to truncate the description here on any of the resource details pages. The full caption the Admin writes can appear here.',
            seen: true,
            date: 'Nov 15, 2022',
            fileSize: '11 MB',
            contentType: 30,
            type: 'Color',
          ),
        ]),
  ];

  static List<taskDataModel> taskData = [
    taskDataModel(
      id: 1,
      tsakName: 'This the the task name',
      taskType: 'One Time',
      tsakDetail:
      'This is dummy copy. It is not meant to be read. It has been placed here solely to demonstrate the look and feel of finished, typeset text. Only for show. He who searches for meaning here will be sorely disappointed.',
      createdDate: 'Nov 22, 2022',
      startDate: 'Nov 30, 2022',
      dueDate: 'Dec 01, 2022',
      status: 40,
      assignBy: 'Arso',
      isOverDue: false,
    ),
    taskDataModel(
      id: 2,
      tsakName: 'Limit all task titles to one line like this...',
      taskType: 'Every Week',
      tsakDetail:
      'This is dummy copy. It is not meant to be read. It has been placed here solely to demonstrate the look and feel of finished, typeset text. Only for show. He who searches for meaning here will be sorely disappointed.',
      createdDate: 'Nov 23, 2022',
      startDate: 'Nov 28, 2022',
      dueDate: 'Dec 05, 2022',
      status: 40,
      assignBy: 'Arso',
      isOverDue: false,
    ),

    taskDataModel(
      id: 2,
      tsakName: 'Limit all task titles to one line like this...',
      taskType: 'Every Week',
      tsakDetail:
      'This is dummy copy. It is not meant to be read. It has been placed here solely to demonstrate the look and feel of finished, typeset text. Only for show. He who searches for meaning here will be sorely disappointed.',
      createdDate: 'Nov 23, 2022',
      startDate: 'Nov 28, 2022',
      dueDate: 'Dec 05, 2022',
      status: 20,
      assignBy: 'Arso',
      isOverDue: false,
    ),
 taskDataModel(
      id: 2,
      tsakName: 'Limit all task titles to one line like this...',
      taskType: 'Every Week',
      tsakDetail:
      'This is dummy copy. It is not meant to be read. It has been placed here solely to demonstrate the look and feel of finished, typeset text. Only for show. He who searches for meaning here will be sorely disappointed.',
      createdDate: 'Nov 23, 2022',
      startDate: 'Nov 28, 2022',
      dueDate: 'Dec 05, 2022',
      status: 20,
      assignBy: 'Arso',
      isOverDue: false,
    ),
taskDataModel(
      id: 2,
      tsakName: 'Limit all task titles to one line like this...',
      taskType: 'Every Week',
      tsakDetail:
      'This is dummy copy. It is not meant to be read. It has been placed here solely to demonstrate the look and feel of finished, typeset text. Only for show. He who searches for meaning here will be sorely disappointed.',
      createdDate: 'Nov 23, 2022',
      startDate: 'Nov 28, 2022',
      dueDate: 'Dec 05, 2022',
      status: 30,
      assignBy: 'Arso',
      isOverDue: false,
    ),
taskDataModel(
      id: 2,
      tsakName: 'Limit all task titles to one line like this...',
      taskType: 'Every Week',
      tsakDetail:
      'This is dummy copy. It is not meant to be read. It has been placed here solely to demonstrate the look and feel of finished, typeset text. Only for show. He who searches for meaning here will be sorely disappointed.',
      createdDate: 'Nov 23, 2022',
      startDate: 'Nov 28, 2022',
      dueDate: 'Dec 05, 2022',
      status: 30,
      assignBy: 'Arso',
      isOverDue: false,
    ),taskDataModel(
      id: 2,
      tsakName: 'Limit all task titles to one line like this...',
      taskType: 'Every Week',
      tsakDetail:
      'This is dummy copy. It is not meant to be read. It has been placed here solely to demonstrate the look and feel of finished, typeset text. Only for show. He who searches for meaning here will be sorely disappointed.',
      createdDate: 'Nov 23, 2022',
      startDate: 'Nov 28, 2022',
      dueDate: 'Dec 05, 2022',
      status: 40,
      assignBy: 'Arso',
      isOverDue: false,
    ),taskDataModel(
      id: 2,
      tsakName: 'Limit all task titles to one line like this...',
      taskType: 'Every Week',
      tsakDetail:
      'This is dummy copy. It is not meant to be read. It has been placed here solely to demonstrate the look and feel of finished, typeset text. Only for show. He who searches for meaning here will be sorely disappointed.',
      createdDate: 'Nov 23, 2022',
      startDate: 'Nov 28, 2022',
      dueDate: 'Dec 05, 2022',
      status: 40,
      assignBy: 'Arso',
      isOverDue: false,
    ),




  ];


  static List Chating = [
    chat(
        senderId: '1',
        message: 'Hi! howw may i help u',
        profilePic: ImageConstant.imgRectangle14164,
        createdDate: '08:00 PM'),
    chat(
        senderId: '0',
        message: 'Hi! howw may i help u',
        profilePic: ImageConstant.imgRectangle14162,
        createdDate: '08:00 PM'),
    chat(
        senderId: '1',
        message: 'Hi! i am not able to visit',
        profilePic: ImageConstant.imgRectangle14164,
        createdDate: '08:05 PM'),
    chat(
        senderId: '1',
        message: 'kindly look into this',
        profilePic: ImageConstant.imgRectangle14164,
        createdDate: '08:06 PM'),
    chat(
        senderId: '0',
        message: 'Hi! i am not able to visit',
        profilePic: ImageConstant.imgRectangle14162,
        createdDate: '09:00 PM'),
    chat(
        senderId: '1',
        message: 'Hi! howw may i help u',
        profilePic: ImageConstant.imgRectangle14164,
        createdDate: '10:00 PM'),
    chat(
        senderId: '0',
        message: 'Hi! howw may i help u',
        profilePic: ImageConstant.imgRectangle14162,
        createdDate: '11:00 PM'),
  ];

}


class dataModelEdit {
  int? id;
  String? name;
  RxBool? selected;

  dataModelEdit({this.id, this.name,this.selected});
}


class dataModel {
  int? id;
  String? name;
  RxBool? selected;

  dataModel({this.id, this.name,this.selected});
}
class ExperienceModel {
  int? id;
  String? name;
  RxBool? selected;

  ExperienceModel({this.id, this.name, this.selected});
}
class DaysModel {
  int? id;
  String? name;
  RxBool? selected;

  DaysModel({this.id, this.name, this.selected});
}



class LeaveModel {
  int? id;
  String? name;
  RxBool? selected;

  LeaveModel({this.id, this.name, this.selected});
}
class PaymentModel {
  int? id;
  String? name;
  RxBool? selected;

  PaymentModel({this.id, this.name, this.selected});
}


class ForeverModel {
  int? id;
  String? name;
  String? des;
  RxBool? selected;

  ForeverModel({this.id, this.name,this.des, this.selected});
}
class AmountModel {
  int? id;
  String? name;
  String? des;
  RxBool? selected;

  AmountModel({this.id, this.name,this.des, this.selected});
}
class AddRequestModel {
  int? id;
  String? name;
  String? des;
  RxBool? selected;

  AddRequestModel({this.id, this.name,this.des, this.selected});
}
class requestFilterModel {
  int? id;
  String? name;
  RxBool? selected;

  requestFilterModel({this.id, this.name, this.selected});
}


class ReportModel {
  int? id;
  String? name;

  ReportModel({this.id, this.name});
}

class ReportModelForChat {
  int? id;
  RxString? name;

  ReportModelForChat({this.id, this.name});
}
class RelationModel {
  int? id;
  String? name;
  RxBool? selected;

  RelationModel({this.id, this.name, this.selected});
}

class dataModel3 {
  int? id;
  String? name;
  String? image;
  Rx<bool>? selected;

  dataModel3({this.id, this.name, this.image, this.selected});
}

class dataModel2 {
  int? id;
  String? name;
  bool? selected;

  dataModel2({this.id, this.name, this.selected});
}

class productModel {
  int? id;
  String? name;
  num? price;
  String? storeImage;
  String? storeImageMain;
  String? productImage;
  String? storeUrl;
  bool? isFav;

  productModel(
      {this.id,
      this.name,
      this.price,
      this.storeImage,
      this.storeImageMain,
      this.storeUrl,
      this.productImage,
      this.isFav});
}

class memberModel {
  int? id;
  String? name;
  String? memberImage;

  memberModel({this.id, this.name, this.memberImage});
}

class FAQ {
  int? number;
  String? header;
  String? desc;
  bool? visible;

  FAQ({this.number, this.header, this.desc, this.visible});
}

class Notifications {
  DateTime? time;
  bool? read;
  String? description;
  String? image;
  String? heading;
  String? redirect;

  Notifications(
      {this.heading,
      this.read,
      this.description,
      this.time,
      this.image,
      this.redirect});
}

class chat {
  String? senderId;
  String? createdDate;
  String? message;
  String? profilePic;

  chat({this.senderId, this.profilePic, this.createdDate, this.message});
}

class filter {
  String? categoryId;
  String? categoryName;
  bool? show;
  List<subCategory>? sub;

  filter({this.categoryId, this.categoryName, this.show, this.sub});
}

class subCategory {
  String? subCatId;
  String? subCatName;
  bool? selected;

  subCategory({this.subCatId, this.subCatName, this.selected});
}
class goalsBottomSheet {
  String? subCatId;
  String? subCatName;
  RxBool? selected;

  goalsBottomSheet({this.subCatId, this.subCatName, this.selected});
}


class quizModel {
  int? id;
  String? name;
  RxBool? selected;

  quizModel({this.id, this.name, this.selected});


}class quizFilter {
  int? id;
  String? name;
  RxBool? selected;
  int? status;

  quizFilter({this.id, this.name, this.selected, this.status});
}
class createChatModel {
  int? id;
  String? name;
  String? des;
  RxBool? selected;

  createChatModel({this.id, this.name, this.des,this.selected});
}

class requestTypeModel {
  int? id;
  String? title;
  String? desc;
  RxBool? selected;

  requestTypeModel({this.id, this.title,this.desc, this.selected});
}

class quizQuestionModel {
  int? id;
  String? question;
  List<quizAnswerModel>? arrOfAnswers;
  quizQuestionModel({this.id, this.question,this.arrOfAnswers});
}

class surveyQuestionModel {
  int? id;
  String? question;
  int? questionType;
  List<quizAnswerModel>? arrOfAnswers;
  List<emojiesAnswerModel>? arrOfEmojies;
  surveyQuestionModel({this.id, this.question,this.questionType,this.arrOfAnswers,this.arrOfEmojies});
}

class quizAnswerModel {
  int? id;
  String? answer;
  RxBool? isSelected;
  quizAnswerModel({this.id, this.answer,this.isSelected});
}

class emojiesAnswerModel {
  int? id;
  String? emojies;
  RxBool? isSelected;
  emojiesAnswerModel({this.id, this.emojies,this.isSelected});
}
class eventDataModel {
  String? eventId;
  String? eventPic;
  String? eventDate;
  String? eventName;
  String? eventType;
  String? eventAddress;
  String? eventDetail;
  String? eventTrainerName;
  String? url;
  int? eventIntrust;
  List<memberModel>? membersList;

  eventDataModel(
      {this.eventId,
      this.eventName,
      this.eventPic,
      this.eventAddress,
      this.eventDate,
      this.eventDetail,
      this.eventTrainerName,
      this.eventType,
      this.url,
      this.eventIntrust,
      this.membersList});
}

class courseCategory {
  int? courseCategoryId;
  String? courseCategoryName;
  bool? selected;
  List<courseDataModel>? courses;

  courseCategory(
      {this.courseCategoryId,
      this.courseCategoryName,
      this.courses,
      this.selected});
}

class courseDataModel {
  String? id;
  String? Name;
  String? Detail;
  String? date;
  String? fileSize;
  String? pic;
  String? type;
  bool? seen;
  int? contentType;

  courseDataModel({
    this.id,
    this.Name,
    this.Detail,
    this.fileSize,
    this.date,
    this.pic,
    this.type,
    this.seen,
    this.contentType,
  });
}

class taskDataModel {
  int? id;
  String? tsakName;
  String? tsakDetail;
  String? taskType;
  String? createdDate;
  String? startDate;
  String? dueDate;
  bool? isOverDue;
  int? status;
  String? assignBy;

  taskDataModel({
    this.id,
    this.tsakName,
    this.tsakDetail,
    this.taskType,
    this.createdDate,
    this.startDate,
    this.dueDate,
    this.isOverDue,
    this.status,
    this.assignBy,
  });
}

