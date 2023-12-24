import 'package:clima_weather_app/screens/location_screen.dart';

import 'package:clima_weather_app/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    
   var weatherData=await  WeatherModel().getWeatherData();
    Navigator.push(context, MaterialPageRoute(builder: ((context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    })));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SpinKitFoldingCube(
        color: Colors.pink,
        size: 100,
      )),
    );
  }
}