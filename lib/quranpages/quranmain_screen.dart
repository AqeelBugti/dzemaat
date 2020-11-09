
import 'package:dzemaat/const/my_decoration.dart';
import 'package:dzemaat/const/my_textstyle.dart';
import 'package:dzemaat/get_quran_data/get_quran_data.dart';
import 'package:dzemaat/quranpages/quransublist_screen.dart';
import 'package:dzemaat/screens/home_screen.dart';
import 'package:flutter/material.dart';

class QuranMainScreen extends StatefulWidget {
  static double heightStep, widthStep;

  @override
  _QuranMainScreenState createState() => _QuranMainScreenState();
}

class _QuranMainScreenState extends State<QuranMainScreen> {
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
      title: Text(
        "Quran",
        style: myTextStyle,
      ),
    );
  }

  Widget _buildSingleMainContainer(
      {String count, String title, String subTitle, Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: QuranMainScreen.widthStep * 20),
        height: QuranMainScreen.heightStep * 100,
        alignment: Alignment.center,
        color: Colors.black54,
        child: ListTile(
          leading: CircleAvatar(
            maxRadius: QuranMainScreen.heightStep * 45,
            backgroundColor: Colors.black54,
            child: Text(
              count,
              style: myTextStyle,
            ),
          ),
          title: Text(
            title,
            style: myTextStyle,
          ),
          subtitle: Text(
            subTitle,
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    QuranMainScreen.widthStep = MediaQuery.of(context).size.width / 1000;
    QuranMainScreen.heightStep = MediaQuery.of(context).size.height / 1000;
    GetQuranData getQuranData = GetQuranData();
    getQuranData.getQuranAyahData();
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: _buildMyAppBar(context),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: myDecoration,
        padding: EdgeInsets.symmetric(
          vertical: QuranMainScreen.widthStep * 30,
        ),
        child: FutureBuilder(
          future: getQuranData.getQuranData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SafeArea(
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (ctx, index) {
                    return _buildSingleMainContainer(
                      count: snapshot.data[index].surahNumber.toString(),
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (ctx) => QuranSublistScreen(
                              name: snapshot.data[index].surahName,
                            ),
                          ),
                        );
                      },
                      subTitle: snapshot.data[index].suranNameTranslation,
                      title: snapshot.data[index].surahName,
                    );
                  },
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
