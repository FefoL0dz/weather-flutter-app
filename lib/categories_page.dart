import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherApp/category_item.dart';
import 'package:weatherApp/models/fake_data.dart';


class CategoriesPage extends StatelessWidget {
  static const String routeName = '/CategoriesPage';
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(12),
      children: FAKE_CATEGORIES.map((e) => CategoryItem(category: e)).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio:3/2, //width / height
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
        ),
    );
  }

}