import 'package:dementiademo/cubit/user_form_cubit.dart';
import 'package:dementiademo/cubit_states/user_form_states.dart';
import 'package:dementiademo/widgets/custom_appbar.dart';
import 'package:dementiademo/widgets/form/custom_form_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class UserFormScreen extends StatelessWidget {
 const UserFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe5e5e5),
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: BlocBuilder<UserFormCubit, UserFormStates>(
          builder: (context, state) {
            return CustomAppBar(
              title: context.read<UserFormCubit>().titles[context.read<UserFormCubit>().currentIndex],bottom: Center(),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: BlocBuilder<UserFormCubit,UserFormStates>(
                builder: (context,state) {
                  UserFormCubit userFormCubit=UserFormCubit.get(context);
                  return PageView.builder(
                    itemCount: context.read<UserFormCubit>().titles.length,
                    physics: const  NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return context.read<UserFormCubit>().pageViewScreens[index];
                    },
                    controller: userFormCubit.pageViewController,
                    onPageChanged: (index){
                      userFormCubit.onPagechanged(index: index);
                    },
                  );
                }
              ),
            ),
            BlocBuilder<UserFormCubit,UserFormStates>(builder: (context,state){
              return CustomFormButton(key: key,buttonText: 'submit',function: (){
              context.read<UserFormCubit>().onSubmit(context: context);
              },);
            })
          ],
        ),
      ),
    );
  }
}
