import 'package:flutter/material.dart';

class CustomElvateButton extends StatelessWidget {
  String ?buttonText;
  IconData ?iconData;
  Function()?function;
  CustomElvateButton({required this.buttonText,this.iconData,this.function});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: function,
        child: Row(children: [
          Icon(iconData),
          Text('$buttonText', style: (Theme.of(context).textTheme.headline6)!
              .copyWith(color: Colors.blue))
        ],),
      style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all<Color>(
              Colors.white),
          foregroundColor:
          MaterialStateProperty.all<Color>(
              Colors.grey.withOpacity(0.5)),
          shadowColor: MaterialStateProperty.all<Color>(
              Colors.grey.withOpacity(0.9))),
    );
  }
}
