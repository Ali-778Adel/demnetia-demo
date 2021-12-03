import 'package:dementiademo/components/ToastMessage.dart';
import 'package:dementiademo/cubit/AthenticationCubit.dart';
import 'package:dementiademo/cubit_states/AthenticationStates.dart';
import 'package:dementiademo/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<AuthenticationCubit, AuthenticationStates>(
          builder: (context, state) {
            AuthenticationCubit cubit = AuthenticationCubit.get(context);
            Widget checkIfLoginDataIsSent(){
              if (state is LoginLoadingState){
                return const CircularProgressIndicator();
              }else{
                return  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        cubit.onLoginPressed(
                          context: context,
                            email: emailController.text,
                            password: passwordController.text).then((value){
                        });
                      }
                      },
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(
                            Colors.white),
                        foregroundColor:
                        MaterialStateProperty.all<Color>(
                            Colors.grey.withOpacity(0.5)),
                        shadowColor: MaterialStateProperty.all<Color>(
                            Colors.grey.withOpacity(0.9))),
                    child: Text(
                      'Log in',
                      style: (Theme.of(context).textTheme.headline6)!
                          .copyWith(color: Colors.blue),
                    ));
              }
            }

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child:  Form(
                key: formKey,
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
                      'Dementia is the best solution for you',
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
                        controller: emailController,
                        decoration: const InputDecoration(
                          fillColor:Colors.limeAccent,
                          constraints:  BoxConstraints(minWidth: 120,maxWidth: 600),
                          icon: Icon(Icons.email),
                          labelText: 'Email',
                          hintText: 'User Name or E-mail ',
                        ),
                        validator: (String? message) {
                          if (emailController.text.isEmpty) {
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
                        controller: passwordController,
                        decoration: InputDecoration(
                          fillColor:Colors.limeAccent,
                          constraints: const BoxConstraints(minWidth: 120,maxWidth: 600),
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
                    Center(
                        child:checkIfLoginDataIsSent()),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Don't have an account ?",
                          style: (Theme.of(context).textTheme.headline6)!
                              .copyWith(color: Colors.grey, fontSize: 18),
                        ),
                        const SizedBox(
                          width: 0,
                        ),
                        TextButton(
                          child: Text(
                            'REGISTER NOW',
                            style: (Theme.of(context).textTheme.headline6)!
                                .copyWith(color: Colors.red, fontSize: 18),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  RegisterScreen()));
                          },
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
            if (state is LoginSccessState) {
              if (state.authModel.status!) {
                HandleToastMeaasge.showToastMessage(
                  context: context,
                    message: state.authModel.message!,
                    enumState: EnumState.SUCCESS);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>const Scaffold()),
                );

              }else {
                HandleToastMeaasge.showToastMessage(
                  context: context,
                    message: state.authModel.message!,
                    enumState: EnumState.WARNING);
              }
            } else if (state is LoginFailureState) {
              if (state.authModel.status!) {
                HandleToastMeaasge.showToastMessage(
                  context: context,
                    message: state.authModel.message!,
                    enumState: EnumState.ERROR);
              } else {
                HandleToastMeaasge.showToastMessage(
                  context: context,
                    message: state.authModel.message!,
                    enumState: EnumState.WARNING);
              }
            }

          },
        ));
  }
}
