class EducationHoursCount {
  bool? status;
  String? message;
  Data? data;

  EducationHoursCount({
    this.status,
    this.message,
    this.data,
  });

  EducationHoursCount.fromJson(Map<String, dynamic> json) {
    status = json['status'] as bool?;
    message = json['message'] as String?;
    data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['status'] = status;
    json['message'] = message;
    json['data'] = data?.toJson();
    return json;
  }
}

class Data {
  Object? totalApprovedHours;

  Data({
    this.totalApprovedHours,
  });

  Data.fromJson(Map<String, dynamic> json) {
    totalApprovedHours = json['total_approved_hours'] as Object?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['total_approved_hours'] = totalApprovedHours;
    return json;
  }
}