import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherApp/weather/events/theme_event.dart';
import 'package:weatherApp/weather/model/weather.dart';
import 'package:weatherApp/weather/states/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc():
      super(ThemeState(
          backgroundColor: Colors.lightBlue,
          textColor: Colors.white)
      );
  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    ThemeState newThemeState;
    if(event is ThemeEventWeatherChanged) {
      final weatherCondition = event.weatherCondition;
      if(weatherCondition == WeatherCondition.clear ||
      weatherCondition == WeatherCondition.lightCloud) {
        newThemeState = ThemeState(
            backgroundColor: Colors.yellow,
            textColor: Colors.black
        );
      } else if (weatherCondition == WeatherCondition.hail ||
      weatherCondition == WeatherCondition.sleet ||
      weatherCondition == WeatherCondition.snow) {
        newThemeState = ThemeState(backgroundColor: Colors.lightBlue,
            textColor: Colors.white);
      } else if (weatherCondition == WeatherCondition.heavyCloud) {
        newThemeState = ThemeState(backgroundColor: Colors.grey,
            textColor: Colors.black);
      } else if (weatherCondition == WeatherCondition.heavyRain ||
          weatherCondition == WeatherCondition.lightRain||
          weatherCondition == WeatherCondition.showers) {
        newThemeState = ThemeState(backgroundColor: Colors.indigo,
            textColor: Colors.white);
      }  else if (weatherCondition == WeatherCondition.thunderstorm) {
        newThemeState = ThemeState(backgroundColor: Colors.deepPurple,
            textColor: Colors.white);
      }  else {
        newThemeState = ThemeState(backgroundColor: Colors.lightBlue,
            textColor: Colors.white);
      }
      yield newThemeState;
    }
  }
}