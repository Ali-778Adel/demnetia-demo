import 'package:dementiademo/components/ToastMessage.dart';
import 'package:dementiademo/cubit/login_cubit.dart';
import 'package:dementiademo/cubit_states/login_state.dart';
import 'package:dementiademo/screens/register_screen.dart';
import 'package:dementiademo/screens/user_form_screen.dart';
import 'package:dementiademo/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final  loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<LoginCubit, LoginStates>(
          builder: (context, state) {
            LoginCubit cubit = LoginCubit.get(context);
            Widget checkState(){
              if (state is LoginLoadingState){
                return const Center(child:  CircularProgressIndicator());
              }else{
                return CustomElvateButton(
                  buttonText: 'Log in',
                  function: (){
                    cubit.onLoginPressed(context: context,
                        name: 'shehta',
                        email: loginEmailController.text,
                        password: loginPasswordController.text);

                  },

                );
              }

            }


            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: cubit.loginFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Log In',
                        style: (Theme.of(context).textTheme.headline4)!
                            .copyWith(color: Colors.black87),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Dementia is the best solution for you.',
                        style: (Theme.of(context).textTheme.headline6)!
                            .copyWith(color: Colors.red),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //email
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                  offset: const Offset(0, 2))
                            ]),
                        child: TextFormField(
                          controller: loginEmailController,
                          decoration: const InputDecoration(
                            fillColor: Colors.limeAccent,
                            constraints:
                            BoxConstraints(minWidth: 120, maxWidth: 600),
                            icon: Icon(Icons.email),
                            labelText: 'Email',
                            hintText: 'User Name or E-mail ',
                          ),
                          validator: (String? message) {
                            if (loginEmailController.text.isEmpty) {
                              return message = "email musn't be empty";
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //password
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                  offset: const Offset(0, 2))
                            ]),
                        child: TextFormField(
                          controller: loginPasswordController,
                          decoration: InputDecoration(
                            fillColor: Colors.limeAccent,
                            constraints: const BoxConstraints(
                                minWidth: 120, maxWidth: 600),
                            icon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: cubit.IconData,
                              onPressed: () {
                                cubit.onPasswordSuffixIconTaped();
                              },
                            ),
                            labelText: 'Password',
                            hintText: 'Password ',
                          ),
                          obscureText: cubit.obsecureText,
                          validator: (String? message) {
                            if (message!.isEmpty) {
                              return message = "password musn't be empty";
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(child: SizedBox(
                          width: 120,
                          child: checkState()
                      )),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              "Don't have an account ?",
                              style: (Theme.of(context).textTheme.headline6)!
                                  .copyWith(color: Colors.grey, fontSize: 16),
                            ),
                          ),
                          const SizedBox(
                            width: 0,
                          ),
                          Expanded(
                            flex: 2,
                            child: TextButton(
                              child: Text(
                                'REGISTER NOW',
                                style: (Theme.of(context).textTheme.headline6)!
                                    .copyWith(color: Colors.red, fontSize: 14),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterScreen()));
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          listener: (context, state) {
            if (state is LoginLoadingState){
              HandleToastMeaasge.showToastMessage(context:context,message: 'loading ...', enumState: EnumState.WARNING);
            }
            else if (state is LoginSuccessState) {
              if (state.authModel.status!) {
                HandleToastMeaasge.showToastMessage(
                    context: context,
                    message: state.authModel.message!,
                    enumState: EnumState.SUCCESS);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>const UserFormScreen()),
                );
              }
            } else if (state is LoginFailureState) {
              if (state.authModel.status ==false) {
                HandleToastMeaasge.showToastMessage(
                    context: context,
                    message: state.authModel.message!,
                    enumState: EnumState.WARNING);
              }else{
                HandleToastMeaasge.showToastMessage(context: context,message: 'check Network connection', enumState: EnumState.ERROR);
              }
            }
          },
        ));
  }
}
