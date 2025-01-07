import '../controller/flashcards_controller.dart';
import 'package:get/get.dart';

class FlashcardsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FlashcardsController());
  }
}
