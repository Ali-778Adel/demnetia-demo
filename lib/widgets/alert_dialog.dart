import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  String? title;
  String? contentText;
  Function()?function;
  CustomAlertDialog({Key? key, this.title, this.contentText,this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        '$title',
        style: const TextStyle(
            color: Colors.red, fontSize: 18, fontWeight: FontWeight.normal),
      ),
      content: Text(
        '$contentText',
        style: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),
      ),
      actions: [
        Center(
          child: ElevatedButton(
            child: Row(
              children: const [
                Icon(Icons.refresh),
                Text(
                  'reload',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
            onPressed: function,
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),),
          ),
        )
      ],
    );
  }

}
