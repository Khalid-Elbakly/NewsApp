import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/components/components.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';

class BuisnessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = AppCubit.get(context).business;

          return ArticleBuilder(list,context);
        });
  }
}
