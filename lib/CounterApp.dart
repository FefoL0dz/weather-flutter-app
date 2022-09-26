import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherApp/Counter_Page.dart';
import 'package:weatherApp/blocs/counter_bloc.dart';

class CounterApp extends StatelessWidget {

  Stream<int> _aStreamFunc() async* {
    yield 2;
    yield 5;
    yield 7;
  }

  void _test() {
    final aStream = this._aStreamFunc();
    aStream.forEach((element) { print(element);});
  }

  @override
  Widget build(BuildContext context) {
   // _test();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
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
      home: BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: CounterPage(),
      )
    );
  }
}