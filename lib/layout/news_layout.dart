import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/cubit/states.dart';

import '../shared/cubit/cubit.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getBusinessData(),
       child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppCubit.get(context);
              return Scaffold(
                appBar: AppBar(
                  title: Text('News App'),
                  actions: [
                    IconButton(icon: Icon(Icons.search), onPressed: () {  },)
                  ],
                ),
                body: cubit.screens[cubit.CurrentIndex],
                bottomNavigationBar: BottomNavigationBar(
                  items: cubit.items,
                  currentIndex: cubit.CurrentIndex,
                  onTap: (index) => cubit.onTapBottomNav(index),
                ),
          );},
  )
    );}
}
