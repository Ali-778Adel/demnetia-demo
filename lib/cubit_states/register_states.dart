import 'package:dementiademo/model/auth_model.dart';

abstract class RegisterStates{}

class RegisterInitState extends RegisterStates{}
class PasswordsVisibilityState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final AuthModel authModel;

  RegisterSuccessState(this.authModel);
}

class RegisterFailureState extends RegisterStates {
  final AuthModel authModel;

  RegisterFailureState(this.authModel);
}
