import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherApp/infinite_list.dart';
import 'package:weatherApp/services/states/comment_bloc.dart';
import 'package:weatherApp/services/states/comment_events.dart';

class InfiniteListApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InfiniteList',
      home: BlocProvider(
        create: (context) => CommentBloc()..add(CommentFetchedEvent()),
        child: InfiniteList(),
      ),
    );
  }
}