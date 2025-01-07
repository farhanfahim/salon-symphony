import 'package:get/get.dart';

class EventsListing {
  bool? status;
  String? message;
  Data? data;

  EventsListing({
    this.status,
    this.message,
    this.data,
  });

  EventsListing.fromJson(Map<String, dynamic> json) {
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
  Meta? meta;
  List<EventsData>? data;

  Data({
    this.meta,
    this.data,
  });

  Data.fromJson(Map<String, dynamic> json) {
    meta = (json['meta'] as Map<String,dynamic>?) != null ? Meta.fromJson(json['meta'] as Map<String,dynamic>) : null;
    data = (json['data'] as List?)?.map((dynamic e) => EventsData.fromJson(e as Map<String,dynamic>)).toList();
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

class EventsData {
  int? id;
  String? uniid;
  String? name;
  String? image;
  String? startTime;
  String? startDate;
  String? endTime;
  String? endDate;
  String? location;
  String? address;
  dynamic long;
  String? instructor;
  Object? type;
  Object? price;
  Object? status;
  String? description;
  int? categoryId;
  String? timezone;
  int? salonId;
  dynamic link;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic lat;
  Salon? salon;
  List<EventReservations>? eventReservations;
  Category? category;
  String? createdAgo;
  UserReservation? userReservation;
  Rx<String> localStatus = ''.obs;
  List<AllReservation>? allReservation;
  Meta? meta;

  EventsData({
    this.id,
    this.uniid,
    this.name,
    this.image,
    this.startTime,
    this.startDate,
    this.endTime,
    this.endDate,
    this.location,
    this.address,
    this.long,
    this.instructor,
    this.type,
    this.price,
    this.status,
    this.description,
    this.categoryId,
    this.timezone,
    this.salonId,
    this.link,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.lat,
    this.salon,
    this.eventReservations,
    this.category,
    this.createdAgo,
    this.userReservation,
    // this.localStatus,
    this.allReservation,
    this.meta,
  });

  EventsData.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    uniid = json['uniid'] as String?;
    name = json['name'] as String?;
    image = json['image'] as String?;
    startTime = json['start_time'] as String?;
    startDate = json['start_date'] as String?;
    endTime = json['end_time'] as String?;
    endDate = json['end_date'] as String?;
    location = json['location'] as String?;
    address = json['address'] as String?;
    long = json['long'];
    instructor = json['instructor'] as String?;
    type = json['type'] as Object?;
    price = json['price'] as Object?;
    status = json['status'] as Object?;
    description = json['description'] as String?;
    categoryId = json['category_id'] as int?;
    timezone = json['timezone'] as String?;
    salonId = json['salon_id'] as int?;
    link = json['link'];
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    lat = json['lat'];
    salon = (json['salon'] as Map<String,dynamic>?) != null ? Salon.fromJson(json['salon'] as Map<String,dynamic>) : null;
    eventReservations = (json['eventReservations'] as List?)?.map((dynamic e) => EventReservations.fromJson(e as Map<String,dynamic>)).toList();
    category = (json['category'] as Map<String,dynamic>?) != null ? Category.fromJson(json['category'] as Map<String,dynamic>) : null;
    createdAgo = json['created_ago'] as String?;
    userReservation = (json['userReservation'] as Map<String,dynamic>?) != null ? UserReservation.fromJson(json['userReservation'] as Map<String,dynamic>) : null;
    localStatus.value = '';
    // allReservation = (json['allReservation'] as List?)?.map((dynamic e) => AllReservation.fromJson(e as Map<String,dynamic>)).toList();
    allReservation = (json['goingUsers'] as List?)?.map((dynamic e) => AllReservation.fromJson(e as Map<String,dynamic>)).toList();
    meta = (json['meta'] as Map<String,dynamic>?) != null ? Meta.fromJson(json['meta'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['uniid'] = uniid;
    json['name'] = name;
    json['image'] = image;
    json['start_time'] = startTime;
    json['start_date'] = startDate;
    json['end_time'] = endTime;
    json['end_date'] = endDate;
    json['location'] = location;
    json['address'] = address;
    json['long'] = long;
    json['instructor'] = instructor;
    json['type'] = type;
    json['price'] = price;
    json['status'] = status;
    json['description'] = description;
    json['category_id'] = categoryId;
    json['timezone'] = timezone;
    json['salon_id'] = salonId;
    json['link'] = link;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['lat'] = lat;
    json['salon'] = salon?.toJson();
    json['eventReservations'] = eventReservations?.map((e) => e.toJson()).toList();
    json['category'] = category?.toJson();
    json['created_ago'] = createdAgo;
    json['userReservation'] = userReservation?.toJson();
    json['allReservation'] = allReservation;
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
    json['created_ago'] = createdAgo;
    return json;
  }
}

class EventReservations {
  int? id;
  int? statusId;
  int? salonId;
  int? userId;
  int? eventId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  User? user;
  String? createdAgo;
  String? status;

  EventReservations({
    this.id,
    this.statusId,
    this.salonId,
    this.userId,
    this.eventId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.user,
    this.createdAgo,
    this.status,
  });

  EventReservations.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    statusId = json['status_id'] as int?;
    salonId = json['salon_id'] as int?;
    userId = json['user_id'] as int?;
    eventId = json['event_id'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null;
    createdAgo = json['created_ago'] as String?;
    status = json['status'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['status_id'] = statusId;
    json['salon_id'] = salonId;
    json['user_id'] = userId;
    json['event_id'] = eventId;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['user'] = user?.toJson();
    json['created_ago'] = createdAgo;
    json['status'] = status;
    return json;
  }
}
class AllReservation {
  int? id;
  int? statusId;
  int? salonId;
  int? userId;
  int? eventId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  User? user;
  String? createdAgo;
  String? status;

  AllReservation({
    this.id,
    this.statusId,
    this.salonId,
    this.userId,
    this.eventId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.user,
    this.createdAgo,
    this.status,
  });

  AllReservation.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    statusId = json['status_id'] as int?;
    salonId = json['salon_id'] as int?;
    userId = json['user_id'] as int?;
    eventId = json['event_id'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null;
    createdAgo = json['created_ago'] as String?;
    status = json['status'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['status_id'] = statusId;
    json['salon_id'] = salonId;
    json['user_id'] = userId;
    json['event_id'] = eventId;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['user'] = user?.toJson();
    json['created_ago'] = createdAgo;
    json['status'] = status;
    return json;
  }
}

class User {
  int? id;
  String? name;
  dynamic email;
  String? phone;
  String? dob;
  dynamic relationshipId;
  dynamic locationId;
  dynamic hireDate;
  dynamic bio;
  String? school;
  String? image;
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
    email = json['email'];
    phone = json['phone'] as String?;
    dob = json['dob'] as String?;
    relationshipId = json['relationship_id'];
    locationId = json['location_id'];
    hireDate = json['hire_date'];
    bio = json['bio'];
    school = json['school'] as String?;
    image = json['image'] as String?;
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

class Meta2 {
  dynamic username;

  Meta2({
    this.username,
  });

  Meta2.fromJson(Map<String, dynamic> json) {
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['username'] = username;
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

class UserReservation {
  int? id;
  int? statusId;
  Rx<int>? localStatusId = 0.obs;
  int? salonId;
  int? userId;
  int? eventId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  UserReservationUserModel? user;
  String? createdAgo;
  String? status;
  Rx<String>? localStatus = ''.obs;

  UserReservation({
    this.id,
    this.statusId,
    this.localStatusId,
    this.salonId,
    this.userId,
    this.eventId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.user,
    this.createdAgo,
    this.status,
    // this.localStatus,
  });

  UserReservation.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    statusId = json['status_id'] as int?;
    salonId = json['salon_id'] as int?;
    userId = json['user_id'] as int?;
    eventId = json['event_id'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    user = (json['user'] as Map<String,dynamic>?) != null ? UserReservationUserModel.fromJson(json['user'] as Map<String,dynamic>) : null;
    createdAgo = json['created_ago'] as String?;
    status = json['status'] as String?;
    localStatus!.value = '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['status_id'] = statusId;
    json['salon_id'] = salonId;
    json['user_id'] = userId;
    json['event_id'] = eventId;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['user'] = user?.toJson();
    json['created_ago'] = createdAgo;
    json['status'] = status;
    return json;
  }
}

class UserReservationUserModel {
  int? id;
  String? name;
  dynamic email;
  String? phone;
  String? dob;
  dynamic relationshipId;
  dynamic locationId;
  dynamic hireDate;
  dynamic bio;
  String? school;
  String? image;
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
  dynamic verificationCode;
  int? pushNotification;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? createdAgo;
  String? relationship;
  int? totalPoints;
  Meta? meta;

  UserReservationUserModel({
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

  UserReservationUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    email = json['email'];
    phone = json['phone'] as String?;
    dob = json['dob'] as String?;
    relationshipId = json['relationship_id'];
    locationId = json['location_id'];
    hireDate = json['hire_date'];
    bio = json['bio'];
    school = json['school'] as String?;
    image = json['image'] as String?;
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

class Meta3 {
  dynamic username;

  Meta3({
    this.username,
  });

  Meta3.fromJson(Map<String, dynamic> json) {
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['username'] = username;
    return json;
  }
}

class Meta4 {
  int? interested;
  int? notGoing;
  int? going;

  Meta4({
    this.interested,
    this.notGoing,
    this.going,
  });

  Meta4.fromJson(Map<String, dynamic> json) {
    interested = json['interested'] as int?;
    notGoing = json['not_going'] as int?;
    going = json['going'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['interested'] = interested;
    json['not_going'] = notGoing;
    json['going'] = going;
    return json;
  }
}