import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherApp/weather/blocs/weather_bloc.dart';
import 'package:weatherApp/weather/repositories/weather_repository.dart';
import 'package:weatherApp/weather/screen/weather_screen.dart';

class WeatherApp extends StatelessWidget {
  final WeatherRepository weatherRepository;

  const WeatherApp({Key key, this.weatherRepository})
      : assert(weatherRepository != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Weather',
        home: BlocProvider(
        create: (context) => WeatherBloc(
            weatherRepository: weatherRepository
        ),
          child: WeatherScreen(),
    ));
  }
}