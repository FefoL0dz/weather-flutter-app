import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherApp/weather/blocs/theme_bloc.dart';
import 'package:weatherApp/weather/blocs/weather_bloc.dart';
import 'package:weatherApp/weather/events/theme_event.dart';
import 'package:weatherApp/weather/events/weather_event.dart';
import 'package:weatherApp/weather/screen/city_search_screen.dart';
import 'package:weatherApp/weather/screen/settings_screen.dart';
import 'package:weatherApp/weather/screen/temperature_widget.dart';
import 'package:weatherApp/weather/states/theme_state.dart';
import 'package:weatherApp/weather/states/weather_states.dart';

class WeatherScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Completer<void> _completer;
  @override
  void initState() {
    super.initState();
    _completer = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('WeatherApp', style: TextStyle(fontSize: 15),),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.settings),
            onPressed: () {
          //Navi to setings scene
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => SettingsScreen()));
            }),
        IconButton(icon: Icon(Icons.search),
            onPressed: () async {
              //Navi to setings scene
              final typedCity = await Navigator.push(context, MaterialPageRoute(
                  builder: (context) => CitySearchScreen()
              ));
              if(typedCity != null) {
                BlocProvider.of<WeatherBloc>(context).add(
                  WeatherEventRequested(city: typedCity)
                );
              }
            }),
      ],
    ),
      body: Center(
        child: BlocConsumer<WeatherBloc, WeatherState>(
            builder: (context, weatherState) {
              if(weatherState is WeatherStateLoading) {
                return Center(child: CircularProgressIndicator());
              }

              if(weatherState is WeatherStateSuccess) {
                final weather = weatherState.weather;
                return BlocBuilder<ThemeBloc, ThemeState>(
                    builder: (context, themeState) {
                      return RefreshIndicator(
                          child: Container(
                            color: themeState.backgroundColor,
                            child: ListView(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(weather.location, style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: themeState.textColor
                                    ),),
                                    Padding(padding: EdgeInsets.symmetric(vertical: 2),),
                                    Center(
                                      child: Text(
                                        'Updated: ${TimeOfDay.fromDateTime(weather.lastUpdated).format(context)}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: themeState.textColor
                                        ),
                                      ),
                                    ),
                                    TemperatureWidget(weather: weather),
                                  ],
                                )
                              ],
                            ),
                          ),
                          onRefresh: () {
                            BlocProvider.of<WeatherBloc>(context).add(
                              WeatherEventRefresh(city: weather.location)
                            );
                            return _completer.future;
                          });
                    });
              }

              if(weatherState is WeatherStateFailure) {
                return Text(
                  'Something went wrong',
                  style: TextStyle(color: Colors.redAccent, fontSize: 16),
                );
              }

              return Center(child: Text(
                'select a location first!',
                style: TextStyle(fontSize: 30),
              ),);
            },
            listener: (context, weatherState) {
              if(weatherState is WeatherStateSuccess) {
                BlocProvider.of<ThemeBloc>(context).add(
                  ThemeEventWeatherChanged(
                      weatherCondition: weatherState
                          .weather.weatherCondition
                  ));
                _completer?.complete();
                _completer = Completer();
              }
            },
            ),
      ),
    );
  }

}