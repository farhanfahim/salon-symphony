import '../referral_all_page/widgets/referral_all_item_widget.dart';
import 'controller/referral_all_controller.dart';
import 'models/referral_all_item_model.dart';
import 'models/referral_all_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

// ignore_for_file: must_be_immutable
  class ReferralAllPage extends StatelessWidget {
  ReferralAllController controller =
      Get.put(ReferralAllController(ReferralAllModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Obx(() => ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller
                    .referralAllModelObj.value.referralAllItemList.length,
                itemBuilder: (context, index) {
                  ReferralAllItemModel model = controller
                      .referralAllModelObj.value.referralAllItemList[index];
                  return ReferralAllItemWidget(model,index);
                }))));
  }
}
