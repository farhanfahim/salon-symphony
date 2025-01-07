import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/widgets/custom_textfield_new.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/app_constant.dart';
import '../../../core/utils/helper_functions.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '../../../widgets/animatedButton.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_dialog_toast_message.dart';
import '../../../widgets/custom_switch.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../request_pending_page/controller/request_pending_controller.dart';
import '../../request_pending_page/models/request_response_model.dart';
import '/core/app_export.dart';
import 'package:salon_symphony/presentation/schedule_requests_change_days_screen/models/schedule_requests_change_days_model.dart';

class AddSchedule{
  int day;
  int availability;
  AddSchedule(this.day,this.availability);
  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'availability': availability,

    };}

}
class ScheduleRequestsChangeDaysController extends GetxController {
  Responsive responsive = Responsive();

  Rx<ScheduleResponseModel>? scheduleResponseModel = ScheduleResponseModel().obs;
  AppPreferences _appPreferences = AppPreferences();
  RxBool isInternetAvailable = true.obs;
  RxBool buttoncolor = true.obs;
  RxBool isCalling = false.obs;
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  RxList<ScheduleData> scheduleData = List<ScheduleData>.empty().obs;
  List<AddSchedule> listOfNewSchedule=[];
  Rx<TextEditingController>  comments = TextEditingController().obs;
  RequestPendingController requestPendingController = Get.put(RequestPendingController());
  final animatedButtonController = AnimatedButtonController();

  @override
  void onReady() {
    super.onReady();
    getScheduleList();
  }

  @override
  void onClose() {
    super.onClose();
  }

  openBottomSheet(context, String day,int index){
    responsive.setContext(context);
    HelperFunction.showBottomSheet(
      context,
      bottomSheetHeight: 600,
      spaceBetween: responsive.setHeight(4),
      screenTitle: "lbl_update_schedule".tr,
      redclrEndTask: false,
      isScrollControlled:true,
      screenEndTask: "Done",
      onTap: (){
       /* updateDays(
          availability: scheduleData[index].localAvailability!.value,
          day: scheduleData[index].day!,
          dayId: scheduleData[index].id!,
        );*/
        print(scheduleData[index].localAvailability!.value);
        print(scheduleData[index].availability);
        if(scheduleData[index].localAvailability!.value !=scheduleData[index].availability!){
          callScheduleRequestApi(scheduleData[index].day!,scheduleData[index].localAvailability!.value,scheduleData[index].id!);
          Get.back();
        }else{
          Get.back();
        }

      },
      widget: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Text(
                "You’re requesting a schedule change. You can add a note that supports your request below.",
                overflow:
                TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.left,
                style: AppStyle
                    .txtPoppinsRegular14Black901,
              ),
              // Container(
              //   margin: getMargin(
              //     left: 1,
              //     top: 15,
              //     right: 1,
              //   ),
              //   decoration: AppDecoration
              //       .outlineBluegray100
              //       .copyWith(
              //     borderRadius: BorderRadiusStyle
              //         .roundedBorder5,
              //   ),
              //   child: Row(
              //     mainAxisAlignment:
              //     MainAxisAlignment.spaceBetween,
              //     crossAxisAlignment:
              //     CrossAxisAlignment.center,
              //     mainAxisSize: MainAxisSize.max,
              //     children: [
              //       Padding(
              //         padding: getPadding(
              //           left: 20,
              //         ),
              //         child: Column(
              //           mainAxisSize:
              //           MainAxisSize.min,
              //           crossAxisAlignment:
              //           CrossAxisAlignment.start,
              //           mainAxisAlignment:
              //           MainAxisAlignment.start,
              //           children: [
              //             Text(
              //               day,
              //               overflow:
              //               TextOverflow.ellipsis,
              //               textAlign: TextAlign.left,
              //               style: AppStyle
              //                   .txtPoppinsRegular14Black901,
              //             ),
              //             Padding(
              //               padding: getPadding(
              //                 top: 0,
              //               ),
              //               child: Text(
              //                 "You currently work this day",
              //                 overflow: TextOverflow
              //                     .ellipsis,
              //                 textAlign:
              //                 TextAlign.left,
              //                 style: AppStyle
              //                     .txtPoppinsRegular12Gray600,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //
              //       Obx(() => CustomSwitch(
              //           margin: getMargin(top: 10, right: 15, bottom: 10),
              //           value:
              //           scheduleData[index].localAvailability!.value == 10
              //               ? false
              //               : true,
              //           onChanged: (value) {
              //             scheduleData[index].localAvailability!.value =
              //             value ? 20 : 10;
              //
              //           }))
              //     ],
              //   ),
              // ),


              SizedBox(height: 20,),
              CustomTextField3(
                  focusNode: FocusNode(),
                  controller: comments,
                  inRowPaddindLeft: 0,
                  inRowPaddindRight: 0,
                  isFinal: true,
                  fieldText: "lbl_comments".tr,
                  maxLines: 6),

              SizedBox(height: 50,),
              CustomButton(
                  width: 343,
                  text: "Submit Request",
                  margin: getMargin(left: 0, top: 40, right: 0, bottom: 20),
                  onTap: (){
                    print(scheduleData[index].localAvailability!.value);
                    print(scheduleData[index].availability);
                    if(scheduleData[index].localAvailability!.value !=scheduleData[index].availability!){
                      callScheduleRequestApi(scheduleData[index].day!,scheduleData[index].localAvailability!.value,scheduleData[index].id!);
                      Get.back();
                    }else{
                      Get.back();
                    }
                  },
                  padding: ButtonPadding.PaddingAll18,
                  fontStyle: ButtonFontStyle
                      .PoppinsSemiBold16)
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> getScheduleList() async {
    Utils.check().then((value) async {
      await _appPreferences.isPreferenceReady;
      var userId;
      _appPreferences.getUserId().then((value1) {
        userId = value1;
        print('userId====>${userId}');
      });
      if (value) {
        apiCallStatus.value = ApiCallStatus.loading;
        await _appPreferences.isPreferenceReady;
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.get(Constants.GetUserSchedules,
              onSuccess: (response) {
                scheduleResponseModel!.value =
                    ScheduleResponseModel.fromJson(response.data['data']);
                apiCallStatus.value = ApiCallStatus.success;
                print('response.data ===== > ${response.data}');
                scheduleData.value = scheduleResponseModel!.value.data!;
                if(scheduleData.value[0].user?.isScheduled==0){
                  Get.dialog(CustomAlertToastDialog(title:"Add Schedule",
                      divider:true,
                      bodyCenter: false,
                      btnTxt:"Let's Go!",
                      body:"It looks like you haven’t added your work schedule yet. Before you can request a schedule change, you must first add your current schedule. Use the toggles to set the days of the week you work.",
                      ontap: (){
                        Get.back(result: true);
                        Get.bottomSheet(
                          enableDrag: false,
                          isDismissible:false,
                          isScrollControlled:true,
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20), // Adjust this value as needed
                              topRight: Radius.circular(20), // Adjust this value as needed
                            ),
                              child: Container(
                                height: 740,
                                color: ColorConstant.whiteA700,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          MyText(title: 'Set Schedule',weight: 'Semi Bold',fontSize: 18,),
                                          GestureDetector(
                                              onTap: () {
                                              Get.back();
                                              Get.back();

                                              },
                                              child: MyText(
                                                title: "Close",
                                                fontSize: 14,
                                                clr: ColorConstant.primaryColor,
                                              )),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                 Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Container(height: 1,width: double.maxFinite,color: ColorConstant.gray400.withOpacity(0.3),),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20.0),
                                      child: MyText(title: 'Add shifts to the days you work, then click save.',fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                      itemCount: scheduleData.value.length,
                                     // shrinkWrap: true,
                                     //    reverse: true,
                                      physics: AlwaysScrollableScrollPhysics(),
                                      itemBuilder: (context, index){
                                        return Container(
                                            margin: getMargin(left: 16, top: 10, right: 16),
                                            decoration: AppDecoration.simpleOutline
                                                .copyWith(
                                                borderRadius:
                                                BorderRadiusStyle.roundedBorder15),
                                            child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Obx(() =>  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 20, top: 0),
                                                          child: Text(scheduleData.value[index].dayName.toString(),
                                                              overflow: TextOverflow.ellipsis,
                                                              textAlign: TextAlign.left,
                                                              style: AppStyle
                                                                  .txtPoppinsRegular14Black901.copyWith(
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: 15
                                                              ))),


                                                    ],
                                                  ),),

                                                  Obx(() => CustomSwitch(
                                                      margin: getMargin(
                                                          top: 10, right: 15, bottom: 10),
                                                      value: scheduleData[index].localAvailability!.value == 10 ? false : true,
                                                      onChanged: (value) {
                                                      scheduleData[index].localAvailability!.value = value ? 20 : 10;




                                           /* callScheduleRequestApi(scheduleData[index].day!,scheduleData[index].localAvailability!.value);*/
                                                      }))
                                                ]));
                                      }),
                                    ),


                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child:
                                        AnimatedButton(
                                          width: 343,
                                          text: "lbl_save".tr,
                                          onPressed: (){
                                            for(var item in scheduleData){
                                              if(item.localAvailability?.value==20){
                                                listOfNewSchedule.add(AddSchedule(item.day!, item.localAvailability!.value));
                                              }
                                            }

                                            String jsonEncoded = jsonEncode(listOfNewSchedule);

                                            addSchedule(data:jsonEncoded);
                                          },
                                          padding: ButtonPaddingOfButton.PaddingAll18,
                                          fontStyle: ButtonFontStyleOfButton.PoppinsSemiBold16,
                                          controller: animatedButtonController,)
                                        // CustomButton(
                                        //     width: 343,
                                        //     text: "lbl_save".tr,
                                        //     onTap: (){
                                        //     for(var item in scheduleData){
                                        //       if(item.localAvailability?.value==20){
                                        //         listOfNewSchedule.add(AddSchedule(item.day!, item.localAvailability!.value));
                                        //       }
                                        //     }
                                        //
                                        //     String jsonEncoded = jsonEncode(listOfNewSchedule);
                                        //
                                        //        addSchedule(data:jsonEncoded);
                                        //      },
                                        //     padding: ButtonPadding.PaddingAll18,
                                        //     fontStyle: ButtonFontStyle
                                        //         .PoppinsSemiBold16),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        );
                      }));
                }
                scheduleData.value.forEach((element) {
                  element.localAvailability!.value = element.availability!;
                });

                return true;
              }, onError: (error) {
                ApiException apiException = error;

                print(apiException.message);

                BaseClient.handleApiError(error);

                apiCallStatus.value = ApiCallStatus.error;

                return false;
              }, headers: {
                'Accept': 'application/json',
                'Authorization': 'Bearer $value',
              }, queryParameters: {
                'user_id': userId,
                'order':'asc'
              });
        });
      } else {
        Utils.showToast('Check your internet connection', true);
      }
    });
  }

  Future<dynamic> addSchedule(
      {data}) async {
    await _appPreferences.isPreferenceReady;
    var userId;
    _appPreferences.getUserId().then((value1) {
      userId = value1;
      print('userId====>${userId}');
    });
    Utils.check().then((value) async {
      print('INTERNET AVAILABLE $value');
      if (value) {
        isCalling.value = true;
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((token) async {
          await BaseClient.put(
              Constants.UserSchedule + "/$userId",
              headers: {
                'Authorization': 'Bearer $token',
                'Accept': 'application/json',
              }, onSuccess: (response) async {
            animatedButtonController.reset();
            Get.back();
                      getScheduleList();
          }, onError: (error) {

            print(error);
            animatedButtonController.reset();

            // show error message to user
            BaseClient.handleApiError(error);

            Utils.showToast(error.toString(), true);
          },
              data: data);


        });
      } else {
        // isInternetAvailable.value = false;
        Utils.showToast('No internet connection', true);
      }
    });
  }

  void callScheduleRequestApi(int day,int availability,int userScheduleId) async {
    Utils.check().then((value) async {
      if (value) {
        await _appPreferences.isPreferenceReady;

        var salonId;
        _appPreferences.getSalonId().then((value1) {
          salonId = value1;
        });
        var userId;
        _appPreferences.getUserId().then((value1) {
          userId = value1;
        });
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.post(Constants.userRequest,
              onSuccess: (response) async {
            print('availability ====>${availability}');
                if(requestPendingController.arrOfTimeRequest.isNotEmpty) {
                  requestPendingController.arrOfTimeRequest.clear();
                }
                if(requestPendingController.arrOfScheduleRequest.isNotEmpty) {
                  requestPendingController.arrOfScheduleRequest.clear();
                }
                if(requestPendingController.arrOfEducationRequest.isNotEmpty) {
                  requestPendingController.arrOfEducationRequest.clear();
                }
                requestPendingController.getRequest();
                Get.dialog(CustomAlertToastDialog(title:"Request Submitted!",bodyCenter:true,image: ImageConstant.dialogImage,
                    body:"You'll receive a notification as soon as a manager responds to this request.",ontap: (){
                  Get.back(result: true);
                  Get.back(result: true);
                }));

              }, onError: (error) {
                print(error);

                BaseClient.handleApiError(error);
                apiCallStatus.value = ApiCallStatus.error;
              }, headers: {
                'Authorization': 'Bearer $value',
                'Accept': 'application/json',
              }, data: {
                'type': AppConstant.SCHEDULE_REQUEST,
                'sub_type': AppConstant.CHANGE_DAY,
                'comments': comments.value.text,
                'user_id': userId,
                'salon_id': salonId,
                'day': day,
                'availability': availability,
                'user_schedule_id':userScheduleId
              });
        });
      } else {
        Utils.showToast('No internet connection', true);
      }
    });
  }
}

