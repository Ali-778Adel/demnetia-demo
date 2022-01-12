import 'package:dementiademo/components/navigation.dart';
import 'package:dementiademo/sharedpref/sharedpref.dart';
import 'package:dementiademo/widgets/custom_appbar.dart';
import 'package:dementiademo/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';


class UserSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size(double.infinity,60),child: CustomAppBar(title: 'بيانات المستخدم ',bottom: Center(),),),
      drawer: CustomDrawer(),
      body:Center(
        child: Container(
          child: Column(
            children: [
              const Icon(
                Icons.person_outline,
                size: 42,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(SharedPref_Helper.getDataFromShareprefrences(key: 'email')),
              const SizedBox(
                height: 10,
              ),
              Text(SharedPref_Helper.getDataFromShareprefrences(key: 'name')),
              const SizedBox(
                height: 100,
              ),
               Center(
                 child: SizedBox(
                   width: 160,
                   height: 50,
                   child: ElevatedButton(
                      onPressed: () {
                        SharedPref_Helper.clearSharedPref(key: 'token');
                        SharedPref_Helper.clearSharedPref(key: 'email');
                        SharedPref_Helper.clearSharedPref(key: 'password');
                        navigationWithBackRoute(
                            buildContext: context, widget: LoginScreen());
                      },
                      child:  Row(
                        children: const [
                          Icon(
                            Icons.logout,
                            size: 18,
                          ),
                          Text(
                            'تسجيل الخروج',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      )),
                 ),
               )
            ],
          ),
        ),
      ),
    );

  }
}
