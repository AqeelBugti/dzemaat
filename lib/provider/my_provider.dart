import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dzemaat/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class MyProvider with ChangeNotifier {
  UserModel userModel;
  Future<UserModel> getUserData() async {
    User currentUser = FirebaseAuth.instance.currentUser;
    QuerySnapshot userSnapShot =
        await FirebaseFirestore.instance.collection("User").get();
    userSnapShot.docs.forEach(
      (element) {
        if (currentUser.uid == element.data()["UserId"]) {
          userModel = UserModel(
            userEmail: element.data()["UserEmail"],
            userName: element.data()["UserName"],
            userImage: element.data()["UserImage"],
          );
        }
      },
    );
    return userModel;
  }
}
