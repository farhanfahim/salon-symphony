class CategoryResponseModel {
  bool? status;
  String? message;
  List<CategoryData>? data;

  CategoryResponseModel({
    this.status,
    this.message,
    this.data,
  });

  CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] as bool?;
    message = json['message'] as String?;
    data = (json['data'] as List?)?.map((dynamic e) => CategoryData.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['status'] = status;
    json['message'] = message;
    json['data'] = data?.map((e) => e.toJson()).toList();
    return json;
  }
}

class CategoryData {
  int? id;
  String? name;
  int? status;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? createdAgo;

  CategoryData({
    this.id,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdAgo,
  });

  CategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
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
    json['status'] = status;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['created_ago'] = createdAgo;
    return json;
  }
}