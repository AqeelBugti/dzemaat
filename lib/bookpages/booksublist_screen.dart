
import 'package:dzemaat/bookpages/bookmain_Screen.dart';
import 'package:dzemaat/const/my_decoration.dart';
import 'package:dzemaat/const/my_textstyle.dart';
import 'package:dzemaat/widget/mybutton.dart';
import 'package:flutter/material.dart';

class BookSublistScreen extends StatelessWidget {
  final String image;
  final String name;
  BookSublistScreen({this.image, this.name});
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
        onPressed: () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => BookMainScreen(),
          ),
        ),
      ),
      title: Text(
        "Book",
        style: myTextStyle,
      ),
    );
  }

  static double heightStep, widthStep;

  @override
  Widget build(BuildContext context) {
    widthStep = MediaQuery.of(context).size.width / 1000;
    heightStep = MediaQuery.of(context).size.height / 1000;
    return Scaffold(
      appBar: _buildMyAppBar(context),
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: myDecoration,
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(top: widthStep * 80),
                        color: Colors.black54,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              height: heightStep * 330,
                              width: widthStep * 400,
                              image: AssetImage("images/$image"),
                            ),
                            Text(
                              name,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: heightStep * 10,
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      color: Colors.black45,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About book",
                            style: myTextStyle,
                          ),
                          Text(
                            "Lerom is a Canadian immigration law firm. Based in Toronto, we specialize in Canadian immigration and citizenship services. Want to live, do business, work",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: heightStep * 10,
                    ),
                    MyButton(
                      buttonName: "DOWNLOAD",
                      containerHeight: heightStep * 70,
                      onPressed: () {},
                      textFontSize: widthStep * 40,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
