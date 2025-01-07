import 'package:get/get_rx/src/rx_types/rx_types.dart';

class QuizQuestionAnswersModel {
  bool? status;
  String? message;
  List<QuestionAnswersData>? data;

  QuizQuestionAnswersModel({
    this.status,
    this.message,
    this.data,
  });

  QuizQuestionAnswersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] as bool?;
    message = json['message'] as String?;
    data = (json['data'] as List?)
        ?.map((dynamic e) =>
            QuestionAnswersData.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['status'] = status;
    json['message'] = message;
    json['data'] = data?.map((e) => e.toJson()).toList();
    return json;
  }
}

class QuestionAnswersData {
  int? id;
  String? question;
  String? image;
  int? type;
  int? quizId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Quiz? quiz;
  List<QuestionAnswers>? questionAnswers;
  String? createdAgo;
  String? typeName;

  QuestionAnswersData({
    this.id,
    this.question,
    this.image,
    this.type,
    this.quizId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.quiz,
    this.questionAnswers,
    this.createdAgo,
    this.typeName,

  });

  QuestionAnswersData.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    question = json['question'] as String?;
    image = json['image'] as String?;
    type = json['type'] as int?;
    quizId = json['quiz_id'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    quiz = (json['quiz'] as Map<String, dynamic>?) != null
        ? Quiz.fromJson(json['quiz'] as Map<String, dynamic>)
        : null;
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
    json['quiz'] = quiz?.toJson();
    json['questionAnswers'] = questionAnswers?.map((e) => e.toJson()).toList();
    json['created_ago'] = createdAgo;
    json['typeName'] = typeName;
    return json;
  }
}

class Quiz {
  int? id;
  String? uniid;
  String? image;
  String? name;
  int? status;
  dynamic description;
  int? categoryId;
  int? salonId;
  Category? category;
  int? userId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? createdAgo;
  List<dynamic>? userQuizStatus;

  Quiz({
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
    this.category,
    this.createdAgo,
    this.userQuizStatus,
  });

  Quiz.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    uniid = json['uniid'] as String?;
    image = json['image'] as String?;
    name = json['name'] as String?;
    status = json['status'] as int?;
    description = json['description'];
    categoryId = json['category_id'] as int?;
    salonId = json['salon_id'] as int?;
    userId = json['user_id'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    createdAgo = json['created_ago'] as String?;
    userQuizStatus = json['userQuizStatus'] as List?;
    category = (json['category'] as Map<String,dynamic>?) != null ? Category.fromJson(json['category'] as Map<String,dynamic>) : null;
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
    json['created_ago'] = createdAgo;
    json['userQuizStatus'] = userQuizStatus;
    json['category'] = category?.toJson();

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
  Rx<bool>? isSelected=false.obs;
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
    this.isSelected
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


class Category {
  String? name;
  int? id;

  Category({
    this.name,
    this.id,
  });

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    id = json['id'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['id'] = id;
    return json;
  }
}