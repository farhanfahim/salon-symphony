import 'package:salon_symphony/data/models/loginResponseModel.dart';

class GoalResponseModel {
  bool? status;
  String? message;
  List<GoalData>? data;

  GoalResponseModel({this.status, this.message, this.data});

  GoalResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GoalData>[];
      json['data'].forEach((v) {
        data!.add(new GoalData.fromJson(v));
      });
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

class GoalData {
  int? id;
  String? uniid;
  String? name;
  String? startDate;
  String? endDate;
  int? targetType;
  String? targetValue;
  int? type;
  int? day;
  int? duration;
  String? durationName;
  String? description;
  int? userId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? salonId;
  Salon? salon;
  User? user;
  List<UserGoals>? userGoals;
  UserStatus? userStatus;
  String? createdAgo;

  GoalData(
      {this.id,
        this.uniid,
        this.name,
        this.startDate,
        this.endDate,
        this.targetType,
        this.targetValue,
        this.type,
        this.day,
        this.duration,
        this.durationName,
        this.description,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.salonId,
        this.salon,
        this.user,
        this.userGoals,
        this.userStatus,
        this.createdAgo});

  GoalData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uniid = json['uniid'];
    name = json['name'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    targetType = json['target_type'];
    targetValue = json['target_value'];
    type = json['type'];
    day = json['day'];
    duration = json['duration'];
    durationName = json['durationName'];
    description = json['description'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    salonId = json['salon_id'];
    salon = json['salon'] != null ? new Salon.fromJson(json['salon']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['userGoals'] != null) {
      userGoals = <UserGoals>[];
      json['userGoals'].forEach((v) {
        userGoals!.add(new UserGoals.fromJson(v));
      });
    }
    userStatus = json['userStatus'] != null
        ? new UserStatus.fromJson(json['userStatus'])
        : null;
    createdAgo = json['created_ago'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uniid'] = this.uniid;
    data['name'] = this.name;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['target_type'] = this.targetType;
    data['target_value'] = this.targetValue;
    data['type'] = this.type;
    data['day'] = this.day;
    data['duration'] = this.duration;
    data['durationName'] = this.durationName;
    data['description'] = this.description;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['salon_id'] = this.salonId;
    if (this.salon != null) {
      data['salon'] = this.salon!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.userGoals != null) {
      data['userGoals'] = this.userGoals!.map((v) => v.toJson()).toList();
    }
    if (this.userStatus != null) {
      data['userStatus'] = this.userStatus!.toJson();
    }
    data['created_ago'] = this.createdAgo;
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
class UserGoals {
  int? goalId;
  int? userId;
  int? id;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? createdAgo;

  UserGoals(
      {this.goalId,
        this.userId,
        this.id,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.createdAgo});

  UserGoals.fromJson(Map<String, dynamic> json) {
    goalId = json['goal_id'];
    userId = json['user_id'];
    id = json['id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    createdAgo = json['created_ago'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goal_id'] = this.goalId;
    data['user_id'] = this.userId;
    data['id'] = this.id;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['created_ago'] = this.createdAgo;
    return data;
  }
}

class UserStatus {
  int? goalId;
  int? userId;
  int? id;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? createdAgo;
  String? typeName;

  UserStatus(
      {this.goalId,
        this.userId,
        this.id,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.createdAgo,
        this.typeName});

  UserStatus.fromJson(Map<String, dynamic> json) {
    goalId = json['goal_id'];
    userId = json['user_id'];
    id = json['id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    createdAgo = json['created_ago'];
    typeName = json['typeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goal_id'] = this.goalId;
    data['user_id'] = this.userId;
    data['id'] = this.id;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['created_ago'] = this.createdAgo;
    data['typeName'] = this.typeName;
    return data;
  }
}