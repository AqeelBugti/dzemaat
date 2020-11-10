import 'package:dzemaat/const/my_decoration.dart';
import 'package:dzemaat/const/my_textstyle.dart';
import 'package:dzemaat/media_query/media_query.dart';
import 'package:dzemaat/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:videos_player/model/video.model.dart';
import 'package:videos_player/util/theme.util.dart';
import 'package:videos_player/videos_player.dart';
import 'package:videos_player/model/control.model.dart';

class VideoMainScreen extends StatelessWidget {
  Widget _buildMyAppBar(context) {
    return AppBar(
      bottom: TabBar(
        labelColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: MediaQuerys.widthStep * 10,
        labelStyle: TextStyle(
          fontSize: MediaQuerys.widthStep * 50,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: MediaQuerys.widthStep * 40,
          fontWeight: FontWeight.bold,
        ),
        indicatorColor: Colors.white,
        unselectedLabelColor: Colors.black,
        tabs: [
          Text("Movies"),
          Text("Shot Clips"),
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => HomeScreen(),
            ),
          );
        },
      ),
      title: Text(
        "Video",
        style: myTextStyle,
      ),
    );
  }

  Widget _buildSingleVideo({context, String time, String image}) {
    return Stack(
      children: [
        Container(
          height: MediaQuerys.heightStep * 400,
          width: double.infinity,
          color: Colors.white30,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: VideosPlayer(
                  maxVideoPlayerHeight: 230,
                  
                  networkVideos: [
                    
                    new NetworkVideo(
                      
                      id: "2",
                      name: "Elephant Dream",
                      videoUrl:
                         image,
                      thumbnailUrl:
                          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg",
                      videoControl: new NetworkVideoControl(
                        
                        looping: true,
                      ),
                    ),
                  ],
                  playlistStyle: Style.Style2,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuerys.widthStep * 20,
                    vertical: MediaQuerys.heightStep * 20,
                  ),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Yes I am Muslim",
                            style: myTextStyle,
                          ),
                          Text(
                            time,
                            style: TextStyle(
                              color: Colors.grey[900],
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: MediaQuerys.heightStep * 50,
          right: MediaQuerys.widthStep * 15,
          child: CircleAvatar(
            maxRadius: MediaQuerys.heightStep * 40,
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(
              Icons.play_arrow,
              size: MediaQuerys.heightStep * 40,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMovieTab(context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildSingleVideo(
                context: context,
                image:
                   "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
                time: "05:13 Hrs",
              ),
              SizedBox(
                height: MediaQuerys.heightStep * 10,
              ),
              _buildSingleVideo(
                context: context,
                image:
                   "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
                time: "5:13 Min",
              ),
              SizedBox(
                height: MediaQuerys.heightStep * 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShotClip(context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildSingleVideo(
                context: context,
                image:
                   "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
                time: "5:13 Min",
              ),
              SizedBox(
                height: MediaQuerys.heightStep * 10,
              ),
              _buildSingleVideo(
                context: context,
                image:
                   "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
                time: "05:13 Hrs",
              ),
              SizedBox(
                height: MediaQuerys.heightStep * 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQuerys().init(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: myDecoration,
          child: SafeArea(
            child: TabBarView(
              children: [
                _buildMovieTab(context),
                _buildShotClip(context),
              ],
            ),
          ),
        ),
        appBar: _buildMyAppBar(context),
      ),
    );
  }
}
