import '/core/app_export.dart';import 'package:salon_symphony/presentation/home_empty_container_screen/models/home_empty_container_model.dart';import 'package:salon_symphony/widgets/custom_bottom_bar.dart';class HomeEmptyContainerController extends GetxController {Rx<HomeEmptyContainerModel> homeEmptyContainerModelObj = HomeEmptyContainerModel().obs;

Rx<BottomBarEnum> type = BottomBarEnum.Home.obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
@override void onInit() {  } 
 }
