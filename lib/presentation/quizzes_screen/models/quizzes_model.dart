import 'package:get/get.dart';
import 'package:salon_symphony/presentation/quizzes_screen/models/quizTab.dart';
import 'quizzes_item_model.dart';

class QuizzesModel {
  RxList<QuizzesItemModel> quizzesItemList =
  RxList.filled(3, QuizzesItemModel());

  RxList<Listall1ItemModel> listall1ItemList = RxList.filled(
      4, Listall1ItemModel());

}

