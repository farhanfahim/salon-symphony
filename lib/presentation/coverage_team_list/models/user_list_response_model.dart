import 'package:get/get_rx/src/rx_types/rx_types.dart';

class UserListResponseModel {
  bool? status;
  String? message;
  List<UserData>? data;

  UserListResponseModel({this.status, this.message, this.data});

  UserListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <UserData>[];
      json['data'].forEach((v) { data!.add(new UserData.fromJson(v)); });
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

class UserData {
  int? id;
  String? name;
  String? keyword;
  String? email;
  String? phone;
  int? position;
  RxBool? isSelected = false.obs;
  String? image;

  UserData({this.id, this.name,this.keyword, this.email, this.phone, this.position,this.image,this.isSelected });

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    position = json['position_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['position_id'] = this.position;

    return data;
  }
}