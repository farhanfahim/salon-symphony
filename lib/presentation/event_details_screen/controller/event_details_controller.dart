import '/core/app_export.dart';
import 'package:salon_symphony/presentation/event_details_screen/models/event_details_model.dart';

class EventDetailsController extends GetxController {
  Rx<EventDetailsModel> eventDetailsModelObj = EventDetailsModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
