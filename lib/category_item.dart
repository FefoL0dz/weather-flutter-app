import 'package:flutter/material.dart';
import 'package:weatherApp/models/category.dart';

import 'models/foods_page.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  //Function _onTap = () {};
  CategoryItem({this.category});

  @override
  Widget build(BuildContext context) {
    final Color _color = this.category.color;
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) => FoodsPage(category: this.category,)
        // )
        // );
        Navigator
            .pushNamed(context,
            FoodsPage.routeName, arguments: {
              'category': category
            });
      },
      splashColor: Colors.deepPurple,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              this.category.content,
              style: Theme.of(context).textTheme.title,
              // TextStyle(fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.white)
            )
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              _color.withOpacity(0.25),
              _color,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          color: _color,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
