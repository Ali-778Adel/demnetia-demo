import 'package:dementiademo/cubit/home_page_cubit.dart';
import 'package:dementiademo/cubit_states/home_page_states.dart';
import 'package:dementiademo/widgets/custom_appbar.dart';
import 'package:dementiademo/widgets/custom_bottom_nav_bar.dart';
import 'package:dementiademo/widgets/custom_drawer.dart';
import 'package:dementiademo/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TabController ?tabController;
    return DefaultTabController(
        length: context.read<HomePageCubit>().relatedTabBarWidgets.length,
        initialIndex: 0,
        child:Scaffold(
          appBar: PreferredSize(
            preferredSize:const Size(double.infinity,160),
            child: CustomAppBar(title: 'Dementia',
              bottom: BlocBuilder<HomePageCubit,HomePageStates>(
                  builder: (context, state) {
                    return CustomTabBar(
                      tabController: tabController,
                      function: (index)=>context.read<HomePageCubit>().onTabBarItemTapped(index: index,context: context,tabController: tabController),
                    );
                  }
              ),
            ),

          ),
          drawer: CustomDrawer(),
          body: BlocBuilder<HomePageCubit,HomePageStates>(
            builder: (context,state){
              return TabBarView(children: context.read<HomePageCubit>().relatedTabBarWidgets);
            },
          ),
          bottomNavigationBar: BlocBuilder<HomePageCubit,HomePageStates>(
            builder: (context,state){
              return CustomBottomNavBar(currentIndex: context.read<HomePageCubit>().currentIndex,
                function: (index)=>context.read<HomePageCubit>().onBottomNavBarItemChanged(index: index),
              );
            },
          ),

        ));
  }
}
