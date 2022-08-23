import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/components/components.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          List<dynamic> list = AppCubit.get(context).search;

          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: textController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Search must be not empty';
                      }
                      return null;
                    },
                    onFieldSubmitted: (String value) {
                      AppCubit.get(context).getSearchData(value);
                    },
                    /*onChanged: (value){
                      AppCubit.get(context).getSearchData(value);
                    },*/
                    decoration: InputDecoration(
                        labelText: 'Search',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search,color: Colors.grey,),
                        labelStyle: TextStyle(color: Colors.grey),
                        prefixIconColor: Colors.grey),
                    style: TextStyle(color: Colors.grey),
                  ),
                  Expanded(child: ArticleBuilder(list, context)),
                ],
              ),
            ),
          );
        });
  }
}
