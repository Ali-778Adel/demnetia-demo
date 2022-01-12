import 'package:dementiademo/cubit/user_form_cubit.dart';
import 'package:flutter/material.dart';

import 'form_container_decoration.dart';

class UserHealthProfile extends StatelessWidget {
  const UserHealthProfile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: UserFormCubit.userHealthProfileInfoFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            CustomContainer(
              containerText: 'What chronic diseases do you duffer from ? ',
              child: TextFormField(
                controller: UserFormCubit.formTextEditingController[
                'healthProfileTEC'][0]['chronicDiseasesC'],
                decoration: const InputDecoration(
                    icon: Icon(Icons.title),
                    hintText: 'please enter your mobile number ',
//                labelText: 'name',
                    label: Text('what is your mobile number ')),
                validator: (String? message) {
                  if (UserFormCubit
                      .formTextEditingController[
                  'healthProfileTEC'][0]
                  ['chronicDiseasesC']
                      .text
                      .isEmpty) {
                    return message = "this answer is required";
                  }
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
