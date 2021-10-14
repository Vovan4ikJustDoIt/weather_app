import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/bloc/weather_state.dart';

class WeatherViewSun extends StatelessWidget {
  const WeatherViewSun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: width * 0.15),
              child: Column(
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/sunrise.svg',
                    color: Colors.white,
                    height: height * 0.11,
                  ),
                  Text(
                    sunConvert(
                        state.loadedWeather!['sys']['sunrise'].toString()),
                    style: TextStyle(
                      fontSize: height * 0.025,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: Column(
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/sunset.svg',
                    color: Colors.white,
                    height: height * 0.11,
                  ),
                  Text(
                    sunConvert(
                        state.loadedWeather!['sys']['sunset'].toString()),
                    style: TextStyle(
                      fontSize: height * 0.025,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );

        //return Center(child: CircularProgressIndicator());
      },
    );
  }

  String sunConvert(String value) {
    var dt = DateTime.fromMillisecondsSinceEpoch(int.parse(value) * 1000);
    String hour =
        (dt.hour) < 10 ? "0" + (dt.hour).toString() : (dt.hour).toString();
    String minute = (dt.minute) < 10
        ? "0" + (dt.minute).toString()
        : (dt.minute).toString();
    if (hour == '13') {
      hour = '1';
      minute = minute + ' PM';
    } else if (hour == '14') {
      hour = '2';
      minute = minute + ' PM';
    } else if (hour == '15') {
      hour = '3';
      minute = minute + ' PM';
    } else if (hour == '16') {
      hour = '4';
      minute = minute + ' PM';
    } else if (hour == '17') {
      hour = '5';
      minute = minute + ' PM';
    } else if (hour == '18') {
      hour = '6';
      minute = minute + ' PM';
    } else if (hour == '19') {
      hour = '7';
      minute = minute + ' PM';
    } else if (hour == '20') {
      hour = '8';
      minute = minute + ' PM';
    } else if (hour == '21') {
      hour = '9';
      minute = minute + ' PM';
    } else if (hour == '22') {
      hour = '10';
      minute = minute + ' PM';
    } else if (hour == '23') {
      hour = '11';
      minute = minute + ' PM';
    } else {
      minute = minute + ' AM';
    }
    return hour + ':' + minute;
  }
}
