import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dzemaat/const/my_decoration.dart';
import 'package:dzemaat/widget/mybutton.dart';
import 'package:dzemaat/widget/mypasswordtextfield.dart';
import 'package:dzemaat/widget/mytextfield.dart';
import 'package:dzemaat/widget/toptitle.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_screen.dart';

class RegisterScreen extends StatefulWidget {
  static double widthStep, heightStep;
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RegExp regExp = new RegExp(RegisterScreen.p);

  bool isLoading = false;
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final TextEditingController confirmPassword = TextEditingController();

  final TextEditingController userName = TextEditingController();
  void submit() async {
    UserCredential result;
    try {
      setState(() {
        isLoading = true;
      });
      result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => HomeScreen()));
    } on PlatformException catch (error) {
      var message = "Please Check Your Internet Connection ";
      if (error.message != null) {
        message = error.message;
      }
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(message.toString()),
        duration: Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(error.toString()),
        duration: Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));
    }
    FirebaseFirestore.instance.collection("User").doc(result.user.uid).set(
      {
        "UserName": userName.text,
        "UserId": result.user.uid,
        "UserEmail": email.text,
        "UserImage":
            "https://www.seekpng.com/png/detail/115-1150053_avatar-png-transparent-png-royalty-free-default-user.png",
      },
    );
    setState(() {
      isLoading = false;
    });
  }

  void vaildation() async {
    if (userName.text.isEmpty &&
        email.text.isEmpty &&
        password.text.isEmpty &&
        confirmPassword.text.isEmpty) {
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("All Flied Are Empty"),
        ),
      );
    } else if (userName.text.length < 6) {
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Name Must Be 6 "),
        ),
      );
    } else if (email.text.isEmpty) {
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Email Is Empty"),
        ),
      );
    } else if (!regExp.hasMatch(email.text)) {
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Please Try Vaild Email"),
        ),
      );
    } else if (password.text.isEmpty) {
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Password Is Empty"),
        ),
      );
    } else if (password.text.length < 8) {
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Password  Is Too Short"),
        ),
      );
    } else if (confirmPassword.text.length < 8) {
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Password  Is Too Short"),
        ),
      );
    } else if (confirmPassword.text != password.text) {
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Password  Is Not Match"),
        ),
      );
    } else {
      submit();
    }
  }

  Widget _buildAllTextField() {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyTextField(
            iconData: Icons.person,
            controller: userName,
            textName: "Username",
          ),
          SizedBox(
            height: 12.0,
          ),
          MyTextField(
            iconData: Icons.email,
            textName: "Email",
            controller: email,
          ),
          SizedBox(
            height: 12.0,
          ),
          MyPasswordTextField(
            name: "Password",
            controller: password,
          ),
          SizedBox(
            height: 12.0,
          ),
          MyPasswordTextField(
            name: "Confrim Password",
            controller: confirmPassword,
          ),
          SizedBox(
            height: 12.0,
          ),
        ],
      ),
    );
  }

  Widget _buildButtonAndTextPart(BuildContext context) {
    return Column(
      children: [
        MyButton(
          buttonName: "Sign Up",
          containerHeight: RegisterScreen.heightStep * 65,
          onPressed: () => vaildation(),
          textFontSize: RegisterScreen.widthStep * 50,
        ),
        MyButton(
          buttonName: "Sign In",
          color: Colors.black54,
          containerHeight: RegisterScreen.heightStep * 65,
          onPressed: () => Navigator.of(context).pushReplacementNamed("/login"),
          textFontSize: RegisterScreen.widthStep * 50,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    RegisterScreen.widthStep = MediaQuery.of(context).size.width / 1000;
    RegisterScreen.heightStep = MediaQuery.of(context).size.height / 1000;
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        decoration: myDecoration,
        height: double.infinity,
        padding:
            EdgeInsets.symmetric(horizontal: RegisterScreen.widthStep * 30),
        width: double.infinity,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TopTitle(
                heightStep: RegisterScreen.heightStep,
                screenName: "Register",
                onlyTopText: false,
                widthStep: RegisterScreen.widthStep,
              ),
              SizedBox(
                height: RegisterScreen.heightStep * 40,
              ),
              _buildAllTextField(),
              _buildButtonAndTextPart(context),
            ],
          ),
        ),
      ),
    );
  }
}
