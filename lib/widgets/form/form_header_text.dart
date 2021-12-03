import 'package:flutter/material.dart';
class CustomFormHeaderText extends StatelessWidget {
  String?headerText;

  CustomFormHeaderText({Key? key,this.headerText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(headerText!,
        style:const TextStyle(
            height: 1,
            color: Colors.teal,
            fontSize: 22,
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.double,
            decorationColor: Colors.red));
  }
}
