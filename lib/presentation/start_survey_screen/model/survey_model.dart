class SurveyModel {
  bool? status;
  String? message;
  SurveyData? data;

  SurveyModel({
    this.status,
    this.message,
    this.data,
  });

  SurveyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] as bool?;
    message = json['message'] as String?;
    data = (json['data'] as Map<String,dynamic>?) != null ? SurveyData.fromJson(json['data'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['status'] = status;
    json['message'] = message;
    json['data'] = data?.toJson();
    return json;
  }
}

class SurveyData {
  int? id;
  String? uniid;
  String? image;
  String? name;
  int? status;
  int? anonymousResponse;
  String? description;
  int? categoryId;
  int? salonId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  User? user;
  Salon? salon;
  Category? category;
  List<SurveyQuestions>? surveyQuestions;
  List<dynamic>? userSurveyAnswers;
  List<SurveyUsers>? surveyUsers;
  String? createdAgo;
  dynamic userSurveyStatus;
  List<dynamic>? startedUsers;
  List<NotStartedUsers>? notStartedUsers;
  List<dynamic>? submittedUsers;
  Meta? meta;

  SurveyData({
    this.id,
    this.uniid,
    this.image,
    this.name,
    this.status,
    this.anonymousResponse,
    this.description,
    this.categoryId,
    this.salonId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.user,
    this.salon,
    this.category,
    this.surveyQuestions,
    this.userSurveyAnswers,
    this.surveyUsers,
    this.createdAgo,
    this.userSurveyStatus,
    this.startedUsers,
    this.notStartedUsers,
    this.submittedUsers,
    this.meta,
  });

  SurveyData.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    uniid = json['uniid'] as String?;
    image = json['image'] as String?;
    name = json['name'] as String?;
    status = json['status'] as int?;
    anonymousResponse = json['anonymous_response'] as int?;
    description = json['description'] as String?;
    categoryId = json['category_id'] as int?;
    salonId = json['salon_id'] as int?;
    userId = json['user_id'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null;
    salon = (json['salon'] as Map<String,dynamic>?) != null ? Salon.fromJson(json['salon'] as Map<String,dynamic>) : null;
    category = (json['category'] as Map<String,dynamic>?) != null ? Category.fromJson(json['category'] as Map<String,dynamic>) : null;
    surveyQuestions = (json['surveyQuestions'] as List?)?.map((dynamic e) => SurveyQuestions.fromJson(e as Map<String,dynamic>)).toList();
    userSurveyAnswers = json['userSurveyAnswers'] as List?;
    surveyUsers = (json['surveyUsers'] as List?)?.map((dynamic e) => SurveyUsers.fromJson(e as Map<String,dynamic>)).toList();
    createdAgo = json['created_ago'] as String?;
    userSurveyStatus = json['userSurveyStatus'];
    startedUsers = json['startedUsers'] as List?;
    notStartedUsers = (json['notStartedUsers'] as List?)?.map((dynamic e) => NotStartedUsers.fromJson(e as Map<String,dynamic>)).toList();
    submittedUsers = json['submittedUsers'] as List?;
    meta = (json['meta'] as Map<String,dynamic>?) != null ? Meta.fromJson(json['meta'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['uniid'] = uniid;
    json['image'] = image;
    json['name'] = name;
    json['status'] = status;
    json['anonymous_response'] = anonymousResponse;
    json['description'] = description;
    json['category_id'] = categoryId;
    json['salon_id'] = salonId;
    json['user_id'] = userId;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['user'] = user?.toJson();
    json['salon'] = salon?.toJson();
    json['category'] = category?.toJson();
    json['surveyQuestions'] = surveyQuestions?.map((e) => e.toJson()).toList();
    json['userSurveyAnswers'] = userSurveyAnswers;
    json['surveyUsers'] = surveyUsers?.map((e) => e.toJson()).toList();
    json['created_ago'] = createdAgo;
    json['userSurveyStatus'] = userSurveyStatus;
    json['startedUsers'] = startedUsers;
    json['notStartedUsers'] = notStartedUsers?.map((e) => e.toJson()).toList();
    json['submittedUsers'] = submittedUsers;
    json['meta'] = meta?.toJson();
    return json;
  }
}

class User {
  int? id;
  String? name;
  dynamic slug;
  String? email;
  dynamic phone;
  dynamic dob;
  dynamic relationshipId;
  dynamic locationId;
  dynamic hireDate;
  dynamic bio;
  dynamic school;
  dynamic image;
  dynamic address;
  dynamic city;
  dynamic countryId;
  dynamic zip;
  dynamic salonId;
  dynamic portfolio;
  dynamic tiktok;
  dynamic instagram;
  dynamic facebook;
  dynamic positionId;
  int? isCompleted;
  int? isSocialLogin;
  int? isApproved;
  int? isVerified;
  int? isScheduled;
  String? verificationCode;
  int? pushNotification;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? createdAgo;
  String? relationship;
  int? totalPoints;
  Meta? meta;

  User({
    this.id,
    this.name,
    this.slug,
    this.email,
    this.phone,
    this.dob,
    this.relationshipId,
    this.locationId,
    this.hireDate,
    this.bio,
    this.school,
    this.image,
    this.address,
    this.city,
    this.countryId,
    this.zip,
    this.salonId,
    this.portfolio,
    this.tiktok,
    this.instagram,
    this.facebook,
    this.positionId,
    this.isCompleted,
    this.isSocialLogin,
    this.isApproved,
    this.isVerified,
    this.isScheduled,
    this.verificationCode,
    this.pushNotification,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdAgo,
    this.relationship,
    this.totalPoints,
    this.meta,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    slug = json['slug'];
    email = json['email'] as String?;
    phone = json['phone'];
    dob = json['dob'];
    relationshipId = json['relationship_id'];
    locationId = json['location_id'];
    hireDate = json['hire_date'];
    bio = json['bio'];
    school = json['school'];
    image = json['image'];
    address = json['address'];
    city = json['city'];
    countryId = json['country_id'];
    zip = json['zip'];
    salonId = json['salon_id'];
    portfolio = json['portfolio'];
    tiktok = json['tiktok'];
    instagram = json['instagram'];
    facebook = json['facebook'];
    positionId = json['position_id'];
    isCompleted = json['is_completed'] as int?;
    isSocialLogin = json['is_social_login'] as int?;
    isApproved = json['is_approved'] as int?;
    isVerified = json['is_verified'] as int?;
    isScheduled = json['is_scheduled'] as int?;
    verificationCode = json['verification_code'] as String?;
    pushNotification = json['push_notification'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    createdAgo = json['created_ago'] as String?;
    relationship = json['relationship'] as String?;
    totalPoints = json['totalPoints'] as int?;
    meta = (json['meta'] as Map<String,dynamic>?) != null ? Meta.fromJson(json['meta'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['slug'] = slug;
    json['email'] = email;
    json['phone'] = phone;
    json['dob'] = dob;
    json['relationship_id'] = relationshipId;
    json['location_id'] = locationId;
    json['hire_date'] = hireDate;
    json['bio'] = bio;
    json['school'] = school;
    json['image'] = image;
    json['address'] = address;
    json['city'] = city;
    json['country_id'] = countryId;
    json['zip'] = zip;
    json['salon_id'] = salonId;
    json['portfolio'] = portfolio;
    json['tiktok'] = tiktok;
    json['instagram'] = instagram;
    json['facebook'] = facebook;
    json['position_id'] = positionId;
    json['is_completed'] = isCompleted;
    json['is_social_login'] = isSocialLogin;
    json['is_approved'] = isApproved;
    json['is_verified'] = isVerified;
    json['is_scheduled'] = isScheduled;
    json['verification_code'] = verificationCode;
    json['push_notification'] = pushNotification;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['created_ago'] = createdAgo;
    json['relationship'] = relationship;
    json['totalPoints'] = totalPoints;
    json['meta'] = meta?.toJson();
    return json;
  }
}

class Meta {
  dynamic username;

  Meta({
    this.username,
  });

  Meta.fromJson(Map<String, dynamic> json) {
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['username'] = username;
    return json;
  }
}

class Salon {
  int? id;
  String? uniid;
  String? image;
  String? name;
  dynamic slug;
  String? address;
  String? bookingSoftware;
  dynamic productLine;
  dynamic jobTitle;
  String? dateFounded;
  String? city;
  int? countryId;
  String? zip;
  int? multiLocations;
  int? status;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic stripeCustomerId;
  String? directoryName;
  num? storageAvailableGbs;
  String? createdAgo;
  String? directory;
  dynamic currentSubscription;
  Meta? meta;

  Salon({
    this.id,
    this.uniid,
    this.image,
    this.name,
    this.slug,
    this.address,
    this.bookingSoftware,
    this.productLine,
    this.jobTitle,
    this.dateFounded,
    this.city,
    this.countryId,
    this.zip,
    this.multiLocations,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.stripeCustomerId,
    this.directoryName,
    this.storageAvailableGbs,
    this.createdAgo,
    this.directory,
    this.currentSubscription,
    this.meta,
  });

  Salon.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    uniid = json['uniid'] as String?;
    image = json['image'] as String?;
    name = json['name'] as String?;
    slug = json['slug'];
    address = json['address'] as String?;
    bookingSoftware = json['booking_software'] as String?;
    productLine = json['product_line'];
    jobTitle = json['job_title'];
    dateFounded = json['date_founded'] as String?;
    city = json['city'] as String?;
    countryId = json['country_id'] as int?;
    zip = json['zip'] as String?;
    multiLocations = json['multi_locations'] as int?;
    status = json['status'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    stripeCustomerId = json['stripe_customer_id'];
    directoryName = json['directory_name'] as String?;
    storageAvailableGbs = json['storage_available_gbs'] as num?;
    createdAgo = json['created_ago'] as String?;
    directory = json['directory'] as String?;
    currentSubscription = json['currentSubscription'];
    meta = (json['meta'] as Map<String,dynamic>?) != null ? Meta.fromJson(json['meta'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['uniid'] = uniid;
    json['image'] = image;
    json['name'] = name;
    json['slug'] = slug;
    json['address'] = address;
    json['booking_software'] = bookingSoftware;
    json['product_line'] = productLine;
    json['job_title'] = jobTitle;
    json['date_founded'] = dateFounded;
    json['city'] = city;
    json['country_id'] = countryId;
    json['zip'] = zip;
    json['multi_locations'] = multiLocations;
    json['status'] = status;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['stripe_customer_id'] = stripeCustomerId;
    json['directory_name'] = directoryName;
    json['storage_available_gbs'] = storageAvailableGbs;
    json['created_ago'] = createdAgo;
    json['directory'] = directory;
    json['currentSubscription'] = currentSubscription;
    json['meta'] = meta?.toJson();
    return json;
  }
}


class Category {
  int? id;
  String? name;
  int? type;
  int? status;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? createdAgo;

  Category({
    this.id,
    this.name,
    this.type,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdAgo,
  });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    type = json['type'] as int?;
    status = json['status'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    createdAgo = json['created_ago'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['type'] = type;
    json['status'] = status;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['created_ago'] = createdAgo;
    return json;
  }
}

class SurveyQuestions {
  int? id;
  String? question;
  String? image;
  int? type;
  int? surveyId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? createdAgo;
  String? typeName;

  SurveyQuestions({
    this.id,
    this.question,
    this.image,
    this.type,
    this.surveyId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdAgo,
    this.typeName,
  });

  SurveyQuestions.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    question = json['question'] as String?;
    image = json['image'] as String?;
    type = json['type'] as int?;
    surveyId = json['survey_id'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    createdAgo = json['created_ago'] as String?;
    typeName = json['typeName'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['question'] = question;
    json['image'] = image;
    json['type'] = type;
    json['survey_id'] = surveyId;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['created_ago'] = createdAgo;
    json['typeName'] = typeName;
    return json;
  }
}

class SurveyUsers {
  int? id;
  int? status;
  int? surveyId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  UserSurvey? user;
  String? createdAgo;
  String? statusName;

  SurveyUsers({
    this.id,
    this.status,
    this.surveyId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.user,
    this.createdAgo,
    this.statusName,
  });

  SurveyUsers.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    status = json['status'] as int?;
    surveyId = json['survey_id'] as int?;
    userId = json['user_id'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    user = (json['user'] as Map<String,dynamic>?) != null ? UserSurvey.fromJson(json['user'] as Map<String,dynamic>) : null;
    createdAgo = json['created_ago'] as String?;
    statusName = json['statusName'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['status'] = status;
    json['survey_id'] = surveyId;
    json['user_id'] = userId;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['user'] = user?.toJson();
    json['created_ago'] = createdAgo;
    json['statusName'] = statusName;
    return json;
  }
}

class UserSurvey {
  int? id;
  String? name;
  String? slug;
  String? email;
  String? phone;
  dynamic dob;
  dynamic relationshipId;
  int? locationId;
  String? hireDate;
  String? bio;
  dynamic school;
  dynamic image;
  dynamic address;
  dynamic city;
  dynamic countryId;
  dynamic zip;
  int? salonId;
  dynamic portfolio;
  dynamic tiktok;
  dynamic instagram;
  dynamic facebook;
  int? positionId;
  int? isCompleted;
  int? isSocialLogin;
  int? isApproved;
  int? isVerified;
  int? isScheduled;
  String? verificationCode;
  int? pushNotification;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? createdAgo;
  String? relationship;
  int? totalPoints;
  Meta? meta;

  UserSurvey({
    this.id,
    this.name,
    this.slug,
    this.email,
    this.phone,
    this.dob,
    this.relationshipId,
    this.locationId,
    this.hireDate,
    this.bio,
    this.school,
    this.image,
    this.address,
    this.city,
    this.countryId,
    this.zip,
    this.salonId,
    this.portfolio,
    this.tiktok,
    this.instagram,
    this.facebook,
    this.positionId,
    this.isCompleted,
    this.isSocialLogin,
    this.isApproved,
    this.isVerified,
    this.isScheduled,
    this.verificationCode,
    this.pushNotification,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdAgo,
    this.relationship,
    this.totalPoints,
    this.meta,
  });

  UserSurvey.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    slug = json['slug'] as String?;
    email = json['email'] as String?;
    phone = json['phone'] as String?;
    dob = json['dob'];
    relationshipId = json['relationship_id'];
    locationId = json['location_id'] as int?;
    hireDate = json['hire_date'] as String?;
    bio = json['bio'] as String?;
    school = json['school'];
    image = json['image'];
    address = json['address'];
    city = json['city'];
    countryId = json['country_id'];
    zip = json['zip'];
    salonId = json['salon_id'] as int?;
    portfolio = json['portfolio'];
    tiktok = json['tiktok'];
    instagram = json['instagram'];
    facebook = json['facebook'];
    positionId = json['position_id'] as int?;
    isCompleted = json['is_completed'] as int?;
    isSocialLogin = json['is_social_login'] as int?;
    isApproved = json['is_approved'] as int?;
    isVerified = json['is_verified'] as int?;
    isScheduled = json['is_scheduled'] as int?;
    verificationCode = json['verification_code'] as String?;
    pushNotification = json['push_notification'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    createdAgo = json['created_ago'] as String?;
    relationship = json['relationship'] as String?;
    totalPoints = json['totalPoints'] as int?;
    meta = (json['meta'] as Map<String,dynamic>?) != null ? Meta.fromJson(json['meta'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['slug'] = slug;
    json['email'] = email;
    json['phone'] = phone;
    json['dob'] = dob;
    json['relationship_id'] = relationshipId;
    json['location_id'] = locationId;
    json['hire_date'] = hireDate;
    json['bio'] = bio;
    json['school'] = school;
    json['image'] = image;
    json['address'] = address;
    json['city'] = city;
    json['country_id'] = countryId;
    json['zip'] = zip;
    json['salon_id'] = salonId;
    json['portfolio'] = portfolio;
    json['tiktok'] = tiktok;
    json['instagram'] = instagram;
    json['facebook'] = facebook;
    json['position_id'] = positionId;
    json['is_completed'] = isCompleted;
    json['is_social_login'] = isSocialLogin;
    json['is_approved'] = isApproved;
    json['is_verified'] = isVerified;
    json['is_scheduled'] = isScheduled;
    json['verification_code'] = verificationCode;
    json['push_notification'] = pushNotification;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['created_ago'] = createdAgo;
    json['relationship'] = relationship;
    json['totalPoints'] = totalPoints;
    json['meta'] = meta?.toJson();
    return json;
  }
}



class NotStartedUsers {
  int? id;
  int? status;
  int? surveyId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  UserNotStarted? user;
  String? createdAgo;
  String? statusName;

  NotStartedUsers({
    this.id,
    this.status,
    this.surveyId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.user,
    this.createdAgo,
    this.statusName,
  });

  NotStartedUsers.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    status = json['status'] as int?;
    surveyId = json['survey_id'] as int?;
    userId = json['user_id'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    user = (json['user'] as Map<String,dynamic>?) != null ? UserNotStarted.fromJson(json['user'] as Map<String,dynamic>) : null;
    createdAgo = json['created_ago'] as String?;
    statusName = json['statusName'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['status'] = status;
    json['survey_id'] = surveyId;
    json['user_id'] = userId;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['user'] = user?.toJson();
    json['created_ago'] = createdAgo;
    json['statusName'] = statusName;
    return json;
  }
}

class UserNotStarted {
  int? id;
  String? name;
  String? slug;
  String? email;
  String? phone;
  dynamic dob;
  dynamic relationshipId;
  int? locationId;
  String? hireDate;
  String? bio;
  dynamic school;
  dynamic image;
  dynamic address;
  dynamic city;
  dynamic countryId;
  dynamic zip;
  int? salonId;
  dynamic portfolio;
  dynamic tiktok;
  dynamic instagram;
  dynamic facebook;
  int? positionId;
  int? isCompleted;
  int? isSocialLogin;
  int? isApproved;
  int? isVerified;
  int? isScheduled;
  String? verificationCode;
  int? pushNotification;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? createdAgo;
  String? relationship;
  int? totalPoints;
  NotStartedMeta? meta;

  UserNotStarted({
    this.id,
    this.name,
    this.slug,
    this.email,
    this.phone,
    this.dob,
    this.relationshipId,
    this.locationId,
    this.hireDate,
    this.bio,
    this.school,
    this.image,
    this.address,
    this.city,
    this.countryId,
    this.zip,
    this.salonId,
    this.portfolio,
    this.tiktok,
    this.instagram,
    this.facebook,
    this.positionId,
    this.isCompleted,
    this.isSocialLogin,
    this.isApproved,
    this.isVerified,
    this.isScheduled,
    this.verificationCode,
    this.pushNotification,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdAgo,
    this.relationship,
    this.totalPoints,
    this.meta,
  });

  UserNotStarted.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    slug = json['slug'] as String?;
    email = json['email'] as String?;
    phone = json['phone'] as String?;
    dob = json['dob'];
    relationshipId = json['relationship_id'];
    locationId = json['location_id'] as int?;
    hireDate = json['hire_date'] as String?;
    bio = json['bio'] as String?;
    school = json['school'];
    image = json['image'];
    address = json['address'];
    city = json['city'];
    countryId = json['country_id'];
    zip = json['zip'];
    salonId = json['salon_id'] as int?;
    portfolio = json['portfolio'];
    tiktok = json['tiktok'];
    instagram = json['instagram'];
    facebook = json['facebook'];
    positionId = json['position_id'] as int?;
    isCompleted = json['is_completed'] as int?;
    isSocialLogin = json['is_social_login'] as int?;
    isApproved = json['is_approved'] as int?;
    isVerified = json['is_verified'] as int?;
    isScheduled = json['is_scheduled'] as int?;
    verificationCode = json['verification_code'] as String?;
    pushNotification = json['push_notification'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    createdAgo = json['created_ago'] as String?;
    relationship = json['relationship'] as String?;
    totalPoints = json['totalPoints'] as int?;
    meta = (json['meta'] as Map<String,dynamic>?) != null ? NotStartedMeta.fromJson(json['meta'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['slug'] = slug;
    json['email'] = email;
    json['phone'] = phone;
    json['dob'] = dob;
    json['relationship_id'] = relationshipId;
    json['location_id'] = locationId;
    json['hire_date'] = hireDate;
    json['bio'] = bio;
    json['school'] = school;
    json['image'] = image;
    json['address'] = address;
    json['city'] = city;
    json['country_id'] = countryId;
    json['zip'] = zip;
    json['salon_id'] = salonId;
    json['portfolio'] = portfolio;
    json['tiktok'] = tiktok;
    json['instagram'] = instagram;
    json['facebook'] = facebook;
    json['position_id'] = positionId;
    json['is_completed'] = isCompleted;
    json['is_social_login'] = isSocialLogin;
    json['is_approved'] = isApproved;
    json['is_verified'] = isVerified;
    json['is_scheduled'] = isScheduled;
    json['verification_code'] = verificationCode;
    json['push_notification'] = pushNotification;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['created_ago'] = createdAgo;
    json['relationship'] = relationship;
    json['totalPoints'] = totalPoints;
    json['meta'] = meta?.toJson();
    return json;
  }
}



class NotStartedMeta {
  int? started;
  int? notStarted;
  int? submitted;

  NotStartedMeta({
    this.started,
    this.notStarted,
    this.submitted,
  });

  NotStartedMeta.fromJson(Map<String, dynamic> json) {
    started = json['started'] as int?;
    notStarted = json['not_started'] as int?;
    submitted = json['submitted'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['started'] = started;
    json['not_started'] = notStarted;
    json['submitted'] = submitted;
    return json;
  }
}