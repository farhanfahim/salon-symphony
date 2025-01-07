import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_icon_button.dart';
import '../../../core/utils/app_constant.dart';
import '../models/documents_model.dart';

// ignore: must_be_immutable
class DocumentsItemWidget extends StatelessWidget {
  DocumentsItemWidget(this.model,this.onTap);

  VoidCallback? onTap;
  DocumentData model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: getMargin(
          top: 1.0,
          bottom: 8.0,
        ),
        decoration: BoxDecoration(
          color: Color(0xffF1F3F6),
          borderRadius: BorderRadius.circular(
            getSize(
              10.00,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: getPadding(
                left: 13,
                top: 15,
                bottom: 15,
              ),
              child: CustomIconButton(
                height: 44,
                width: 44,
                variant: IconButtonVariant.FillWhite,
                shape: IconButtonShape.RoundedBorder5,
                child: CommonImageView(
                  svgPath: model.localStatus!.value==AppConstant.VIEWED? ImageConstant.doc_icon_viewed : ImageConstant.doc_icon_not_viewed,

                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: getPadding(
                  left: 13,
                  top: 22,
                  bottom: 5,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      model.title!=null? model.title!:"",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      style: AppStyle.txtPoppinsMedium14.copyWith(
                        height: 1.00,
                        fontSize: 15,
                        letterSpacing: 0.5,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 4,
                        right: 10,
                      ),
                      child: Obx(() => Text(
                        model.localStatus!.value==AppConstant.VIEWED?"you_have_viewed".tr : "you_have_not_viewed".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsRegular12Gray600.copyWith(
                          fontSize: 10,
                          color: model.localStatus!.value==AppConstant.VIEWED?ColorConstant.green600 : ColorConstant.gray600,
                        ),
                      ),)
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                right: 13,
                top: 27,
                bottom: 19,
                left: 10,
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                color: ColorConstant.hintTextColor.withOpacity(0.8),
                size: getSize(
                  20.00,
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}
