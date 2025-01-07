import 'package:salon_symphony/core/app_export.dart';

import '../../../data/models/myProfileResponseModel.dart';

class DocumentResponseModel {
 Meta? meta;
 List<DocumentData>? data;

 DocumentResponseModel({this.meta, this.data});

 DocumentResponseModel.fromJson(Map<String, dynamic> json) {
  meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  if (json['data'] != null) {
   data = <DocumentData>[];
   json['data'].forEach((v) { data!.add(new DocumentData.fromJson(v)); });
  }
 }

 Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  if (this.meta != null) {
   data['meta'] = this.meta!.toJson();
  }
  if (this.data != null) {
   data['data'] = this.data!.map((v) => v.toJson()).toList();
  }
  return data;
 }
}

class Meta {
 int? total;
 int? perPage;
 int? currentPage;
 int? lastPage;
 int? firstPage;
 String? firstPageUrl;
 String? lastPageUrl;
 String? nextPageUrl;
 String? previousPageUrl;

 Meta({this.total, this.perPage, this.currentPage, this.lastPage, this.firstPage, this.firstPageUrl, this.lastPageUrl, this.nextPageUrl, this.previousPageUrl});

 Meta.fromJson(Map<String, dynamic> json) {
  total = json['total'];
  perPage = json['per_page'];
  currentPage = json['current_page'];
  lastPage = json['last_page'];
  firstPage = json['first_page'];
  firstPageUrl = json['first_page_url'];
  lastPageUrl = json['last_page_url'];
  nextPageUrl = json['next_page_url'];
  previousPageUrl = json['previous_page_url'];
 }

 Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['total'] = this.total;
  data['per_page'] = this.perPage;
  data['current_page'] = this.currentPage;
  data['last_page'] = this.lastPage;
  data['first_page'] = this.firstPage;
  data['first_page_url'] = this.firstPageUrl;
  data['last_page_url'] = this.lastPageUrl;
  data['next_page_url'] = this.nextPageUrl;
  data['previous_page_url'] = this.previousPageUrl;
  return data;
 }
}

class DocumentData {
 int? id;
 String? title;
 String? link;
 String? size;
 String? description;
 int? status;
 int? viewStatus;
 RxInt? localStatus = 10.obs;
 int? salonId;
 String? createdAt;
 String? updatedAt;
 String? deletedAt;
 Salon? salon;
 String? createdAgo;
 Meta? meta;

 DocumentData({this.id, this.title, this.link, this.size, this.description, this.status, this.viewStatus,this.localStatus, this.salonId, this.createdAt, this.updatedAt, this.deletedAt, this.salon, this.createdAgo, this.meta});

 DocumentData.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  title = json['title'];
  link = json['link'];
  size = json['size'];
  description = json['description'];
  status = json['status'];
  viewStatus = json['view_status'];
  salonId = json['salon_id'];
  createdAt = json['created_at'];
  updatedAt = json['updated_at'];
  deletedAt = json['deleted_at'];
  salon = json['salon'] != null ? new Salon.fromJson(json['salon']) : null;
  createdAgo = json['created_ago'];
  meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
 }

 Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['title'] = this.title;
  data['link'] = this.link;
  data['size'] = this.size;
  data['description'] = this.description;
  data['status'] = this.status;
  data['view_status'] = this.viewStatus;
  data['salon_id'] = this.salonId;
  data['created_at'] = this.createdAt;
  data['updated_at'] = this.updatedAt;
  data['deleted_at'] = this.deletedAt;
  if (this.salon != null) {
   data['salon'] = this.salon!.toJson();
  }
  data['created_ago'] = this.createdAgo;
  if (this.meta != null) {
   data['meta'] = this.meta!.toJson();
  }
  return data;
 }
}
