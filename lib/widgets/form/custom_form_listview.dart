import 'package:flutter/material.dart';
class CustomFormListview extends StatelessWidget {
  Widget?listViewWidget;
   CustomFormListview({Key? key,this.listViewWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemExtent: 120,
        scrollDirection: Axis.horizontal,
        controller: ScrollController(keepScrollOffset: false),
        itemCount: 2,
        itemBuilder: (context, index) {
          return listViewWidget!;
        });
  }
}
