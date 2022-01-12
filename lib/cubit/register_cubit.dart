import 'package:dementiademo/constants/endpoints.dart';
import 'package:dementiademo/cubit_states/register_states.dart';
import 'package:dementiademo/model/auth_model.dart';
import 'package:dementiademo/network/authentication_dio_helper.dart';
import 'package:dementiademo/sharedpref/sharedpref.dart';
import 'package:dementiademo/widgets/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit() : super(RegisterInitState());
  static RegisterCubit get(context)=>BlocProvider.of(context);
   var registerFormKey=GlobalKey<FormState>();
   AuthModel?authModel;
  bool obsecureText = true;
  var IconData = const Icon(Icons.visibility_off_outlined);
  void onPasswordSuffixIconTaped() {
    if (obsecureText) {
      IconData =const Icon(Icons.visibility_outlined);
      obsecureText = false;
    } else {
      IconData = const Icon(Icons.visibility_off_outlined);
      obsecureText = true;
    }
    emit(PasswordsVisibilityState());
  }

  Future<dynamic> onRegisterPressed(
      {required BuildContext context,
        required String name,
        required String email,
        required String password,
        required String phone}) async {

    await sendregisterUserData(
        context: context,
        name: name,
        email: email,
        password: password,
        phone: phone);



  }

  Future<dynamic> sendregisterUserData(
      {required BuildContext context,
        required String name,
        required String email,
        required String password,
        required String phone}) async {
    emit(RegisterLoadingState());
    await AuthenticationDioHelper.sendUserData(url: Register, data: {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone
    }).then((value) {
      authModel = AuthModel.fromJson(value.data);
      print('value of sent data is  ${authModel!.data!.name!}');
      print(authModel.toString());
      setUserDataToShared(
          token: true, name: name, email: email, phoneNumber: phone);
      print(SharedPref_Helper.getDataFromSharepref(key: 'name'));
      emit(RegisterSuccessState(authModel!));
    }).catchError((error) {
      print('error${error.toString()}');
      print('error${authModel!.status}');
      emit(RegisterFailureState(authModel!));
    }).timeout(const Duration(seconds: 15), onTimeout: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              title: 'Time Out',
              contentText: 'it take along time to responde ',
              function: () {
                onRegisterPressed(
                    context: context,
                    name: name,
                    email: email,
                    password: password,
                    phone: phone);
              },
            );
          });
    });
  }

  void setUserDataToShared(
      {bool? token, String? name, String, email, String? phoneNumber}) async {
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