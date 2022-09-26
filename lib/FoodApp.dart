import 'package:flutter/material.dart';
import 'package:weatherApp/categories_page.dart';
import 'package:weatherApp/models/foods_page.dart';

class FoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes:{
        '/FoodsPage': (context) => FoodsPage(),
        '/CategoriesPage': (context) => CategoriesPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        fontFamily: 'Great_Vibes',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(color: Color.fromRGBO(20, 52, 52, 1)),
          body2: TextStyle(color: Color.fromRGBO(20, 52, 52, 1)),
          title: TextStyle(
            fontSize: 25,
            fontFamily: 'Bonbon',
            color: Colors.white
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('Food\'s categories'),
        ),
        body: SafeArea(child: CategoriesPage()),
      ),
    );
  }
}