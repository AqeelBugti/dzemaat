// import 'package:dzemaat/const/my_decoration.dart';
// import 'package:dzemaat/const/my_textstyle.dart';
// import 'package:dzemaat/media_query/media_query.dart';
// import 'package:dzemaat/screens/home_screen.dart';
// import 'package:dzemaat/videopages/video_player_home.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoMainScreen extends StatelessWidget {
//   Widget _buildMyAppBar(context) {
//     return AppBar(
//       bottom: TabBar(
//         labelColor: Colors.white,
//         indicatorSize: TabBarIndicatorSize.label,
//         indicatorWeight: MediaQuerys.widthStep * 10,
//         labelStyle: TextStyle(
//           fontSize: MediaQuerys.widthStep * 50,
//           fontWeight: FontWeight.bold,
//         ),
//         unselectedLabelStyle: TextStyle(
//           fontSize: MediaQuerys.widthStep * 40,
//           fontWeight: FontWeight.bold,
//         ),
//         indicatorColor: Colors.white,
//         unselectedLabelColor: Colors.black,
//         tabs: [
//           Text("Movies"),
//           Text("Shot Clips"),
//         ],
//       ),
//       backgroundColor: Colors.transparent,
//       elevation: 0.0,
//       iconTheme: IconThemeData(color: Colors.white),
//       leading: IconButton(
//         icon: Icon(
//           Icons.arrow_back_ios,
//           color: Colors.white,
//         ),
//         onPressed: () {
//           Navigator.of(context).pushReplacement(
//             MaterialPageRoute(
//               builder: (ctx) => HomeScreen(),
//             ),
//           );
//         },
//       ),
//       title: Text(
//         "Video",
//         style: myTextStyle,
//       ),
//     );
//   }

//   Widget _buildSingleVideo({context, String time, String image}) {
//     return Stack(
//       children: [
//         Container(
//           height: MediaQuerys.heightStep * 400,
//           width: double.infinity,
//           color: Colors.white30,
//           child: Column(
//             children: [
//               Expanded(
//                 flex: 3,
//                 child: ChewieListItem(
//                   looping: true,
//                   videoPlayerController: VideoPlayerController.network(image),
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   color: Colors.transparent,
//                   padding: EdgeInsets.symmetric(
//                     horizontal: MediaQuerys.widthStep * 20,
//                     vertical: MediaQuerys.heightStep * 20,
//                   ),
//                   child: Row(
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Yes I am Muslim",
//                             style: myTextStyle,
//                           ),
//                           Text(
//                             time,
//                             style: TextStyle(
//                               color: Colors.grey[900],
//                               fontWeight: FontWeight.bold,
//                             ),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Positioned(
//           bottom: MediaQuerys.heightStep * 50,
//           right: MediaQuerys.widthStep * 15,
//           child: CircleAvatar(
//             maxRadius: MediaQuerys.heightStep * 40,
//             backgroundColor: Theme.of(context).primaryColor,
//             child: Icon(
//               Icons.play_arrow,
//               size: MediaQuerys.heightStep * 40,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildMovieTab(context) {
//     return Container(
//       height: double.infinity,
//       width: double.infinity,
//       child: SingleChildScrollView(
//         child: Container(
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               _buildSingleVideo(
//                 context: context,
//                 image:
//                     "https://r4---sn-vgqsrnee.googlevideo.com/videoplayback?expire=1604442295&ei=V4ShX_e8G82E8wSuyaCgBg&ip=205.185.222.96&id=o-AE9Q1JWwgcX8P2S40x_065fu5JuM1UpNnL-KdLkSpdXo&itag=18&source=youtube&requiressl=yes&vprv=1&mime=video%2Fmp4&gir=yes&clen=3964548&ratebypass=yes&dur=43.932&lmt=1488384842737641&fvip=4&c=WEB&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRAIgDeoZYUB8wpv4TSLSNtsNhZ14lbeVmnIO6vUqnMpUgOoCIHmXRmwDdcjrSCgT_qh-LIjMJrf__QVUHcStSt1-lzow&redirect_counter=1&cm2rm=sn-hp5r77z&req_id=2b89fe1d80daa3ee&cms_redirect=yes&mh=Ti&mip=182.183.158.179&mm=34&mn=sn-vgqsrnee&ms=ltu&mt=1604420424&mv=D&mvi=4&pl=0&lsparams=mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AG3C_xAwRQIgVSLt9Xhv65qxQSOZ9L-i1S0ui-XncPNy9XhMBU0c9bECIQDxYED3dVbzJgfO3gdZx4ZaiuUPlUcfUY9ebqVcA59yww%3D%3D",
//                 time: "05:13 Hrs",
//               ),
//               SizedBox(
//                 height: MediaQuerys.heightStep * 10,
//               ),
//               _buildSingleVideo(
//                 context: context,
//                 image:
//                     "https://r2---sn-vgqsrned.googlevideo.com/videoplayback?expire=1604443076&ei=ZIehX-zuL9mD8gOUno3oDg&ip=177.96.56.36&id=o-AHj-6pqBnK0ipsxdcIp_KBlTZzXxVkI2xXii5aIviToT&itag=18&source=youtube&requiressl=yes&vprv=1&mime=video%2Fmp4&gir=yes&clen=7882947&ratebypass=yes&dur=101.517&lmt=1487665776281704&fvip=2&c=WEB&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRAIgTxms07k2inR8J07A7Qt6NhorkSfuDDZcpEf47MW2CdICIBPVGpdxj-Lg8IzY_Bi2qJ6VpEduUmpbPOdrbIdGCgIU&rm=sn-b8u-wvpl7l&req_id=980eb608c955a3ee&redirect_counter=2&cm2rm=sn-bg0sr7l&cms_redirect=yes&mh=Ai&mip=182.183.158.179&mm=34&mn=sn-vgqsrned&ms=ltu&mt=1604420971&mv=D&mvi=2&pl=0&lsparams=mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AG3C_xAwRAIgMyRVTSpsbF6KuoQM36Tih7Vq5nx81yqQxvRR75UwUF8CICXfB8KvBgpCbpSTeaKXt-mJKhZiCNTdmAkQ4ter--Wk",
//                 time: "5:13 Min",
//               ),
//               SizedBox(
//                 height: MediaQuerys.heightStep * 10,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildShotClip(context) {
//     return Container(
//       height: double.infinity,
//       width: double.infinity,
//       child: SingleChildScrollView(
//         child: Container(
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               _buildSingleVideo(
//                 context: context,
//                 image:
//                     "https://r2---sn-vgqsrned.googlevideo.com/videoplayback?expire=1604443076&ei=ZIehX-zuL9mD8gOUno3oDg&ip=177.96.56.36&id=o-AHj-6pqBnK0ipsxdcIp_KBlTZzXxVkI2xXii5aIviToT&itag=18&source=youtube&requiressl=yes&vprv=1&mime=video%2Fmp4&gir=yes&clen=7882947&ratebypass=yes&dur=101.517&lmt=1487665776281704&fvip=2&c=WEB&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRAIgTxms07k2inR8J07A7Qt6NhorkSfuDDZcpEf47MW2CdICIBPVGpdxj-Lg8IzY_Bi2qJ6VpEduUmpbPOdrbIdGCgIU&rm=sn-b8u-wvpl7l&req_id=980eb608c955a3ee&redirect_counter=2&cm2rm=sn-bg0sr7l&cms_redirect=yes&mh=Ai&mip=182.183.158.179&mm=34&mn=sn-vgqsrned&ms=ltu&mt=1604420971&mv=D&mvi=2&pl=0&lsparams=mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AG3C_xAwRAIgMyRVTSpsbF6KuoQM36Tih7Vq5nx81yqQxvRR75UwUF8CICXfB8KvBgpCbpSTeaKXt-mJKhZiCNTdmAkQ4ter--Wk",
//                 time: "5:13 Min",
//               ),
//               SizedBox(
//                 height: MediaQuerys.heightStep * 10,
//               ),
//               _buildSingleVideo(
//                 context: context,
//                 image:
//                     "https://r4---sn-vgqsrnee.googlevideo.com/videoplayback?expire=1604442295&ei=V4ShX_e8G82E8wSuyaCgBg&ip=205.185.222.96&id=o-AE9Q1JWwgcX8P2S40x_065fu5JuM1UpNnL-KdLkSpdXo&itag=18&source=youtube&requiressl=yes&vprv=1&mime=video%2Fmp4&gir=yes&clen=3964548&ratebypass=yes&dur=43.932&lmt=1488384842737641&fvip=4&c=WEB&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRAIgDeoZYUB8wpv4TSLSNtsNhZ14lbeVmnIO6vUqnMpUgOoCIHmXRmwDdcjrSCgT_qh-LIjMJrf__QVUHcStSt1-lzow&redirect_counter=1&cm2rm=sn-hp5r77z&req_id=2b89fe1d80daa3ee&cms_redirect=yes&mh=Ti&mip=182.183.158.179&mm=34&mn=sn-vgqsrnee&ms=ltu&mt=1604420424&mv=D&mvi=4&pl=0&lsparams=mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AG3C_xAwRQIgVSLt9Xhv65qxQSOZ9L-i1S0ui-XncPNy9XhMBU0c9bECIQDxYED3dVbzJgfO3gdZx4ZaiuUPlUcfUY9ebqVcA59yww%3D%3D",
//                 time: "05:13 Hrs",
//               ),
//               SizedBox(
//                 height: MediaQuerys.heightStep * 10,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     MediaQuerys().init(context);
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         extendBodyBehindAppBar: true,
//         body: Container(
//           height: double.infinity,
//           width: double.infinity,
//           decoration: myDecoration,
//           child: SafeArea(
//             child: TabBarView(
//               children: [
//                 _buildMovieTab(context),
//                 _buildShotClip(context),
//               ],
//             ),
//           ),
//         ),
//         appBar: _buildMyAppBar(context),
//       ),
//     );
//   }
// }
