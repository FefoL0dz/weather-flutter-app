import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherApp/weather/events/weather_event.dart';
import 'package:weatherApp/weather/model/weather.dart';
import 'package:weatherApp/weather/repositories/weather_repository.dart';
import 'package:weatherApp/weather/states/weather_states.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc({@required this.weatherRepository}):
      assert(weatherRepository != null),
  super(WeatherStateInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if(event is WeatherEventRequested) {
     yield WeatherStateLoading();
     try {
       final Weather weather = await weatherRepository.getWeatherFromCity(event.city);
       yield WeatherStateSuccess(weather: weather);
     } catch(exception) {
       yield WeatherStateFailure();
     }
    } else if (event is WeatherEventRefresh) {
      try {
        final Weather weather = await weatherRepository.getWeatherFromCity(event.city);
        yield WeatherStateSuccess(weather: weather);
      } catch(exception) {
        yield WeatherStateFailure();
      }
    }
  }
}