// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/bloc/weather_state.dart';
import 'package:weather_app/widgets/weather_view_sun.dart';
import 'package:weather_app/widgets/weather_view_temp.dart';

class WeatherView extends StatelessWidget {
  bool tempChecked;

  WeatherView(this.tempChecked, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherEmptyState) {
          return const Center(
            child: Text('No data. Press button "Load Weather'),
          );
        }

        if (state is WeatherLoadingState) {
          return Center(
              child: Padding(
            padding: EdgeInsets.only(top: height * 0.4),
            child: const CircularProgressIndicator(
              color: Colors.white,
            ),
          ));
        }

        if (state is WeatherLoadedState) {
          return Center(
            child: Container(
              color: Colors.blueAccent,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.05),
                    child: Text(
                      "${state.loadedWeather!['name']}, ${state.loadedWeather!['sys']['country']}",
                      style: TextStyle(
                        fontSize: height * 0.05,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.05),
                    child: SvgPicture.asset(
                      'assets/${state.loadedWeather!['weather'][0]['icon']}.svg',
                      color: Colors.white,
                      height: height * 0.16,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.02),
                    child: Text(
                      '${state.loadedWeather!['weather'][0]['description'].toUpperCase()}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: height * 0.035,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.03),
                    child: WeatherViewTemp(tempChecked),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: height * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset(
                          'assets/barometer.svg',
                          color: Colors.white,
                          height: height * 0.025,
                        ),
                        Text(
                          " ${state.loadedWeather!['main']['pressure']} hpa    ",
                          style: TextStyle(
                            fontSize: height * 0.025,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/humidity.svg',
                          color: Colors.white,
                          height: height * 0.025,
                        ),
                        Text(
                          ' ${state.loadedWeather!['main']['humidity']} %    ',
                          style: TextStyle(
                            fontSize: height * 0.025,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/wind.svg',
                          color: Colors.white,
                          height: height * 0.025,
                        ),
                        Text(
                          ' ${state.loadedWeather!['wind']['speed']} m/s',
                          style: TextStyle(
                            fontSize: height * 0.025,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const WeatherViewSun(),
                ],
              ),
            ),
          );
        }

        if (state is WeatherErrorState) {
          return Padding(
            padding: EdgeInsets.only(top: height * 0.4),
            child: const Center(
              child: Text('Error loading weather. Please retrying.',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          );
        }
        return Center(
            child: Padding(
          padding: EdgeInsets.only(top: height * 0.4),
          child: const CircularProgressIndicator(
            color: Colors.white,
          ),
        ));
      },
    );
  }
}
