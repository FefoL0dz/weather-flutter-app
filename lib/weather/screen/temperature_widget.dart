import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherApp/weather/blocs/settings_bloc.dart';
import 'package:weatherApp/weather/blocs/theme_bloc.dart';
import 'package:weatherApp/weather/model/weather.dart';
import 'package:weatherApp/weather/states/settings_state.dart';
import 'package:weather_icons/weather_icons.dart';

class TemperatureWidget extends StatelessWidget {
  final Weather weather;
  TemperatureWidget({Key key, @required this.weather}) : assert(weather != null),
  super(key: key);

  int _toFahrenheit(double celsius) =>
      ((celsius * 9 / 5) + 32).round();
  String _formattedTemperature(double temp, TemperatureUnit temperatureUnit) =>
      temperatureUnit == TemperatureUnit.fahrenheit ? '${_toFahrenheit(temp)}ºF'
          : '${temp.round()}ºC';
  BoxedIcon _mapWeatherConditionToIcon({WeatherCondition weatherCondition}) {
    switch(weatherCondition) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
        return BoxedIcon(WeatherIcons.day_sunny);
        break;
      case WeatherCondition.hail:
      case WeatherCondition.snow:
      case WeatherCondition.sleet:
        return BoxedIcon(WeatherIcons.snow);
        break;
      case WeatherCondition.heavyCloud:
        return BoxedIcon(WeatherIcons.cloud_up);
        break;
      case WeatherCondition.heavyRain:
      case WeatherCondition.lightRain:
      case WeatherCondition.showers:
        return BoxedIcon(WeatherIcons.rain);
        break;
      case WeatherCondition.thunderstorm:
        return BoxedIcon(WeatherIcons.thunderstorm);
        break;
      case WeatherCondition.unknown:
        return BoxedIcon(WeatherIcons.sunset);
        break;
    }
    return BoxedIcon(WeatherIcons.sunset);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _mapWeatherConditionToIcon(weatherCondition: weather.weatherCondition),
            Padding(padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: BlocBuilder<SettingsBloc, SettingState>(
              builder: (context, settingsState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text('Min temp: ${
                    _formattedTemperature(
                        weather.minTemp,
                        settingsState.temperatureUnit)
                    }', style: TextStyle(fontSize: 18, color: BlocProvider.of<ThemeBloc>(context).state.textColor)),
                    Text('Temp: ${
                        _formattedTemperature(
                            weather.temp,
                            settingsState.temperatureUnit)
                    }', style: TextStyle(fontSize: 18, color: BlocProvider.of<ThemeBloc>(context).state.textColor)),
                    Text('Max temp: ${
                        _formattedTemperature(
                            weather.maxTemp,
                            settingsState.temperatureUnit)
                    }', style: TextStyle(fontSize: 18, color: BlocProvider.of<ThemeBloc>(context).state.textColor)),
                  ],
                );
              },

            ),),
          ],
        )
      ],
    );
  }
}