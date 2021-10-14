import 'package:weather_app/services/weather_api_provider.dart';

class WeatherRepository {
  String query;
  WeatherRepository(this.query);

  final WeatherProvider _weatherProvider = WeatherProvider();
  Future getAllWeather() => _weatherProvider.getWeather(query);
}
