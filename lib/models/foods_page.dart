import 'package:flutter/material.dart';
import 'package:weatherApp/models/Food.dart';
import 'package:weatherApp/models/category.dart';
import 'package:weatherApp/models/fake_data.dart';

import 'detail_food_page.dart';

class FoodsPage extends StatelessWidget {
  static const String routeName = '/FoodsPage';
   Category category;
  @override
  Widget build(BuildContext context) {
    Map<String, Category> arguments = ModalRoute.of(context).settings.arguments;
    this.category = arguments['category'];
    List<Food> foods = FAKE_FOODS.where((element) => element.categoryId == this.category.id).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Foods from ${category.content}'),
        backgroundColor: category.color,
      ),
      body: Center(
          child: Center(
              child: ListView.builder(
                itemCount: foods.length,
                  itemBuilder: (context, index) {
                  Food food = foods[index];
                    return InkWell(child: Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            clipBehavior: Clip.hardEdge,
                            child: Center(
                              child: FadeInImage.assetNetwork(
                                  placeholder: 'assets/images/loading.gif',
                                  image: food.urlImage),
                            ),
                          ),
                        ),
                        Positioned(top: 30, left: 30,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.black45,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.white, width: 2)
                              ),
                              child: Row(children: <Widget>[
                                Icon(Icons.timer, color: Colors.white, size: 25,),
                                Text('${food.duration.inMinutes} minutes',
                                  style: TextStyle(fontSize: 22, color: Colors.white),)
                              ],),
                            )
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => DetailFoodPage(food: food)
                          ));
                    });
                  }
              ),
        )
      )
    );
  }

  FoodsPage({this.category});
}