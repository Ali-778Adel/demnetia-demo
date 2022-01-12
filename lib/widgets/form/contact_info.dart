import 'package:dementiademo/cubit/user_form_cubit.dart';
import 'package:flutter/material.dart';

import 'form_container_decoration.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: UserFormCubit.userContactInfoFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            CustomContainer(
              containerText: 'What is your mobile number ? ',
              child: TextFormField(
                controller: UserFormCubit.formTextEditingController[
                    'ContactInfoTEC'][0]['mobileNumberC'],
                decoration: const InputDecoration(
                    icon: Icon(Icons.title),
                    hintText: 'please enter your mobile number ',
//                labelText: 'name',
                    label: Text('what is your mobile number ')),
                validator: (String? message) {
                  if (UserFormCubit
                      .formTextEditingController[
                          'ContactInfoTEC'][0]
                          ['mobileNumberC']
                      .text
                      .isEmpty) {
                    return message = "this answer is required";
                  }
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomContainer(
              containerText: 'please enter the phone that you call frequently* ',
              child: TextFormField(
                controller: UserFormCubit.formTextEditingController[
                    'ContactInfoTEC'][0]['frequentlyCallMobileNumC'],
                decoration: const InputDecoration(
//                      fillColor: Colors.limeAccent,
                  icon: Icon(Icons.calendar_today),
                  labelText: 'your answer',
                  hintText: 'please enter the phone that you call frequently ',
                ),
                validator: (String? message) {
                  if (UserFormCubit
                      .formTextEditingController[
                          'ContactInfoTEC'][0]
                          ['frequentlyCallMobileNumC']
                      .text
                      .isEmpty) {
                    return message = "this answer is requuired";
                  }
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
