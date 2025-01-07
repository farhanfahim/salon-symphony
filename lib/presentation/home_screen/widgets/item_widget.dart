import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../../../core/utils/dummy_content.dart';
import '../../../core/utils/responsive.dart';
import '../controller/home_controller.dart';

// ignore: must_be_immutable
class ItemWidget extends StatelessWidget {
  ItemWidget(this.model,this.onTap);
  Responsive responsive = Responsive();
  quizModel model;
  VoidCallback onTap;
  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return GestureDetector(
      onTap:onTap,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [

                Obx(() =>(model.selected!.value == true?Container(
                  margin: getMargin(
                    top: 15,
                    right: 5,
                    bottom: 15,
                  ),
                  decoration: AppDecoration.outlineBluegray100
                      .copyWith(
                    borderRadius:
                    BorderRadiusStyle.roundedBorder10,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: getSize(
                          15.00,
                        ),
                        width: getSize(
                          15.00,
                        ),
                        margin: getMargin(
                          all: 1,
                        ),
                        decoration: BoxDecoration(
                          color: ColorConstant.purple400,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              50,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ):
                Container(
                  margin: getMargin(
                    top: 15,
                    right: 5,
                    bottom: 15,
                  ),
                  decoration: AppDecoration
                      .outlineBluegray100
                      .copyWith(
                    borderRadius:
                    BorderRadiusStyle.roundedBorder10,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: getSize(
                          15.00,
                        ),
                        width: getSize(
                          15.00,
                        ),
                        margin: getMargin(
                          all: 1,
                        ),
                        decoration: BoxDecoration(
                          color: ColorConstant.whiteA700,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              50,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))),
                SizedBox(width: 15,),
                Text(
                  model.name!,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPoppinsRegular14
                      .copyWith(
                    height: 1.29,
                  ),
                ),
                Spacer(),

              ],
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
