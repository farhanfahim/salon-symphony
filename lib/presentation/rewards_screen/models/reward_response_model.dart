class RewardResponseModel {
  bool? status;
  String? message;
  RewardData? data;

  RewardResponseModel({this.status, this.message, this.data});

  RewardResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new RewardData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class RewardData {
  List<Badges>? badges;
  List<Points>? points;
  int? totalPoints;

  RewardData({this.badges, this.points, this.totalPoints});

  RewardData.fromJson(Map<String, dynamic> json) {
    if (json['badges'] != null) {
      badges = <Badges>[];
      json['badges'].forEach((v) { badges!.add(new Badges.fromJson(v)); });
    }
    if (json['points'] != null) {
      points = <Points>[];
      json['points'].forEach((v) { points!.add(new Points.fromJson(v)); });
    }
    totalPoints = json['totalPoints'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.badges != null) {
      data['badges'] = this.badges!.map((v) => v.toJson()).toList();
    }
    if (this.points != null) {
      data['points'] = this.points!.map((v) => v.toJson()).toList();
    }
    data['totalPoints'] = this.totalPoints;
    return data;
  }
}

class Badges {
  int? id;
  String? name;
  String? badge;
  int? status;
  int? userId;

  Badges({this.id, this.name, this.badge,  this.status, this.userId, });

  Badges.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    badge = json['badge'];
    status = json['status'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['badge'] = this.badge;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    return data;
  }
}

class Points {
  int? id;
  String? name;
  String? description;
  String? badge;
  int? points;
  String? date;
  int? status;

  Points({this.id, this.name, this.description, this.points, this.date, this.status,});

  Points.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    badge = json['badge'];
    points = json['points'];
    date = json['date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['badge'] = this.badge;
    data['points'] = this.points;
    data['date'] = this.date;
    data['status'] = this.status;
    return data;
  }
}