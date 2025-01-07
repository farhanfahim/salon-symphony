import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:salon_symphony/core/utils/responsive.dart';
import 'package:salon_symphony/presentation/resource_library_page/widgets/item_widget.dart';
import 'package:salon_symphony/widgets/custom_text.dart';
import 'package:salon_symphony/widgets/no_internet_found.dart';

import '../../core/utils/helper_functions.dart';
import '../../data/models/eventsListModel.dart';
import '../../data/models/resourcesResponseModel.dart';
import '../../data/services/api_call_status.dart';
import '../../widgets/search_text_field.dart';
import '../../widgets/skeleton.dart';
import '../../widgets/widgets_shimmer.dart';
import '../resourse_library_allTab/resource_library_allTab.dart';
import '../resourse_library_allTab/widget.dart';
import '../search_screen/search_screen.dart';
import 'controller/resource_library_controller.dart';
import 'models/resource_library_model.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/widgets/custom_button.dart';
import 'package:salon_symphony/widgets/custom_icon_button.dart';
import 'package:salon_symphony/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class ResourceLibraryPage extends StatelessWidget {
  ResourceLibraryController controller = Get.put(ResourceLibraryController());
  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return Obx(() => controller.isInternetAvailable.value ?
    Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AbsorbPointer(
          absorbing: controller.isApiCalling.value,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: DefaultTabController(
              length: controller.tabs.value.length,
              child: Obx(() => controller.apiCallStatus.value ==
                  ApiCallStatus.loading
                  ? tabShimmer2()
                  : ButtonsTabBar(
                onTap: (index){
                  controller.selectedIndex.value=index;
                  print("index is ${controller.selectedIndex.value}");
                    if (controller.selectedIndex.value == 0) {
                      // eventsApiList!.clear();
                      controller.selectedCategoryId = null;
                      controller.currentPage=1;
                      controller.pagingController1.refresh();
                    } else {
                      // eventsApiList!.clear();
                      controller.selectedCategoryId = controller.categoryResponseModel
                          .value.data![controller.selectedIndex.value -1].id!;
                      controller.currentPage=1;
                      controller.pagingController1.refresh();

                    }
                },
                backgroundColor: ColorConstant.primaryColor,
                unselectedBackgroundColor:
                ColorConstant.lightPurple,
                controller: controller.tabController,
                height: 43,
                labelStyle:
                AppStyle.txtPoppinsRegular14.copyWith(
                  color: ColorConstant.whiteA700,
                ),
                unselectedLabelStyle:
                AppStyle.txtPoppinsRegular14.copyWith(
                  color: ColorConstant.deepPurpleA201,
                ),
                unselectedBorderColor: Colors.blue,
                contentPadding:
                EdgeInsets.symmetric(horizontal: 20),
                radius: 20,
                tabs: controller.tabs.value,
              )),
            ),
          ),
        ),
        // Divider(),
        SizedBox(
          height: 10,
        ),

        Container(height: 1,width: double.maxFinite,color: ColorConstant.gray400.withOpacity(0.3),),
        Expanded(
            child: Container(
              color: Color(0xfff9f9f9),
              child: CustomRefreshIndicator(
                  onRefresh: () async {
                    controller.pagingController1.refresh();
                    controller.currentPage = 1;
                  },
                  child: PagedListView<int, ResourceData>(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    pagingController: controller.pagingController1,
                    // shrinkWrap: true,
                    builderDelegate: PagedChildBuilderDelegate<ResourceData>(
                      itemBuilder:(context, item, index)  {
                        return Resource_listing_all(data: item,);
                      },
                      newPageProgressIndicatorBuilder: (context) => Padding(
                        padding: const EdgeInsets.all(5),
                        child: Center(
                          child: Container(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  ColorConstant.deepPurpleA201),
                            ),
                          ),
                        ),
                      ),
                      firstPageProgressIndicatorBuilder: (context){
                        return educationResourcesShimmer();
                      },
                      noItemsFoundIndicatorBuilder: (context) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              'No resources found.',
                              style: AppStyle.txtPoppinsSemiBold16.copyWith(
                                height: 1.50,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                              )
                          ),
                          Text(
                              'Resources added to this category will appear here.',
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
    ) : NoInternetFound(context, () {
      controller.pagingController1.refresh();
      controller.getCategories();
    }));
  }

}
