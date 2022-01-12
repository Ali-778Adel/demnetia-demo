import 'package:dementiademo/components/ToastMessage.dart';
import 'package:dementiademo/constants/endpoints.dart';
import 'package:dementiademo/cubit_states/login_state.dart';
import 'package:dementiademo/model/auth_model.dart';
import 'package:dementiademo/network/authentication_dio_helper.dart';
import 'package:dementiademo/sharedpref/sharedpref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginIntialState());
 static LoginCubit get(context)=>BlocProvider.of(context);
  AuthModel? authModel;
  var loginFormKey = GlobalKey<FormState>();


  //sufixIconLogic
  var IconData = const Icon(Icons.visibility_off_outlined);
  bool obsecureText = true;
  void onPasswordSuffixIconTaped() {
    if (obsecureText) {
      IconData =const Icon(Icons.visibility_outlined);
      obsecureText = false;
    } else {
      IconData =const Icon(Icons.visibility_off_outlined);
      obsecureText = true;
    }
    emit(PasswordsVisibilityState());
  }
  //on LoginButton Tapped
  Future<dynamic> onLoginPressed(
      {required BuildContext context,
        required String name,
        required String email,
        required String password}) async {
      await sendLoginUserData(email: email, password: password)
        .onError((error, stackTrace) => print("error on sendLoginData${error.toString()}"
          "${stackTrace.toString()}"));
  }//onLoginPressed



  //login  logic
  Future<dynamic> sendLoginUserData(
      {String? name, String? email, String? password}) async {
    emit(LoginLoadingState());
    await AuthenticationDioHelper.sendUserData(
        url: Login,
        data: {
          'name': name,
          'email': email,
          'password': password,
        },
        lang: 'ar')
        .then((value) {
      authModel = AuthModel.fromJson(value.data);
//      setUserDataToSharedPref(token: true, name: name, email: email);
      setUserDataToSharedPref(
          token: true,
          name: authModel!.data!.name!,
          email: email,
          phoneNumber: authModel!.data!.phone!);
      print('value of sent data is  ${authModel!.data!.name!}'
          '${authModel!.message.toString()}');
      emit(LoginSuccessState(authModel!));
    }).catchError((s) {
      print('error error error error error ${s.toString()}');
      print('error message${authModel!.message!.toString()}');
      print('error message${authModel!.status!}');
      emit(LoginFailureState(authModel!)

      );
    });
  }
  void setUserDataToSharedPref(
      {bool? token, String? name, String ?email, String? phoneNumber}) async {
    // ignore: avoid_print
    await SharedPref_Helper.setDataToSharePref(key: 'token', value: token)
        .then((value) => print('token added with $value'));
    await SharedPref_Helper.setDataToSharePref(key: 'name', value: name)
        .then((value) => print('name added with $value'));
    ;
    await SharedPref_Helper.setDataToSharePref(key: 'email', value: email)
        .then((value) => print('email added with $value'));
    ;
    await SharedPref_Helper.setDataToSharePref(
        key: 'phoneNumber', value: phoneNumber)
        .then((value) => print('phoneNumber added with $value'));
    ;
  }
}