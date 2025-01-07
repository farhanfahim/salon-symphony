import '/core/app_export.dart';
import 'package:salon_symphony/presentation/event_option_screen/models/event_option_model.dart';

class EventOptionController extends GetxController {
  Rx<EventOptionModel> eventOptionModelObj = EventOptionModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
