import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        padding: EdgeInsets.all(40),
        margin: EdgeInsets.all(50),
        color: Colors.blue[300],
        child: Container(
          decoration: BoxDecoration(color: Colors.blue[500], borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              'CADT STUDENT',
              style: TextStyle(color: Colors.white, fontSize: 30, decoration: TextDecoration.none),
            ),
          ),
        ),
      ),
    ),
  );
}
