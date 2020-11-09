import 'package:dzemaat/const/textformfield_textstyle.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String textName;
  final TextEditingController controller;
  final IconData iconData;
  MyTextField({
    @required this.iconData,
    @required this.controller,
    @required this.textName,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: textFormFieldTextStyle,
      decoration: InputDecoration(
        hintText: textName,
        fillColor: Colors.white24,
        filled: true,
        prefixIcon: Icon(
          iconData,
          color: Colors.white,
        ),
        hintStyle: textFormFieldTextStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
