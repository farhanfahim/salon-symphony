class ExtraPayload{
  Object? notifiable_id;
  Object? type;
  Object? refId;
  Object? link;
  Object? id;
  Object? title;
  Object? message;
  Object? userName;
  Object? isGroupChat;
  Object? fromId;
  Object? fromName;

  ExtraPayload({required this.type, required this.refId, required this.link, required this.title, required this.message, required this.notifiable_id, required this.userName,  this.fromId, this.fromName});
  ExtraPayload.fromJson(dynamic json) {
    notifiable_id = json["notifiable_id"];
    type = json["type"] != null ? int.parse(json["type"].toString()) : null;
    refId = json["ref_id"];
    link = json["link"];
    id = json["notification_id"];
    title = json["title"];
    message = json["message"];
    userName = json["user_name"];
    isGroupChat = json["is_group_chat"];
    fromId = json["from_id"];
    fromName = json["from_name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["ref_id"] = refId;
    map["type"] = type;
    map["notifiable_id"] = notifiable_id;
    map["link"] = link;
    map["notification_id"] = id;
    map["title"] = title;
    map["message"] = message;
    map["user_name"] = userName;
    map["is_group_chat"] = isGroupChat;
    map["from_id"] = fromId;
    map["from_name"] = fromName;
   return map;
  }
}
// payload = {
// notifiable_id: user_id,
// ref_id: ref_id,
// link: link ? link : '',
// type: type,
// title: title ? title : constants.APP_NAME,
// message: msg ? msg : ''
// }
