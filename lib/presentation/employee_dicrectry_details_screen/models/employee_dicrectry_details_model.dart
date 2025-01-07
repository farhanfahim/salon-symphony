import '../../profile_specialities/model/specialites_response_model.dart';

class TeamUsersModel {
 bool? status;
 String? message;
 TeamUsers? data;

 TeamUsersModel({
  this.status,
  this.message,
  this.data,
 });

 TeamUsersModel.fromJson(Map<String, dynamic> json) {
  status = json['status'] as bool?;
  message = json['message'] as String?;
  data = (json['data'] as Map<String,dynamic>?) != null ? TeamUsers.fromJson(json['data'] as Map<String,dynamic>) : null;
 }

 Map<String, dynamic> toJson() {
  final Map<String, dynamic> json = <String, dynamic>{};
  json['status'] = status;
  json['message'] = message;
  json['data'] = data?.toJson();
  return json;
 }
}

class TeamUsers {
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
 Salon? salon;
 List<Roles>? roles;
 List<SpecialitiesResponseData>? specialities;
 Position? position;
 Location? location;
 List<dynamic>? points;
 List<Schedule>? schedule;
 List<Badges>? badges;
 List<Certificates>? certificates;
 String? createdAgo;
 String? relationship;
 int? totalPoints;
 Meta? meta;

 TeamUsers({
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
  this.salon,
  this.roles,
  this.specialities,
  this.position,
  this.points,
  this.schedule,
  this.badges,
  this.certificates,
  this.location,
  this.createdAgo,
  this.relationship,
  this.totalPoints,
  this.meta,
 });

 TeamUsers.fromJson(Map<String, dynamic> json) {
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
  salon = (json['salon'] as Map<String,dynamic>?) != null ? Salon.fromJson(json['salon'] as Map<String,dynamic>) : null;
  roles = (json['roles'] as List?)?.map((dynamic e) => Roles.fromJson(e as Map<String,dynamic>)).toList();
  if (json['specialities'] != null) {
   specialities = <SpecialitiesResponseData>[];
   json['specialities'].forEach((v) { specialities!.add(new SpecialitiesResponseData.fromJson(v)); });
  }
  position = (json['position'] as Map<String,dynamic>?) != null ? Position.fromJson(json['position'] as Map<String,dynamic>) : null;
  points = json['points'] as List?;
  schedule = (json['schedule'] as List?)?.map((dynamic e) => Schedule.fromJson(e as Map<String,dynamic>)).toList();
  badges = (json['badges'] as List?)?.map((dynamic e) => Badges.fromJson(e as Map<String,dynamic>)).toList();
  certificates = (json['certificates'] as List?)?.map((dynamic e) => Certificates.fromJson(e as Map<String,dynamic>)).toList();
  location = (json['location'] as Map<String,dynamic>?) != null ? Location.fromJson(json['location'] as Map<String,dynamic>) : null;
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
  json['salon'] = salon?.toJson();
  json['roles'] = roles?.map((e) => e.toJson()).toList();
  if (this.specialities != null) {
   json['specialities'] = this.specialities!.map((v) => v.toJson()).toList();
  }
  json['position'] = position?.toJson();
  json['points'] = points;
  json['schedule'] = schedule?.map((e) => e.toJson()).toList();
  json['badges'] = badges?.map((e) => e.toJson()).toList();
  json['certificates'] = certificates?.map((e) => e.toJson()).toList();
  json['location'] = location;
  json['created_ago'] = createdAgo;
  json['relationship'] = relationship;
  json['totalPoints'] = totalPoints;
  json['meta'] = meta?.toJson();
  return json;
 }
}
class Location {
 int? id;
 String? name;
 String? image;
 String? address;
 String? city;
 int? countryId;
 String? zip;
 int? status;
 int? salonId;
 int? userId;
 String? createdAt;
 String? updatedAt;
 dynamic deletedAt;
 String? createdAgo;

 Location({
  this.id,
  this.name,
  this.image,
  this.address,
  this.city,
  this.countryId,
  this.zip,
  this.status,
  this.salonId,
  this.userId,
  this.createdAt,
  this.updatedAt,
  this.deletedAt,
  this.createdAgo,
 });

 Location.fromJson(Map<String, dynamic> json) {
  id = json['id'] as int?;
  name = json['name'] as String?;
  image = json['image'] as String?;
  address = json['address'] as String?;
  city = json['city'] as String?;
  countryId = json['country_id'] as int?;
  zip = json['zip'] as String?;
  status = json['status'] as int?;
  salonId = json['salon_id'] as int?;
  userId = json['user_id'] as int?;
  createdAt = json['created_at'] as String?;
  updatedAt = json['updated_at'] as String?;
  deletedAt = json['deleted_at'];
  createdAgo = json['created_ago'] as String?;
 }

 Map<String, dynamic> toJson() {
  final Map<String, dynamic> json = <String, dynamic>{};
  json['id'] = id;
  json['name'] = name;
  json['image'] = image;
  json['address'] = address;
  json['city'] = city;
  json['country_id'] = countryId;
  json['zip'] = zip;
  json['status'] = status;
  json['salon_id'] = salonId;
  json['user_id'] = userId;
  json['created_at'] = createdAt;
  json['updated_at'] = updatedAt;
  json['deleted_at'] = deletedAt;
  json['created_ago'] = createdAgo;
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
 String? directoryName;
 String? createdAgo;
 String? directory;
 Meta? meta;

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
  this.directoryName,
  this.createdAgo,
  this.directory,
  this.meta,
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
  directoryName = json['directory_name'] as String?;
  createdAgo = json['created_ago'] as String?;
  directory = json['directory'] as String?;
  meta = (json['meta'] as Map<String,dynamic>?) != null ? Meta.fromJson(json['meta'] as Map<String,dynamic>) : null;
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
  json['directory_name'] = directoryName;
  json['created_ago'] = createdAgo;
  json['directory'] = directory;
  json['meta'] = meta?.toJson();
  return json;
 }
}

class Meta {
 int? storageAvailableGbs;

 Meta({
  this.storageAvailableGbs,
 });

 Meta.fromJson(Map<String, dynamic> json) {
  storageAvailableGbs = json['storage_available_gbs'] as int?;
 }

 Map<String, dynamic> toJson() {
  final Map<String, dynamic> json = <String, dynamic>{};
  json['storage_available_gbs'] = storageAvailableGbs;
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

class Position {
 int? id;
 String? name;
 int? status;
 String? createdAt;
 String? updatedAt;
 dynamic deletedAt;
 String? createdAgo;

 Position({
  this.id,
  this.name,
  this.status,
  this.createdAt,
  this.updatedAt,
  this.deletedAt,
  this.createdAgo,
 });

 Position.fromJson(Map<String, dynamic> json) {
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

class Schedule {
 int? id;
 int? day;
 String? startTime;
 String? endTime;
 int? availability;
 int? userId;
 String? createdAt;
 String? updatedAt;
 dynamic deletedAt;
 String? createdAgo;
 String? dayName;
 String? available;
 Meta? meta;

 Schedule({
  this.id,
  this.day,
  this.startTime,
  this.endTime,
  this.availability,
  this.userId,
  this.createdAt,
  this.updatedAt,
  this.deletedAt,
  this.createdAgo,
  this.dayName,
  this.available,
  this.meta,
 });

 Schedule.fromJson(Map<String, dynamic> json) {
  id = json['id'] as int?;
  day = json['day'] as int?;
  startTime = json['start_time'] as String?;
  endTime = json['end_time'] as String?;
  availability = json['availability'] as int?;
  userId = json['user_id'] as int?;
  createdAt = json['created_at'] as String?;
  updatedAt = json['updated_at'] as String?;
  deletedAt = json['deleted_at'];
  createdAgo = json['created_ago'] as String?;
  dayName = json['dayName'] as String?;
  available = json['available'] as String?;
  meta = (json['meta'] as Map<String,dynamic>?) != null ? Meta.fromJson(json['meta'] as Map<String,dynamic>) : null;
 }

 Map<String, dynamic> toJson() {
  final Map<String, dynamic> json = <String, dynamic>{};
  json['id'] = id;
  json['day'] = day;
  json['start_time'] = startTime;
  json['end_time'] = endTime;
  json['availability'] = availability;
  json['user_id'] = userId;
  json['created_at'] = createdAt;
  json['updated_at'] = updatedAt;
  json['deleted_at'] = deletedAt;
  json['created_ago'] = createdAgo;
  json['dayName'] = dayName;
  json['available'] = available;
  json['meta'] = meta?.toJson();
  return json;
 }
}

class Badges {
 int? id;
 String? name;
 String? badge;
 String? date;
 int? status;
 int? userId;
 String? createdAt;
 String? updatedAt;
 dynamic deletedAt;
 dynamic salonId;
 String? createdAgo;
 Meta? meta;

 Badges({
  this.id,
  this.name,
  this.badge,
  this.date,
  this.status,
  this.userId,
  this.createdAt,
  this.updatedAt,
  this.deletedAt,
  this.salonId,
  this.createdAgo,
  this.meta,
 });

 Badges.fromJson(Map<String, dynamic> json) {
  id = json['id'] as int?;
  name = json['name'] as String?;
  badge = json['badge'] as String?;
  date = json['date'] as String?;
  status = json['status'] as int?;
  userId = json['user_id'] as int?;
  createdAt = json['created_at'] as String?;
  updatedAt = json['updated_at'] as String?;
  deletedAt = json['deleted_at'];
  salonId = json['salon_id'];
  createdAgo = json['created_ago'] as String?;
  meta = (json['meta'] as Map<String,dynamic>?) != null ? Meta.fromJson(json['meta'] as Map<String,dynamic>) : null;
 }

 Map<String, dynamic> toJson() {
  final Map<String, dynamic> json = <String, dynamic>{};
  json['id'] = id;
  json['name'] = name;
  json['badge'] = badge;
  json['date'] = date;
  json['status'] = status;
  json['user_id'] = userId;
  json['created_at'] = createdAt;
  json['updated_at'] = updatedAt;
  json['deleted_at'] = deletedAt;
  json['salon_id'] = salonId;
  json['created_ago'] = createdAgo;
  json['meta'] = meta?.toJson();
  return json;
 }
}
class Certificates {
 int? id;
 dynamic certificate;
 String? size;
 int? userId;
 String? createdAt;
 String? updatedAt;
 dynamic deletedAt;
 String? createdAgo;

 Certificates({
  this.id,
  this.certificate,
  this.size,
  this.userId,
  this.createdAt,
  this.updatedAt,
  this.deletedAt,
  this.createdAgo,
 });

 Certificates.fromJson(Map<String, dynamic> json) {
  id = json['id'] as int?;
  certificate = json['certificate'];
  size = json['size'] as String?;
  userId = json['user_id'] as int?;
  createdAt = json['created_at'] as String?;
  updatedAt = json['updated_at'] as String?;
  deletedAt = json['deleted_at'];
  createdAgo = json['created_ago'] as String?;
 }

 Map<String, dynamic> toJson() {
  final Map<String, dynamic> json = <String, dynamic>{};
  json['id'] = id;
  json['certificate'] = certificate;
  json['size'] = size;
  json['user_id'] = userId;
  json['created_at'] = createdAt;
  json['updated_at'] = updatedAt;
  json['deleted_at'] = deletedAt;
  json['created_ago'] = createdAgo;
  return json;
 }
}
