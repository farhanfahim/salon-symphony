import 'package:get/get.dart';
import 'flashcards_item_model.dart';

class FlashcardsModel {
  RxList<FlashcardsItemModel> flashcardsItemList =
      RxList.filled(3, FlashcardsItemModel());
}
