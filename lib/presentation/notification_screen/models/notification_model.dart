import 'package:get/get.dart';
import 'listdescription_item_model.dart';
import 'listthisisdummyc_item_model.dart';
import 'listthisisdummyc_two_item_model.dart';

class NotificationModel {
  RxList<ListdescriptionItemModel> listdescriptionItemList =
      RxList.filled(5, ListdescriptionItemModel());

  RxList<ListthisisdummycItemModel> listthisisdummycItemList =
      RxList.filled(3, ListthisisdummycItemModel());

  RxList<ListthisisdummycTwoItemModel> listthisisdummycTwoItemList =
      RxList.filled(2, ListthisisdummycTwoItemModel());
}
