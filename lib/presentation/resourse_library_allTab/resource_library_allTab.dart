// import 'package:flutter/cupertino.dart';
// import 'package:salon_symphony/presentation/resourse_library_allTab/widget.dart';
//
// import '../../core/utils/size_utils.dart';
//
// class ResourceRibraryAllTab extends StatelessWidget {
//   const ResourceRibraryAllTab({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ListView.builder(
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: 3,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: getPadding(left: 15, right: 15),
//                   child: Resource_listing_all(index: index),
//                 );
//               }),
//
//         ],
//       ),
//     );
//   }
// }
