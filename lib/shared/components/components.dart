import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';

Widget BuildArticleItem(article) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
               image: DecorationImage(image: NetworkImage('${article['urlToImage']}'),fit: BoxFit.cover)),
            ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: Text(
                  '${article["title"]}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                )),
                Text(
                  '${article["publishedAt"]}',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget myDivider() {
  return Container(
    color: Colors.grey[200],
    width: double.infinity,
    height: 2,
  );
}

Widget ArticleBuilder(list){
        return ConditionalBuilder(
          condition: list.length > 0,
          builder: (context) =>
              ListView.separated(itemBuilder: (context, index) =>
                  BuildArticleItem(list[index]),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: list.length),
          fallback: (context) => Center(child: CircularProgressIndicator()),);
      }
