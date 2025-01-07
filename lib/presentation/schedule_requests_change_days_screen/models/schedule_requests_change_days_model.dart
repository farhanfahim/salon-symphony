import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:salon_symphony/data/models/loginResponseModel.dart';

class ScheduleResponseModel {
  bool? status;
  String? message;
  List<ScheduleData>? data;

  ScheduleResponseModel({this.status, this.message, this.data});

  ScheduleResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ScheduleData>[];
      json['data'].forEach((v) { data!.add(new ScheduleData.fromJson(v)); });
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

class ScheduleData {
  int? id;
  int? day;
  String? startTime;
  Rx<String>? localStartTime = "".obs;
  String? endTime;
  Rx<String>? localEndTime = "".obs;
  int? availability;
  Rx<int>? localAvailability = 10.obs;
  int? userId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  User? user;
  String? createdAgo;
  String? dayName;
  String? available;

  ScheduleData({this.id, this.day, this.startTime,this.localStartTime, this.endTime, this.localEndTime, this.availability, this.localAvailability,this.userId, this.createdAt, this.updatedAt, this.deletedAt, this.user, this.createdAgo, this.dayName, this.available});

  ScheduleData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    availability = json['availability'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    createdAgo = json['created_ago'];
    dayName = json['dayName'];
    available = json['available'];
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
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['created_ago'] = this.createdAgo;
    data['dayName'] = this.dayName;
    data['available'] = this.available;
    return data;
  }
}


