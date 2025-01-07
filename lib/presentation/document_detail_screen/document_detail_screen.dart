import 'dart:io';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/core/utils/responsive.dart';
import 'package:salon_symphony/widgets/error_widget.dart';
import '../../baseviews/baseview_process_screen.dart';
import '../../core/utils/app_constant.dart';
import '../../core/utils/helper_functions.dart';
import '../../core/utils/utils.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/no_record_found_widget.dart';
import '../../widgets/response_binding_widget.dart';
import '../../widgets/widgets_shimmer.dart';
import 'controller/document_detail_controller.dart';

class DocumentDetailScreen extends GetWidget<DocumentsDetailController> {
  DocumentsDetailController controller = Get.put(DocumentsDetailController());
  Responsive responsive = Responsive();
  Map<String,dynamic> map = Get.arguments;
  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return BaseviewScreen(
      basicAppBar: true,
      screenName: "document_details".tr,
      showBottomBar: false,
      showBackButton: true,
      isBackButtonShow: true,
      stickyHeader: true,
      bottomSafeArea: true,
      mainTopHeight: 0,
      sidePadding: false,
      backgroundColor: Colors.white,
      onBackTap: (){
        Get.back(result: controller.documentResponseModel?.value.localStatus?.value);
      },
      basicAppTrailingIcon: ImageConstant.imgMenuIcon,
      basicAppTrailingIconOnTap: (){
        HelperFunction.showBottomSheet(context,
            screenTitle: 'Document Option',
            redclrEndTask: false,
            screenEndTask: 'done'.tr,
            bottomSheetHeight: 210,
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: (){
                    String deepLink = '${AppConstant.shareBaseUrl}/team/docs/details/${controller.documentResponseModel!.value.id!}';
                    // String deepLink = '${AppConstant.shareBaseUrl}?docId=${controller.documentResponseModel!.value.id!}';
                    deepLink = Uri.encodeFull(deepLink);
                    // await Clipboard.setData(ClipboardData(text: deepLink));
                    Utils.share(deepLink);
                    Get.back();
                  },
                  child: Row(
                    children: [
                      CommonImageView(
                        imagePath: ImageConstant.share_icon,
                        height: 17,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Share Document',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: getFontSize(
                              16,
                            ),
                            letterSpacing: 0.5,
                             fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () async {
                    try {
                      Utils.reportProblem();
                    } catch (e) {
                      Utils.showToast(e.toString(), true);
                    }
                  },
                  child: Row(
                    children: [
                      CommonImageView(
                        imagePath: ImageConstant.report_problem_icon,
                        height: 17,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text('report_a_problem'.tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: getFontSize(
                              16,
                            ),
                            letterSpacing: 0.5,
                             fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                ),
              ],
            ));
      },
      child: Obx(() => ResponseBindingWidget(
        apiCallStatus: controller.apiCallStatus.value,
        errorWidget: () {
          return RecordDeletedWidget();
        },
        loadingWidget: () {
          return documentDetailShimmer();
        },
        emptyWidget: () {
          return NoRecordFoundWidget();
        },
        successWidget: () {
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        MyText(
                          title: controller.documentResponseModel!.value.title!=null?controller.documentResponseModel!.value.title.toString():"",
                          fontSize: 20,

                          weight: "Bold",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // make a row with text "PDF • 10 MB • Sep 24, 2022"
                        Row(
                          children: [
                            MyText(
                              title: "pdf".tr,
                              fontSize: 12,
                              alignRight: true,
                              clr: ColorConstant.hintTextColor,
                              weight: "Regular",
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.circle,
                              size: 2,
                              color: ColorConstant.hintTextColor,),
                            SizedBox(
                              width: 4,
                            ),
                            MyText(
                              title: controller.documentResponseModel!.value.size != null
                                  ? (double.parse(controller.documentResponseModel!.value.size!.replaceAll(RegExp(r'[^0-9.]'), ''))).round().toString() + "KB"
                                  : "",
                              fontSize: 12,
                              alignRight: true,
                              clr: ColorConstant.hintTextColor,
                              weight: "Regular",
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: MyText(
                                title: "•",
                                fontSize: 10,
                                alignRight: true,
                                clr: ColorConstant.hintTextColor,
                                weight: "Regular",
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            MyText(
                              title: controller.documentResponseModel!.value.createdAt!=null?Utils.getFormatedDate(controller.documentResponseModel!.value.createdAt!):"",
                              fontSize: 12,
                              alignRight: true,
                              clr: ColorConstant.hintTextColor,
                              weight: "Regular",
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(),

                        // make a row with text "Description"
                        SizedBox(
                          height: 20,
                        ),
                        Text(controller.documentResponseModel!.value.description!=null?'description'.tr:"",
                          style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: getFontSize(
                              16,
                            ),
                            letterSpacing: 0.5,
                            fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        MyText(
                          title:
                          controller.documentResponseModel!.value.description!=null?controller.documentResponseModel!.value.description.toString():"",
                          fontSize: 14,
                          weight: "Regular",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.93),
                  border: Border(
                    top: BorderSide(
                      color: ColorConstant.gray301,
                    ),
                  ),
                ),
                child: controller.documentResponseModel!.value.link!=null?CustomButton(
                  width: double.maxFinite,
                  text: "download".tr,
                  prefixWidget: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CommonImageView(
                      svgPath: ImageConstant.download_icon,
                      fit: BoxFit.cover,
                      height: responsive.setHeight(2),
                      color: ColorConstant.whiteA700,
                    ),
                  ),
                  onTap: () {
                    try{
                      controller.launchUrls();
                    }catch(e){
                      Utils.showToast(e.toString(), true);
                    }
                  },
                  margin: getMargin(left: 16, top: 20, right: 16, bottom: 0),
                  padding: ButtonPadding.PaddingAll18,
                  fontStyle: ButtonFontStyle.PoppinsSemiBold16,

                ):Container(),
              )
            ],
          );
        })),
    );
  }
}
