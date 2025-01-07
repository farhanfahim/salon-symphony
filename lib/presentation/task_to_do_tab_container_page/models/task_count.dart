class TaskCount {
  final bool? status;
  final String? message;
  final Data? data;

  TaskCount({
    this.status,
    this.message,
    this.data,
  });

  TaskCount.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        message = json['message'] as String?,
        data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'data' : data?.toJson()
  };
}

class Data {
  final int? todo;
  final int? overdue;
  final int? done;

  Data({
    this.todo,
    this.overdue,
    this.done,
  });

  Data.fromJson(Map<String, dynamic> json)
      : todo = json['todo'] as int?,
        overdue = json['overdue'] as int?,
        done = json['done'] as int?;

  Map<String, dynamic> toJson() => {
    'todo' : todo,
    'overdue' : overdue,
    'done' : done
  };
}