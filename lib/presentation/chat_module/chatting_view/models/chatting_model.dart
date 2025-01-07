import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ChattingModel {
  int type;
  int userId;
  int senderId;
  String text;
  String image;
  String video;
  String pdf;
  Timestamp? time;
  String id;

  ChattingModel({
    required this.type,
    required this.userId,
    required this.senderId,
    required this.text,
    required this.image,
    required this.video,
    required this.time,
    required this.pdf,
    required this.id,
  });
}
