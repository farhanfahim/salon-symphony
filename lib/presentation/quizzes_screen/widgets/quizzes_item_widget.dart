import 'package:salon_symphony/widgets/custom_text.dart';

import '../../../data/models/getQuizListModel.dart';
import '../../quizzes_all_screen/controller/quizzes_all_controller.dart';
import '../controller/quizzes_controller.dart';
import '../models/quizzes_item_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

// ignore: must_be_immutable
class QuizzesItemWidget extends StatelessWidget {
  QuizzesItemWidget(this.data,this.index, {this.onTapColumnrectangleeightyfive} );
  QuizData? data;
  int? index;
  var controller = Get.put(QuizzesAllController());

  VoidCallback? onTapColumnrectangleeightyfive;

  @override
  Widget build(BuildContext context) {
    String concatenatedTags = data!.tags!.map<String>((item) {
      int index = data!.tags!.indexOf(item);
      String separator = index == data!.tags!.length - 1 ? '' : ', ';
      return '${item.name!}$separator'.toUpperCase();
    }).join();
    return GestureDetector(
      onTap: () {
        onTapColumnrectangleeightyfive!();
      },
      child: Container(
        margin: getMargin(
          top: 8.0,
        ),
        decoration: BoxDecoration(
          color: ColorConstant.whiteA700,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorConstant.gray300, width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    child: CommonImageView(
                      url: data!.image,
                      height: getVerticalSize(
                        180.00,
                      ),
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                      radius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                data!=null &&  data!.userQuizStatus!=null && data!.userQuizStatus!.score!=0?Positioned(
                right: 20,
                    top: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        color: data!.userQuizStatus!.score! <= 79 ? Color(0xffFF0054): Color(0xff00B000),
                        border: Border.all(
                          color:  data!.userQuizStatus!.score! <= 79 ? Color(0xffFF0054): Color(0xff00B000),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
                        child: Text(
                            data!=null &&  data!.userQuizStatus!=null && data!.userQuizStatus!.score!=0?data!.userQuizStatus!.score.toString()+"%".toUpperCase():"",
                          maxLines: null,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsRegular14Gray600.copyWith(
                              height: 1.29,color: ColorConstant.whiteA700
                          ),
                        ),
                      ),
                    )):Container()
              ],
            ),
            SizedBox(height: 10,),
            Container(
              margin: getMargin(
                left: 15,
                right: 15,
                bottom: 8,
              ),
              child:  MyText(
                title: '${concatenatedTags.toUpperCase()}',
                fontSize: 12,
                line: 1,
                toverflow: TextOverflow.ellipsis,
                weight: 'Semi Bold',
                clr: ColorConstant.deepPurpleA201,
              ),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: getPadding(
                      left: 15,
                      // top: 11,
                      right: 15,
                    ),
                    child: Text(
                      data!.name!,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      style: AppStyle.txtPoppinsBold16.copyWith(
                        fontSize: 19
                      ),
                    ),
                  ),
                ),


              ],
            ),

            Container(
              margin: getMargin(
                left: 15,
                top: 5,
                right: 15,
                bottom: 10,
              ),
              child:  Text(
                data!.description!=null?data!.description!:"",
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: AppStyle.txtPoppinsRegular14Gray600.copyWith(
                    height: 1.29,color: Color(0xff717171),fontSize: 13,fontWeight: FontWeight.w400
                ),
              ),
            ),
            Container(
              margin: getMargin(
                left: 15,
                top: 5,
                right: 15,
                bottom: 17,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    data!.meta!.questionsCount! >1?data!.meta!.questionsCount.toString()+" Questions":data!.meta!.questionsCount.toString()+" Question",
                    maxLines: null,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsRegular14Gray600.copyWith(
                      height: 1,color: ColorConstant.black900,fontSize: 12,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Spacer(),
                  Text(
                    data?.userQuizStatus!=null ? data?.userQuizStatus?.status==10?"Start Quiz":"Retake Quiz":"Start Quiz",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsRegular14Gray600.copyWith(
                      height: 1,color: ColorConstant.primaryColor,fontSize: 12,fontWeight: FontWeight.w500
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 1.0,left: 5),
                    child: Icon(Icons.arrow_forward,size: 11,color: ColorConstant.primaryColor,),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
