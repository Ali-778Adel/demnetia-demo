import 'package:flutter/material.dart';
class CustomBottomNavBar extends StatelessWidget{
  int currentIndex;

  Function(int?index)?function;
  CustomBottomNavBar({required this.currentIndex,this.function,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: currentIndex,
         items:const [
        BottomNavigationBarItem( icon: Icon(Icons.home),label: 'home page'),
        BottomNavigationBarItem( icon: Icon(Icons.work),label: 'mission todo'),

    ],
      onTap:function,
    );
  }



}