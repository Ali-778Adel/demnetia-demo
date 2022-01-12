import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  TabController? tabController;
  Function(int?)? function;
  CustomTabBar({Key? key, this.tabController, this.function}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TabBar(
        isScrollable: true,
        physics: const BouncingScrollPhysics(),
        indicatorColor: Colors.black,
        controller: tabController,
        onTap: function,
        tabs: const [
          Tab(
            icon: Icon(Icons.work),
            text: 'done missions',
          ),
          Tab(
            icon: Icon(Icons.title),
            text: 'done missions',
          ),
          Tab(icon: Icon(Icons.done), text: 'daily missions'),
          Tab(
            icon: Icon(Icons.archive),
            text: 'archeived missions',
          ),
          Tab(
            icon: Icon(Icons.location_on),
            text: 'saved places',
          ),
        ]);
  }
}
