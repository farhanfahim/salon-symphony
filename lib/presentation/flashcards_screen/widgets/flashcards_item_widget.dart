import 'package:salon_symphony/core/utils/app_constant.dart';

import '../controller/flashcards_controller.dart';
import '../models/flashcards_item_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_button.dart';

import '../models/flashcards_response_model.dart';

// ignore: must_be_immutable
class FlashcardsItemWidget extends StatelessWidget {
  FlashcardsItemWidget(this.model,this.onTap);

  FlashCardData model;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Align(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            onTap!();
          },
          child: Container(
            margin: getMargin(
              top: 8.0,
              bottom: 8.0,
            ),
            decoration: BoxDecoration(
              color: ColorConstant.whiteA700,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: ColorConstant.gray300, width: 1),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: getVerticalSize(
                      180.00,
                    ),
                    width: getHorizontalSize(
                      363.00,
                    ),

                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        model.image!=null?
                        model.image!.isNotEmpty?CommonImageView(
                          url: model.image,
                          radius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          height: getVerticalSize(
                            180.00,
                          ),
                          width: getHorizontalSize(
                            363.00,
                          ),
                          fit: BoxFit.cover,
                        ):CommonImageView(
                          url: model.image,
                          radius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          height: getVerticalSize(
                            180.00,
                          ),
                          width: getHorizontalSize(
                            363.00,
                          ),
                          fit: BoxFit.cover,
                        ):CommonImageView(
                          url: "",
                          radius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          height: getVerticalSize(
                            180.00,
                          ),
                          width: getHorizontalSize(
                            363.00,
                          ),
                          fit: BoxFit.cover,
                        ),

                        Obx(() => model.localUserFlashcardStatus!.value== AppConstant.COMPLETED?CommonImageView(
                          svgPath: ImageConstant.flashcard_complete_icon_new,
                          // height: getVerticalSize(
                          //   22.00,
                          // ),
                          // width: getHorizontalSize(
                          //   22.00,
                          // ),
                          margin: getMargin(
                            top: 10,
                            right: 10,
                          ),
                          fit: BoxFit.cover,
                        ):Container())
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Wrap(
                    children: model.tags!.map((item) => Text(
                      '${item.name!.toUpperCase()}${model.tags!.indexOf(item) == model.tags!.length - 1 ? '' : ', '}' ,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsMedium16.copyWith(
                        fontSize: 12,
                        color: ColorConstant.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),).toList().cast<Widget>(),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  child: Text(
                    model.name!=null? model.name!:"-",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsMedium16.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  child: Text(
                    model.description!=null? model.description!:"-",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    style: AppStyle.txtPoppinsMedium16.copyWith(
                      letterSpacing: 0.5,
                      fontSize: 12,
                      // color: ColorConstant.primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,bottom: 20,right: 20),
                  child: Row(
                    children: [

                      Obx(() => model.localUserFlashcardStatus!.value == AppConstant.NOT_STARTED?CommonImageView(
                        svgPath: ImageConstant.grey_cancel,
                        height: getVerticalSize(
                          10.00,
                        ),
                        width: getHorizontalSize(
                          10.00,
                        ),
                        fit: BoxFit.cover,
                      ):
                      CommonImageView(
                        svgPath: ImageConstant.imgClock18X18,
                        height: getVerticalSize(
                          12.00,
                        ),
                        width: getHorizontalSize(
                          12.00,
                        ),
                        fit: BoxFit.cover,
                      ),),
                      SizedBox(
                        width: 5,
                      ),
                      Obx(() => Text(
                        model.localUserFlashcardStatus!.value==AppConstant.STARTED? "You've started this set.":
                        model.localUserFlashcardStatus!.value==AppConstant.NOT_STARTED? "You've not started this set.":
                        "You've completed this set.",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsRegular12Gray600.copyWith(
                          height: 1.00,
                          color:model.localUserFlashcardStatus!.value==AppConstant.NOT_STARTED? ColorConstant.gray400: ColorConstant.green800,
                          fontSize: 10,
                          letterSpacing: 0.5,
                        ),
                      ),),
                      Spacer(),
                      CommonImageView(
                        imagePath: ImageConstant.flashcards_icons,
                        height: getVerticalSize(
                          10.00,
                        ),
                        width: getHorizontalSize(
                          12.00,
                        ),
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                          model.flashcardElements!=null?model.flashcardElements!.length.toString():"0",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsRegular12Gray600.copyWith(
                          height: 1.00,
                          fontWeight: FontWeight.w100,
                          color: ColorConstant.hintTextColor,
                          fontSize: 10,
                          letterSpacing: 0.5,
                        ),
                      ),


                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
