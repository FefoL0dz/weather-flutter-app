import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherApp/events/counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch(event) {
      case CounterEvent.increase:
        var newState = state + 1;
        yield newState;
        break;
      case CounterEvent.decrease:
        var newState = state - 1;
        yield newState;
        break;
    }
  }
}