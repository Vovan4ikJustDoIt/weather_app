import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_event.dart';
import 'package:weather_app/bloc/weather_state.dart';
import 'package:weather_app/services/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository, WeatherState initialState)
      : super(initialState);

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherLoadEvent) {
      yield WeatherLoadingState();
      try {
        final Map _loadedWeatherList = await weatherRepository.getAllWeather();
        yield WeatherLoadedState(loadedWeather: _loadedWeatherList);
      } catch (_) {
        yield WeatherErrorState();
      }
    }
  }
}
