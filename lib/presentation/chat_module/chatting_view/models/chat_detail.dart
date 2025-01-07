import 'package:cloud_firestore/cloud_firestore.dart';

class ChatDetail {
  ChatDetail({
    this.blockedBy,
    this.createdAt,
    this.updatedAt,
    this.isBlocked,
    this.isGroupChat,
    this.lastMessage,
    this.name,
    this.userIds,
    this.deletedMessageIds,
    this.deletedStatuses,
    this.readStatuses,
    this.blockedStatuses,
    this.groupMessageStatuses,
  });

  int? blockedBy;
  Timestamp? createdAt;
  Timestamp? updatedAt;
  bool? isBlocked;
  bool? isGroupChat;
  String? lastMessage;
  String? name;
  List<int>? userIds;
  List<DeletedMessageId>? deletedMessageIds;
  List<DeletedStatus>? deletedStatuses;
  List<ReadStatus>? readStatuses;
  List<BlockedStatuses>? blockedStatuses;
  List<GroupMessageStatuses>? groupMessageStatuses;

  factory ChatDetail.fromJson(Map<String, dynamic> json) => ChatDetail(
    blockedBy: json["blocked_by"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    isBlocked: json["is_blocked"],
    isGroupChat: json["is_group_chat"],
    lastMessage: json["last_message"],
    name: json["name"],
    userIds: List<int>.from(json["users_ids"].map((x) => x)),
    deletedMessageIds: json["deleted_messages_ids"] != null ? List<DeletedMessageId>.from(json["deleted_messages_ids"].map((x) => DeletedMessageId.fromJson(x))) : List<DeletedMessageId>.empty(),
    deletedStatuses: List<DeletedStatus>.from(json["deleted_statuses"].map((x) => DeletedStatus.fromJson(x))),
    readStatuses: List<ReadStatus>.from(json["read_statuses"].map((x) => ReadStatus.fromJson(x))),
    groupMessageStatuses: List<GroupMessageStatuses>.from(json["group_message_statuses"].map((x) => GroupMessageStatuses.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "blocked_by": blockedBy,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "is_blocked": isBlocked,
    "is_group_chat": isGroupChat,
    "last_message": lastMessage,
    "name": name,
    "users_ids": userIds?.map((e) => e).toList(),
    "deleted_messages_ids": deletedMessageIds?.map((e) => e.toJson()).toList(),
    "deleted_statuses": deletedStatuses?.map((e) => e.toJson()).toList(),
    "read_statuses": readStatuses?.map((e) => e.toJson()).toList(),
    "group_message_statuses": groupMessageStatuses?.map((e) => e.toJson()).toList(),
  };
}

class DeletedStatus {
  DeletedStatus({
    this.id,
    this.isDeleted,
  });

  int? id;
  bool? isDeleted;

  factory DeletedStatus.fromJson(Map<String, dynamic> json) => DeletedStatus(
    id: json["id"],
    isDeleted: json["is_deleted"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "is_deleted": isDeleted,
  };
}

class ReadStatus {
  ReadStatus({
    this.id,
    this.isRead,
  });

  int? id;
  bool? isRead;

  factory ReadStatus.fromJson(Map<String, dynamic> json) => ReadStatus(
    id: json["id"],
    isRead: json["is_read"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "is_read": isRead,
  };
}
class BlockedStatuses {
  BlockedStatuses({
    this.id,
    this.isBlocked,
  });

  int? id;
  bool? isBlocked;

  factory BlockedStatuses.fromJson(Map<String, dynamic> json) => BlockedStatuses(
    id: json["id"],
    isBlocked: json["is_blocked"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "is_blocked": isBlocked,
  };
}

class GroupMessageStatuses {
  GroupMessageStatuses({
    this.id,
    this.isGroupMessageDeleted,
  });

  int? id;
  bool? isGroupMessageDeleted;

  factory GroupMessageStatuses.fromJson(Map<String, dynamic> json) => GroupMessageStatuses(
    id: json["id"],
    isGroupMessageDeleted: json["is_group_message_deleted"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "is_group_message_deleted": isGroupMessageDeleted,
  };
}

class DeletedMessageId {
  DeletedMessageId({
    this.id,
    this.deletedMessageId,
  });

  int? id;
  String? deletedMessageId;

  factory DeletedMessageId.fromJson(Map<String, dynamic> json) => DeletedMessageId(
    id: json["id"],
    deletedMessageId: json["deleted_message_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "deleted_message_id": deletedMessageId,
  };
}
