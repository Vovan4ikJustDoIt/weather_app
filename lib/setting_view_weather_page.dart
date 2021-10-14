import 'package:flutter/material.dart';
import 'package:weather_app/weather_page.dart';

class SettingViewWeatherPage extends StatefulWidget {
  const SettingViewWeatherPage({Key? key}) : super(key: key);

  @override
  State<SettingViewWeatherPage> createState() => _SettingViewWeatherPageState();
}

class _SettingViewWeatherPageState extends State<SettingViewWeatherPage> {
  final textController = TextEditingController();
  bool tempChecked = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather setting'),
      ),
      body: Center(
        child: Container(
          width: width,
          color: Colors.white,
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(top: width * 0.09),
              child: Container(
                width: width * 0.7,
                color: Colors.white,
                child: TextField(
                  decoration: const InputDecoration(
                      hintText: 'City', icon: Icon(Icons.location_city)),
                  style: const TextStyle(fontSize: 20),
                  controller: textController,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: width * 0.09),
              child: ListTile(
                title: const Text(
                  'Temperature in Fahrenheit',
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Checkbox(
                  onChanged: (bool? value) {
                    setState(() {
                      tempChecked = value!;
                    });
                  },
                  value: tempChecked,
                ),
              ),
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (textController.text != "") {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => WeatherPage(
                        query: textController.text,
                        temp: tempChecked,
                      )),
              (Route<dynamic> route) => false,
            );
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Error'),
                  content:
                      const Text('The "City" input field must not be empty.'),
                  actions: <Widget>[
                    // ignore: deprecated_member_use
                    FlatButton(
                      child: const Text('Ok'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
