import 'package:flutter/foundation.dart';

abstract class WeatherState {
  get loadedWeather => null;
}

class WeatherEmptyState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  @override
  Map? loadedWeather;
  WeatherLoadedState({@required this.loadedWeather})
      : assert(loadedWeather != null);
}

class WeatherErrorState extends WeatherState {}
