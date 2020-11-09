import 'package:flutter/material.dart';
class MediaQuerys {
 static MediaQueryData _mediaQueryData;
 static double heightStep;
  static double widthStep;

 
 void init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    widthStep = _mediaQueryData.size.width/1000;
    heightStep = _mediaQueryData.size.height/1000;
   
  }

}