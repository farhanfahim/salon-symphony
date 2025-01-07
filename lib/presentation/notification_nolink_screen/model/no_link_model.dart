class NoLinkNotification {
  bool? status;
  String? message;
  Data? data;

  NoLinkNotification({
    this.status,
    this.message,
    this.data,
  });

  NoLinkNotification.fromJson(Map<String, dynamic> json) {
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
  int? notifiableId;
  String? title;
  String? message;
  String? link;
  int? refId;
  int? type;
  dynamic readAt;
  dynamic extra;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  int? userId;
  dynamic alertId;
  User? user;
  PostedBy? postedBy;
  dynamic alert;
  String? createdAgo;
  String? userName;

  Data({
    this.id,
    this.notifiableId,
    this.title,
    this.message,
    this.link,
    this.refId,
    this.type,
    this.readAt,
    this.extra,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.userId,
    this.alertId,
    this.user,
    this.postedBy,
    this.alert,
    this.createdAgo,
    this.userName,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    notifiableId = json['notifiable_id'] as int?;
    title = json['title'] as String?;
    message = json['message'] as String?;
    link = json['link'] as String?;
    refId = json['ref_id'] as int?;
    type = json['type'] as int?;
    readAt = json['read_at'];
    extra = json['extra'];
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    userId = json['user_id'] as int?;
    alertId = json['alert_id'];
    user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null;
    postedBy = (json['postedBy'] as Map<String,dynamic>?) != null ? PostedBy.fromJson(json['postedBy'] as Map<String,dynamic>) : null;
    alert = json['alert'];
    createdAgo = json['created_ago'] as String?;
    userName = json['user_name'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['notifiable_id'] = notifiableId;
    json['title'] = title;
    json['message'] = message;
    json['link'] = link;
    json['ref_id'] = refId;
    json['type'] = type;
    json['read_at'] = readAt;
    json['extra'] = extra;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['user_id'] = userId;
    json['alert_id'] = alertId;
    json['user'] = user?.toJson();
    json['postedBy'] = postedBy?.toJson();
    json['alert'] = alert;
    json['created_ago'] = createdAgo;
    json['user_name'] = userName;
    return json;
  }
}

class User {
  int? id;
  String? name;
  String? slug;
  String? email;
  String? phone;
  String? dob;
  int? relationshipId;
  int? locationId;
  String? hireDate;
  String? bio;
  String? school;
  String? image;
  String? address;
  dynamic city;
  dynamic countryId;
  dynamic zip;
  int? salonId;
  String? portfolio;
  String? tiktok;
  String? instagram;
  String? facebook;
  int? positionId;
  int? isCompleted;
  int? isSocialLogin;
  int? isApproved;
  int? isVerified;
  int? isScheduled;
  dynamic verificationCode;
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
    slug = json['slug'] as String?;
    email = json['email'] as String?;
    phone = json['phone'] as String?;
    dob = json['dob'] as String?;
    relationshipId = json['relationship_id'] as int?;
    locationId = json['location_id'] as int?;
    hireDate = json['hire_date'] as String?;
    bio = json['bio'] as String?;
    school = json['school'] as String?;
    image = json['image'] as String?;
    address = json['address'] as String?;
    city = json['city'];
    countryId = json['country_id'];
    zip = json['zip'];
    salonId = json['salon_id'] as int?;
    portfolio = json['portfolio'] as String?;
    tiktok = json['tiktok'] as String?;
    instagram = json['instagram'] as String?;
    facebook = json['facebook'] as String?;
    positionId = json['position_id'] as int?;
    isCompleted = json['is_completed'] as int?;
    isSocialLogin = json['is_social_login'] as int?;
    isApproved = json['is_approved'] as int?;
    isVerified = json['is_verified'] as int?;
    isScheduled = json['is_scheduled'] as int?;
    verificationCode = json['verification_code'];
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

class PostedBy {
  int? id;
  String? name;
  String? slug;
  String? email;
  String? phone;
  String? dob;
  dynamic relationshipId;
  int? locationId;
  String? hireDate;
  dynamic bio;
  String? school;
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
  dynamic verificationCode;
  int? pushNotification;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? createdAgo;
  String? relationship;
  int? totalPoints;
  Meta? meta;

  PostedBy({
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

  PostedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    slug = json['slug'] as String?;
    email = json['email'] as String?;
    phone = json['phone'] as String?;
    dob = json['dob'] as String?;
    relationshipId = json['relationship_id'];
    locationId = json['location_id'] as int?;
    hireDate = json['hire_date'] as String?;
    bio = json['bio'];
    school = json['school'] as String?;
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
    verificationCode = json['verification_code'];
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

