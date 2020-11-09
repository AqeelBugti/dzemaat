
import 'package:dzemaat/const/my_decoration.dart';
import 'package:dzemaat/const/my_textstyle.dart';
import 'package:dzemaat/media_query/media_query.dart';
import 'package:dzemaat/screens/home_screen.dart';
import 'package:flutter/material.dart';

class PrayerTimeScreen extends StatelessWidget {
  Widget _buildMyAppBar(context) {
    return AppBar(
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
      actions: [
        IconButton(
          icon: Icon(
            Icons.refresh,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ],
      title: Text(
        "Prayer Times",
        style: myTextStyle,
      ),
    );
  }

  Widget _buildPrayerTime({String prayerName, String time}) {
    return Container(
      height: MediaQuerys.heightStep * 70,
      margin: EdgeInsets.symmetric(horizontal: MediaQuerys.widthStep * 20),
      padding: EdgeInsets.symmetric(horizontal: MediaQuerys.widthStep * 20),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            prayerName,
            style: myTextStyle,
          ),
          Text(
            time,
            style: myTextStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildTopPart(context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuerys.heightStep * 20,
        ),
        width: double.infinity,
        color: Colors.white24,
        child: Column(
          children: [
            Text(
              "04:20 PM",
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuerys.heightStep * 50,
              ),
            ),
            Container(
              height: MediaQuerys.heightStep * 100,
              width: MediaQuerys.widthStep * 800,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "November 14,2017",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "25 Safar 1439",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAllPrayerTime() {
    return Expanded(
      flex: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildPrayerTime(
            prayerName: "Amsak",
            time: "05:16 Am",
          ),
          _buildPrayerTime(
            prayerName: "Al-Fajar",
            time: "05:30 Am",
          ),
          _buildPrayerTime(
            prayerName: "Sunrise",
            time: "06:47 Am",
          ),
          _buildPrayerTime(
            prayerName: "Al Zohar",
            time: "12:22 Pm",
          ),
          _buildPrayerTime(
            prayerName: "Asar",
            time: "03:16 Pm",
          ),
          _buildPrayerTime(
            prayerName: "Sunset",
            time: "05:58 Pm",
          ),
          _buildPrayerTime(
            prayerName: "Al-Maghreeb",
            time: "05:58 Pm",
          ),
          _buildPrayerTime(
            prayerName: "Al-Eshaa",
            time: "07:14 Pm",
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
            MediaQuerys().init(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildMyAppBar(context),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: myDecoration,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTopPart(context),
              _buildAllPrayerTime(),
            ],
          ),
        ),
      ),
    );
  }
}
