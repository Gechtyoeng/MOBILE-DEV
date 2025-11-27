import 'package:flutter/material.dart';
import 'data/joke_data.dart';
import 'ui/screen/joke.dart';

void main() {
  runApp(MaterialApp(home: JokeList(jokes: newJokes)));
}

