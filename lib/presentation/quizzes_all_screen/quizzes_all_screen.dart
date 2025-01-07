import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/presentation/quizzes_all_screen/widgets/quiz_item_widget.dart';
import 'package:salon_symphony/presentation/quizzes_screen/quizzes_screen.dart';

import '../../core/utils/helper_functions.dart';
import '../../core/utils/responsive.dart';
import '../../data/models/getQuizListModel.dart';
import '../../data/services/api_call_status.dart';
import '../../widgets/search_text_field.dart';
import '../../widgets/widgets_shimmer.dart';
import '../quizzes_screen/widgets/quizzes_item_widget.dart';
import '../search_screen/search_screen.dart';
import 'controller/quizzes_all_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_icon_button.dart';

class QuizzesAllScreen extends StatelessWidget {
  QuizzesAllController controller =
  Get.put(QuizzesAllController());
  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    // controller.onLoad();
    return BaseviewScreen(
        screenName: 'lbl_quizzes'.tr,
        basicAppBar: true,
        showBottomBar: false,
        sidePadding: false,
        stickyHeader: true,
        basicAppTrailingIcon: ImageConstant.filterAppBar_icon,
        basicAppTrailingIconOnTap: () {
          HelperFunction.showBottomSheet(
            context,
            screenEndTask: 'Done',
            bottomSheetHeight: responsive.setHeight(42),
            spaceBetween: responsive.setHeight(4),
            screenTitle: "lbl_filter_quizzes".tr,
            widget: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Obx(() => (ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.arrOfOptions.length,
                        itemBuilder: (context, index) {
                          print("length ${controller.arrOfOptions.length}");
                          return QuizItemWidget(controller.arrOfOptions[index],index,
                              () {
                            controller.updateQuizItem(index);
                            Get.back();
                          });
                        },
                      ))),
                ],
              ),
            ),
          );
        },
        backgroundColor: ColorConstant.whiteA700,
        child: Obx(() =>
             Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AbsorbPointer(
                    absorbing: controller.apiCallStatus.value ==
                        ApiCallStatus.loading ? true : false,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: DefaultTabController(
                        length: controller.tabs.value.length,
                        child: Column(
                          children: [
                            Obx(() =>
                            controller.isLoaded.value == false
                                ? tabShimmer()
                                : ButtonsTabBar(
                              onTap: (index){
                                controller.selectedIndex.value = index;
                                // tabController!.addListener(() {
                                  if (controller.selectedIndex.value == 0) {
                                    controller.selectedCategoryId = null;
                                    controller.pagingController.refresh();
                                    // controller.quizApiList!.clear();
                                  } else {
                                    controller.selectedCategoryId = controller.categoryResponseModel
                                        .value.data![controller.selectedIndex.value -1].id!;
                                    controller.pagingController.refresh();
                                    // controller.quizApiList!.clear();
                                  }
                                // });

                              },
                                  backgroundColor: ColorConstant.primaryColor,
                                  unselectedBackgroundColor: ColorConstant
                                      .lightPurple,
                                  controller: controller.tabController,
                                  height: 43,
                                  labelStyle: AppStyle.txtPoppinsRegular14.copyWith(
                                    color: ColorConstant.whiteA700,
                                  ),
                                  unselectedLabelStyle:
                                  AppStyle.txtPoppinsRegular14.copyWith(
                                    color: ColorConstant.deepPurpleA201,
                                  ),
                                  unselectedBorderColor: Colors.blue,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20),
                                  radius: 20,
                                  tabs: controller.tabs.value,
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 1,
                    width: double.maxFinite,
                    color: ColorConstant.gray400.withOpacity(0.3),
                  ),
                  Expanded(
                      child: Container(
                        color: Color(0xfff9f9f9),
                        child:
                        CustomRefreshIndicator(
                          onRefresh: () async {
                            controller.pagingController.refresh();
                            controller.currentPage = 1;
                          },
                          child: PagedListView<int, QuizData>(
                            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                            pagingController: controller.pagingController,
                            // shrinkWrap: true,
                            builderDelegate: PagedChildBuilderDelegate<QuizData>(
                              itemBuilder:(context, item, index)  {
                                return  Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: QuizzesItemWidget(item,index,
                                        onTapColumnrectangleeightyfive: (){
                                          Get.toNamed(AppRoutes.quizzesDetailsScreen,arguments: {
                                            'id':item.id,
                                          })!.then((value) {
                                            if(value != null && value == 10) {
                                          controller.currentPage=1;
                                          controller.totalPages=0;
                                              controller.pagingController.refresh();
                                            }
                                          });
                                        },),
                                  ),
                                );
                              },
                              newPageProgressIndicatorBuilder: (context) => Padding(
                                padding: const EdgeInsets.all(5),
                                child: Center(
                                  child: Container(
                                    width: 15.0,
                                    height: 15.0,
                                    child: CircularProgressIndicator(strokeWidth: 2.0,),
                                  ),
                                ),
                              ),
                              firstPageProgressIndicatorBuilder: (context) =>
                                  flashCard(context),
                              noItemsFoundIndicatorBuilder: (context) => Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      'No quiz found.',
                                      style: AppStyle.txtPoppinsSemiBold16.copyWith(
                                        height: 1.50,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                      )
                                  ),
                                  Text(
                                      'Quiz added to this category will appear here.',
                                      style: AppStyle.txtPoppinsSemiBold16.copyWith(
                                        height: 1.50,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.5,
                                      )
                                  ),
                                ],
                              ),


                            ),
                          ),
                            builder: (
                                BuildContext context,
                                Widget child,
                                IndicatorController controller,
                                ) {
                              return Stack(
                                alignment: Alignment.topCenter,
                                children: <Widget>[
                                  if (!controller.isIdle)
                                    Positioned(
                                      top: 25.0,
                                      child: SizedBox(
                                        height: 30,
                                        width: 30,
                                        child:  Image.asset(
                                          ImageConstant.spinnerImage, // Replace with the actual path to your image
                                          width: 24, // Adjust the width as needed
                                          height: 24, // Adjust the height as needed
                                          // You can apply color to the image if needed
                                        ),

                                      ),
                                    ),
                                  Transform.translate(
                                    offset: Offset(0, 10.0 * controller.value),
                                    child: child,
                                  ),
                                ],
                              );
                            }
                        ),
                      )
                  ),

                ],
              )
           ));
  }
}
