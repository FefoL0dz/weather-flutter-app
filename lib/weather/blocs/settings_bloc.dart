 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherApp/weather/events/settings_event.dart';
import 'package:weatherApp/weather/states/settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingState> {
  SettingsBloc():super(SettingState(temperatureUnit: TemperatureUnit.celsius));
  @override
  Stream<SettingState> mapEventToState(SettingsEvent event) async* {
    if(event is SettingsEventToggleUnit) {
      yield SettingState(
          temperatureUnit: state.temperatureUnit == TemperatureUnit.celsius ?
              TemperatureUnit.fahrenheit : TemperatureUnit.celsius
      );
    }
  }

}