
import 'package:dzemaat/const/my_decoration.dart';
import 'package:dzemaat/const/my_textstyle.dart';
import 'package:dzemaat/get_quran_data/get_quran_data.dart';
import 'package:dzemaat/quranpages/quranmain_screen.dart';
import 'package:flutter/material.dart';

class QuranSublistScreen extends StatelessWidget {
  final String name;

  QuranSublistScreen({
    this.name,
  });

  static TextStyle myStyle;
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
              builder: (ctx) => QuranMainScreen(),
            ),
          );
        },
      ),
      title: Text(
        name,
        style: myTextStyle,
      ),
    );
  }

  Widget _buildSingleTextContainer({String count, String translate}) {
    return Container(
      margin: EdgeInsets.only(bottom: widthStep * 30),
      alignment: Alignment.center,
      color: Colors.black54,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: widthStep * 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      count,
                      style: myStyle,
                    ),
                    SizedBox(
                      width: widthStep * 5,
                    ),
                    Text(
                      "Boismi Allahi alrrahani alrraheemni",
                      style: myStyle,
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  translate,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widthStep * 40,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static double heightStep, widthStep;
  @override
  Widget build(BuildContext context) {
    widthStep = MediaQuery.of(context).size.width / 1000;
    heightStep = MediaQuery.of(context).size.height / 1000;
    myStyle = TextStyle(
      fontSize: widthStep * 45,
      color: Theme.of(context).primaryColor,
      fontWeight: FontWeight.bold,
    );
    GetQuranData getQuranData = GetQuranData();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildMyAppBar(context),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.symmetric(vertical: heightStep * 20),
        decoration: myDecoration,
        child: SafeArea(
          child: FutureBuilder(
              future: getQuranData.getQuranAyahData(name: name),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (ctx, index) {
                        return _buildSingleTextContainer(
                          count: snapshot.data[index].ayahsNumber.toString(),
                          translate: snapshot.data[index].ayahsNameTranslation,
                        );
                      });
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      ),
    );
  }
}
