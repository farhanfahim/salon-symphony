class LoginResponseModel {
  int? status;
  String? message;
  LoginData? data;

  LoginResponseModel({
    this.status,
    this.message,
    this.data,
  });

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] as int?;
    message = json['message'] as String?;
    data = (json['data'] as Map<String,dynamic>?) != null ? LoginData.fromJson(json['data'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['status'] = status;
    json['message'] = message;
    json['data'] = data?.toJson();
    return json;
  }
}

class LoginData {
  User? user;
  AccessToken? accessToken;

  LoginData({
    this.user,
    this.accessToken,
  });

  LoginData.fromJson(Map<String, dynamic> json) {
    user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null;
    accessToken = (json['access_token'] as Map<String,dynamic>?) != null ? AccessToken.fromJson(json['access_token'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['user'] = user?.toJson();
    json['access_token'] = accessToken?.toJson();
    return json;
  }
}
class Approved {
  int? id;
  String? name;
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
  int? isScheduled;
  int? isApproved;
  int? isVerified;
  dynamic verificationCode;
  int? pushNotification;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<Roles>? roles;
  dynamic salon;
  dynamic position;
  dynamic relationship;
  List<dynamic>? specialities;
  List<dynamic>? points;
  List<dynamic>? badges;
  List<dynamic>? certificates;
  dynamic location;
  String? createdAgo;
  Meta? meta;

  Approved({
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
    this.isScheduled,
    this.isApproved,
    this.isVerified,
    this.verificationCode,
    this.pushNotification,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.roles,
    this.salon,
    this.position,
    this.relationship,
    this.specialities,
    this.points,
    this.badges,
    this.certificates,
    this.location,
    this.createdAgo,
    this.meta,
  });

  Approved.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
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
    isScheduled = json['is_scheduled'] as int?;
    isApproved = json['is_approved'] as int?;
    isVerified = json['is_verified'] as int?;
    verificationCode = json['verification_code'];
    pushNotification = json['push_notification'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    roles = (json['roles'] as List?)?.map((dynamic e) => Roles.fromJson(e as Map<String,dynamic>)).toList();
    salon = json['salon'];
    position = json['position'];
    relationship = json['relationship'];
    specialities = json['specialities'] as List?;
    points = json['points'] as List?;
    badges = json['badges'] as List?;
    certificates = json['certificates'] as List?;
    location = json['location'];
    createdAgo = json['created_ago'] as String?;
    meta = (json['meta'] as Map<String,dynamic>?) != null ? Meta.fromJson(json['meta'] as Map<String,dynamic>) : null;
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
    json['is_scheduled'] = isScheduled;
    json['is_approved'] = isApproved;
    json['is_verified'] = isVerified;
    json['verification_code'] = verificationCode;
    json['push_notification'] = pushNotification;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['roles'] = roles?.map((e) => e.toJson()).toList();
    json['salon'] = salon;
    json['position'] = position;
    json['relationship'] = relationship;
    json['specialities'] = specialities;
    json['points'] = points;
    json['badges'] = badges;
    json['certificates'] = certificates;
    json['location'] = location;
    json['created_ago'] = createdAgo;
    json['meta'] = meta?.toJson();
    return json;
  }
}
class User {
  int? id;
  String? name;
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
  int? isScheduled;
  int? isApproved;
  int? isVerified;
  dynamic verificationCode;
  int? pushNotification;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<Roles>? roles;
  dynamic salon;
  dynamic position;
  dynamic relationship;
  List<dynamic>? specialities;
  List<dynamic>? points;
  List<dynamic>? badges;
  List<dynamic>? certificates;
  dynamic location;
  String? createdAgo;
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
    this.isScheduled,
    this.isApproved,
    this.isVerified,
    this.verificationCode,
    this.pushNotification,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.roles,
    this.salon,
    this.position,
    this.relationship,
    this.specialities,
    this.points,
    this.badges,
    this.certificates,
    this.location,
    this.createdAgo,
    this.meta,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
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
    isScheduled = json['is_scheduled'] as int?;
    isApproved = json['is_approved'] as int?;
    isVerified = json['is_verified'] as int?;
    verificationCode = json['verification_code'];
    pushNotification = json['push_notification'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    roles = (json['roles'] as List?)?.map((dynamic e) => Roles.fromJson(e as Map<String,dynamic>)).toList();
    salon = json['salon'];
    position = json['position'];
    relationship = json['relationship'];
    specialities = json['specialities'] as List?;
    points = json['points'] as List?;
    badges = json['badges'] as List?;
    certificates = json['certificates'] as List?;
    location = json['location'];
    createdAgo = json['created_ago'] as String?;
    meta = (json['meta'] as Map<String,dynamic>?) != null ? Meta.fromJson(json['meta'] as Map<String,dynamic>) : null;
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
    json['is_scheduled'] = isScheduled;
    json['is_approved'] = isApproved;
    json['is_verified'] = isVerified;
    json['verification_code'] = verificationCode;
    json['push_notification'] = pushNotification;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['roles'] = roles?.map((e) => e.toJson()).toList();
    json['salon'] = salon;
    json['position'] = position;
    json['relationship'] = relationship;
    json['specialities'] = specialities;
    json['points'] = points;
    json['badges'] = badges;
    json['certificates'] = certificates;
    json['location'] = location;
    json['created_ago'] = createdAgo;
    json['meta'] = meta?.toJson();
    return json;
  }
}

class Roles {
  int? id;
  String? name;
  String? displayName;
  dynamic description;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? createdAgo;

  Roles({
    this.id,
    this.name,
    this.displayName,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdAgo,
  });

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    displayName = json['display_name'] as String?;
    description = json['description'];
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    createdAgo = json['created_ago'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['display_name'] = displayName;
    json['description'] = description;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['created_ago'] = createdAgo;
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

class AccessToken {
  String? type;
  String? token;
  String? expiresAt;

  AccessToken({
    this.type,
    this.token,
    this.expiresAt,
  });

  AccessToken.fromJson(Map<String, dynamic> json) {
    type = json['type'] as String?;
    token = json['token'] as String?;
    expiresAt = json['expires_at'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['type'] = type;
    json['token'] = token;
    json['expires_at'] = expiresAt;
    return json;
  }
}