import 'package:flutter/material.dart';
import 'gradiantButton.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
             gradiantButton(text: 'hello1', start: Colors.blue, end: Colors.red,),
             gradiantButton(text: 'hello2', start: Colors.blue, end: Colors.red,),
             gradiantButton(text: 'hello3', start: Colors.blue, end: Colors.red,),

            ],
          ),
        ),
      ),
    ),
  );
}
