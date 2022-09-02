// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'package:http/http.dart' as http;
// // import 'package:radio_punjab_today/Model/video_model.dart';
//
// import '../Api Call/Model/Categories_Model/Video/all_video_model.dart';
//
// class AllVideoScreen extends StatefulWidget {
//   const AllVideoScreen({Key? key}) : super(key: key);
//
//   @override
//   State<AllVideoScreen> createState() => _AllVideoScreenState();
// }
//
// class _AllVideoScreenState extends State<AllVideoScreen> {
//   int currentPage = 1;
//   late int totalPages;å
//
//   List videos = [];
//
//   final RefreshController refreshController =
//       RefreshController(initialRefresh: true);
//
//   Future<bool> getPassengerData({bool isRefresh = false}) async {
//     if (isRefresh) {
//       currentPage = 1;
//     } else {
//       if (currentPage >= totalPages) {
//         refreshController.loadNoData();
//         return false;
//       }
//     }
//
//     final Uri uri = Uri.parse(
//         "https://app2019.radiopunjabtoday.com/api/category/8/video?page=${currentPage}");
//     final response = await http.get(uri);
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body.toString());
//       final result = AllVideoModel.fromJson(data);
//       if (isRefresh) {
//         videos = result.video!.data!;
//       } else {
//         videos.addAll(result.video!.data!);
//       }
//       currentPage++;
//
//       totalPages = result.video!.total!;
//
//       print(response.body);
//       setState(() {});
//
//       return true;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SmartRefresher(
//         controller: refreshController,
//         enablePullUp: true,
//         onRefresh: () async {
//           final result = await getPassengerData(isRefresh: true);
//           if (result) {
//             refreshController.refreshCompleted();
//           } else {
//             refreshController.refreshFailed();
//           }
//         },
//         child: ListView.separated(
//             itemBuilder: ((context, index) {
//               final passenger = videos[index];
//               return ListTile(
//                 title: Text(passenger.name),
//                 subtitle: Text(passenger.airline.country),
//               );
//             }),
//             separatorBuilder: ((context, index) => Divider()),
//             itemCount: videos.length),
//       ),
//     );
//   }
// }
