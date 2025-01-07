class ReportResponseModel {
 bool? status;
 String? message;
 List<ReportData>? data;

 ReportResponseModel({this.status, this.message, this.data});

 ReportResponseModel.fromJson(Map<String, dynamic> json) {
  status = json['status'];
  message = json['message'];
  if (json['data'] != null) {
   data = <ReportData>[];
   json['data'].forEach((v) {
    data!.add(new ReportData.fromJson(v));
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

class ReportData {
 int? id;
 String? name;
 String? value;
 String? type;
 int? status;
 String? createdAt;
 String? updatedAt;
 String? deletedAt;
 String? createdAgo;

 ReportData(
     {this.id,
      this.name,
      this.value,
      this.type,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.createdAgo});

 ReportData.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  name = json['name'];
  value = json['value'];
  type = json['type'];
  status = json['status'];
  createdAt = json['created_at'];
  updatedAt = json['updated_at'];
  deletedAt = json['deleted_at'];
  createdAgo = json['created_ago'];
 }

 Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['name'] = this.name;
  data['value'] = this.value;
  data['type'] = this.type;
  data['status'] = this.status;
  data['created_at'] = this.createdAt;
  data['updated_at'] = this.updatedAt;
  data['deleted_at'] = this.deletedAt;
  data['created_ago'] = this.createdAgo;
  return data;
 }
}