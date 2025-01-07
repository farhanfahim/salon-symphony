import 'package:salon_symphony/data/models/loginResponseModel.dart';

class RequestResponseModel {
  bool? status;
  String? message;
  List<RequestData>? data;

  RequestResponseModel({this.status, this.message, this.data});

  RequestResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <RequestData>[];
      json['data'].forEach((v) { data!.add(new RequestData.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RequestData {
  int? id;
  int? type;
  int? subType;
  String? date;
  String? returnDate;
  int? coverageBy;
  int? day;
  String? startTime;
  String? endTime;
  int? availability;
  String? className;
  String? educator;
  String? hour;
  Object? purpose;
  num? value;
  String? paymentMethod;
  String? comments;
  String? note;
  String? attachment;
  int? status;
  int? userId;
  int? salonId;
  Object? approvedBy;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  Salon? salon;
  User? user;
  Coverage? coverage;
  Schedule? schedule;
  Approved? approved;
  String? createdAgo;
  String? dayName;
  String? available;
  String? typeName;
  String? subTypeName;

  RequestData({this.id, this.type, this.subType, this.date, this.returnDate, this.coverageBy, this.day, this.startTime, this.endTime, this.availability, this.className, this.educator, this.hour, this.purpose, this.value, this.paymentMethod, this.comments, this.attachment, this.status, this.userId, this.salonId, this.approvedBy, this.createdAt, this.updatedAt, this.deletedAt, this.salon, this.user, this.coverage, this.schedule, this.approved, this.createdAgo,this.dayName, this.available, this.typeName, this.subTypeName});

  RequestData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    subType = json['sub_type'];
    date = json['date'];
    returnDate = json['return_date'];
    coverageBy = json['coverage_by'];
    day = json['day'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    availability = json['availability'];
    className = json['class'];
    educator = json['educator'];
    hour = json['hour'];
    purpose = json['purpose'];
    value = json['value'];
    paymentMethod = json['payment_method'];
    comments = json['comments'];
    note = json['note'];
    attachment = json['attachment'];
    status = json['status'];
    userId = json['user_id'];
    salonId = json['salon_id'];
    approvedBy = json['approved_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    salon = json['salon'] != null ? new Salon.fromJson(json['salon']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    coverage = json['coverage'] != null ? new Coverage.fromJson(json['coverage']) : null;
    schedule = json['schedule'] != null ? new Schedule.fromJson(json['schedule']) : null;
    approved = json['approved'] != null ? new Approved.fromJson(json['approved']) : null;
    createdAgo = json['created_ago'];
    dayName = json['dayName'];
    available = json['available'];
    typeName = json['typeName'];
    subTypeName = json['subTypeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['sub_type'] = this.subType;
    data['date'] = this.date;
    data['return_date'] = this.returnDate;
    data['coverage_by'] = this.coverageBy;
    data['day'] = this.day;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['availability'] = this.availability;
    data['class'] = this.className;
    data['educator'] = this.educator;
    data['hour'] = this.hour;
    data['purpose'] = this.purpose;
    data['value'] = this.value;
    data['payment_method'] = this.paymentMethod;
    data['comments'] = this.comments;
    data['note'] = this.note;
    data['attachment'] = this.attachment;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['salon_id'] = this.salonId;
    data['approved_by'] = this.approvedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.salon != null) {
    data['salon'] = this.salon!.toJson();
    }
    if (this.user != null) {
    data['user'] = this.user!.toJson();
    }
    if (this.coverage != null) {
    data['coverage'] = this.coverage!.toJson();
    }

    if (this.schedule != null) {
      data['schedule'] = this.schedule!.toJson();
    }
    if (this.approved != null) {
      data['approved'] = this.approved!.toJson();
    }
    data['created_ago'] = this.createdAgo;
    data['dayName'] = this.dayName;
    data['schedule'] = this.schedule;
    data['available'] = this.available;
    data['typeName'] = this.typeName;
    data['subTypeName'] = this.subTypeName;
    return data;
    }
}

class Salon {
  int? id;
  String? uniid;
  String? image;
  String? name;
  String? slug;
  String? address;
  String? bookingSoftware;
  String? productLine;
  String? jobTitle;
  String? dateFounded;
  String? city;
  int? countryId;
  String? zip;
  int? multiLocations;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? createdAgo;

  Salon({this.id, this.uniid, this.image, this.name, this.slug, this.address, this.bookingSoftware, this.productLine, this.jobTitle, this.dateFounded, this.city, this.countryId, this.zip, this.multiLocations, this.status, this.createdAt, this.updatedAt, this.deletedAt, this.createdAgo});

  Salon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uniid = json['uniid'];
    image = json['image'];
    name = json['name'];
    slug = json['slug'];
    address = json['address'];
    bookingSoftware = json['booking_software'];
    productLine = json['product_line'];
    jobTitle = json['job_title'];
    dateFounded = json['date_founded'];
    city = json['city'];
    countryId = json['country_id'];
    zip = json['zip'];
    multiLocations = json['multi_locations'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    createdAgo = json['created_ago'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uniid'] = this.uniid;
    data['image'] = this.image;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['address'] = this.address;
    data['booking_software'] = this.bookingSoftware;
    data['product_line'] = this.productLine;
    data['job_title'] = this.jobTitle;
    data['date_founded'] = this.dateFounded;
    data['city'] = this.city;
    data['country_id'] = this.countryId;
    data['zip'] = this.zip;
    data['multi_locations'] = this.multiLocations;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['created_ago'] = this.createdAgo;
    return data;
  }
}

class Coverage {
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

  Coverage({
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

  Coverage.fromJson(Map<String, dynamic> json) {
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

class Schedule {
  int? id;
  int? day;
  String? startTime;
  String? endTime;
  int? availability;
  int? userId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? createdAgo;
  String? dayName;
  String? available;
  Meta? meta;

  Schedule({this.id, this.day, this.startTime, this.endTime, this.availability, this.userId, this.createdAt, this.updatedAt, this.deletedAt, this.createdAgo, this.dayName, this.available, this.meta});

  Schedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    availability = json['availability'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    createdAgo = json['created_ago'];
    dayName = json['dayName'];
    available = json['available'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['day'] = this.day;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['availability'] = this.availability;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['created_ago'] = this.createdAgo;
    data['dayName'] = this.dayName;
    data['available'] = this.available;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}
