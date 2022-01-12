import 'package:dementiademo/cubit/user_form_cubit.dart';
import 'package:flutter/material.dart';
import 'form_container_decoration.dart';


class LocationInfo extends StatelessWidget {
  const LocationInfo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: UserFormCubit.userLocationInfoFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            CustomContainer(
              containerText: 'please enter your address ? ',
              child: TextFormField(
                controller: UserFormCubit.formTextEditingController[
                'locationInfoTEC'][0]['addressC'],
                decoration: const InputDecoration(
                    icon: Icon(Icons.title),
                    hintText: 'please enter your address ',
//                labelText: 'name',
                    label: Text('address ')),
                validator: (String? message) {
                  if (UserFormCubit
                      .formTextEditingController[
                  'locationInfoTEC'][0]
                  ['addressC']
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
              containerText: 'please enter the location that you visit regularly* ',
              child: TextFormField(
                controller: UserFormCubit.formTextEditingController[
                'locationInfoTEC'][0]['frequentlyvisitedplaceC'],
                decoration: const InputDecoration(
//                      fillColor: Colors.limeAccent,
                  icon: Icon(Icons.calendar_today),
                  labelText: 'please enter the location that you visit regularly',
                  hintText: 'your answer ',
                ),
                validator: (String? message) {
                  if (UserFormCubit
                      .formTextEditingController[
                  'locationInfoTEC'][0]
                  ['frequentlyvisitedplaceC']
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
