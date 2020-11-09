import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  final Function onPressed;
  final double containerHeight;
  final double textFontSize;
  final Color color;
  MyButton({
    this.containerHeight,
    this.buttonName,
    this.onPressed,
    this.textFontSize,
    this.color = const Color(0xff19ba19),
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      width: double.infinity,
      child: RaisedButton(
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize:textFontSize,
            color: Colors.white,
          ),
        ),
        onPressed: onPressed,
        color: color,
      ),
    );
  }
}
