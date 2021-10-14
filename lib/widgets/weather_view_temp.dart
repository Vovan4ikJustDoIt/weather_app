// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/bloc/weather_state.dart';

class WeatherViewTemp extends StatelessWidget {
  bool tempChecked;

  WeatherViewTemp(this.tempChecked, {Key? key}) : super(key: key);

  String tempConvert(String temp, bool tempChecked) {
    double fahrenheit = (double.parse(temp) - 273.15) * (9 / 5) + 32;
    double celsius = double.parse(temp) - 273.15;
    if (tempChecked == false) {
      return celsius.toString().split('.')[0] + " °C";
    } else {
      return fahrenheit.toString().split('.')[0] + " °F";
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Text(
          tempConvert(
              state.loadedWeather!['main']['temp'].toString(), tempChecked),
          style: TextStyle(
            fontSize: height * 0.08,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        );
      },
    );
  }
}
