import 'package:dementiademo/cubit/user_form_cubit.dart';
import 'package:dementiademo/cubit_states/user_form_states.dart';
import 'package:dementiademo/widgets/custom_appbar.dart';
import '../widgets/form/custom_radio_row.dart';
import '../widgets/form/cutom_radio_listtile.dart';
import '../widgets/form/form_container_decoration.dart';
import '../widgets/form/form_header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserFormApplication extends StatelessWidget {
  const UserFormApplication({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 60),
          child: CustomAppBar(
            title: 'Form',
            fontSize: 32,
          )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              CustomContainer(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: .5,
                      ),
                      const Text('prsonal info *',
                          style: TextStyle(
                              height: 1,
                              color: Colors.teal,
                              fontSize: 22,
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.double,
                              decorationColor: Colors.red)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller:
                              context.read<UserFormCubit>().ageContoller,
                          decoration: const InputDecoration(
//                      fillColor: Colors.limeAccent,
                            constraints:
                                BoxConstraints(minWidth: 120, maxWidth: 600),
                            icon: Icon(Icons.calendar_today),
                            labelText: 'Age',
                            hintText: 'please enter your age ',
                          ),
                          validator: (String? message) {
                            if (context
                                .read<UserFormCubit>()
                                .ageContoller
                                .text
                                .isEmpty) {
                              return message = "age musn't be empty";
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomRadioRow(
                        questionText: 'Do you have a wife? ',
                        blocBuilderWidget:
                            BlocBuilder<UserFormCubit, UserFormStates>(
                          builder: (context, state) {
                            return ListView.builder(
                                itemExtent: 120,
                                scrollDirection: Axis.horizontal,
                                controller:
                                    ScrollController(keepScrollOffset: false),
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return CustomRadioListTile(
                                    value: (index + 1),
                                    groupValue:
                                        context.read<UserFormCubit>().value,
                                    index: index,
                                    titles:
                                        context.read<UserFormCubit>().titles,
                                    function: (int? val) {
                                      context
                                          .read<UserFormCubit>()
                                          .onRadioTapped(radioValue: val);
                                    },
                                  );
                                });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<UserFormCubit, UserFormStates>(
                        builder: (context, state) {
                          return DropdownButton(
                            isExpanded: true,
                            iconEnabledColor: Colors.black,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                            dropdownColor: Colors.white,
                            focusColor: Colors.black,
                            value:
                                context.read<UserFormCubit>().dropDownIntialVal,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: context
                                .read<UserFormCubit>()
                                .deopDownItemsList
                                .map((String items) {
                              return DropdownMenuItem(
                                  value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              context
                                  .read<UserFormCubit>()
                                  .ondropDownItemChanged(newValue);
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomContainer(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormHeaderText(headerText: 'Health status *'),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomRadioRow(
                        questionText: 'Do you suffer from chronic diseases? ',
                        blocBuilderWidget:
                            BlocBuilder<UserFormCubit, UserFormStates>(
                          builder: (context, state) {
                            return ListView.builder(
                                itemExtent: 120,
                                scrollDirection: Axis.horizontal,
                                controller:
                                    ScrollController(keepScrollOffset: false),
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return CustomRadioListTile(
                                    value: (index + 1),
                                    groupValue:
                                        context.read<UserFormCubit>().value,
                                    index: index,
                                    titles:
                                        context.read<UserFormCubit>().titles,
                                    function: (int? val) {
                                      context
                                          .read<UserFormCubit>()
                                          .onRadioTapped(radioValue: val);
                                    },
                                  );
                                });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomRadioRow(
                        questionText:
                            'Are you habituated to drugs and alcohol? ',
                        blocBuilderWidget:
                            BlocBuilder<UserFormCubit, UserFormStates>(
                          builder: (context, state) {
                            return ListView.builder(
                                itemExtent: 120,
                                scrollDirection: Axis.horizontal,
                                controller:
                                    ScrollController(keepScrollOffset: false),
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return CustomRadioListTile(
                                    value: (index + 1),
                                    groupValue:
                                        context.read<UserFormCubit>().value,
                                    index: index,
                                    titles:
                                        context.read<UserFormCubit>().titles,
                                    function: (int? val) {
                                      context
                                          .read<UserFormCubit>()
                                          .onRadioTapped(radioValue: val);
                                    },
                                  );
                                });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomRadioRow(
                        questionText: 'do you get a health checkup? ',
                        blocBuilderWidget:
                            BlocBuilder<UserFormCubit, UserFormStates>(
                          builder: (context, state) {
                            return ListView.builder(
                                itemExtent: 120,
                                scrollDirection: Axis.horizontal,
                                controller:
                                    ScrollController(keepScrollOffset: false),
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return CustomRadioListTile(
                                    value: (index + 1),
                                    groupValue:
                                        context.read<UserFormCubit>().value,
                                    index: index,
                                    titles:
                                        context.read<UserFormCubit>().titles,
                                    function: (int? val) {
                                      context
                                          .read<UserFormCubit>()
                                          .onRadioTapped(radioValue: val);
                                    },
                                  );
                                });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomContainer(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormHeaderText(headerText: 'Health status *'),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomRadioRow(
                        questionText: 'Do you suffer from chronic diseases? ',
                        blocBuilderWidget:
                            BlocBuilder<UserFormCubit, UserFormStates>(
                          builder: (context, state) {
                            return ListView.builder(
                                itemExtent: 120,
                                scrollDirection: Axis.horizontal,
                                controller:
                                    ScrollController(keepScrollOffset: false),
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return CustomRadioListTile(
                                    value: (index + 1),
                                    groupValue:
                                        context.read<UserFormCubit>().value,
                                    index: index,
                                    titles:
                                        context.read<UserFormCubit>().titles,
                                    function: (int? val) {
                                      context
                                          .read<UserFormCubit>()
                                          .onRadioTapped(radioValue: val);
                                    },
                                  );
                                });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomRadioRow(
                        questionText:
                            'Are you habituated to drugs and alcohol? ',
                        blocBuilderWidget:
                            BlocBuilder<UserFormCubit, UserFormStates>(
                          builder: (context, state) {
                            return ListView.builder(
                                itemExtent: 120,
                                scrollDirection: Axis.horizontal,
                                controller:
                                    ScrollController(keepScrollOffset: false),
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return CustomRadioListTile(
                                    value: (index + 1),
                                    groupValue:
                                        context.read<UserFormCubit>().value,
                                    index: index,
                                    titles:
                                        context.read<UserFormCubit>().titles,
                                    function: (int? val) {
                                      context
                                          .read<UserFormCubit>()
                                          .onRadioTapped(radioValue: val);
                                    },
                                  );
                                });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomRadioRow(
                        questionText: 'do you get a health checkup? ',
                        blocBuilderWidget:
                            BlocBuilder<UserFormCubit, UserFormStates>(
                          builder: (context, state) {
                            return ListView.builder(
                                itemExtent: 120,
                                scrollDirection: Axis.horizontal,
                                controller:
                                    ScrollController(keepScrollOffset: false),
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return CustomRadioListTile(
                                    value: (index + 1),
                                    groupValue:
                                        context.read<UserFormCubit>().value,
                                    index: index,
                                    titles:
                                        context.read<UserFormCubit>().titles,
                                    function: (int? val) {
                                      context
                                          .read<UserFormCubit>()
                                          .onRadioTapped(radioValue: val);
                                    },
                                  );
                                });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomContainer(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormHeaderText(headerText: 'Health status *'),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomRadioRow(
                        questionText: 'Do you suffer from chronic diseases? ',
                        blocBuilderWidget:
                            BlocBuilder<UserFormCubit, UserFormStates>(
                          builder: (context, state) {
                            return ListView.builder(
                                itemExtent: 120,
                                scrollDirection: Axis.horizontal,
                                controller:
                                    ScrollController(keepScrollOffset: false),
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return CustomRadioListTile(
                                    value: (index + 1),
                                    groupValue:
                                        context.read<UserFormCubit>().value,
                                    index: index,
                                    titles:
                                        context.read<UserFormCubit>().titles,
                                    function: (int? val) {
                                      context
                                          .read<UserFormCubit>()
                                          .onRadioTapped(radioValue: val);
                                    },
                                  );
                                });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomRadioRow(
                        questionText:
                            'Are you habituated to drugs and alcohol? ',
                        blocBuilderWidget:
                            BlocBuilder<UserFormCubit, UserFormStates>(
                          builder: (context, state) {
                            return ListView.builder(
                                itemExtent: 120,
                                scrollDirection: Axis.horizontal,
                                controller:
                                    ScrollController(keepScrollOffset: false),
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return CustomRadioListTile(
                                    value: (index + 1),
                                    groupValue:
                                        context.read<UserFormCubit>().value,
                                    index: index,
                                    titles:
                                        context.read<UserFormCubit>().titles,
                                    function: (int? val) {
                                      context
                                          .read<UserFormCubit>()
                                          .onRadioTapped(radioValue: val);
                                    },
                                  );
                                });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomRadioRow(
                        questionText: 'do you get a health checkup? ',
                        blocBuilderWidget:
                            BlocBuilder<UserFormCubit, UserFormStates>(
                          builder: (context, state) {
                            return ListView.builder(
                                itemExtent: 120,
                                scrollDirection: Axis.horizontal,
                                controller:
                                    ScrollController(keepScrollOffset: false),
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return CustomRadioListTile(
                                    value: (index + 1),
                                    groupValue:
                                        context.read<UserFormCubit>().value,
                                    index: index,
                                    titles:
                                        context.read<UserFormCubit>().titles,
                                    function: (int? val) {
                                      context
                                          .read<UserFormCubit>()
                                          .onRadioTapped(radioValue: val);
                                    },
                                  );
                                });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
