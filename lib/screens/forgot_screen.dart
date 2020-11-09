
import 'package:dzemaat/const/my_decoration.dart';
import 'package:dzemaat/media_query/media_query.dart';
import 'package:dzemaat/widget/mybutton.dart';
import 'package:dzemaat/widget/mytextfield.dart';
import 'package:dzemaat/widget/toptitle.dart';
import 'package:flutter/material.dart';

class ForgotScreen extends StatefulWidget {
  @override
  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final TextEditingController email = TextEditingController();
  Widget _buildSingleText({String title}) {
    return Text(
      title,
      style: TextStyle(
        fontSize: MediaQuerys.widthStep * 43,
        color: Colors.white,
      ),
    );
  }

  Widget _buildForgotPasswordText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "FORGOT",
          style: TextStyle(
            fontSize: MediaQuerys.widthStep * 50,
            color: Colors.grey[300],
          ),
        ),
        SizedBox(
          width: MediaQuerys.widthStep * 20,
        ),
        Text(
          "PASSWORD?",
          style: TextStyle(
            fontSize: MediaQuerys.widthStep * 50,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildAllForgotBottomText() {
    return Container(
      height: MediaQuerys.heightStep * 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildSingleText(
            title: "Enter your Email address",
          ),
          _buildSingleText(
            title: "You Will receive an Email With link",
          ),
          _buildSingleText(
            title: "to reset password",
          ),
        ],
      ),
    );
  }

  Widget _buildEmailAndButtonPortion() {
    return Container(
      height: MediaQuerys.heightStep * 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MyTextField(
            controller: email,
            iconData: Icons.email,
            textName: "Email",
          ),
          SizedBox(
            height: MediaQuerys.heightStep * 20,
          ),
          MyButton(
            textFontSize: MediaQuerys.heightStep * 23,
            containerHeight: MediaQuerys.heightStep * 80,
            buttonName: "SUBMIT",
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget _buildMyAppBar(context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.grey[300],
        ),
        onPressed: () => Navigator.of(context).pushReplacementNamed("/login"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQuerys().init(context);

    return Scaffold(
      extendBody: false,
      extendBodyBehindAppBar: true,
      appBar: _buildMyAppBar(context),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: MediaQuerys.widthStep * 30),
        decoration: myDecoration,
        child: Column(
          children: [
            TopTitle(
              onlyTopText: true,
              heightStep: MediaQuerys.heightStep,
              widthStep: MediaQuerys.widthStep,
            ),
            _buildForgotPasswordText(),
            Container(
              height: MediaQuerys.heightStep * 500,
              width: double.infinity,
              child: Column(
                children: [
                  _buildAllForgotBottomText(),
                  _buildEmailAndButtonPortion(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
