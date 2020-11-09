
import 'package:dzemaat/const/my_decoration.dart';
import 'package:dzemaat/const/my_textstyle.dart';
import 'package:dzemaat/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AammalMainScreen extends StatelessWidget {
  static double heightStep, widthStep;
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
        "Aammals",
        style: myTextStyle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    widthStep = MediaQuery.of(context).size.width / 1000;
    heightStep = MediaQuery.of(context).size.height / 1000;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: myDecoration,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5
                ),
                color: Colors.green,
                child: Text(
                  "2. Prayer for Fending Off Evil Self inspiration",
                  style: myTextStyle,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15
                ),
                height: heightStep*650,
                color: Colors.black45,
                child: Column(
                  children: [
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: heightStep * 100,
                width: widthStep * 800,
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
                          "8/10",
                          style: TextStyle(
                            color: Colors.white,
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
      ),
      appBar: _buildMyAppBar(context),
    );
  }
}
