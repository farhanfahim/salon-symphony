import 'package:salon_symphony/presentation/rewards_screen/models/reward_response_model.dart';

import '../../../core/utils/app_constant.dart';
import '../../../core/utils/utils.dart';
import '../../request_pending_page/models/request_response_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

// ignore: must_be_immutable
class BadgeItemWidget extends StatelessWidget {
  BadgeItemWidget(this.model,  );

  Badges model;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(getHorizontalSize(10.00)),
        child: CommonImageView(
          url: model.badge!, ));
  }
}
