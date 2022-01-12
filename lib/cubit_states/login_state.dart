import 'package:dementiademo/model/auth_model.dart';

abstract class LoginStates{}

class LoginIntialState extends LoginStates {}

class PasswordsVisibilityState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final AuthModel authModel;
  LoginSuccessState(this.authModel);
}

class LoginFailureState extends LoginStates {
  final AuthModel authModel;
  LoginFailureState(this.authModel);
}
