import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  final String answer;
  final VoidCallback onTap;
  final bool isSelected;
  const AnswerCard({super.key, required this.answer, required this.onTap, required this.isSelected});

  Color get color => isSelected ? Colors.amber : Colors.blueGrey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 70,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Align(
          alignment: AlignmentGeometry.center,
          child: Text(
            answer,
            style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}

