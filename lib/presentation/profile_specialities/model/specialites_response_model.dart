import 'package:get/get_rx/src/rx_types/rx_types.dart';

class SpecialitiesResponseModel {
  Meta? meta;
  List<SpecialitiesResponseData>? data;

  SpecialitiesResponseModel({this.meta, this.data});

  SpecialitiesResponseModel.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <SpecialitiesResponseData>[];
      json['data'].forEach((v) {
        data!.add(new SpecialitiesResponseData.fromJson(v));
      });
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

  Meta(
      {this.total,
        this.perPage,
        this.currentPage,
        this.lastPage,
        this.firstPage,
        this.firstPageUrl,
        this.lastPageUrl,
        this.nextPageUrl,
        this.previousPageUrl});

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

class SpecialitiesResponseData {
  int? id;
  String? name;
  int? status;
  RxBool? selected = false.obs;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? createdAgo;

  SpecialitiesResponseData(
      {this.id,
        this.name,
        this.selected,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.createdAgo});

  SpecialitiesResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
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
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['created_ago'] = this.createdAgo;
    return data;
  }
}


class CertificatesResponseData {
  int? id;
  String? certificate;
  String? size;

  CertificatesResponseData(
      {
        this.id,
        this.certificate,
        this.size,});

  CertificatesResponseData.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    certificate = json['certificate'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['certificate'] = this.certificate;
    data['size'] = this.size;
    return data;
  }
}