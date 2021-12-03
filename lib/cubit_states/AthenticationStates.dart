
// ignore_for_file: file_names



import 'package:dementiademo/model/auth_model.dart';

abstract class AuthenticationStates {}

class AthenticationIntialState extends AuthenticationStates {}

class PasswordsVisibilityState extends AuthenticationStates {}

class LoginLoadingState extends AuthenticationStates {}

class LoginSccessState extends AuthenticationStates {
  final AuthModel authModel;
  LoginSccessState(this.authModel);
}

class LoginFailureState extends AuthenticationStates {
  final AuthModel authModel;
  LoginFailureState(this.authModel);
}

class RegisterLoadingState extends AuthenticationStates {}

class RegisterSuccessState extends AuthenticationStates {
  final AuthModel authModel;

  RegisterSuccessState(this.authModel);
}

class RegisterFailureState extends AuthenticationStates {
  final AuthModel authModel;

  RegisterFailureState(this.authModel);
}
