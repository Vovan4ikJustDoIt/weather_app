import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/bloc/weather_state.dart';
import 'package:weather_app/services/weather_repository.dart';
import 'package:weather_app/setting_view_weather_page.dart';
import 'package:weather_app/widgets/actions_buttons.dart';
import 'package:weather_app/widgets/weather_view.dart';

class WeatherPage extends StatelessWidget {
  final String query;
  final bool temp;
  final weatherState = WeatherEmptyState();

  WeatherPage({Key? key, required this.query, required this.temp})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final weatherRepository = WeatherRepository(query);
    return BlocProvider<WeatherBloc>(
      create: (context) => WeatherBloc(weatherRepository, weatherState),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingViewWeatherPage()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ),
        body: Center(
          child: Container(
            color: Colors.blueAccent,
            child: Column(
              children: [
                const ActionsButtons(),
                WeatherView(temp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
