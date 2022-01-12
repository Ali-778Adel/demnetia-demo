import 'package:dementiademo/components/ToastMessage.dart';
import 'package:dementiademo/components/navigation.dart';
import 'package:dementiademo/cubit/register_cubit.dart';
import 'package:dementiademo/cubit_states/register_states.dart';
import 'package:dementiademo/screens/user_form_screen.dart';
import 'package:dementiademo/widgets/custom_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  var fullNameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<RegisterCubit, RegisterStates>(
            builder: (context, state) {
              RegisterCubit cubit = RegisterCubit.get(context);

              Widget checkIfRegisterDataSent() {
                if (state is RegisterLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return SizedBox(
                    width: 140,
                    child: CustomElvateButton(
                        function: () {
                          if (cubit.registerFormKey.currentState!.validate()) {
                            cubit.onRegisterPressed(
                                context: context,
                                name: fullNameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                phone: phoneController.text);
                          }
                        },
                        buttonText: 'Register'),
                  );
                }
              }

              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: cubit.registerFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          'Register',
                          style: (Theme.of(context).textTheme.headline4)!
                              .copyWith(color: Colors.black87),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Your emories is our mission  ',
                          style: (Theme.of(context).textTheme.headline6)!
                              .copyWith(color: Colors.red),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        //firstName
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
                            controller: fullNameController,
                            decoration: const InputDecoration(
                              constraints:
                              BoxConstraints(minWidth: 120, maxWidth: 600),
                              icon: Icon(Icons.title),
                              labelText: 'FullName',
                              hintText: 'Enter your full name here ',
                            ),
                            validator: (String? message) {
                              if (message!.isEmpty) {
                                return " name musn't be empty";
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //lastName
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
                            controller: phoneController,
                            decoration: const InputDecoration(
                              constraints:
                              BoxConstraints(minWidth: 120, maxWidth: 600),
                              icon: Icon(Icons.phone),
                              labelText: 'Phone number',
                              hintText: 'Enter your phone number here ',
                            ),
                            validator: (String? message) {
                              if (emailController.text.isEmpty) {
                                return "phone number musn't be empty";
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                              constraints:
                              BoxConstraints(minWidth: 120, maxWidth: 600),
                              icon: Icon(Icons.email),
                              labelText: 'Email',
                              hintText: 'Enter your email here ',
                            ),
                            validator: (String? message) {
                              if (emailController.text.isEmpty) {
                                return "email musn't be empty";
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                              hintText: 'Enter your passsord here ',
                            ),
                            obscureText: cubit.obsecureText,
                            validator: (String? message) {
                              if (message!.isEmpty) {
                                return " password musn't be empty ";
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(child: checkIfRegisterDataSent()),

                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Already have an account ?",
                              style: (Theme.of(context).textTheme.headline6)!
                                  .copyWith(color: Colors.grey, fontSize: 18),
                            ),
                            TextButton(
                              child: Text(
                                'LOG IN ',
                                style: (Theme.of(context).textTheme.headline6)!
                                    .copyWith(color: Colors.red, fontSize: 18),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }, listener: (context, state) {
          if (state is RegisterLoadingState){
            HandleToastMeaasge.showToastMessage(context:context,message: 'loading ...', enumState: EnumState.WARNING);
          }
          else if (state is RegisterSuccessState) {
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
          } else if (state is RegisterFailureState) {
            if (state.authModel.status ==false) {
              HandleToastMeaasge.showToastMessage(
                  context: context,
                  message: state.authModel.message!,
                  enumState: EnumState.WARNING);
            }else{
              HandleToastMeaasge.showToastMessage(context: context,message: 'check Network connection', enumState: EnumState.ERROR);
            }
          }
        }));
  }
}
