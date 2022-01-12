import 'package:dementiademo/cubit/user_form_cubit.dart';
import 'package:dementiademo/widgets/form/form_container_decoration.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PersonalInfoWidget extends StatelessWidget {

 const PersonalInfoWidget(
      {Key? key,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics:const BouncingScrollPhysics(),
      child: Form(
        key:UserFormCubit.personalInfoFormKey ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5,),
            CustomContainer(
              containerText: 'What is your name * ',
              child: TextFormField(
                controller: UserFormCubit.formTextEditingController['personalInfoTextEditigController'][0]['nameController'],
                decoration:  const InputDecoration(
                  icon: Icon(Icons.title),
                  hintText: 'please enter your name ',
//                labelText: 'name',
                  label:Text('what is your name')
                ),
                validator: (String? message) {
                  if (UserFormCubit.formTextEditingController['personalInfoTextEditigController'][0]['nameController'].text.isEmpty) {
                    return message = "name musn't be empty";
                  }
                },
              ),
            ),
            const SizedBox(height:10,),
            CustomContainer(
              containerText: 'how old are you * ',
              child: TextFormField(
                controller: UserFormCubit.formTextEditingController['personalInfoTextEditigController'][0]['ageController'],
                decoration: const InputDecoration(
//                      fillColor: Colors.limeAccent,
                  icon: Icon(Icons.calendar_today),
                  labelText: 'age',
                  hintText: 'please enter your age ',
                ),
                validator: (String? message) {
                  if (UserFormCubit.formTextEditingController['personalInfoTextEditigController'][0]['ageController'].text.isEmpty) {
                    return message = "age musn't be empty";
                  }
                },
              ),
            ),
            const SizedBox(height: 10,),
            CustomContainer(
              containerText: 'where do you live * ',
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: UserFormCubit.formTextEditingController['personalInfoTextEditigController'][0]['locationController'],
                  decoration: const InputDecoration(
//                      fillColor: Colors.limeAccent,
                    icon: Icon(Icons.location_city),
                    labelText: 'location',
                    hintText: 'please enter your country ',
                  ),
                  validator: (String? message) {
                    if (UserFormCubit.formTextEditingController['personalInfoTextEditigController'][0]['locationController'].text.isEmpty) {
                      return message = "location musn't be empty";
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 10,),
            CustomContainer(
              containerText: 'What is your phone number * ',
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: UserFormCubit.formTextEditingController['personalInfoTextEditigController'][0]['phoneNumberController'],
                  decoration: const InputDecoration(
//                      fillColor: Colors.limeAccent,
                    icon: Icon(Icons.phone),
                    labelText: 'phone number',
                    hintText: 'please enter your phone number ',
                  ),
                  validator: (String? message) {
                    if (UserFormCubit.formTextEditingController['personalInfoTextEditigController'][0]['phoneNumberController'].text.isEmpty) {
                      return message = "phone number musn't be empty";
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 10,),
            CustomContainer(
              containerText: 'What is your national number * ',
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: UserFormCubit.formTextEditingController['personalInfoTextEditigController'][0]['nationalPhoneNumberController'],
                  decoration: const InputDecoration(
                    icon: Icon(Icons.phone_in_talk),
                    labelText: 'national phone number',
                    hintText: 'please enter your national phone number ',
                  ),
                  validator: (String? message) {
                    if (UserFormCubit.formTextEditingController['personalInfoTextEditigController'][0]['nationalPhoneNumberController']
                        .text.isEmpty) {
                      return message = "national phone number musn't be empty";
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 20,),
//         CustomFormButton(function: function,buttonText: 'submit',)
          ],
        ),
      ),
    );
  }
}
