import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherApp/models/Food.dart';

class DetailFoodPage extends StatelessWidget {
  Food food;

  DetailFoodPage({this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${food.name}'),),
      body: Column(children: <Widget>[
        Center(child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/loading.gif',
            image: food.urlImage),),
        Text('ingredients'),
       Expanded(child: ListView.builder(itemBuilder: (context, index) {
         String ingredient = this.food.ingredients[index];
         return ListTile(
           leading: CircleAvatar(
               child: Text('${index+1}'),
           ),
           title: Text(ingredient,
               style: TextStyle(fontSize:20)),
         );
       }, itemCount: this.food.ingredients.length))
      ],),
    );
  }
  
}