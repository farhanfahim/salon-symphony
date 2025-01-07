import '../controller/flashcard_complete_controller.dart';
import 'package:get/get.dart';

class FlashcardCompleteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FlashcardCompleteController());
  }
}
