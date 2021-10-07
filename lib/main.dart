import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('City'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              print('hello');
            },
          )
        ],
      ),
      body: Center(
        child: Container(
          color: Colors.blueAccent,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: height * 0.1),
                child: SvgPicture.asset(
                  'assets/01d.svg',
                  color: Colors.white,
                  height: height * 0.16,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.02),
                child: Text(
                  'CLEAR SKY',
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
                child: Text(
                  '28 °C',
                  style: TextStyle(
                    fontSize: height * 0.08,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.05),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/barometer.svg',
                        color: Colors.white,
                        height: height * 0.025,
                      ),
                      Text(
                        " 1032 hpa    ",
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
                        ' 29 %    ',
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
                        ' 3 m/s',
                        style: TextStyle(
                          fontSize: height * 0.025,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.15),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/sunrise.svg',
                            color: Colors.white,
                            height: height * 0.11,
                          ),
                          Text(
                            '6 AM',
                            style: TextStyle(
                              fontSize: height * 0.025,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/sunset.svg',
                            color: Colors.white,
                            height: height * 0.11,
                          ),
                          Text(
                            '6 PM',
                            style: TextStyle(
                              fontSize: height * 0.025,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
