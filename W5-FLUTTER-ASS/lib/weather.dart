// === this file contain class for the weather
import 'package:flutter/material.dart';

// enum to store different weather
enum WeatherType {
  cloudy(image: 'assets/ex4/cloudy.png',firstColor: Color.fromARGB(255, 180, 83, 197), secondColor: Color.fromARGB(255, 193, 98, 209)),
  sunny(image: 'assets/ex4/sunny.png',firstColor: Color.fromARGB(255, 251, 86, 86), secondColor: Color.fromARGB(255, 247, 142, 135)),
  sunnyCloudy(image: 'assets/ex4/sunnyCloudy.png',firstColor: Color.fromARGB(255, 82, 216, 152), secondColor: Color.fromARGB(255, 146, 224, 149)),
  veryCloudy(image: 'assets/ex4/veryCloudy.png',firstColor: Color.fromARGB(255, 229, 170, 60), secondColor: Color.fromARGB(255, 223, 173, 98));

  final String image;
  final Color firstColor;
  final Color? secondColor;

  const WeatherType({required this.image,required this.firstColor, this.secondColor});
}

//class for each weather
class Weather {
  final String placeName;
  final double min;
  final double max;
  final double current;
  final WeatherType type;

  Weather({required this.placeName, required this.type, required this.current, required this.min, required this.max});

  String get currentTemp => current.toStringAsFixed(1);
  String get minTemp => min.toStringAsFixed(1);
  String get maxTemp => max.toStringAsFixed(1);
}
