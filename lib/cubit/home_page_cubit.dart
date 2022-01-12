import 'package:dementiademo/components/navigation.dart';
import 'package:dementiademo/cubit_states/home_page_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageCubit extends Cubit<HomePageStates>
{
  HomePageCubit() : super(HOInitState());
  static HomePageCubit get(context)=>BlocProvider.of(context);
  List<Widget>bottomNavBarWidgets=
  [
    const Scaffold(body: Center(child: Text('firstScreen')),),
    const Scaffold(body: Center(child: Text('secondScreen')),),

  ];

  int currentIndex=0;
   void onBottomNavBarItemChanged({int?index}){
    currentIndex=index!;
    emit(HOonBottomNavbarTappedState());
  }
List<Widget>relatedTabBarWidgets=
[
  const Scaffold(body: Center(child: Text('first')),),
  const Scaffold(body: Center(child: Text('second')),),
  const Scaffold(body: Center(child: Text('third')),),
  const Scaffold(body: Center(child: Text('fourth')),),
  const Scaffold(body:  Center(child: Text('fifth')),)

];
  int tbCurrentIndex=0;
  void onTabBarItemTapped({int?index,BuildContext? context ,TabController? tabController}){
     tbCurrentIndex=index!;
     print(tbCurrentIndex);
//     switch(index){
//       case 0:{
//         tabController!.animateTo(tbCurrentIndex,duration:const Duration(seconds: 20),curve: Curves.ease);
//       }break;
//       case 1:{
//         tabController!.animateTo(tbCurrentIndex,duration:const Duration(milliseconds: 20),curve: Curves.ease);
//       }break;
//       case 2:{
//         tabController!.animateTo(tbCurrentIndex,duration:const Duration(milliseconds: 20),curve: Curves.ease);
//       }break;
//       case 3:{
//         tabController!.animateTo(tbCurrentIndex,duration:const Duration(milliseconds: 20),curve: Curves.ease);
//       }break;
//       case 4:{
//         tabController!.animateTo(tbCurrentIndex,duration:const Duration(milliseconds: 20),curve: Curves.ease);
//       }break;
//     }

   }

}