import 'package:flutter/material.dart';
class CustomAppBar extends StatelessWidget {
  String? title;
  double ?fontSize;
  Widget?bottom;
  CustomAppBar({Key? key, this.title,this.fontSize,this.bottom}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        title!,
        style:  TextStyle(color: Colors.black,fontSize:fontSize ),
      ),
      centerTitle: true,
      bottom:PreferredSize(preferredSize:const Size(double.infinity,80),child: bottom!,),
    );
  }
}

class CustomAppBar2 extends StatelessWidget {
  Widget? centerWidget;
  List<Widget>?appBarActions;
  Widget ?appBarLeading;
  CustomAppBar2({Key? key, this.centerWidget,this.appBarActions}) : super(key: key);
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
