import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../../../core/utils/dummy_content.dart';
import '../../../core/utils/responsive.dart';
import '../controller/quizzes_all_controller.dart';

// ignore: must_be_immutable
class QuizItemWidget extends StatelessWidget {
  QuizItemWidget(this.model,this.index,this.onTap);
  Responsive responsive = Responsive();
  quizFilter model;
  int? index;
  VoidCallback onTap;
  var controller = Get.find<QuizzesAllController>();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return GestureDetector(
      onTap:onTap,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0,top: 15,bottom: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [

                  Text(
                    model.name!,
                    textScaleFactor: 1.0,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyle.txtPoppinsRegular14
                        .copyWith(
                      height: 1.29,
                    ),
                  ),
                  Spacer(),
                  Obx(() =>(
                      model.selected!.value == true?Container(
                        margin: getMargin(
                          // top: 15,
                          right: 5,
                          // bottom: 15,
                        ),
                        decoration:
                        AppDecoration.outlineBluegray100.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10,
                          border: Border.all(
                            color: ColorConstant.primaryColor,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                all: 2,
                              ),
                              decoration: BoxDecoration(
                                color: ColorConstant.primaryColor,
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
                          // top: 15,
                          right: 5,
                          // bottom: 15,
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
                                all: 2,
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
                ],
              ),
            ),
            index != 3?
            Divider():Offstage()
          ],
        ),
      ),
    );
  }
}
