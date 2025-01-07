import 'package:salon_symphony/presentation/rewards_screen/models/reward_response_model.dart';

import '../../../core/utils/app_constant.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/utils/utils.dart';
import '../../request_pending_page/models/request_response_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

// ignore: must_be_immutable
class PointItemWidget extends StatelessWidget {
  Responsive responsive = Responsive();
  PointItemWidget(this.model,  );

  Points model;

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return Padding(
      padding: const EdgeInsets.only(top:10.0),
      child: Column(
        children: [
          Container(
            color: ColorConstant.gray100,
            width: double.infinity,
            padding: getPadding(left: 10, top: 15, right: 10, bottom: 10,),
            child: Text(model.date!=null?Utils.getFormatedDate(model.date!):"-",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsRegular14Gray500),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: getPadding(left: 10,top: 15),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(model.name!=null?model.name!:"-",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                style: AppStyle.txtPoppinsBold16),

                            Text(model.points!=null?" (+${model.points.toString()})":"-",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtMuliBold16.copyWith(letterSpacing: 0.06,color:ColorConstant.green600))
                          ])),
                  Padding(
                    padding: getPadding(
                        left: 11,
                        top: 5,
                        bottom: 10,
                        right: 11),
                    child: Text(model.description!=null?model.description!.toString():"-",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: AppStyle
                            .txtPoppinsRegular14Bluegray400),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
