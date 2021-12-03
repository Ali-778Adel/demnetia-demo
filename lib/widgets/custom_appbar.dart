import 'package:flutter/material.dart';
class CustomAppBar extends StatelessWidget {
  String? title;
  double ?fontSize;
  CustomAppBar({this.title,this.fontSize});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        title!,
        style:  TextStyle(color: Colors.black,fontSize:fontSize ),
      ),
      centerTitle: true,
//      leading: Container(color: Colors.teal,child: IconButton(icon: CustomDrawer(),onPressed: (){CustomDrawer();},)),
    );
  }
}

class CustomAppBar2 extends StatelessWidget {
  Widget? centerWidget;
  List<Widget>?appBarActions;
  Widget ?appBarLeading;
  CustomAppBar2({this.centerWidget,this.appBarActions});
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        child: AppBar(
          title:centerWidget ,
          actions: appBarActions,
          leading:appBarLeading ,
          centerTitle: true,
        )
        , preferredSize: const Size(double.infinity, 60.0));
  }
}
