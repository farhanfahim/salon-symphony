import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../../../core/utils/dummy_content.dart';
import '../../../core/utils/responsive.dart';
import '../controller/request_all_controller.dart';

// ignore: must_be_immutable
class RequestOptionItemWidget extends StatelessWidget {
  RequestOptionItemWidget(this.index,this.model,this.onTap);
  Responsive responsive = Responsive();
  requestTypeModel model;
  VoidCallback onTap;
  int? index ;
  var controller = Get.find<RequestAllController>();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap:onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 22.0,bottom: 22.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title!,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      textScaleFactor: 1.0,
                      style: AppStyle.txtPoppinsRegular14Black901
                          .copyWith(
                        height: 1.29,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      model.desc!,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      textScaleFactor: 1.0,
                      style: AppStyle.txtPoppinsRegular12
                          .copyWith(color: ColorConstant.gray500,
                        height: 1.29,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Icon(Icons.add,color: ColorConstant.primaryColor,),
                )
              ],
            ),
          ),
          index != 2 ?
          Container(
            height: 1,
            width: double.maxFinite,
            color: ColorConstant.gray400.withOpacity(0.3),
          )
          : Offstage(),
        ],
      ),
    );
  }
}
