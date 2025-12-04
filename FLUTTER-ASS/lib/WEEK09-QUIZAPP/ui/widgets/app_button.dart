
import 'package:flutter/material.dart';


class Button extends StatelessWidget {
  final String title;
  final VoidCallback onButtonClick;
  const Button({super.key, required this.title, required this.onButtonClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: Colors.amber,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: onButtonClick,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}