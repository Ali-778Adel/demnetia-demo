import 'package:dementiademo/cubit/user_form_cubit.dart';
import 'package:dementiademo/cubit_states/user_form_states.dart';
import '../widgets/form/cutom_radio_listtile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Test2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width*.95,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Expanded(
                flex: 4,
                child: Text('Do you have a wife ?',style: TextStyle(
                  fontSize: 22,
                ),),
              ),
              Expanded(
                flex: 5,
                child: BlocBuilder<UserFormCubit, UserFormStates>(
                  builder: (context, state) {
                    return ListView.builder(
                      itemExtent: 120,
                        scrollDirection: Axis.horizontal,
                        controller: ScrollController(keepScrollOffset: false),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return CustomRadioListTile(
                            value: (index + 1),
                            groupValue: context.read<UserFormCubit>().value,
                            index: index,
                            titles: context.read<UserFormCubit>().titles,
                            function: (int? val) {
                              context
                                  .read<UserFormCubit>()
                                  .onRadioTapped(radioValue: val);
                            },
                          );
                        });
                  },
                ),
              )
            ],

          ),
        ),
      ),
    );

  }
}
