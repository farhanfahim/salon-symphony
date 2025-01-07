import '../controller/flashcards_one_controller.dart';
import 'package:get/get.dart';

class FlashcardsOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FlashcardsOneController());
  }
}
