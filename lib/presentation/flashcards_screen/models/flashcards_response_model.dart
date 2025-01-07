import 'package:salon_symphony/core/app_export.dart';

class FlashCardResponseModel {
  Meta? meta;
  List<FlashCardData>? data;

  FlashCardResponseModel({this.meta, this.data});

  FlashCardResponseModel.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <FlashCardData>[];
      json['data'].forEach((v) {
        data!.add(new FlashCardData.fromJson(v));
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

class FlashCardData {
  int? id;
  String? uniid;
  String? image;
  String? name;
  int? status;
  int? userFlashcardStatus;
  Rx<int>? localUserFlashcardStatus = 0.obs;
  String? description;
  int? categoryId;
  int? salonId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  List<Tags>? tags;
  List<FlashcardElements>? flashcardElements;
  String? createdAgo;
  Meta3? meta;

  FlashCardData({
    this.id,
    this.uniid,
    this.image,
    this.name,
    this.status,
    this.description,
    this.categoryId,
    this.salonId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.tags,
    this.flashcardElements,
    this.createdAgo,
    this.userFlashcardStatus,
    this.localUserFlashcardStatus,
    this.meta,
  });

  FlashCardData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uniid = json['uniid'];
    image = json['image'];
    name = json['name'];
    status = json['status'];
    description = json['description'];
    categoryId = json['category_id'];
    salonId = json['salon_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }

    if (json['flashcardElements'] != null) {
      flashcardElements = <FlashcardElements>[];
      json['flashcardElements'].forEach((v) {
        flashcardElements!.add(new FlashcardElements.fromJson(v));
      });
    }

    createdAgo = json['created_ago'];
    userFlashcardStatus = json['user_flashcard_status'];
    meta = json['meta'] != null ? new Meta3.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uniid'] = this.uniid;
    data['image'] = this.image;
    data['name'] = this.name;
    data['status'] = this.status;
    data['description'] = this.description;
    data['category_id'] = this.categoryId;
    data['salon_id'] = this.salonId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    if (this.flashcardElements != null) {
      data['flashcardElements'] =
          this.flashcardElements!.map((v) => v.toJson()).toList();
    }
    data['created_ago'] = this.createdAgo;
    data['user_flashcard_status'] = this.userFlashcardStatus;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Meta3 {
  int? learning;
  int? known;

  Meta3({this.learning, this.known});

  Meta3.fromJson(Map<String, dynamic> json) {
    learning = json['learning'];
    known = json['known'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['learning'] = this.learning;
    data['known'] = this.known;
    return data;
  }
}

class Tags {
  int? id;
  String? name;
  int? categoryId;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? createdAgo;

  Tags(
      {this.id,
      this.name,
      this.categoryId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.createdAgo});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
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
    data['category_id'] = this.categoryId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['created_ago'] = this.createdAgo;
    return data;
  }
}

class FlashcardElements {
  int? id;
  String? frontPrompt;
  String? frontImage;
  String? backPrompt;
  String? backImage;
  int? flashcardId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? createdAgo;
  int? userScore;
  Rx<int> localUserScore = 0.obs;
  Meta? meta;

  FlashcardElements(
      {this.id,
      this.frontPrompt,
      this.frontImage,
      this.backPrompt,
      this.backImage,
      this.flashcardId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.createdAgo,
      this.userScore,
      required this.localUserScore,
      this.meta});

  FlashcardElements.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    frontPrompt = json['front_prompt'];
    frontImage = json['front_image'];
    backPrompt = json['back_prompt'];
    backImage = json['back_image'];
    flashcardId = json['flashcard_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    createdAgo = json['created_ago'];
    userScore = json['userScore'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['front_prompt'] = this.frontPrompt;
    data['front_image'] = this.frontImage;
    data['back_prompt'] = this.backPrompt;
    data['back_image'] = this.backImage;
    data['flashcard_id'] = this.flashcardId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['created_ago'] = this.createdAgo;
    data['userScore'] = this.userScore;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}
