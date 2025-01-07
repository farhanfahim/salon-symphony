import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/dummy_content.dart';
import '/core/app_export.dart';

class RequestAllController extends GetxController with SingleGetTickerProviderMixin {
  TextEditingController searchFieldController = TextEditingController();
  RxList<requestTypeModel> arrOfRequestType = List<requestTypeModel>.empty().obs;
  TabController? tabController;
ExpandableController expandableController = ExpandableController();

  RxList<GoalsModel> arrOfRequest = List<GoalsModel>.empty().obs;
RxBool expanded = false.obs;

  @override
  void onReady() {


    super.onReady();
  }


  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    arrOfRequest.add(GoalsModel(name:"Time Off (4)",isSelected:false.obs));
    arrOfRequest.add(GoalsModel(name:"Schedule (2)",isSelected:false.obs));
    arrOfRequest.add(GoalsModel(name:"Education (2)",isSelected:false.obs));
    arrOfRequest.refresh();
    expandableController.toggle();
  }

  @override
  void onClose() {
    super.onClose();
  }

  generateOption(){

    if(arrOfRequestType.isNotEmpty){
      arrOfRequestType.clear();
    }
    arrOfRequestType.add(requestTypeModel(id:1,title:"Time Off Request",desc:"Submit a request vacation, personal time, etc.",selected: false.obs));
    arrOfRequestType.add(requestTypeModel(id:1,title:"Scheduling Request",desc:"Submit a request to change your work schedule.",selected: false.obs));
    arrOfRequestType.add(requestTypeModel(id:1,title:"Education Request",desc:"Submit class hours and reimbursement requests.",selected: false.obs));
    arrOfRequestType.refresh();

  }

  updateRequestItem(int index) {
    for (var item in arrOfRequestType) {
      item.selected = false.obs;
    }
    arrOfRequestType[index].selected = true.obs;
    arrOfRequestType.refresh();
  }
  
}
class GoalsModel {
  String? name;
  ExpandableController? expandableController;
  RxBool? isSelected;
  GoalsModel({this.name,this.isSelected});
}
