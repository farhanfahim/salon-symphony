class UserInvitationModel {
  bool? status;
  String? message;
  Data? data;

  UserInvitationModel({
    this.status,
    this.message,
    this.data,
  });

  UserInvitationModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  dynamic email;
  String? phone;
  String? hireDate;
  String? passcode;
  int? status;
  int? roleId;
  int? salonLocationId;
  int? salonId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Salon? salon;
  Location? location;
  String? createdAgo;
  String? statusName;

  Data({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.hireDate,
    this.passcode,
    this.status,
    this.roleId,
    this.salonLocationId,
    this.salonId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.salon,
    this.location,
    this.createdAgo,
    this.statusName,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    email = json['email'];
    phone = json['phone'] as String?;
    hireDate = json['hire_date'] as String?;
    passcode = json['passcode'] as String?;
    status = json['status'] as int?;
    roleId = json['role_id'] as int?;
    salonLocationId = json['salon_location_id'] as int?;
    salonId = json['salon_id'] as int?;
    userId = json['user_id'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    salon = (json['salon'] as Map<String,dynamic>?) != null ? Salon.fromJson(json['salon'] as Map<String,dynamic>) : null;
    location = (json['location'] as Map<String,dynamic>?) != null ? Location.fromJson(json['location'] as Map<String,dynamic>) : null;
    createdAgo = json['created_ago'] as String?;
    statusName = json['statusName'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['email'] = email;
    json['phone'] = phone;
    json['hire_date'] = hireDate;
    json['passcode'] = passcode;
    json['status'] = status;
    json['role_id'] = roleId;
    json['salon_location_id'] = salonLocationId;
    json['salon_id'] = salonId;
    json['user_id'] = userId;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['salon'] = salon?.toJson();
    json['location'] = location?.toJson();
    json['created_ago'] = createdAgo;
    json['statusName'] = statusName;
    return json;
  }
}

class Salon {
  int? id;
  String? uniid;
  String? image;
  String? name;
  dynamic slug;
  String? address;
  dynamic bookingSoftware;
  dynamic productLine;
  dynamic jobTitle;
  dynamic dateFounded;
  String? city;
  int? countryId;
  String? zip;
  int? multiLocations;
  int? status;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic stripeCustomerId;
  dynamic directoryName;
  String? createdAgo;
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
    this.meta,
  });

  Salon.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    uniid = json['uniid'] as String?;
    image = json['image'] as String?;
    name = json['name'] as String?;
    slug = json['slug'];
    address = json['address'] as String?;
    bookingSoftware = json['booking_software'];
    productLine = json['product_line'];
    jobTitle = json['job_title'];
    dateFounded = json['date_founded'];
    city = json['city'] as String?;
    countryId = json['country_id'] as int?;
    zip = json['zip'] as String?;
    multiLocations = json['multi_locations'] as int?;
    status = json['status'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    stripeCustomerId = json['stripe_customer_id'];
    directoryName = json['directory_name'];
    createdAgo = json['created_ago'] as String?;
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
    json['meta'] = meta?.toJson();
    return json;
  }
}

class Meta {


  Meta();

Meta.fromJson(Map<String, dynamic> json) {

}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> json = <String, dynamic>{};

  return json;
}
}

class Location {
  int? id;
  dynamic name;
  dynamic image;
  String? address;
  String? city;
  int? countryId;
  String? zip;
  int? status;
  int? salonId;
  dynamic userId;
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
    name = json['name'];
    image = json['image'];
    address = json['address'] as String?;
    city = json['city'] as String?;
    countryId = json['country_id'] as int?;
    zip = json['zip'] as String?;
    status = json['status'] as int?;
    salonId = json['salon_id'] as int?;
    userId = json['user_id'];
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

