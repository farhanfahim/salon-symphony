import 'package:flutter/material.dart';
import 'package:salon_symphony/core/app_export.dart';
import 'package:salon_symphony/presentation/resource_details_screen/controller/audio_player_controller.dart';
import 'package:salon_symphony/presentation/resource_details_screen/controller/resource_details_controller.dart';
import 'package:salon_symphony/widgets/custom_text.dart';

import '../../core/utils/responsive.dart';
import '../../core/utils/utils.dart';
import '../../data/models/resourcesResponseModel.dart';
import '../resource_library_page/controller/resource_library_controller.dart';

class Resource_listing_all extends StatelessWidget {
  // int index;
  ResourceData data;
  Resource_listing_all({Key? key, required this.data}) : super(key: key);
  // ResourceLibraryController controller = Get.put(ResourceLibraryController());
  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    String concatenatedTags = data.tags!.map<String>((item) {
      int index = data.tags!.indexOf(item);
      String separator = index == data.tags!.length - 1 ? '' : ', ';
      return '${item.name!}$separator'.toUpperCase();
    }).join();
    return Padding(
      padding: const EdgeInsets.only( top: 15),
      child: InkWell(
        onTap: () {
          Get.delete<ResourceDetailsController>();
          Get.delete<AudioController>();
          Get.toNamed(AppRoutes.resourceDetailsScreen, arguments: {
            'id': data.id,
          });
        },
        child: Container(
            decoration: BoxDecoration(
              color: ColorConstant.whiteA700,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: ColorConstant.gray300, width: 1),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Stack(
                   children: [
                     CommonImageView(
                       url: data.image,
                       height: 180,
                       width: double.infinity,
                       fit: BoxFit.cover,
                       radius: BorderRadius.only(
                         topLeft: Radius.circular(10),
                         topRight: Radius.circular(10),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top: 15.0, left: 15),
                       child: Container(
                         height: 190,
                         child: Align(
                           alignment: Alignment.bottomLeft,
                           child: MyText(
                             title: '${concatenatedTags.toUpperCase()}',
                             fontSize: 12,
                             line: 1,
                             toverflow: TextOverflow.ellipsis,
                             weight: 'Semi Bold',
                             clr: ColorConstant.deepPurpleA201,
                           ),
                         ),
                       ),
                     ),
                     Positioned(
                       bottom: 10,
                       right: 13,
                       child: Container(
                         decoration: BoxDecoration(
                           shape: BoxShape.circle,
                         ),
                         child: CommonImageView(
                           svgPath:
                           data.type == 30 ? ImageConstant.res_pdf_icon :
                           data.type == 10 ? ImageConstant.res_video_icon :
                           ImageConstant.res_audio_icon,
                            height: 32,
                            width: 32,
                         ),
                       ),

                     ),
                   ],
                 ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,top: 5,bottom: 20,right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      MyText(
                        title: data.name!.capitalize!,
                        fontSize: 20,
                        toverflow: TextOverflow.ellipsis,
                        line: 1,
                        weight: 'Bold',
                        clr: ColorConstant.black900,
                      ),
                      data.description!=''?
                      SizedBox(
                        height: 5,
                      ):Offstage(),
                      data.description!=''?
                      Text(
                        data.description!,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppStyle.txtPoppinsRegular14Gray600.copyWith(
                            height: 1.29,color: Color(0xff717171),fontSize: 13,fontWeight: FontWeight.w400
                        ),
                      ):Offstage(),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          data.userView == null
                              ?
                          CommonImageView(
                            svgPath: ImageConstant.cross,
                            // height: 20,
                            // width: 20,
                          ):
                          CommonImageView(
                            svgPath: ImageConstant.green_check,
                            height: 8,
                            width: 7.5,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          data.userView == null
                              ?  MyText(
                            title: "You haven't viewed this resource.",
                            fontSize: 12,
                            weight: 'Regular',
                            clr: ColorConstant.hintTextColor.withOpacity(0.5),
                          )
                              :
                          MyText(
                            title: "You viewed this on ${Utils.formatDate(data.userView!.updatedAt!)}",
                            fontSize: 12,
                            weight: 'Regular',
                            clr: ColorConstant.green600,
                          ),
                        ],
                      )
                    ],
                  ),
                ),

              ],
            )),
      ),
    );
  }
}
