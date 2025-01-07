class GetResourceDetailResponseModel {
  bool? status;
  String? message;
  ResourceDetailData? data;

  GetResourceDetailResponseModel({
    this.status,
    this.message,
    this.data,
  });

  GetResourceDetailResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] as bool?;
    message = json['message'] as String?;
    data = (json['data'] as Map<String,dynamic>?) != null ? ResourceDetailData.fromJson(json['data'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['status'] = status;
    json['message'] = message;
    json['data'] = data?.toJson();
    return json;
  }
}

class ResourceDetailData {
  int? id;
  String? name;
  String? image;
  int? type;
  String? description;
  String? link;
  String? size;
  int? categoryId;
  int? link_type;
  int? salonId;
  int? status;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Salon? salon;
  List<dynamic>? views;
  Category? category;
  List<Tags>? tags;
  String? createdAgo;
  String? typeName;
  bool? userView;
  Meta? meta;

  ResourceDetailData({
    this.id,
    this.name,
    this.image,
    this.type,
    this.description,
    this.link,
    this.size,
    this.categoryId,
    this.link_type,
    this.salonId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.salon,
    this.views,
    this.category,
    this.tags,
    this.createdAgo,
    this.typeName,
    this.userView,
    this.meta,
  });

  ResourceDetailData.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    image = json['image'] as String?;
    type = json['type'] as int?;
    description = json['description'] as String?;
    link = json['link'] as String?;
    size = json['size'] as String?;
    categoryId = json['category_id'] as int?;
    link_type = json['link_type'] as int?;
    salonId = json['salon_id'] as int?;
    status = json['status'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    salon = (json['salon'] as Map<String,dynamic>?) != null ? Salon.fromJson(json['salon'] as Map<String,dynamic>) : null;
    views = json['views'] as List?;
    category = (json['category'] as Map<String,dynamic>?) != null ? Category.fromJson(json['category'] as Map<String,dynamic>) : null;
    tags = (json['tags'] as List?)?.map((dynamic e) => Tags.fromJson(e as Map<String,dynamic>)).toList();
    createdAgo = json['created_ago'] as String?;
    typeName = json['type_name'] as String?;
    userView = json['userView'] as bool?;
    meta = (json['meta'] as Map<String,dynamic>?) != null ? Meta.fromJson(json['meta'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['image'] = image;
    json['type'] = type;
    json['description'] = description;
    json['link'] = link;
    json['size'] = size;
    json['category_id'] = categoryId;
    json['link_type'] = link_type;
    json['salon_id'] = salonId;
    json['status'] = status;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['salon'] = salon?.toJson();
    json['views'] = views;
    json['category'] = category?.toJson();
    json['tags'] = tags?.map((e) => e.toJson()).toList();
    json['created_ago'] = createdAgo;
    json['type_name'] = typeName;
    json['userView'] = userView;
    json['meta'] = meta?.toJson();
    return json;
  }
}

class Salon {
  int? id;
  String? uniid;
  dynamic image;
  String? name;
  dynamic slug;
  dynamic address;
  dynamic bookingSoftware;
  dynamic productLine;
  dynamic jobTitle;
  dynamic dateFounded;
  dynamic city;
  dynamic countryId;
  dynamic zip;
  int? multiLocations;
  int? status;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic stripeCustomerId;
  String? createdAgo;

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
    this.createdAgo,
  });

  Salon.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    uniid = json['uniid'] as String?;
    image = json['image'];
    name = json['name'] as String?;
    slug = json['slug'];
    address = json['address'];
    bookingSoftware = json['booking_software'];
    productLine = json['product_line'];
    jobTitle = json['job_title'];
    dateFounded = json['date_founded'];
    city = json['city'];
    countryId = json['country_id'];
    zip = json['zip'];
    multiLocations = json['multi_locations'] as int?;
    status = json['status'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    stripeCustomerId = json['stripe_customer_id'];
    createdAgo = json['created_ago'] as String?;
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
    json['created_ago'] = createdAgo;
    return json;
  }
}

class Category {
  int? id;
  String? name;
  int? status;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? createdAgo;

  Category({
    this.id,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdAgo,
  });

  Category.fromJson(Map<String, dynamic> json) {
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

class Meta {
  int? userViews;

  Meta({
    this.userViews,
  });

  Meta.fromJson(Map<String, dynamic> json) {
    userViews = json['user_views'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['user_views'] = userViews;
    return json;
  }
}