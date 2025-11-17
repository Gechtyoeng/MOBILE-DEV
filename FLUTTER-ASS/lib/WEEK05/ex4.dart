// ==== exercise 4 the weather forecast
import 'package:flutter/material.dart';
import './weather.dart';

void main() {
  // create a list of weather
  List<Weather> weathers = [
    Weather(placeName: 'PhnomPenh', type: WeatherType.sunny, current: 20, min: 10, max: 30),
    Weather(placeName: 'Paris', type: WeatherType.sunnyCloudy, current: 20, min: 10, max: 30),
    Weather(placeName: 'Rome', type: WeatherType.veryCloudy, current: 20, min: 10, max: 30),
    Weather(placeName: 'Toulouse', type: WeatherType.cloudy, current: 20, min: 10, max: 30),
    Weather(placeName: 'Toulouse', type: WeatherType.cloudy, current: 20, min: 10, max: 30),
    Weather(placeName: 'Toulouse', type: WeatherType.cloudy, current: 20, min: 10, max: 30),
  ];

  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.blue[200]),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: ListView(children: [for (var weather in weathers) WeatherCard(weather: weather)]),
        ),
      ),
    ),
  );
}

//stateless widget for weather card
class WeatherCard extends StatelessWidget {
  final Weather weather;
  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: PhysicalModel(
        elevation: 10,
        shape: BoxShape.rectangle,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [weather.type.firstColor, weather.type.secondColor != null ? weather.type.secondColor! : weather.type.firstColor],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                right: -30,
                top: -40,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(colors: [weather.type.firstColor, weather.type.secondColor != null ? weather.type.secondColor! : weather.type.firstColor]),
                  ),
                ),
              ),
              Positioned(
                right: -30,
                top: -40,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(colors: [weather.type.firstColor, weather.type.secondColor != null ? weather.type.secondColor! : weather.type.firstColor]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 20, right: 15, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(radius: 30, backgroundImage: AssetImage(weather.type.image)),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(weather.placeName, style: const TextStyle(color: Colors.white, fontSize: 20)),
                            const SizedBox(height: 10),
                            Text('Min ${weather.minTemp}°C', style: const TextStyle(color: Colors.white, fontSize: 12)),
                            Text('Max ${weather.maxTemp}°C', style: const TextStyle(color: Colors.white, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                    Text('${weather.currentTemp}°C', style: const TextStyle(color: Colors.white, fontSize: 24)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
