import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dzemaat/const/my_decoration.dart';
import 'package:dzemaat/const/my_textstyle.dart';
import 'package:dzemaat/media_query/media_query.dart';
import 'package:dzemaat/model/usermodel.dart';
import 'package:dzemaat/screens/home_screen.dart';
import 'package:dzemaat/widget/mybutton.dart';
import 'package:dzemaat/widget/mytextfield.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileMainScreen extends StatefulWidget {
  @override
  _ProfileMainScreenState createState() => _ProfileMainScreenState();
}

class _ProfileMainScreenState extends State<ProfileMainScreen> {
  UserModel userModel;
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  File pickedImage;

  PickedFile _image;
  Future<void> getImage({ImageSource source}) async {
    _image = await ImagePicker().getImage(source: source);
    if (_image != null) {
      setState(() {
        pickedImage = File(_image.path);
      });
    }
  }

  User user;

  Future<String> _uploadImage({File image}) async {
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child("UserImage/${user.uid}");
    StorageUploadTask uploadTask = storageReference.putFile(image);
    StorageTaskSnapshot snapshot = await uploadTask.onComplete;
    String imageUrl = await snapshot.ref.getDownloadURL();
    return imageUrl;
  }

  bool isEdit = false;
  void userDetailUpdate() async {
    setState(() {
      isEdit = true;
    });
    String imageUrl = pickedImage == null
        ? await _uploadImage(image: pickedImage)
        : userModel.userName;

    FirebaseFirestore.instance.collection("User").doc(user.uid).update({
      "UserName": userName.text,
      "UserEmail": email.text,
      "UserImage": imageUrl,
    });

    setState(() {
      isEdit = false;
    });
  }

  RegExp regExp = new RegExp(p);
  final TextEditingController email = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> myDialogBox(context) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: Text("Pick Form Camera"),
                    onTap: () {
                      getImage(source: ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text("Pick Form Gallery"),
                    onTap: () {
                      getImage(source: ImageSource.gallery);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void vaildation() async {
    if (email.text.isEmpty && userName.text.isEmpty) {
      FirebaseAuth.instance.signOut();
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Both Flied Are Empty"),
        ),
      );
    } else if (userName.text.isEmpty) {
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Password Is Empty"),
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
    } else if (userName.text.isEmpty) {
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Password Is Empty"),
        ),
      );
    } else {
      userDetailUpdate();
    }
  }

  Widget _buildMyAppBar(context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
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
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        "Back",
        style: myTextStyle,
      ),
    );
  }

  Widget _buildBottomPart() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                MyTextField(
                  iconData: Icons.person,
                  textName: userModel.userName,
                  controller: userName,
                ),
                SizedBox(
                  height: MediaQuerys.heightStep * 15,
                ),
                MyTextField(
                  iconData: Icons.email,
                  controller: email,
                  textName: userModel.userEmail,
                ),
                SizedBox(
                  height: MediaQuerys.heightStep * 15,
                ),
              ],
            ),
          ),
          MyButton(
            buttonName: "Update Profile",
            containerHeight: MediaQuerys.heightStep * 65,
            onPressed: () {
              vaildation();
            },
            textFontSize: MediaQuerys.widthStep * 40,
          ),
        ],
      ),
    );
  }

  Widget _buildTopPart() {
    return Container(
      color: Colors.white30,
      width: double.infinity,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuerys.heightStep * 25,
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(
                userModel.userImage,
              ),
              maxRadius: MediaQuerys.heightStep * 90,
            ),
            SizedBox(
              height: MediaQuerys.heightStep * 15,
            ),
            GestureDetector(
              onTap: () => myDialogBox(context),
              child: Text(
                "Change Profile Photo",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuerys.widthStep * 40,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuerys.heightStep * 25,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    user = FirebaseAuth.instance.currentUser;
    MediaQuerys().init(context);
    return Scaffold(
      key:scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: _buildMyAppBar(context),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: myDecoration,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
            child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection("User").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var myDoc = snapshot.data.docs;
                    myDoc.forEach((checkDocs) {
                      if (checkDocs.data()["UserId"] == user.uid) {
                        userModel = UserModel(
                          userEmail: checkDocs.data()["UserEmail"],
                          userImage: checkDocs.data()["UserImage"],
                          userName: checkDocs.data()["UserName"],
                        );
                      }
                    });
                    return Container(
                      height: 600,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildTopPart(),
                          _buildBottomPart(),
                        ],
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
