import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/search_screen/Search_Screen.dart';
import 'package:newsapp/shared/cubit/states.dart';

import '../shared/cubit/cubit.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('News App'),
              actions: [
                IconButton(icon: Icon(Icons.search), onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
                },),
                IconButton(icon: Icon(Icons.brightness_6), onPressed: () {
                  return AppCubit.get(context).ChangeMode();
                },)
              ],
            ),
            body: cubit.screens[cubit.CurrentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.items,
              currentIndex: cubit.CurrentIndex,
              onTap: (index) => cubit.onTapBottomNav(index),
            ),
          );
        },
      );
  }
}
