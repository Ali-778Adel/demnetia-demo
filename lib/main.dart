import 'package:dementiademo/app_const_ui/AppThemes.dart';

import 'package:dementiademo/cubit/login_cubit.dart';
import 'package:dementiademo/cubit/register_cubit.dart';
import 'package:dementiademo/cubit/user_form_cubit.dart';
import 'package:dementiademo/screens/home_page_screen.dart';
import 'package:dementiademo/screens/login_screen.dart';
import 'package:dementiademo/screens/test_screen.dart';
import 'package:dementiademo/screens/user_form_screen.dart';
import 'package:dementiademo/sharedpref/sharedpref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants/Bloc_Observer.dart';
import 'cubit/home_page_cubit.dart';
import 'network/authentication_dio_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AuthenticationDioHelper.initAuthDio();
  Bloc.observer = MyBlocObserver();
  await SharedPref_Helper.initSharedPref();
  bool token = await SharedPref_Helper.getDataFromSharepref(key: 'token');
  bool isFormCompleted=await SharedPref_Helper.getDataFromSharepref(key: 'isFormCompleted');
  print(SharedPref_Helper.getDataFromSharepref(key: 'name').toString());
  print('i print $token' );
  runApp(MyApp(
    token: token,
    isFormCompleted: isFormCompleted,
  ));
}

class MyApp extends StatelessWidget {
   bool ?token;
   bool ?isFormCompleted;
  MyApp({ this.token,this.isFormCompleted, Key? key}) : super(key: key);
  Widget launch() {
    if (token==true&&isFormCompleted==false) {
      return const UserFormScreen();
    } else if(token==false&&isFormCompleted==false){
      return LoginScreen();
    }else{
      return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => UserFormCubit()),
        BlocProvider(create: (context) => HomePageCubit()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: launch(),
      ),
    );
  }
}
