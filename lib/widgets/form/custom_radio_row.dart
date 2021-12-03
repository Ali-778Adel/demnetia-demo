import 'package:flutter/material.dart';
class CustomRadioRow extends StatelessWidget {
  String? questionText;
  Widget? blocBuilderWidget;

  CustomRadioRow({Key? key,this.questionText,this.blocBuilderWidget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width * .99,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              questionText!,
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: blocBuilderWidget!,
          )
        ],
      ),
    );
  }
}
