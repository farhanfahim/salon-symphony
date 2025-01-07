import '../../../core/utils/app_constant.dart';
import '../../../core/utils/utils.dart';
import '../../request_pending_page/models/request_response_model.dart';
import '../controller/request_all_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

// ignore: must_be_immutable
class RequestAllItemWidget extends StatelessWidget {
  RequestAllItemWidget(this.model, {this.onTap, this.index,this.lastIndex});

  RequestData model;
  int? index ;
  int? lastIndex ;
  var controller = Get.find<RequestAllController>();
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: () {
        onTap!();
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                    left: 5,
                    // top: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: getPadding(
                          top: 15,
                        ),
                        child: Text(
                          model.type == AppConstant.TIME_OFF_REQUEST? model.subTypeName!=null? model.subTypeName!:""
                              :model.type == AppConstant.SCHEDULE_REQUEST?model.subType==AppConstant.CHANGE_DAY?
                              "Change Days":"Change Shift"
                              :model.type == AppConstant.EDUCATION_REIMBURSEMENT?"Reimbursement"
                              :model.type == AppConstant.EDUCATION_REQUEST?"Class Hours":"",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsSemiBold18.copyWith(
                            height: 1.50,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: CommonImageView(
                          imagePath: model.status==10? ImageConstant.pending_tab:
                          model.status==20? ImageConstant.approved_tab:
                          ImageConstant.decline_tab,
                          height: getSize(
                            23.00,
                          ),
                          width: getSize(
                            83.00,
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                //for time Off
                model.type==AppConstant.TIME_OFF_REQUEST?Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(
                        left: 5,
                        top: 8,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Leave Date:",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsRegular12Gray600,
                          ),
                          Padding(
                            padding: getPadding(
                              left: 11  ,
                              bottom: 1,
                            ),
                            child: Text(
                              model.date!=null?Utils.getFormatedDate(model.date!):"",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsRegular12Gray600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 5,
                        top: 5,
                        bottom: 18,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Return Date:",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsRegular12Gray600,
                          ),
                          Padding(
                            padding: getPadding(
                              left: 8,
                            ),
                            child: Text(
                              model.returnDate!=null?Utils.getFormatedDate(model.returnDate!):"",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsRegular12Gray600,
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 1,
                                  bottom: 1,
                                ),
                                child: Text(
                                  "Details",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsRegular12Gray600.
                                  copyWith(
                                    color: ColorConstant.hintTextColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0,right:6),
                                child: Icon(
                                  Icons.arrow_forward_sharp,
                                  size: 12,
                                  color: ColorConstant.hintTextColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ) :
                model.type==AppConstant.EDUCATION_REQUEST?Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: getPadding(
                            left: 5,
                            top: 5,
                            right: 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 1,
                                  bottom: 1,
                                ),
                                child: Text(
                                  "Total Time:",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsRegular12Gray600,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 8,
                                ),
                                child: Text(
                                  model.hour!=null?model.hour!.toString()+" Hours":"0 Hours",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsRegular12Gray600,
                                ),
                              ),
                              Spacer(),

                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 5,
                            top: 7,
                            right: 0,
                            bottom: 15
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 1,
                                ),
                                child: Text(
                                  "Class Date:",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsRegular12Gray600,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 8,
                                  bottom: 1,
                                ),
                                child: Text(
                                  "${model.date!=null?Utils.getFormatedDate(model.date!):"-"}",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsRegular12Gray600,
                                ),

                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Padding(
                                    padding: getPadding(
                                      top: 1,
                                      bottom: 1,
                                    ),
                                    child: Text(
                                      "Details",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsRegular12Gray600.
                                      copyWith(
                                        color: ColorConstant.hintTextColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2.0,right:6),

                                    child: Icon(
                                      Icons.arrow_forward_sharp,
                                      size: 12,
                                      color: ColorConstant.hintTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                      ],
                    )

                  ],
                ):
                model.type==AppConstant.EDUCATION_REIMBURSEMENT?Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: getPadding(
                            left: 5,
                            top: 7,
                            right: 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 1,
                                ),
                                child: Text(
                                  "Total Spent:",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsRegular12Gray600,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 8,
                                  bottom: 1,
                                ),
                                child: Text(
                                  "\$ ${model.value!=null?model.value:"0"}",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsRegular12Gray600,
                                ),
                              ),
                              Spacer()
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 5,
                            top: 5,
                            right: 0,
                            bottom: 16,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 1,
                                  bottom: 1,
                                ),
                                child: Text(
                                  "Date Spent:",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsRegular12Gray600,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 8,
                                ),
                                child: Text(
                                  model.date!=null?Utils.getFormatedDate(model.date!):"",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsRegular12Gray600,
                                ),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Padding(
                                    padding: getPadding(
                                      top: 1,
                                      bottom: 1,
                                    ),
                                    child: Text(
                                      "Details",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsRegular12Gray600.
                                      copyWith(
                                        color: ColorConstant.hintTextColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2.0,right:6),
                                    child: Icon(
                                      Icons.arrow_forward_sharp,
                                      size: 12,
                                      color: ColorConstant.hintTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ) :
                model.type==AppConstant.SCHEDULE_REQUEST?Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    model.subType==AppConstant.CHANGE_DAY?Column(
                      children: [
                        Padding(
                          padding: getPadding(
                            left: 5,
                            top: 8,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Swap This:",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsRegular12Gray600,
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 5  ,
                                  bottom: 1,
                                ),
                                child: Text(
                                  model.day!=null?"${model.dayName}, ${model.availability==AppConstant.AVAILABLITY?"OFF":"ON"}":"-",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsRegular12Gray600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 5,
                            top: 5,
                            bottom: 18,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "With This:",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsRegular12Gray600,
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 9,
                                ),
                                child: Text(
                                  model.day!=null?"${model.dayName}, ${model.availability==AppConstant.AVAILABLITY?"ON":"OFF"}":"-",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsRegular12Gray600,
                                ),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Padding(
                                    padding: getPadding(
                                      top: 1,
                                      bottom: 1,
                                    ),
                                    child: Text(
                                      "Details",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsRegular12Gray600.
                                      copyWith(
                                        color: ColorConstant.hintTextColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2.0,right:6),

                                    child: Icon(
                                      Icons.arrow_forward_sharp,
                                      size: 12,
                                      color: ColorConstant.hintTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                      ],
                    ):
                    Padding(
                      padding: getPadding(
                        left: 5,
                        top: 5,
                        bottom: 18,
                      ),
                      child:Column(
                        children: [
                          Padding(
                            padding: getPadding(
                              left: 5,
                              top: 8,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Swap:",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsRegular12Gray600,
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 5  ,
                                    bottom: 1,
                                  ),
                                  child: Text(
                                    model.schedule!=null?"${model.dayName} ${model.schedule!.startTime} - ${model.dayName} ${model.schedule!.endTime} ":"-",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsRegular12Gray600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 5,
                              top: 5,
                              bottom: 18,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "With:",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsRegular12Gray600,
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 9,
                                  ),
                                  child: Text(
                                    model!=null?"${model.dayName} ${model.startTime} - ${model.dayName} ${model.endTime} ":"-",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPoppinsRegular12Gray600,
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Padding(
                                      padding: getPadding(
                                        top: 1,
                                        bottom: 1,
                                      ),
                                      child: Text(
                                        "Details",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsRegular12Gray600.
                                        copyWith(
                                          color: ColorConstant.hintTextColor,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2.0,right:6),
                                      child: Icon(
                                        Icons.arrow_forward_sharp,
                                        size: 12,
                                        color: ColorConstant.hintTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),

                  ],
                ):Container(),


              ],
            ),
          ),
          index ==  lastIndex ?
          Offstage() :
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Container(
              height: 1,width: double.maxFinite,
              color: ColorConstant.gray200,
            ),
          )
        ],
      ),
    );
  }
}
