class SurveySubmitModel {
  bool? status;
  String? message;
  Data? data;

  SurveySubmitModel({
    this.status,
    this.message,
    this.data,
  });

  SurveySubmitModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] as bool?;
    message = json['message'] as String?;
    data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;
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
  int? id;
  int? status;
  int? surveyId;
  String? userId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? createdAgo;
  String? statusName;
  Meta? meta;

  Data({
    this.id,
    this.status,
    this.surveyId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdAgo,
    this.statusName,
    this.meta,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    status = json['status'] as int?;
    surveyId = json['survey_id'] as int?;
    userId = json['user_id'] as String?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    createdAgo = json['created_ago'] as String?;
    statusName = json['statusName'] as String?;
    meta = (json['meta'] as Map<String,dynamic>?) != null ? Meta.fromJson(json['meta'] as Map<String,dynamic>) : null;
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
    json['created_ago'] = createdAgo;
    json['statusName'] = statusName;
    json['meta'] = meta?.toJson();
    return json;
  }
}

class Meta {
  String? badge;
  int? points;

  Meta({
    this.badge,
    this.points,
  });

  Meta.fromJson(Map<String, dynamic> json) {
    badge = json['badge'] as String?;
    points = json['points'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['badge'] = badge;
    json['points'] = points;
    return json;
  }
}