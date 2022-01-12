import 'package:dementiademo/components/navigation.dart';
import 'package:dementiademo/screens/user_settings.dart';
import 'package:dementiademo/sharedpref/sharedpref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 8,
      child: SizedBox(
        width: MediaQuery.of(context).size.width*.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserAccountsDrawerHeader(
              accountName:Text( SharedPref_Helper.getDataFromShareprefrences(key: 'name')),
              accountEmail:Text(SharedPref_Helper.getDataFromShareprefrences(key: 'email')),
              currentAccountPicture: const Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person),
                ),
              ),
              decoration: const BoxDecoration(color: Colors.teal),
            ),
            customGridTile(
                icon: Icons.home, header: 'HomePage',
                footer: 'go to home page '),
            customGridTile(
                icon: Icons.settings,
                header: 'Settings',
                footer: 'custom app settings ',

            ),


            customGridTile(
                icon: Icons.person_outline,
                header: 'Profile',
                footer: 'user settings',
                function: (){
                  navigationWithBackRoute(buildContext: context,widget: UserSettings());
                }),
          ],
        ),
      ),
    );
  }
}

Widget customGridTile({
  String? footer,
  String? header,
  IconData? icon,
  Function ()?function
}) {
  return ListTile(
    title: Text(
      header!,
      style: TextStyle(fontSize: 18, color: Colors.black),
    ),
    subtitle: Text(
      footer!,
      style: TextStyle(fontSize: 14, color: Colors.grey),
    ),
    leading: CircleAvatar(
      backgroundColor: Colors.teal,
      child: Icon(
        icon!,
        size: 18,
        color: Colors.black,
      ),
    ),
    onTap:function ,
  );
}
