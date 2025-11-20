import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: ListView(
            children: [
              ScoreBar(subject: 'Dart'),
              ScoreBar(subject: 'flutter'),
              ScoreBar(subject: 'C#'),
            ],
          ),
        ),
      ),
    ),
  );
}

class ScoreBar extends StatefulWidget {
  final String subject;
  const ScoreBar({super.key, required this.subject});

  String get cardTitle => 'My score in $subject';

  @override
  State<ScoreBar> createState() => _ScoreBarState();
}

class _ScoreBarState extends State<ScoreBar> {
  int currentScore = 0;

  //switch to get the current color based on score
  Color barColor() => switch (currentScore) {
    < 5 => Colors.green.shade300,
    < 8 => Colors.green.shade600,
    <= 10 => Colors.green.shade900,
    _ => Colors.grey,
  };

  void increase() {
    setState(() {
      if (currentScore < 10) currentScore++;
    });
  }

  void decrease() {
    setState(() {
      if (currentScore > 0) currentScore--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: const Color.fromARGB(255, 179, 181, 177)),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            widget.cardTitle,
            style: const TextStyle(color: Colors.amber, fontSize: 36, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: decrease,
                icon: const Icon(Icons.minimize, color: Colors.amber, size: 30),
              ),
              IconButton(
                onPressed: increase,
                icon: const Icon(Icons.add, color: Colors.amber, size: 30),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
                ),
                FractionallySizedBox(
                  widthFactor: currentScore / 10,
                  child: Container(
                    decoration: BoxDecoration(color: barColor(), borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
