import 'package:dementiademo/cubit/user_form_cubit.dart';
import 'package:flutter/material.dart';

import 'form_container_decoration.dart';

class UserEducationProfile extends StatelessWidget {
  const UserEducationProfile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: UserFormCubit.userEducationFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            CustomContainer(
              containerText: 'In which college were you? ',
              child: TextFormField(
                controller: UserFormCubit.formTextEditingController[
                    'educationalProfileTEC'][0]['collegeC'],
                decoration: const InputDecoration(
                    icon: Icon(Icons.title),
                    hintText: 'please enter your college name ',
//                labelText: 'name',
                    label: Text('please enter your college name ')),
                validator: (String? message) {
                  if (UserFormCubit
                      .formTextEditingController[
                          'educationalProfileTEC'][0]['collegeC']
                      .text
                      .isEmpty) {
                    return message = "college name musn't be empty";
                  }
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomContainer(
              containerText: 'What is your graduation year * ',
              child: TextFormField(
                controller: UserFormCubit.formTextEditingController[
                    'educationalProfileTEC'][0]['graduationYearC'],
                decoration: const InputDecoration(
//                      fillColor: Colors.limeAccent,
                  icon: Icon(Icons.calendar_today),
                  labelText: 'graduation year',
                  hintText: 'please enter your garduation year ',
                ),
                validator: (String? message) {
                  if (UserFormCubit
                      .formTextEditingController[
                          'educationalProfileTEC'][0]['graduationYearC']
                      .text
                      .isEmpty) {
                    return message = "graduation year musn't be empty";
                  }
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomContainer(
              containerText: 'Tell me about your educational background* ',
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: UserFormCubit.formTextEditingController[
                          'educationalProfileTEC'][0]
                      ['educationalBackgroundC'],
                  decoration: const InputDecoration(
//                      fillColor: Colors.limeAccent,
                    icon: Icon(Icons.location_city),
                    labelText: 'eduacational background',
                    hintText: 'please enter your educational background ',
                  ),
                  validator: (String? message) {
                    if (UserFormCubit
                        .formTextEditingController[
                            'educationalProfileTEC'][0]
                            ['educationalBackgroundC']
                        .text
                        .isEmpty) {
                      return message = "eduacational background musn't be empty";
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomContainer(
              containerText: 'How was your education prepared you for your career? ',
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: UserFormCubit.formTextEditingController[
                          'educationalProfileTEC'][0]
                      ['carrerInfoC'],
                  decoration: const InputDecoration(
//                      fillColor: Colors.limeAccent,
                    icon: Icon(Icons.phone),
                    labelText: 'carrer',
                    hintText: 'your answer ',
                  ),
                  validator: (String? message) {
                    if (UserFormCubit
                        .formTextEditingController[
                            'educationalProfileTEC'][0]
                            ['carrerInfoC']
                        .text
                        .isEmpty) {
                      return message = "creer info musn't be empty";
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
