import '../../presentation/employee_dicrectry_details_screen/models/employee_dicrectry_details_model.dart';

class PaginatedMembersModel {
  final bool? status;
  final String? message;
  final Data? data;

  PaginatedMembersModel({
    this.status,
    this.message,
    this.data,
  });

  PaginatedMembersModel.fromJson(Map<String, dynamic> json)
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
  final Meta? meta;
  final List<MembersData>? data;

  Data({
    this.meta,
    this.data,
  });

  Data.fromJson(Map<String, dynamic> json)
      : meta = (json['meta'] as Map<String,dynamic>?) != null ? Meta.fromJson(json['meta'] as Map<String,dynamic>) : null,
        data = (json['data'] as List?)?.map((dynamic e) => MembersData.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'meta' : meta?.toJson(),
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class Meta {
  final int? total;
  final int? perPage;
  final int? currentPage;
  final int? lastPage;
  final int? firstPage;
  final String? firstPageUrl;
  final String? lastPageUrl;
  final dynamic nextPageUrl;
  final dynamic previousPageUrl;

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

  Meta.fromJson(Map<String, dynamic> json)
      : total = json['total'] as int?,
        perPage = json['per_page'] as int?,
        currentPage = json['current_page'] as int?,
        lastPage = json['last_page'] as int?,
        firstPage = json['first_page'] as int?,
        firstPageUrl = json['first_page_url'] as String?,
        lastPageUrl = json['last_page_url'] as String?,
        nextPageUrl = json['next_page_url'],
        previousPageUrl = json['previous_page_url'];

  Map<String, dynamic> toJson() => {
    'total' : total,
    'per_page' : perPage,
    'current_page' : currentPage,
    'last_page' : lastPage,
    'first_page' : firstPage,
    'first_page_url' : firstPageUrl,
    'last_page_url' : lastPageUrl,
    'next_page_url' : nextPageUrl,
    'previous_page_url' : previousPageUrl
  };
}

class MembersData {
  final int? id;
  final String? name;
  final dynamic email;
  final String? phone;
  final dynamic dob;
  final int? relationshipId;
  final dynamic locationId;
  final dynamic hireDate;
  final dynamic bio;
  final dynamic school;
  final dynamic image;
  final dynamic address;
  final dynamic city;
  final dynamic countryId;
  final dynamic zip;
  final int? salonId;
  final dynamic portfolio;
  final dynamic tiktok;
  final dynamic instagram;
  final dynamic facebook;
  final dynamic positionId;
  final int? isCompleted;
  final int? isSocialLogin;
  final int? isApproved;
  final int? isVerified;
  final dynamic verificationCode;
  final int? pushNotification;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;
  final Salon? salon;
  final List<dynamic>? specialities;
  final Position? position;
  final Location? location;
  final List<dynamic>? badges;
  final List<dynamic>? points;
  final List<dynamic>? roles;
  final List<dynamic>? schedule;
  final List<dynamic>? certificates;
  final String? createdAgo;
  final String? relationship;
  final int? totalPoints;
  final Meta? meta;

  MembersData({
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
    this.specialities,
    this.position,
    this.badges,
    this.points,
    this.roles,
    this.location,
    this.schedule,
    this.certificates,
    this.createdAgo,
    this.relationship,
    this.totalPoints,
    this.meta,
  });

  MembersData.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        email = json['email'],
        phone = json['phone'] as String?,
        dob = json['dob'],
        relationshipId = json['relationship_id'] as int?,
        locationId = json['location_id'],
        hireDate = json['hire_date'],
        bio = json['bio'],
        school = json['school'],
        image = json['image'],
        address = json['address'],
        city = json['city'],
        countryId = json['country_id'],
        zip = json['zip'],
        salonId = json['salon_id'] as int?,
        portfolio = json['portfolio'],
        tiktok = json['tiktok'],
        instagram = json['instagram'],
        facebook = json['facebook'],
        positionId = json['position_id'],
        isCompleted = json['is_completed'] as int?,
        isSocialLogin = json['is_social_login'] as int?,
        isApproved = json['is_approved'] as int?,
        isVerified = json['is_verified'] as int?,
        verificationCode = json['verification_code'],
        pushNotification = json['push_notification'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        deletedAt = json['deleted_at'],
        salon = (json['salon'] as Map<String,dynamic>?) != null ? Salon.fromJson(json['salon'] as Map<String,dynamic>) : null,
        specialities = json['specialities'] as List?,
        position = (json['position'] as Map<String,dynamic>?) != null ? Position.fromJson(json['position'] as Map<String,dynamic>) : null,
        location = (json['location'] as Map<String,dynamic>?) != null ? Location.fromJson(json['location'] as Map<String,dynamic>) : null,
        badges = json['badges'] as List?,
        points = json['points'] as List?,
        roles = json['roles'] as List?,
        schedule = json['schedule'] as List?,
        certificates = json['certificates'] as List?,
        createdAgo = json['created_ago'] as String?,
        relationship = json['relationship'] as String?,
        totalPoints = json['totalPoints'] as int?,
        meta = (json['meta'] as Map<String,dynamic>?) != null ? Meta.fromJson(json['meta'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'email' : email,
    'phone' : phone,
    'dob' : dob,
    'relationship_id' : relationshipId,
    'location_id' : locationId,
    'hire_date' : hireDate,
    'bio' : bio,
    'school' : school,
    'image' : image,
    'address' : address,
    'city' : city,
    'country_id' : countryId,
    'zip' : zip,
    'salon_id' : salonId,
    'portfolio' : portfolio,
    'tiktok' : tiktok,
    'instagram' : instagram,
    'facebook' : facebook,
    'position_id' : positionId,
    'is_completed' : isCompleted,
    'is_social_login' : isSocialLogin,
    'is_approved' : isApproved,
    'is_verified' : isVerified,
    'verification_code' : verificationCode,
    'push_notification' : pushNotification,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'deleted_at' : deletedAt,
    'salon' : salon?.toJson(),
    'specialities' : specialities,
    'position' : position,
    'badges' : badges,
    'points' : points,
    'roles' : roles,
    'location' : location,
    'schedule' : schedule,
    'certificates' : certificates,
    'created_ago' : createdAgo,
    'relationship' : relationship,
    'totalPoints' : totalPoints,
    'meta' : meta?.toJson()
  };
}

class Salon {
  final int? id;
  final String? uniid;
  final dynamic image;
  final String? name;
  final dynamic slug;
  final dynamic address;
  final dynamic bookingSoftware;
  final dynamic productLine;
  final dynamic jobTitle;
  final dynamic dateFounded;
  final dynamic city;
  final dynamic countryId;
  final dynamic zip;
  final int? multiLocations;
  final int? status;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;
  final dynamic stripeCustomerId;
  final String? directoryName;
  final num? storageAvailableGbs;
  final String? createdAgo;
  final String? directory;
  final Meta? meta;

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
    this.storageAvailableGbs,
    this.createdAgo,
    this.directory,
    this.meta,
  });

  Salon.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        uniid = json['uniid'] as String?,
        image = json['image'],
        name = json['name'] as String?,
        slug = json['slug'],
        address = json['address'],
        bookingSoftware = json['booking_software'],
        productLine = json['product_line'],
        jobTitle = json['job_title'],
        dateFounded = json['date_founded'],
        city = json['city'],
        countryId = json['country_id'],
        zip = json['zip'],
        multiLocations = json['multi_locations'] as int?,
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        deletedAt = json['deleted_at'],
        stripeCustomerId = json['stripe_customer_id'],
        directoryName = json['directory_name'] as String?,
        storageAvailableGbs = json['storage_available_gbs'] as num?,
        createdAgo = json['created_ago'] as String?,
        directory = json['directory'] as String?,
        meta = (json['meta'] as Map<String,dynamic>?) != null ? Meta.fromJson(json['meta'] as Map<String,dynamic>) : null;

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
    'stripe_customer_id' : stripeCustomerId,
    'directory_name' : directoryName,
    'storage_available_gbs' : storageAvailableGbs,
    'created_ago' : createdAgo,
    'directory' : directory,
    'meta' : meta?.toJson()
  };
}
