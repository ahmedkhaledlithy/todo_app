import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_prof_app/blocs/bottom_nav/bottom_tab_cubit.dart';
import 'package:todo_prof_app/modules/search_tasks/search.dart';
import 'package:todo_prof_app/modules/settings/settings_screen.dart';
import 'package:todo_prof_app/shared/bottom_navigation_bar.dart';

import 'home.dart';


class BottomNavigation extends StatelessWidget {

  Widget getBody(int state) {
    List<Widget> pages = [HomeScreen(), SearchScreen(), SettingsScreen()];
    return IndexedStack(index: state, children: pages);
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<BottomNavCubit, int>(
        builder: (context, state) {
          return Scaffold(
            body: getBody(state),
            bottomNavigationBar: _buildBottomBar(context),
          );
        }
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return FlashyTabBar(
      selectedIndex: context.read<BottomNavCubit>().state,
      backgroundColor: Colors.white,

      items: <FlashyTabBarItem>[
        FlashyTabBarItem(
          icon: Icon(Icons.home_outlined,),
          title: Text('TASKS'),

        ),
        FlashyTabBarItem(
          icon: Icon(Icons.search,),
          title: Text('SEARCH'),
        ),
        FlashyTabBarItem(
          icon: Icon(Icons.settings),
          title: Text('SETTINGS'),
        ),
      ],
      onItemSelected: (index) {
        context.read<BottomNavCubit>().updateIndex(index);
      },
    );
  }


}

