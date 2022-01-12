import 'package:flutter/material.dart';
class CustomFormButton extends StatelessWidget {
  String ?buttonText;
  Function ()?function;
   CustomFormButton({Key? key,this.buttonText,this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
            fixedSize: MaterialStateProperty.all<Size>(const Size(100,30))),
        onPressed: function, child:Text(buttonText!,style:const TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 22),));
  }
}
