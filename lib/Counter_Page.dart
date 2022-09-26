import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherApp/blocs/counter_bloc.dart';
import 'package:weatherApp/events/counter_event.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = context.bloc<CounterBloc>();
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, counter) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Two Events Here:'),
                Container(
                  child: FlatButton(
                    child: Text('Increment (+)'),
                    onPressed: () {
                      counterBloc.add(CounterEvent.increase);
                    },
                  ),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.amber),
                ),
                Container(
                  child: FlatButton(
                    child: Text('Decrement (-)'),
                    onPressed: () {
                      counterBloc.add(CounterEvent.decrease);
                    },
                  ),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.deepPurpleAccent),
                ),
                Text('$counter'),
              ],
            );
          },
        )
      ),
    );
  }

}