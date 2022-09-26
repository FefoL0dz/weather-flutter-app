import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category {
  final int id;
  final String content;
  final Color color;

  const Category({
    @required this.id,
    @required this.content,
    this.color = Colors.green,
});
}