class InvitationSignUpModel {
  final bool? status;
  final String? message;
  final Data? data;

  InvitationSignUpModel({
    this.status,
    this.message,
    this.data,
  });

  InvitationSignUpModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        message = json['message'] as String?,
        data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'data' : data?.toJson()
  };
}

class Data {
  final int? id;
  final String? name;
  final dynamic email;
  final String? phone;
  final String? hireDate;
  final String? passcode;
  final int? status;
  final int? roleId;
  final int? salonLocationId;
  final int? salonId;
  final int? userId;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;
  final Salon? salon;
  final Location? location;
  final String? createdAgo;

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
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        email = json['email'],
        phone = json['phone'] as String?,
        hireDate = json['hire_date'] as String?,
        passcode = json['passcode'] as String?,
        status = json['status'] as int?,
        roleId = json['role_id'] as int?,
        salonLocationId = json['salon_location_id'] as int?,
        salonId = json['salon_id'] as int?,
        userId = json['user_id'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        deletedAt = json['deleted_at'],
        salon = (json['salon'] as Map<String,dynamic>?) != null ? Salon.fromJson(json['salon'] as Map<String,dynamic>) : null,
        location = (json['location'] as Map<String,dynamic>?) != null ? Location.fromJson(json['location'] as Map<String,dynamic>) : null,
        createdAgo = json['created_ago'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'email' : email,
    'phone' : phone,
    'hire_date' : hireDate,
    'passcode' : passcode,
    'status' : status,
    'role_id' : roleId,
    'salon_location_id' : salonLocationId,
    'salon_id' : salonId,
    'user_id' : userId,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'deleted_at' : deletedAt,
    'salon' : salon?.toJson(),
    'location' : location?.toJson(),
    'created_ago' : createdAgo
  };
}

class Salon {
  final int? id;
  final String? uniid;
  final String? image;
  final String? name;
  final dynamic slug;
  final String? address;
  final dynamic bookingSoftware;
  final dynamic productLine;
  final dynamic jobTitle;
  final dynamic dateFounded;
  final String? city;
  final int? countryId;
  final String? zip;
  final int? multiLocations;
  final int? status;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;
  final String? createdAgo;

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

  Salon.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        uniid = json['uniid'] as String?,
        image = json['image'] as String?,
        name = json['name'] as String?,
        slug = json['slug'],
        address = json['address'] as String?,
        bookingSoftware = json['booking_software'],
        productLine = json['product_line'],
        jobTitle = json['job_title'],
        dateFounded = json['date_founded'],
        city = json['city'] as String?,
        countryId = json['country_id'] as int?,
        zip = json['zip'] as String?,
        multiLocations = json['multi_locations'] as int?,
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        deletedAt = json['deleted_at'],
        createdAgo = json['created_ago'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'uniid' : uniid,
    'image' : image,
    'name' : name,
    'slug' : slug,
    'address' : address,
    'booking_software' : bookingSoftware,
    'product_line' : productLine,
    'job_title' : jobTitle,
    'date_founded' : dateFounded,
    'city' : city,
    'country_id' : countryId,
    'zip' : zip,
    'multi_locations' : multiLocations,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'deleted_at' : deletedAt,
    'created_ago' : createdAgo
  };
}

class Location {
  final int? id;
  final String? address;
  final String? city;
  final int? countryId;
  final String? zip;
  final int? status;
  final int? salonId;
  final dynamic userId;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;
  final String? createdAgo;

  Location({
    this.id,
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

  Location.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        address = json['address'] as String?,
        city = json['city'] as String?,
        countryId = json['country_id'] as int?,
        zip = json['zip'] as String?,
        status = json['status'] as int?,
        salonId = json['salon_id'] as int?,
        userId = json['user_id'],
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        deletedAt = json['deleted_at'],
        createdAgo = json['created_ago'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'address' : address,
    'city' : city,
    'country_id' : countryId,
    'zip' : zip,
    'status' : status,
    'salon_id' : salonId,
    'user_id' : userId,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'deleted_at' : deletedAt,
    'created_ago' : createdAgo
  };
}