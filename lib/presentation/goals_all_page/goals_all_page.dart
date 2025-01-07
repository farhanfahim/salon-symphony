import 'dart:io';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import 'package:salon_symphony/presentation/goals_achieved_page/controller/goals_achieved_controller.dart';
import 'package:salon_symphony/presentation/goals_active_page/controller/goals_active_controller.dart';
import '../../core/utils/helper_functions.dart';
import '../../core/utils/responsive.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../goals_achieved_page/goals_achieved_page.dart';
import '../goals_active_page/goals_active_page.dart';
import '../goals_missed_page/controller/goals_missed_controller.dart';
import '../goals_missed_page/goals_missed_page.dart';
import 'controller/goals_all_controller.dart';
import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';

// ignore_for_file: must_be_immutable
class GoalsAllPage extends StatelessWidget {
  GoalsAllController controller = Get.put(GoalsAllController());
  Responsive responsive = Responsive();
  // GoalsActiveController goalsActiveController = Get.put(GoalsActiveController());
  // GoalsAchievedController goalsAchievedController = Get.put(GoalsAchievedController());
  // GoalsMissedController goalsMissedController = Get.put(GoalsMissedController());
  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return BaseviewScreen(
        basicAppBar: true,
        screenName: "Goals",
        showBottomBar: false,
        bottomSafeArea: true,
        mainTopHeight: 0,
        sidePadding: false,
        basicAppTrailingIcon: ImageConstant.imgMenuIcon,
        basicAppTrailingIconOnTap: () {
          HelperFunction.showBottomSheet(context,
              screenTitle: 'Goals Option',
              redclrEndTask: false,
              screenEndTask: 'Done',
              bottomSheetHeight: 150,
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),

                  GestureDetector(
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
                        Text('Report a problem',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                16,
                              ),
                              letterSpacing: 0.5,
                              fontFamily:
                              Platform.isIOS ? 'SF Pro Display' : 'Roboto',
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                  ),
                ],
              ));
        },
        backgroundColor: ColorConstant.whiteA700,

        child: Stack(
          children: [
            Column(
              children: [
            TabBar(
                  indicator: CustomTabIndicator(),
                  controller: controller.tabController,
                  unselectedLabelColor: ColorConstant.gray600,
                  indicatorColor:ColorConstant.primaryColor,
                  labelColor: ColorConstant.deepPurpleA201,
                  tabs: [
                    Tab(
                      text: "ACTIVE",
                    ),
                    Tab(
                      text: "ACHIEVED",
                    ),
                    Tab(
                      text: "MISSED",
                    ),
                  ],
                ),

                Container(height: 1,width: double.maxFinite,color: ColorConstant.gray400.withOpacity(0.3),),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 70.0),
                    child: TabBarView(
                        controller: controller.tabController,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          GoalsActivePage(),
                          GoalsAchievedPage(),
                          GoalsMissedPage(),
                        ]),
                  ),
                ),

              ],
            ),
            Positioned(
                bottom: 0,
                child: Stack(
                  children: [
                    Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: ColorConstant.stickyBorderColor.withOpacity(0.3),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child:  CustomButton(
                        width: 343,
                        text: "New Goal",
                        prefixWidget: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.add,
                            color: ColorConstant.whiteA700,
                          ),
                        ),
                        margin: getMargin(
                            left: 16, top: 15, right: 16,),
                        padding: ButtonPadding.PaddingAll18,
                        fontStyle: ButtonFontStyle.PoppinsSemiBold16,
                        onTap: () {
                          HelperFunction.showBottomSheet(context,
                              screenTitle: 'Create Goal',
                              redclrEndTask: false,
                              screenEndTask: 'Done',
                              bottomSheetHeight: 370,
                              widget: Padding(
                                padding: const EdgeInsets.only(right: 0.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      onTap:(){
                                        Get.back();
                                        Get.toNamed(AppRoutes.createWeeklyGoalScreen,arguments: {
                                          "isEditingGoal":false
                                        });
                                      },child: Container(
                                      color: ColorConstant.whiteA700,
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 20.0),
                                        child: Row(
                                          children: [
                                            CustomIconButton(
                                                height: 32,
                                                width: 32,
                                                variant: IconButtonVariant.OutlineGray300,
                                                child: CommonImageView(
                                                    color: ColorConstant.primaryColor,
                                                    svgPath: ImageConstant.imgFlagaltlight)),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text('Weekly Goal',
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                textScaleFactor: 1.0,
                                                style: TextStyle(
                                                  color: ColorConstant.black900,
                                                  fontSize: getFontSize(
                                                    15,
                                                  ),
                                                  letterSpacing: 0.5,
                                                   fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                                  fontWeight: FontWeight.w500,
                                                )),
                                            Spacer(),
                                            Icon(
                                              Icons.add,
                                              color: ColorConstant.primaryColor,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Divider(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      onTap:(){
                                        Get.back();
                                        Get.toNamed(AppRoutes.createMonthlyGoalScreen,arguments: {
                                          "isEditingGoal":false
                                        });
                                      },child: Container(
                                      color: ColorConstant.whiteA700,
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 20.0),
                                        child: Row(
                                          children: [
                                            CustomIconButton(
                                                height: 32,
                                                width: 32,
                                                variant: IconButtonVariant.OutlineGray300,
                                                child: CommonImageView(
                                                    color: ColorConstant.pink500,
                                                    svgPath: ImageConstant.imgFlagaltlight)),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text('Monthly Goal',
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                textScaleFactor: 1.0,
                                                style: TextStyle(
                                                  color: ColorConstant.black900,
                                                  fontSize: getFontSize(
                                                    15,
                                                  ),
                                                  letterSpacing: 0.5,
                                                   fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                                  fontWeight: FontWeight.w500,
                                                )),
                                            Spacer(),
                                            Icon(
                                              Icons.add,
                                              color: ColorConstant.primaryColor,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Divider(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      onTap:(){
                                        Get.back();
                                        Get.toNamed(AppRoutes.createAnnualGoalScreen,arguments: {
                                          "isEditingGoal":false
                                        });
                                      },child: Container(
                                      color: ColorConstant.whiteA700,
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 20.0),
                                        child: Row(
                                          children: [
                                            CustomIconButton(
                                                height: 32,
                                                width: 32,
                                                variant: IconButtonVariant.OutlineGray300,
                                                child: CommonImageView(
                                                    color: ColorConstant.green600,
                                                    svgPath: ImageConstant.imgFlagaltlight)),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text('Annual Goal',
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                textScaleFactor: 1.0,
                                                style: TextStyle(
                                                  color: ColorConstant.black900,
                                                  fontSize: getFontSize(
                                                    15,
                                                  ),
                                                  letterSpacing: 0.5,
                                                   fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                                  fontWeight: FontWeight.w500,
                                                )),
                                            Spacer(),
                                            Icon(
                                              Icons.add,
                                              color: ColorConstant.primaryColor,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Divider(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      onTap:(){
                                        Get.back();
                                        Get.toNamed(AppRoutes.createCustomGoalScreen,arguments: {
                                        "isEditingGoal":false
                                        });
                                      },child: Container(
                                      color: ColorConstant.whiteA700,
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 20.0),
                                        child: Row(
                                          children: [
                                            CustomIconButton(
                                                height: 32,
                                                width: 32,
                                                variant: IconButtonVariant.OutlineGray300,
                                                child: CommonImageView(
                                                    color: ColorConstant.amber200,
                                                    svgPath: ImageConstant.imgFlagaltlight)),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text('Custom Goal',
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                textScaleFactor: 1.0,
                                                style: TextStyle(
                                                  color: ColorConstant.black900,
                                                  fontSize: getFontSize(
                                                    15,
                                                  ),
                                                  letterSpacing: 0.5,
                                                   fontFamily: Platform.isIOS?'SF Pro Display':'Roboto',
                                                  fontWeight: FontWeight.w500,
                                                )),
                                            Spacer(),
                                            Icon(
                                              Icons.add,
                                              color: ColorConstant.primaryColor,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    ),
                                  ],
                                ),
                              ));
                        },


                      ),
                    )
                  ],
                ))

          ],
        )
    );
  }
}

class CustomTabIndicator extends Decoration {
  final double radius;



  final double indicatorHeight;

  const CustomTabIndicator({
    this.radius = 8,
    this.indicatorHeight = 4.5,
  });

  @override
  _CustomPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter(
      this,
      onChanged,
      radius,
      ColorConstant.deepPurpleA200,
      indicatorHeight,
    );
  }
}

class _CustomPainter extends BoxPainter {
  final CustomTabIndicator decoration;
  final double radius;
  final Color color;
  final double indicatorHeight;

  _CustomPainter(
      this.decoration,
      VoidCallback? onChanged,
      this.radius,
      this.color,
      this.indicatorHeight,
      ) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    final Paint paint = Paint();
    double xAxisPos = offset.dx + configuration.size!.width / 2;
    double yAxisPos = offset.dy + configuration.size!.height - indicatorHeight/2;
    paint.color = color;

    RRect fullRect = RRect.fromRectAndCorners(
      Rect.fromCenter(
        center: Offset(xAxisPos, yAxisPos),
        width: configuration.size!.width / 1.25,
        height: indicatorHeight,
      ),
      topLeft: Radius.circular(radius),
      topRight: Radius.circular(radius),
    );

    canvas.drawRRect(fullRect, paint);
  }
}
