class ResultResponseModel {
  bool? status;
  String? message;
  ResultData? data;

  ResultResponseModel({this.status, this.message, this.data});

  ResultResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new ResultData.fromJson(json['data']) : null;
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

class ResultData {
  int? knows;
  int? learning;
  String? badge;

  ResultData({this.knows, this.learning, this.badge});

  ResultData.fromJson(Map<String, dynamic> json) {
    knows = json['knows'];
    learning = json['learning'];
    badge = json['badge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['knows'] = this.knows;
    data['learning'] = this.learning;
    data['badge'] = this.badge;
    return data;
  }
}