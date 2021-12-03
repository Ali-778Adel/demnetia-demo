import 'package:dementiademo/cubit/user_form_cubit.dart';
import 'package:dementiademo/cubit_states/user_form_states.dart';
import '../widgets/form/cutom_radio_listtile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Flexible(
          fit: FlexFit.loose,
//          flex: 1,
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: Row(
              children: [
              const Text(
                  '* Do you have a wife ?',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                BlocBuilder<UserFormCubit, UserFormStates>(
                  builder: (context, state) {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: ScrollController(keepScrollOffset: false),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 60,
                            width: 140,
                            child: CustomRadioListTile(
                              value: (index + 1),
                              groupValue: context.read<UserFormCubit>().value,
                              index: index,
                              titles: context.read<UserFormCubit>().titles,
                              function: (int? val) {
                                context
                                    .read<UserFormCubit>()
                                    .onRadioTapped(radioValue: val);
                              },
                            ),
                          );
                        });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
