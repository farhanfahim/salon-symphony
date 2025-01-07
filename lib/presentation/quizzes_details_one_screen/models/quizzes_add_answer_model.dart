class QuizAddAnswersModel {
  bool? status;
  String? message;
  Data? data;

  QuizAddAnswersModel({
    this.status,
    this.message,
    this.data,
  });

  QuizAddAnswersModel.fromJson(Map<String, dynamic> json) {
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
  int? quizId;
  String? userId;
  int? status;
  int? score;
  int? id;
  String? statusName;
  Meta? meta;

  Data({
    this.quizId,
    this.userId,
    this.status,
    this.score,
    this.id,
    this.statusName,
    this.meta,
  });

  Data.fromJson(Map<String, dynamic> json) {
    quizId = json['quiz_id'] as int?;
    userId = json['user_id'] as String?;
    status = json['status'] as int?;
    score = json['score'] as int?;
    id = json['id'] as int?;
    statusName = json['statusName'] as String?;
    meta = (json['meta'] as Map<String,dynamic>?) != null ? Meta.fromJson(json['meta'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['quiz_id'] = quizId;
    json['user_id'] = userId;
    json['status'] = status;
    json['score'] = score;
    json['id'] = id;
    json['statusName'] = statusName;
    json['meta'] = meta?.toJson();
    return json;
  }
}

class Meta {
  bool? perfect;
  String? badge;

  Meta({
    this.perfect,
    this.badge,
  });

  Meta.fromJson(Map<String, dynamic> json) {
    perfect = json['perfect'] as bool?;
    badge = json['badge'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['perfect'] = perfect;
    json['badge'] = badge;
    return json;
  }
}