import 'package:dementiademo/app_const_ui/AppThemes.dart';
import 'package:dementiademo/cubit/AthenticationCubit.dart';
import 'package:dementiademo/cubit/user_form_cubit.dart';
import 'package:dementiademo/screens/test2.dart';
import 'package:dementiademo/screens/test_screen.dart';
import 'package:dementiademo/screens/user_form_application.dart';
import 'package:dementiademo/sharedpref/sharedpref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/Bloc_Observer.dart';
import 'network/authentication_dio_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AuthenticationDioHelper.initAuthDio();
  Bloc.observer = MyBlocObserver();
  await SharedPref_Helper.initSharedPref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=>AuthenticationCubit()),
      BlocProvider(create: (context)=>UserFormCubit())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home:const UserFormApplication(),
    ),
    );

  }
}

