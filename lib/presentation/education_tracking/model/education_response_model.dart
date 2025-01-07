import '../../../data/models/loginResponseModel.dart';
import '../../request_pending_page/models/request_response_model.dart';

class EducationResponseModel {
  Meta? meta;
  List<EducationData>? data;

  EducationResponseModel({this.meta, this.data});

  EducationResponseModel.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <EducationData>[];
      json['data'].forEach((v) { data!.add(new EducationData.fromJson(v)); });
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

class EducationData {

  num? id;
  num? type;
  num? status;
  num? value;
  String? className;
  String? educator;
  String? hour;
  String? date;


  EducationData({this.id, this.type,this.status,this.date, this.className, this.educator, this.hour, this.value,});

EducationData.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  type = json['type'];
  status = json['status'];

  date = json['date'];

  className = json['class'];
  educator = json['educator'];
  hour = json['hour'];

  value = json['value'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['type'] = this.type;
  data['status'] = this.status;

  data['date'] = this.date;

  data['class'] = this.className;
  data['educator'] = this.educator;
  data['hour'] = this.hour;

  data['value'] = this.value;
  return data;
  }
}

