class NotificationCount {
  bool? status;
  String? message;
  Data? data;

  NotificationCount({
    this.status,
    this.message,
    this.data,
  });

  NotificationCount.fromJson(Map<String, dynamic> json) {
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
  int? unreadCount;

  Data({
    this.unreadCount,
  });

  Data.fromJson(Map<String, dynamic> json) {
    unreadCount = json['unread_count'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['unread_count'] = unreadCount;
    return json;
  }
}