// create a stateful widget display the weather lifecycle

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.blueGrey, width: 2),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('SEASONS', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(child: SeasonCard(country: 'Cambodia')),
                      const SizedBox(width: 10),
                      Expanded(child: SeasonCard(country: 'China')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

//enum for season type
enum SeasonType {
  spring(imagePath: 'assets/season/spring.jpg'),
  summer(imagePath: 'assets/season/summer.jpg'),
  fall(imagePath: 'assets/season/fall.jpg'),
  winter(imagePath: 'assets/season/winter.jpg');

  final String imagePath;
  const SeasonType({required this.imagePath});
}

class SeasonCard extends StatefulWidget {
  final String country;
  const SeasonCard({super.key, required this.country});

  @override
  State<SeasonCard> createState() => _SeasonCardState();
}

class _SeasonCardState extends State<SeasonCard> {
  SeasonType currentSeason = SeasonType.spring;

  void handleNextSeason() {
    setState(() {
      final seasons = SeasonType.values;
      int currentIndex = seasons.indexOf(currentSeason);
      int nextIndex = (currentIndex + 1) % seasons.length;

      currentSeason = seasons[nextIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(onTap: handleNextSeason, child: Image.asset(currentSeason.imagePath)),
        const SizedBox(height: 10),
        Text(widget.country, style: TextStyle(fontSize: 24)),
      ],
    );
  }
}
