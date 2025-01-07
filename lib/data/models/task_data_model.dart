

import 'package:get/get.dart';

class Task {
  Meta? meta;
  List<PagedTaskData>? data;

  Task({
    this.meta,
    this.data,
  });

  Task.fromJson(Map<String, dynamic> json) {
    meta = (json['meta'] as Map<String,dynamic>?) != null ? Meta.fromJson(json['meta'] as Map<String,dynamic>) : null;
    data = (json['data'] as List?)?.map((dynamic e) => PagedTaskData.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['meta'] = meta?.toJson();
    json['data'] = data?.map((e) => e.toJson()).toList();
    return json;
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
  dynamic nextPageUrl;
  dynamic previousPageUrl;

  Meta({
    this.total,
    this.perPage,
    this.currentPage,
    this.lastPage,
    this.firstPage,
    this.firstPageUrl,
    this.lastPageUrl,
    this.nextPageUrl,
    this.previousPageUrl,
  });

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'] as int?;
    perPage = json['per_page'] as int?;
    currentPage = json['current_page'] as int?;
    lastPage = json['last_page'] as int?;
    firstPage = json['first_page'] as int?;
    firstPageUrl = json['first_page_url'] as String?;
    lastPageUrl = json['last_page_url'] as String?;
    nextPageUrl = json['next_page_url'];
    previousPageUrl = json['previous_page_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['total'] = total;
    json['per_page'] = perPage;
    json['current_page'] = currentPage;
    json['last_page'] = lastPage;
    json['first_page'] = firstPage;
    json['first_page_url'] = firstPageUrl;
    json['last_page_url'] = lastPageUrl;
    json['next_page_url'] = nextPageUrl;
    json['previous_page_url'] = previousPageUrl;
    return json;
  }
}

class PagedTaskData {
  int? id;
  String? uniid;
  String? name;
  String? start;
  String? end;
  int? type;
  int? status;
  String? description;
  int? salonId;
  int? repeatCycle;
  int? dueOn;
  int? assignBy;
  dynamic assignTo;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Salon? salon;
  Assignee? assignee;
  List<dynamic>? requests;
  List<Details>? details;
  String? createdAgo;
  String? typeName;
  String? repeat;
  String? dueOnDay;
  UserStatus? userStatus;
  List<dynamic>? todoUsers;
  List<OverdueUsers>? overdueUsers;
  List<dynamic>? doneUsers;

  PagedTaskData({
    this.id,
    this.uniid,
    this.name,
    this.start,
    this.end,
    this.type,
    this.status,
    this.description,
    this.salonId,
    this.repeatCycle,
    this.dueOn,
    this.assignBy,
    this.assignTo,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.salon,
    this.assignee,
    this.requests,
    this.details,
    this.createdAgo,
    this.typeName,
    this.repeat,
    this.dueOnDay,
    this.userStatus,
    this.todoUsers,
    this.overdueUsers,
    this.doneUsers,
  });

  PagedTaskData.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    uniid = json['uniid'] as String?;
    name = json['name'] as String?;
    start = json['start'] as String?;
    end = json['end'] as String?;
    type = json['type'] as int?;
    status = json['status'] as int?;
    description = json['description'] as String?;
    salonId = json['salon_id'] as int?;
    repeatCycle = json['repeat_cycle'] as int?;
    dueOn = json['due_on'] as int?;
    assignBy = json['assign_by'] as int?;
    assignTo = json['assign_to'];
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    salon = (json['salon'] as Map<String,dynamic>?) != null ? Salon.fromJson(json['salon'] as Map<String,dynamic>) : null;
    assignee = (json['assignee'] as Map<String,dynamic>?) != null ? Assignee.fromJson(json['assignee'] as Map<String,dynamic>) : null;
    requests = json['requests'] as List?;
    details = (json['details'] as List?)?.map((dynamic e) => Details.fromJson(e as Map<String,dynamic>)).toList();
    createdAgo = json['created_ago'] as String?;
    typeName = json['typeName'] as String?;
    repeat = json['repeat'] as String?;
    dueOnDay = json['dueOnDay'] as String?;
    userStatus = (json['userStatus'] as Map<String,dynamic>?) != null ? UserStatus.fromJson(json['userStatus'] as Map<String,dynamic>) : null;
    todoUsers = json['todoUsers'] as List?;
    overdueUsers = (json['overdueUsers'] as List?)?.map((dynamic e) => OverdueUsers.fromJson(e as Map<String,dynamic>)).toList();
    doneUsers = json['doneUsers'] as List?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['uniid'] = uniid;
    json['name'] = name;
    json['start'] = start;
    json['end'] = end;
    json['type'] = type;
    json['status'] = status;
    json['description'] = description;
    json['salon_id'] = salonId;
    json['repeat_cycle'] = repeatCycle;
    json['due_on'] = dueOn;
    json['assign_by'] = assignBy;
    json['assign_to'] = assignTo;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['salon'] = salon?.toJson();
    json['assignee'] = assignee?.toJson();
    json['requests'] = requests;
    json['details'] = details?.map((e) => e.toJson()).toList();
    json['created_ago'] = createdAgo;
    json['typeName'] = typeName;
    json['repeat'] = repeat;
    json['dueOnDay'] = dueOnDay;
    json['userStatus'] = userStatus?.toJson();
    json['todoUsers'] = todoUsers;
    json['overdueUsers'] = overdueUsers?.map((e) => e.toJson()).toList();
    json['doneUsers'] = doneUsers;
    return json;
  }
}

class Salon {
  int? id;
  String? uniid;
  dynamic image;
  String? name;
  dynamic slug;
  dynamic address;
  dynamic bookingSoftware;
  dynamic productLine;
  dynamic jobTitle;
  dynamic dateFounded;
  dynamic city;
  dynamic countryId;
  dynamic zip;
  int? multiLocations;
  int? status;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic stripeCustomerId;
  String? directoryName;
  num? storageAvailableGbs;
  String? createdAgo;
  String? directory;

  Salon({
    this.id,
    this.uniid,
    this.image,
    this.name,
    this.slug,
    this.address,
    this.bookingSoftware,
    this.productLine,
    this.jobTitle,
    this.dateFounded,
    this.city,
    this.countryId,
    this.zip,
    this.multiLocations,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.stripeCustomerId,
    this.directoryName,
    this.storageAvailableGbs,
    this.createdAgo,
    this.directory,
  });

  Salon.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    uniid = json['uniid'] as String?;
    image = json['image'];
    name = json['name'] as String?;
    slug = json['slug'];
    address = json['address'];
    bookingSoftware = json['booking_software'];
    productLine = json['product_line'];
    jobTitle = json['job_title'];
    dateFounded = json['date_founded'];
    city = json['city'];
    countryId = json['country_id'];
    zip = json['zip'];
    multiLocations = json['multi_locations'] as int?;
    status = json['status'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    stripeCustomerId = json['stripe_customer_id'];
    directoryName = json['directory_name'] as String?;
    storageAvailableGbs = json['storage_available_gbs'] as num?;
    createdAgo = json['created_ago'] as String?;
    directory = json['directory'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['uniid'] = uniid;
    json['image'] = image;
    json['name'] = name;
    json['slug'] = slug;
    json['address'] = address;
    json['booking_software'] = bookingSoftware;
    json['product_line'] = productLine;
    json['job_title'] = jobTitle;
    json['date_founded'] = dateFounded;
    json['city'] = city;
    json['country_id'] = countryId;
    json['zip'] = zip;
    json['multi_locations'] = multiLocations;
    json['status'] = status;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['stripe_customer_id'] = stripeCustomerId;
    json['directory_name'] = directoryName;
    json['storage_available_gbs'] = storageAvailableGbs;
    json['created_ago'] = createdAgo;
    json['directory'] = directory;
    return json;
  }
}



class Assignee {
  int? id;
  String? name;
  String? email;
  dynamic phone;
  dynamic dob;
  dynamic relationshipId;
  dynamic locationId;
  dynamic hireDate;
  dynamic bio;
  dynamic school;
  dynamic image;
  dynamic address;
  dynamic city;
  dynamic countryId;
  dynamic zip;
  dynamic salonId;
  dynamic portfolio;
  dynamic tiktok;
  dynamic instagram;
  dynamic facebook;
  dynamic positionId;
  int? isCompleted;
  int? isSocialLogin;
  int? isApproved;
  int? isVerified;
  String? verificationCode;
  int? pushNotification;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? createdAgo;
  String? relationship;
  int? totalPoints;

  Assignee({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.dob,
    this.relationshipId,
    this.locationId,
    this.hireDate,
    this.bio,
    this.school,
    this.image,
    this.address,
    this.city,
    this.countryId,
    this.zip,
    this.salonId,
    this.portfolio,
    this.tiktok,
    this.instagram,
    this.facebook,
    this.positionId,
    this.isCompleted,
    this.isSocialLogin,
    this.isApproved,
    this.isVerified,
    this.verificationCode,
    this.pushNotification,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdAgo,
    this.relationship,
    this.totalPoints,
  });

  Assignee.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    email = json['email'] as String?;
    phone = json['phone'];
    dob = json['dob'];
    relationshipId = json['relationship_id'];
    locationId = json['location_id'];
    hireDate = json['hire_date'];
    bio = json['bio'];
    school = json['school'];
    image = json['image'];
    address = json['address'];
    city = json['city'];
    countryId = json['country_id'];
    zip = json['zip'];
    salonId = json['salon_id'];
    portfolio = json['portfolio'];
    tiktok = json['tiktok'];
    instagram = json['instagram'];
    facebook = json['facebook'];
    positionId = json['position_id'];
    isCompleted = json['is_completed'] as int?;
    isSocialLogin = json['is_social_login'] as int?;
    isApproved = json['is_approved'] as int?;
    isVerified = json['is_verified'] as int?;
    verificationCode = json['verification_code'] as String?;
    pushNotification = json['push_notification'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    createdAgo = json['created_ago'] as String?;
    relationship = json['relationship'] as String?;
    totalPoints = json['totalPoints'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['email'] = email;
    json['phone'] = phone;
    json['dob'] = dob;
    json['relationship_id'] = relationshipId;
    json['location_id'] = locationId;
    json['hire_date'] = hireDate;
    json['bio'] = bio;
    json['school'] = school;
    json['image'] = image;
    json['address'] = address;
    json['city'] = city;
    json['country_id'] = countryId;
    json['zip'] = zip;
    json['salon_id'] = salonId;
    json['portfolio'] = portfolio;
    json['tiktok'] = tiktok;
    json['instagram'] = instagram;
    json['facebook'] = facebook;
    json['position_id'] = positionId;
    json['is_completed'] = isCompleted;
    json['is_social_login'] = isSocialLogin;
    json['is_approved'] = isApproved;
    json['is_verified'] = isVerified;
    json['verification_code'] = verificationCode;
    json['push_notification'] = pushNotification;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['created_ago'] = createdAgo;
    json['relationship'] = relationship;
    json['totalPoints'] = totalPoints;
    return json;
  }
}


class Details {
  int? id;
  String? startDate;
  String? endDate;
  int? status;
  int? taskId;
  int? assignBy;
  int? assignTo;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Assigned? assigned;
  String? createdAgo;
  String? statusName;
  Meta? meta;

  Details({
    this.id,
    this.startDate,
    this.endDate,
    this.status,
    this.taskId,
    this.assignBy,
    this.assignTo,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.assigned,
    this.createdAgo,
    this.statusName,
    this.meta,
  });

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    startDate = json['start_date'] as String?;
    endDate = json['end_date'] as String?;
    status = json['status'] as int?;
    taskId = json['task_id'] as int?;
    assignBy = json['assign_by'] as int?;
    assignTo = json['assign_to'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    assigned = (json['assigned'] as Map<String,dynamic>?) != null ? Assigned.fromJson(json['assigned'] as Map<String,dynamic>) : null;
    createdAgo = json['created_ago'] as String?;
    statusName = json['statusName'] as String?;
    meta = (json['meta'] as Map<String,dynamic>?) != null ? Meta.fromJson(json['meta'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['start_date'] = startDate;
    json['end_date'] = endDate;
    json['status'] = status;
    json['task_id'] = taskId;
    json['assign_by'] = assignBy;
    json['assign_to'] = assignTo;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['assigned'] = assigned?.toJson();
    json['created_ago'] = createdAgo;
    json['statusName'] = statusName;
    json['meta'] = meta?.toJson();
    return json;
  }
}

class Assigned {
  int? id;
  String? name;
  dynamic email;
  String? phone;
  String? dob;
  dynamic relationshipId;
  dynamic locationId;
  dynamic hireDate;
  dynamic bio;
  String? school;
  String? image;
  dynamic address;
  dynamic city;
  dynamic countryId;
  dynamic zip;
  int? salonId;
  dynamic portfolio;
  dynamic tiktok;
  dynamic instagram;
  dynamic facebook;
  int? positionId;
  int? isCompleted;
  int? isSocialLogin;
  int? isApproved;
  int? isVerified;
  dynamic verificationCode;
  int? pushNotification;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? createdAgo;
  String? relationship;
  int? totalPoints;

  Assigned({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.dob,
    this.relationshipId,
    this.locationId,
    this.hireDate,
    this.bio,
    this.school,
    this.image,
    this.address,
    this.city,
    this.countryId,
    this.zip,
    this.salonId,
    this.portfolio,
    this.tiktok,
    this.instagram,
    this.facebook,
    this.positionId,
    this.isCompleted,
    this.isSocialLogin,
    this.isApproved,
    this.isVerified,
    this.verificationCode,
    this.pushNotification,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdAgo,
    this.relationship,
    this.totalPoints,
  });

  Assigned.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    email = json['email'];
    phone = json['phone'] as String?;
    dob = json['dob'] as String?;
    relationshipId = json['relationship_id'];
    locationId = json['location_id'];
    hireDate = json['hire_date'];
    bio = json['bio'];
    school = json['school'] as String?;
    image = json['image'] as String?;
    address = json['address'];
    city = json['city'];
    countryId = json['country_id'];
    zip = json['zip'];
    salonId = json['salon_id'] as int?;
    portfolio = json['portfolio'];
    tiktok = json['tiktok'];
    instagram = json['instagram'];
    facebook = json['facebook'];
    positionId = json['position_id'] as int?;
    isCompleted = json['is_completed'] as int?;
    isSocialLogin = json['is_social_login'] as int?;
    isApproved = json['is_approved'] as int?;
    isVerified = json['is_verified'] as int?;
    verificationCode = json['verification_code'];
    pushNotification = json['push_notification'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    createdAgo = json['created_ago'] as String?;
    relationship = json['relationship'] as String?;
    totalPoints = json['totalPoints'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['email'] = email;
    json['phone'] = phone;
    json['dob'] = dob;
    json['relationship_id'] = relationshipId;
    json['location_id'] = locationId;
    json['hire_date'] = hireDate;
    json['bio'] = bio;
    json['school'] = school;
    json['image'] = image;
    json['address'] = address;
    json['city'] = city;
    json['country_id'] = countryId;
    json['zip'] = zip;
    json['salon_id'] = salonId;
    json['portfolio'] = portfolio;
    json['tiktok'] = tiktok;
    json['instagram'] = instagram;
    json['facebook'] = facebook;
    json['position_id'] = positionId;
    json['is_completed'] = isCompleted;
    json['is_social_login'] = isSocialLogin;
    json['is_approved'] = isApproved;
    json['is_verified'] = isVerified;
    json['verification_code'] = verificationCode;
    json['push_notification'] = pushNotification;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['created_ago'] = createdAgo;
    json['relationship'] = relationship;
    json['totalPoints'] = totalPoints;
    return json;
  }
}

class OverdueUsers {
  int? id;
  String? startDate;
  String? endDate;
  int? status;
  int? taskId;
  int? assignBy;
  int? assignTo;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  OverdueAssigned? assigned;
  String? createdAgo;
  String? statusName;

  OverdueUsers({
    this.id,
    this.startDate,
    this.endDate,
    this.status,
    this.taskId,
    this.assignBy,
    this.assignTo,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.assigned,
    this.createdAgo,
    this.statusName,
  });

  OverdueUsers.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    startDate = json['start_date'] as String?;
    endDate = json['end_date'] as String?;
    status = json['status'] as int?;
    taskId = json['task_id'] as int?;
    assignBy = json['assign_by'] as int?;
    assignTo = json['assign_to'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    assigned = (json['assigned'] as Map<String,dynamic>?) != null ? OverdueAssigned.fromJson(json['assigned'] as Map<String,dynamic>) : null;
    createdAgo = json['created_ago'] as String?;
    statusName = json['statusName'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['start_date'] = startDate;
    json['end_date'] = endDate;
    json['status'] = status;
    json['task_id'] = taskId;
    json['assign_by'] = assignBy;
    json['assign_to'] = assignTo;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['assigned'] = assigned?.toJson();
    json['created_ago'] = createdAgo;
    json['statusName'] = statusName;
    return json;
  }
}
class UserStatus {
  int? id;
  String? startDate;
  String? endDate;
  int? status;
  Rx<int>? localStatus = 0.obs;
  int? taskId;
  int? assignBy;
  int? assignTo;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? createdAgo;
  String? statusName;
  // Meta? meta;

  UserStatus({
    this.id,
    this.startDate,
    this.endDate,
    this.status,
    this.localStatus,
    this.taskId,
    this.assignBy,
    this.assignTo,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdAgo,
    this.statusName,
    // this.meta,
  });

  UserStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    startDate = json['start_date'] as String?;
    endDate = json['end_date'] as String?;
    status = json['status'] as int?;
    taskId = json['task_id'] as int?;
    assignBy = json['assign_by'] as int?;
    assignTo = json['assign_to'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    createdAgo = json['created_ago'] as String?;
    statusName = json['statusName'] as String?;
    // meta = (json['meta'] as Map<String,dynamic>?) != null ? Meta.fromJson(json['meta'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['start_date'] = startDate;
    json['end_date'] = endDate;
    json['status'] = status;
    json['task_id'] = taskId;
    json['assign_by'] = assignBy;
    json['assign_to'] = assignTo;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['created_ago'] = createdAgo;
    json['statusName'] = statusName;
    // json['meta'] = meta?.toJson();
    return json;
  }
}
class OverdueAssigned {
  int? id;
  String? name;
  dynamic email;
  String? phone;
  String? dob;
  dynamic relationshipId;
  dynamic locationId;
  dynamic hireDate;
  dynamic bio;
  String? school;
  String? image;
  dynamic address;
  dynamic city;
  dynamic countryId;
  dynamic zip;
  int? salonId;
  dynamic portfolio;
  dynamic tiktok;
  dynamic instagram;
  dynamic facebook;
  int? positionId;
  int? isCompleted;
  int? isSocialLogin;
  int? isApproved;
  int? isVerified;
  dynamic verificationCode;
  int? pushNotification;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? createdAgo;
  String? relationship;
  int? totalPoints;
  Meta? meta;

  OverdueAssigned({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.dob,
    this.relationshipId,
    this.locationId,
    this.hireDate,
    this.bio,
    this.school,
    this.image,
    this.address,
    this.city,
    this.countryId,
    this.zip,
    this.salonId,
    this.portfolio,
    this.tiktok,
    this.instagram,
    this.facebook,
    this.positionId,
    this.isCompleted,
    this.isSocialLogin,
    this.isApproved,
    this.isVerified,
    this.verificationCode,
    this.pushNotification,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdAgo,
    this.relationship,
    this.totalPoints,
    this.meta,
  });

  OverdueAssigned.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    email = json['email'];
    phone = json['phone'] as String?;
    dob = json['dob'] as String?;
    relationshipId = json['relationship_id'];
    locationId = json['location_id'];
    hireDate = json['hire_date'];
    bio = json['bio'];
    school = json['school'] as String?;
    image = json['image'] as String?;
    address = json['address'];
    city = json['city'];
    countryId = json['country_id'];
    zip = json['zip'];
    salonId = json['salon_id'] as int?;
    portfolio = json['portfolio'];
    tiktok = json['tiktok'];
    instagram = json['instagram'];
    facebook = json['facebook'];
    positionId = json['position_id'] as int?;
    isCompleted = json['is_completed'] as int?;
    isSocialLogin = json['is_social_login'] as int?;
    isApproved = json['is_approved'] as int?;
    isVerified = json['is_verified'] as int?;
    verificationCode = json['verification_code'];
    pushNotification = json['push_notification'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    createdAgo = json['created_ago'] as String?;
    relationship = json['relationship'] as String?;
    totalPoints = json['totalPoints'] as int?;
    meta = (json['meta'] as Map<String,dynamic>?) != null ? Meta.fromJson(json['meta'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['email'] = email;
    json['phone'] = phone;
    json['dob'] = dob;
    json['relationship_id'] = relationshipId;
    json['location_id'] = locationId;
    json['hire_date'] = hireDate;
    json['bio'] = bio;
    json['school'] = school;
    json['image'] = image;
    json['address'] = address;
    json['city'] = city;
    json['country_id'] = countryId;
    json['zip'] = zip;
    json['salon_id'] = salonId;
    json['portfolio'] = portfolio;
    json['tiktok'] = tiktok;
    json['instagram'] = instagram;
    json['facebook'] = facebook;
    json['position_id'] = positionId;
    json['is_completed'] = isCompleted;
    json['is_social_login'] = isSocialLogin;
    json['is_approved'] = isApproved;
    json['is_verified'] = isVerified;
    json['verification_code'] = verificationCode;
    json['push_notification'] = pushNotification;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['created_ago'] = createdAgo;
    json['relationship'] = relationship;
    json['totalPoints'] = totalPoints;
    json['meta'] = meta?.toJson();
    return json;
  }
}
