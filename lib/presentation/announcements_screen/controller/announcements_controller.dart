import '/core/app_export.dart';import 'package:salon_symphony/presentation/announcements_screen/models/announcements_model.dart';class AnnouncementsController extends GetxController {Rx<AnnouncementsModel> announcementsModelObj = AnnouncementsModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
 }
