import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 50,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.blue[100]),
              child: Center(
                child: Text(
                  'OOP',
                  style: TextStyle(color: Colors.white, fontSize: 20, decoration: TextDecoration.none),
                ),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.blue[300]),
              child: Center(
                child: Text(
                  'DART',
                  style: TextStyle(color: Colors.white, fontSize: 20, decoration: TextDecoration.none),
                ),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.blue[600]),
              child: Center(
                child: Text(
                  'FLUTTER',
                  style: TextStyle(color: Colors.white, fontSize: 20, decoration: TextDecoration.none),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
