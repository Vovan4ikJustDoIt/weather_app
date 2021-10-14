import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/bloc/weather_event.dart';

class ActionsButtons extends StatefulWidget {
  const ActionsButtons({Key? key}) : super(key: key);

  @override
  State<ActionsButtons> createState() => _ActionsButtonsState();
}

class _ActionsButtonsState extends State<ActionsButtons> {
  @override
  void initState() {
    final WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);
    weatherBloc.add(WeatherLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
