
import 'package:dzemaat/const/my_decoration.dart';
import 'package:dzemaat/const/my_textstyle.dart';
import 'package:dzemaat/screens/home_screen.dart';
import 'package:dzemaat/widget/google_sign_in.dart';
import 'package:dzemaat/widget/mybutton.dart';
import 'package:dzemaat/widget/mypasswordtextfield.dart';
import 'package:dzemaat/widget/mytextfield.dart';
import 'package:dzemaat/widget/toptitle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  static double widthStep, heightStep;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void submit(context) async {
    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => HomeScreen()));
    } on PlatformException catch (error) {
      var message = "Please Check Your Internet Connection ";
      if (error.message != null) {
        message = error.message;
      }
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(message.toString()),
          duration: Duration(milliseconds: 800),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(error.toString()),
        duration: Duration(milliseconds: 800),
        backgroundColor: Theme.of(context).primaryColor,
      ));
    }
    setState(() {
      isLoading = false;
    });
  }

  void vaildation() async {
    if (email.text.isEmpty && password.text.isEmpty) {
      FirebaseAuth.instance.signOut();
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Both Flied Are Empty"),
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
    } else {
      submit(context);
    }
  }

  Widget _buildAllTextField() {
    return Container(
      height: LoginScreen.heightStep * 250,
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyTextField(
              iconData: Icons.email,
              textName: "Email",
              controller: email,
            ),
            MyPasswordTextField(
              name: "Password",
              controller: password,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomText(BuildContext context) {
    return Container(
      height: LoginScreen.heightStep * 80,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlatButton(
            onPressed: () =>
                Navigator.of(context).pushReplacementNamed("/forgot"),
            child: Text(
              "Forgot ?",
              style: myTextStyle,
            ),
          ),
          FlatButton(
            onPressed: () =>
                Navigator.of(context).pushReplacementNamed("/register"),
            child: Text(
              "Register",
              style: myTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSingleConnectWith({String image, Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        maxRadius: LoginScreen.heightStep * 28,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(
          "images/$image.png",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    LoginScreen.widthStep = MediaQuery.of(context).size.width / 1000;
    LoginScreen.heightStep = MediaQuery.of(context).size.height / 1000;
    getFontSize(getTextFontSize: LoginScreen.widthStep * 50);
    return Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          child: Container(
            padding:
                EdgeInsets.symmetric(horizontal: LoginScreen.widthStep * 30),
            height: double.infinity,
            width: double.infinity,
            decoration: myDecoration,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TopTitle(
                    onlyTopText: false,
                    heightStep: LoginScreen.heightStep,
                    widthStep: LoginScreen.widthStep,
                    screenName: "SignIn",
                  ),
                  _buildAllTextField(),
                  MyButton(
                    containerHeight: LoginScreen.heightStep * 65,
                    buttonName: "Sign In",
                    textFontSize: LoginScreen.widthStep * 45,
                    onPressed: () => vaildation(),
                  ),
                  _buildBottomText(context),
                  Text(
                    "Or Continue With",
                    style: TextStyle(
                      fontSize: LoginScreen.widthStep * 44,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: LoginScreen.heightStep * 80,
                    width: LoginScreen.widthStep * 600,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildSingleConnectWith(image: "facebook"),
                          _buildSingleConnectWith(image: "twitter"),
                          _buildSingleConnectWith(
                              image: "google",
                              onTap: () {
                                signInWithGoogle().then(
                                  (result) => {
                                    if (result != null)
                                      {
                                       Container(
                                         height: 1000,
                                         width: 300,
                                         color: Colors.red,
                                       ),
                                      }
                                  },
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
