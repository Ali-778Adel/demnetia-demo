// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';


class HandleToastMeaasge {
  static Color ?color;
  static dynamic showToastMessage({BuildContext?context,required String message,required EnumState enumState}) async{
    return  showToast(
        message,
      context: context,
      duration:const Duration(seconds:3),
      backgroundColor: chosseColor(state: enumState),



    );
  }

  static Color chosseColor({required EnumState ?state}) {
    switch ( state) {
      case EnumState.SUCCESS:
        {
         return color= Colors.green;
        }
        break;
      case EnumState.WARNING:
        {
        return  color =Colors.yellow;
        }
        break;
      case EnumState.ERROR:
        {
      return    color= Colors.red;
        }break;
      default:{
        return color=Colors.blue;
      }

    }
  }
}

enum EnumState { SUCCESS, WARNING, ERROR }
//(
//msg: message,
//toastLength: Toast.LENGTH_LONG,
//gravity: ToastGravity.BOTTOM,
//timeInSecForIosWeb: 5,
//backgroundColor: chosseColor(state: enumState),
//textColor: Colors.white,
//fontSize: 16.0);