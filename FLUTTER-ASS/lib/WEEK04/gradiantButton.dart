import 'package:flutter/material.dart';

class gradiantButton extends StatelessWidget {
  final String text;
  final Color start;
  final Color end;
  const gradiantButton({super.key, required this.text, required this.start, required this.end});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: const Color(0xff4E7DF5),
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(colors: [start, end]),
      ),
      child: const Text(
        'HELLO',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700, color: Colors.white, decoration: TextDecoration.none),
      ),
    );
  }
}
