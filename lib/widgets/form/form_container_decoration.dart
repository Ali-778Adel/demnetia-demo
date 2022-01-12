import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget{
  String ?containerText;
 Widget ?child;
 double?containerHeight;
 CustomContainer({Key? key, this.child,this.containerText,this.containerHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: containerHeight,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(containerText!,style:const TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 18),),
          const SizedBox(height: 20,),
          child!
        ],
      ),
    );
  }


}

