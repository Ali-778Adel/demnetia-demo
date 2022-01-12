import 'package:flutter/material.dart';
class CustomRadioListTile extends StatelessWidget {
  Key?key;
  int?value;
  int ?groupValue;
  String?title;
  int?index;
  List<String>?titles;
  Function(int?val)?function;
   CustomRadioListTile({Key? key,this.value,this.groupValue,this.function,this.title,this.index,this.titles}) : super(key: key) ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,width: 120,
      child: RadioListTile<int?>(
          value: value,
          groupValue: groupValue,
          onChanged:(int?val){
            function!(val!);
          },
        toggleable: true,

          activeColor:Colors.red ,
          title: Text(titles![index!],style:const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.normal),),
      ),
    );
  }
}
