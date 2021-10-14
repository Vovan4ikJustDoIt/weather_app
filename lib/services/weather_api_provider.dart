import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherProvider {
  Future getWeather(String query) async {
    final url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'q': query,
      'appid': "96cfe16052455262474d335a1e7c7a4a",
    });
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map weatherJson = json.decode(response.body);
      return weatherJson;
    } else {
      throw Exception('Error weather');
    }
  }
}
