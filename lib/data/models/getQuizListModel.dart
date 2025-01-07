import '../../presentation/employee_dicrectry_details_screen/models/employee_dicrectry_details_model.dart';

class GetQuizListResponseModel {
  bool? status;
  String? message;
  Data? data;

  GetQuizListResponseModel({
    this.status,
    this.message,
    this.data,
  });

  GetQuizListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] as bool?;
    message = json['message'] as String?;
    data = (json['data'] as Map<String, dynamic>?) != null
        ? Data.fromJson(json['data'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['status'] = status;
    json['message'] = message;
    json['data'] = data?.toJson();
    return json;
  }
}

class Data {
  Meta? meta;
  List<QuizData>? data;

  Data({
    this.meta,
    this.data,
  });

  Data.fromJson(Map<String, dynamic> json) {
    meta = (json['meta'] as Map<String, dynamic>?) != null
        ? Meta.fromJson(json['meta'] as Map<String, dynamic>)
        : null;
    data = (json['data'] as List?)
        ?.map((dynamic e) => QuizData.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['meta'] = meta?.toJson();
    json['data'] = data?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Meta {
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;
  int? firstPage;
  String? firstPageUrl;
  String? lastPageUrl;
  dynamic nextPageUrl;
  dynamic previousPageUrl;

  Meta({
    this.total,
    this.perPage,
    this.currentPage,
    this.lastPage,
    this.firstPage,
    this.firstPageUrl,
    this.lastPageUrl,
    this.nextPageUrl,
    this.previousPageUrl,
  });

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'] as int?;
    perPage = json['per_page'] as int?;
    currentPage = json['current_page'] as int?;
    lastPage = json['last_page'] as int?;
    firstPage = json['first_page'] as int?;
    firstPageUrl = json['first_page_url'] as String?;
    lastPageUrl = json['last_page_url'] as String?;
    nextPageUrl = json['next_page_url'];
    previousPageUrl = json['previous_page_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['total'] = total;
    json['per_page'] = perPage;
    json['current_page'] = currentPage;
    json['last_page'] = lastPage;
    json['first_page'] = firstPage;
    json['first_page_url'] = firstPageUrl;
    json['last_page_url'] = lastPageUrl;
    json['next_page_url'] = nextPageUrl;
    json['previous_page_url'] = previousPageUrl;
    return json;
  }
}

class QuizData {
  int? id;
  String? uniid;
  String? image;
  String? name;
  int? status;
  String? description;
  int? categoryId;
  int? salonId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<Tags>? tags;
  User? user;
  Salon? salon;
  Category? category;
  List<UserQuizScore>? userQuizScore;
  List<dynamic>? userQuizAnswers;
  List<QuizQuestions>? quizQuestions;
  String? createdAgo;
  UserQuizStatus? userQuizStatus;
  QuizStatusMeta? meta;

  QuizData({
    this.id,
    this.uniid,
    this.image,
    this.name,
    this.status,
    this.description,
    this.categoryId,
    this.salonId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.tags,
    this.user,
    this.salon,
    this.category,
    this.userQuizScore,
    this.userQuizAnswers,
    this.quizQuestions,
    this.createdAgo,
    this.userQuizStatus,
    this.meta,
  });

  QuizData.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    uniid = json['uniid'] as String?;
    image = json['image'] as String?;
    name = json['name'] as String?;
    status = json['status'] as int?;
    description = json['description'] as String?;
    categoryId = json['category_id'] as int?;
    salonId = json['salon_id'] as int?;
    userId = json['user_id'] as int?;
    createdAt = json['created_at'] as String? ?? "";
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    tags = (json['tags'] as List?)
        ?.map((dynamic e) => Tags.fromJson(e as Map<String, dynamic>))
        .toList();
    user = (json['user'] as Map<String, dynamic>?) != null
        ? User.fromJson(json['user'] as Map<String, dynamic>)
        : null;
    salon = (json['salon'] as Map<String, dynamic>?) != null
        ? Salon.fromJson(json['salon'] as Map<String, dynamic>)
        : null;
    category = (json['category'] as Map<String, dynamic>?) != null
        ? Category.fromJson(json['category'] as Map<String, dynamic>)
        : null;
    userQuizScore = (json['userQuizScore'] as List?)
        ?.map((dynamic e) => UserQuizScore.fromJson(e as Map<String, dynamic>))
        .toList();
    userQuizAnswers = json['userQuizAnswers'] as List?;
    quizQuestions = (json['quizQuestions'] as List?)
        ?.map((dynamic e) => QuizQuestions.fromJson(e as Map<String, dynamic>))
        .toList();
    createdAgo = json['created_ago'] as String?;
    userQuizStatus = (json['userQuizStatus'] as Map<String, dynamic>?) != null
        ? UserQuizStatus.fromJson(
            json['userQuizStatus'] as Map<String, dynamic>)
        : null;
    meta = (json['meta'] as Map<String, dynamic>?) != null
        ? QuizStatusMeta.fromJson(json['meta'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['uniid'] = uniid;
    json['image'] = image;
    json['name'] = name;
    json['status'] = status;
    json['description'] = description;
    json['category_id'] = categoryId;
    json['salon_id'] = salonId;
    json['user_id'] = userId;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['tags'] = tags?.map((e) => e.toJson()).toList();
    json['user'] = user?.toJson();
    json['salon'] = salon?.toJson();
    json['category'] = category?.toJson();
    json['userQuizScore'] = userQuizScore?.map((e) => e.toJson()).toList();
    json['userQuizAnswers'] = userQuizAnswers;
    json['quizQuestions'] = quizQuestions?.map((e) => e.toJson()).toList();
    json['created_ago'] = createdAgo;
    json['userQuizStatus'] = userQuizStatus?.toJson();
    json['meta'] = meta?.toJson();
    return json;
  }
}

class Tags {
  int? id;
  String? name;
  int? categoryId;
  int? status;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? createdAgo;

  Tags({
    this.id,
    this.name,
    this.categoryId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdAgo,
  });

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    categoryId = json['category_id'] as int?;
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
    json['category_id'] = categoryId;
    json['status'] = status;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['created_ago'] = createdAgo;
    return json;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  dynamic dob;
  dynamic relationshipId;
  int? locationId;
  dynamic hireDate;
  dynamic bio;
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

  User({
    this.id,
    this.name,
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
    email = json['email'] as String?;
    phone = json['phone'] as String?;
    dob = json['dob'];
    relationshipId = json['relationship_id'];
    locationId = json['location_id'] as int?;
    hireDate = json['hire_date'];
    bio = json['bio'];
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
    meta = (json['meta'] as Map<String, dynamic>?) != null
        ? Meta.fromJson(json['meta'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
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

class UserQuizScore {
  int? id;
  int? score;
  int? userId;
  int? status;
  int? quizId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? createdAgo;
  String? statusName;
  Meta? meta;

  UserQuizScore({
    this.id,
    this.score,
    this.userId,
    this.status,
    this.quizId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdAgo,
    this.statusName,
    this.meta,
  });

  UserQuizScore.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    score = json['score'] as int?;
    userId = json['user_id'] as int?;
    status = json['status'] as int?;
    quizId = json['quiz_id'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    createdAgo = json['created_ago'] as String?;
    statusName = json['statusName'] as String?;
    meta = (json['meta'] as Map<String, dynamic>?) != null
        ? Meta.fromJson(json['meta'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['score'] = score;
    json['user_id'] = userId;
    json['status'] = status;
    json['quiz_id'] = quizId;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['created_ago'] = createdAgo;
    json['statusName'] = statusName;
    json['meta'] = meta?.toJson();
    return json;
  }
}

class QuizQuestions {
  int? id;
  String? question;
  String? image;
  int? type;
  int? quizId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<QuestionAnswers>? questionAnswers;
  String? createdAgo;
  String? typeName;

  QuizQuestions({
    this.id,
    this.question,
    this.image,
    this.type,
    this.quizId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.questionAnswers,
    this.createdAgo,
    this.typeName,
  });

  QuizQuestions.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    question = json['question'] as String?;
    image = json['image'] as String?;
    type = json['type'] as int?;
    quizId = json['quiz_id'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    questionAnswers = (json['questionAnswers'] as List?)
        ?.map(
            (dynamic e) => QuestionAnswers.fromJson(e as Map<String, dynamic>))
        .toList();
    createdAgo = json['created_ago'] as String?;
    typeName = json['typeName'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['question'] = question;
    json['image'] = image;
    json['type'] = type;
    json['quiz_id'] = quizId;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['questionAnswers'] = questionAnswers?.map((e) => e.toJson()).toList();
    json['created_ago'] = createdAgo;
    json['typeName'] = typeName;
    return json;
  }
}

class QuestionAnswers {
  int? id;
  String? answer;
  dynamic image;
  int? isCorrect;
  int? quizQuestionId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? createdAgo;
  String? correct;

  QuestionAnswers({
    this.id,
    this.answer,
    this.image,
    this.isCorrect,
    this.quizQuestionId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdAgo,
    this.correct,
  });

  QuestionAnswers.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    answer = json['answer'] as String?;
    image = json['image'];
    isCorrect = json['is_correct'] as int?;
    quizQuestionId = json['quiz_question_id'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    createdAgo = json['created_ago'] as String?;
    correct = json['correct'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['answer'] = answer;
    json['image'] = image;
    json['is_correct'] = isCorrect;
    json['quiz_question_id'] = quizQuestionId;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['created_ago'] = createdAgo;
    json['correct'] = correct;
    return json;
  }
}

class UserQuizStatus {
  int? id;
  int? score;
  int? userId;
  int? status;
  int? quizId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? createdAgo;
  String? statusName;
  QuizStatusMeta? meta;

  UserQuizStatus({
    this.id,
    this.score,
    this.userId,
    this.status,
    this.quizId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdAgo,
    this.statusName,
    this.meta,
  });

  UserQuizStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    score = json['score'] as int?;
    userId = json['user_id'] as int?;
    status = json['status'] as int?;
    quizId = json['quiz_id'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    createdAgo = json['created_ago'] as String?;
    statusName = json['statusName'] as String?;
    meta = (json['meta'] as Map<String, dynamic>?) != null
        ? QuizStatusMeta.fromJson(json['meta'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['score'] = score;
    json['user_id'] = userId;
    json['status'] = status;
    json['quiz_id'] = quizId;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['created_ago'] = createdAgo;
    json['statusName'] = statusName;
    json['meta'] = meta?.toJson();
    return json;
  }
}

class QuizStatusMeta {
  int? maxScore;
  int? minScore;
  int? questionsCount;

  QuizStatusMeta({
    this.maxScore,
    this.minScore,
    this.questionsCount,
  });

  QuizStatusMeta.fromJson(Map<String, dynamic> json) {
    maxScore = json['max_score'] as int?;
    minScore = json['min_score'] as int?;
    questionsCount = json['questions_count'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['max_score'] = maxScore;
    json['min_score'] = minScore;
    json['questions_count'] = questionsCount;
    return json;
  }
}
