import 'package:flutter/material.dart';

Future<dynamic>navigationWithBackRoute({Widget? widget,BuildContext? buildContext}){
  return Navigator.push(buildContext!, MaterialPageRoute(builder: (buildContext)=>widget!));

}
//
Future<dynamic>navigationWithoutBackRoute({Widget? widget,BuildContext? buildContext}){
  return Navigator.pushAndRemoveUntil<void>(buildContext!,
    MaterialPageRoute(builder: (buildContext)=>widget!),(Route<dynamic> route) => false, );

}