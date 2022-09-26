
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherApp/weather/blocs/settings_bloc.dart';
import 'package:weatherApp/weather/blocs/theme_bloc.dart';
import 'package:weatherApp/weather/blocs/weather_bloc_observer.dart';
import 'package:weatherApp/weather/repositories/weather_repository.dart';
import 'package:weatherApp/weather/weather_app.dart';
import 'package:http/http.dart' as http;

// void main() {
//   runApp(MaterialApp(
//     title: 'Transaction app',
//     theme: ThemeData(
//       primaryColor: Colors.pink[600],
//       accentColor: Colors.blue[200],
//     ),
//     home: ClassApp_9(),
//   ));
// }

// void main() => runApp(WeatherApp());

void main() {
  Bloc.observer = WeatherBlocObserver();
  final WeatherRepository weatherRepository = WeatherRepository(
      httpClient: http.Client()
  );

  // final Widget myWidget = MultiBlocProvider(
  //   providers: [
  //     BlocProvider<ThemeBloc>(create: (context) => ThemeBloc(),),
  //     BlocProvider<SettingsBloc>(create: (context) => SettingsBloc(),)
  //   ],
  //   child: WeatherApp(weatherRepository: weatherRepository,),
  // );
  // runApp(myWidget);

  runApp(
    BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: BlocProvider<SettingsBloc>(
        create: (context) => SettingsBloc(),
        child: WeatherApp(weatherRepository: weatherRepository,),
      ),
    )
  );
}
