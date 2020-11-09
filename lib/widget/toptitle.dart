import 'package:dzemaat/const/my_textstyle.dart';
import 'package:dzemaat/media_query/media_query.dart';
import 'package:flutter/material.dart';

class TopTitle extends StatelessWidget {
  final bool onlyTopText;
  final double heightStep, widthStep;
  final String screenName;
  TopTitle({
    this.onlyTopText,
    this.heightStep,
    this.widthStep,
    this.screenName,
  });
  @override
  Widget build(BuildContext context) {
    MediaQuerys().init(context);

    return Container(
      height: MediaQuerys.heightStep * 350,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: MediaQuerys.heightStep * 350,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dzemaat",
                  style: TextStyle(
                    height: 6,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                onlyTopText == false
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            screenName,
                            style: myTextStyle,
                          ),
                          SizedBox(
                            width: MediaQuerys.widthStep * 20,
                          ),
                          Text(
                            "Now",
                            style: TextStyle(
                              fontSize: MediaQuerys.widthStep * 45,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    : Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
