import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget{
 Widget ?child;
 CustomContainer({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:const EdgeInsets.all(15),
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(5, 5),
                blurRadius: 2,
                spreadRadius: 2)
          ],
          borderRadius:BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15))
      ),
      child: child,
    );
  }


}

