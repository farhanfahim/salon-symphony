import '../../../core/app_export.dart';

class SurveyQuestionModel {
  bool? status;
  String? message;
  List<SurveyQuestionData>? data;

  SurveyQuestionModel({
    this.status,
    this.message,
    this.data,
  });

  SurveyQuestionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] as bool?;
    message = json['message'] as String?;
    data = (json['data'] as List?)?.map((dynamic e) => SurveyQuestionData.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['status'] = status;
    json['message'] = message;
    json['data'] = data?.map((e) => e.toJson()).toList();
    return json;
  }
}

class SurveyQuestionData {
  int? id;
  String? question;
  String? image;
  int? type;
  int? surveyId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Survey? survey;
  List<SurveyQuestionOptions>? surveyQuestionOptions;
  String? createdAgo;
  String? typeName;

  SurveyQuestionData({
    this.id,
    this.question,
    this.image,
    this.type,
    this.surveyId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.survey,
    this.surveyQuestionOptions,
    this.createdAgo,
    this.typeName,
  });

  SurveyQuestionData.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    question = json['question'] as String?;
    image = json['image'] as String?;
    type = json['type'] as int?;
    surveyId = json['survey_id'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    survey = (json['survey'] as Map<String,dynamic>?) != null ? Survey.fromJson(json['survey'] as Map<String,dynamic>) : null;
    surveyQuestionOptions = (json['surveyQuestionOptions'] as List?)?.map((dynamic e) => SurveyQuestionOptions.fromJson(e as Map<String,dynamic>)).toList();
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
    json['survey'] = survey?.toJson();
    json['surveyQuestionOptions'] = surveyQuestionOptions?.map((e) => e.toJson()).toList();
    json['created_ago'] = createdAgo;
    json['typeName'] = typeName;
    return json;
  }
}

class Survey {
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
  String? createdAgo;
  dynamic userSurveyStatus;
  List<dynamic>? startedUsers;
  List<dynamic>? notStartedUsers;
  List<dynamic>? submittedUsers;
  Meta? meta;

  Survey({
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
    this.createdAgo,
    this.userSurveyStatus,
    this.startedUsers,
    this.notStartedUsers,
    this.submittedUsers,
    this.meta,
  });

  Survey.fromJson(Map<String, dynamic> json) {
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
    createdAgo = json['created_ago'] as String?;
    userSurveyStatus = json['userSurveyStatus'];
    startedUsers = json['startedUsers'] as List?;
    notStartedUsers = json['notStartedUsers'] as List?;
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
    json['created_ago'] = createdAgo;
    json['userSurveyStatus'] = userSurveyStatus;
    json['startedUsers'] = startedUsers;
    json['notStartedUsers'] = notStartedUsers;
    json['submittedUsers'] = submittedUsers;
    json['meta'] = meta?.toJson();
    return json;
  }
}

class Meta {

Meta.fromJson(Map<String, dynamic> json) {

}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> json = <String, dynamic>{};

  return json;
}
}

class SurveyQuestionOptions {
  int? id;
  String? answer;
  int? surveyQuestionId;
  String? createdAt;
  String? updatedAt;
  Rx<bool>? isSelected=false.obs;
  dynamic deletedAt;
  dynamic image;
  String? createdAgo;

  SurveyQuestionOptions({
    this.id,
    this.answer,
    this.surveyQuestionId,
    this.createdAt,
    this.updatedAt,
    this.isSelected,
    this.deletedAt,
    this.image,
    this.createdAgo,
  });

  SurveyQuestionOptions.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    answer = json['answer'] as String?;
    surveyQuestionId = json['survey_question_id'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    image = json['image'];
    createdAgo = json['created_ago'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['answer'] = answer;
    json['survey_question_id'] = surveyQuestionId;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['image'] = image;
    json['created_ago'] = createdAgo;
    return json;
  }
}