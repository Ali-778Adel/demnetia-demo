// ignore: file_names
// ignore: file_names

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var lightTheme = ThemeData(
//  scaffoldBackgroundColor: Colors.white,
//  backgroundColor: Colors.white10,
  appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.teal),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white10,
          statusBarIconBrightness: Brightness.dark),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.deepOrange,
      elevation: 0.0,
      unselectedIconTheme: IconThemeData(color: Colors.black)),
  tabBarTheme:  TabBarTheme(
      labelColor: Colors.black,
      indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.orange, boxShadow: const [
        BoxShadow(
          color: Colors.white60,
          blurRadius: 2,
          spreadRadius: 2,
          offset: Offset(1,1)
        )
      ])),

  primarySwatch: Colors.blue,
);

var darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black54,
  appBarTheme: const AppBarTheme(
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black54,
          statusBarIconBrightness: Brightness.light),
      backgroundColor: Colors.black54,
      centerTitle: true,
      elevation: 0.0,
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black54,
      selectedItemColor: Colors.deepOrange,
      elevation: 0.0,
      unselectedIconTheme: IconThemeData(color: Colors.grey)),
  primarySwatch: Colors.deepOrange,
);
