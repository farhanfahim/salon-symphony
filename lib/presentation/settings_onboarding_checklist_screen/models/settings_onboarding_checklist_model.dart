import 'package:get/get_rx/src/rx_types/rx_types.dart';

class SettingsOnboardingChecklistModel {
  bool? status;
  String? message;
  Data? data;

  SettingsOnboardingChecklistModel({
    this.status,
    this.message,
    this.data,
  });

  SettingsOnboardingChecklistModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] as bool?;
    message = json['message'] as String?;
    data = (json['data'] as Map<String, dynamic>?) != null
        ? Data.fromJson(json['data'] as Map<String, dynamic>)
        : null;
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
  Meta? meta;
  List<OnboardingChecklistData>? data;

  Data({
    this.meta,
    this.data,
  });

  Data.fromJson(Map<String, dynamic> json) {
    meta = (json['meta'] as Map<String, dynamic>?) != null
        ? Meta.fromJson(json['meta'] as Map<String, dynamic>)
        : null;
    data = (json['data'] as List?)
        ?.map((dynamic e) =>
            OnboardingChecklistData.fromJson(e as Map<String, dynamic>))
        .toList();
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

class OnboardingChecklistData {
  int? id;
  String? name;
  String? description;
  String? dueDate;
  dynamic link;
  dynamic linkId;
  dynamic linkCategory;
  int? linkType;
  int? status;
  int? salonId;
  dynamic categoryId;
  dynamic positionId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<UserOnboardingTask>? userOnboardingTask;
  User? user;
  Salon? salon;
  dynamic position;
  dynamic category;
  String? createdAgo;
  List<CompletedUsers>? completedUsers;
  List<IncompleteUsers>? incompleteUsers;
  Rx<int>? userStatus;
  Rx<int>? LocaluserStatus;
  Meta? meta;

  OnboardingChecklistData({
    this.id,
    this.name,
    this.description,
    this.dueDate,
    this.link,
    this.linkId,
    this.linkCategory,
    this.linkType,
    this.status,
    this.salonId,
    this.categoryId,
    this.positionId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.userOnboardingTask,
    this.user,
    this.salon,
    this.position,
    this.category,
    this.createdAgo,
    this.completedUsers,
    this.incompleteUsers,
    this.userStatus,
    this.LocaluserStatus,
    this.meta,
  });

  OnboardingChecklistData.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    description = json['description'] as String?;
    dueDate = json['due_date'] as String?;
    link = json['link'];
    linkId = json['link_id'];
    linkCategory = json['link_category'];
    linkType = json['link_type'] as int?;
    status = json['status'] as int?;
    salonId = json['salon_id'] as int?;
    categoryId = json['category_id'];
    positionId = json['position_id'];
    userId = json['user_id'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    userOnboardingTask = (json['userOnboardingTask'] as List?)
        ?.map((dynamic e) =>
            UserOnboardingTask.fromJson(e as Map<String, dynamic>))
        .toList();
    user = (json['user'] as Map<String, dynamic>?) != null
        ? User.fromJson(json['user'] as Map<String, dynamic>)
        : null;
    salon = (json['salon'] as Map<String, dynamic>?) != null
        ? Salon.fromJson(json['salon'] as Map<String, dynamic>)
        : null;
    position = json['position'];
    category = json['category'];
    createdAgo = json['created_ago'] as String?;
    completedUsers = (json['completedUsers'] as List?)
        ?.map((dynamic e) => CompletedUsers.fromJson(e as Map<String, dynamic>))
        .toList();
    incompleteUsers = (json['incompleteUsers'] as List?)
        ?.map(
            (dynamic e) => IncompleteUsers.fromJson(e as Map<String, dynamic>))
        .toList();
    userStatus = Rx<int>(json['userStatus'] as int);
    LocaluserStatus = Rx<int>(json['userStatus'] as int);
    meta = (json['meta'] as Map<String, dynamic>?) != null
        ? Meta.fromJson(json['meta'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['description'] = description;
    json['due_date'] = dueDate;
    json['link'] = link;
    json['link_id'] = linkId;
    json['link_category'] = linkCategory;
    json['link_type'] = linkType;
    json['status'] = status;
    json['salon_id'] = salonId;
    json['category_id'] = categoryId;
    json['position_id'] = positionId;
    json['user_id'] = userId;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['userOnboardingTask'] =
        userOnboardingTask?.map((e) => e.toJson()).toList();
    json['user'] = user?.toJson();
    json['salon'] = salon?.toJson();
    json['position'] = position;
    json['category'] = category;
    json['created_ago'] = createdAgo;
    json['completedUsers'] = completedUsers?.map((e) => e.toJson()).toList();
    json['incompleteUsers'] = incompleteUsers?.map((e) => e.toJson()).toList();
    json['userStatus'] = userStatus?.value;
    json['userStatus'] = LocaluserStatus?.value;
    json['meta'] = meta?.toJson();
    return json;
  }
}

class UserOnboardingTask {
  int? id;
  int? userId;
  int? status;
  int? onboardingTaskId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? createdAgo;
  String? statusName;

  UserOnboardingTask({
    this.id,
    this.userId,
    this.status,
    this.onboardingTaskId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdAgo,
    this.statusName,
  });

  UserOnboardingTask.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    userId = json['user_id'] as int?;
    status = json['status'] as int?;
    onboardingTaskId = json['onboarding_task_id'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    createdAgo = json['created_ago'] as String?;
    statusName = json['statusName'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['user_id'] = userId;
    json['status'] = status;
    json['onboarding_task_id'] = onboardingTaskId;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['created_ago'] = createdAgo;
    json['statusName'] = statusName;
    return json;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  dynamic dob;
  dynamic relationshipId;
  int? locationId;
  dynamic hireDate;
  dynamic bio;
  dynamic school;
  dynamic image;
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
  int? isScheduled;
  String? verificationCode;
  int? pushNotification;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? createdAgo;
  String? relationship;
  int? totalPoints;

  User({
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
    this.isScheduled,
    this.verificationCode,
    this.pushNotification,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdAgo,
    this.relationship,
    this.totalPoints,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    email = json['email'] as String?;
    phone = json['phone'] as String?;
    dob = json['dob'];
    relationshipId = json['relationship_id'];
    locationId = json['location_id'] as int?;
    hireDate = json['hire_date'];
    bio = json['bio'];
    school = json['school'];
    image = json['image'];
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
    isScheduled = json['is_scheduled'] as int?;
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
    json['is_scheduled'] = isScheduled;
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

class Salon {
  int? id;
  String? uniid;
  String? image;
  String? name;
  dynamic slug;
  String? address;
  dynamic bookingSoftware;
  dynamic productLine;
  dynamic jobTitle;
  String? dateFounded;
  String? city;
  int? countryId;
  String? zip;
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
    image = json['image'] as String?;
    name = json['name'] as String?;
    slug = json['slug'];
    address = json['address'] as String?;
    bookingSoftware = json['booking_software'];
    productLine = json['product_line'];
    jobTitle = json['job_title'];
    dateFounded = json['date_founded'] as String?;
    city = json['city'] as String?;
    countryId = json['country_id'] as int?;
    zip = json['zip'] as String?;
    multiLocations = json['multi_locations'] as int?;
    status = json['status'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    stripeCustomerId = json['stripe_customer_id'];
    directoryName = json['directory_name'] as String?;
    storageAvailableGbs = json['storage_available_gbs'] ;
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

Map<String, dynamic> toJson() {
  final Map<String, dynamic> json = <String, dynamic>{};

  return json;
}

class CompletedUsers {
  int? id;
  int? userId;
  int? status;
  int? onboardingTaskId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? createdAgo;
  String? statusName;

  CompletedUsers({
    this.id,
    this.userId,
    this.status,
    this.onboardingTaskId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdAgo,
    this.statusName,
  });

  CompletedUsers.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    userId = json['user_id'] as int?;
    status = json['status'] as int?;
    onboardingTaskId = json['onboarding_task_id'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    createdAgo = json['created_ago'] as String?;
    statusName = json['statusName'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['user_id'] = userId;
    json['status'] = status;
    json['onboarding_task_id'] = onboardingTaskId;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['created_ago'] = createdAgo;
    json['statusName'] = statusName;
    return json;
  }
}

class IncompleteUsers {
  int? id;
  int? userId;
  int? status;
  int? onboardingTaskId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? createdAgo;
  String? statusName;

  IncompleteUsers({
    this.id,
    this.userId,
    this.status,
    this.onboardingTaskId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdAgo,
    this.statusName,
  });

  IncompleteUsers.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    userId = json['user_id'] as int?;
    status = json['status'] as int?;
    onboardingTaskId = json['onboarding_task_id'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    deletedAt = json['deleted_at'];
    createdAgo = json['created_ago'] as String?;
    statusName = json['statusName'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['user_id'] = userId;
    json['status'] = status;
    json['onboarding_task_id'] = onboardingTaskId;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['deleted_at'] = deletedAt;
    json['created_ago'] = createdAgo;
    json['statusName'] = statusName;
    return json;
  }
}
