import 'package:flutter/material.dart';
import '../widgets/app_button.dart';

class HistoryScreen extends StatelessWidget {
  final VoidCallback onReturn;
  const HistoryScreen({super.key, required this.onReturn});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          Text('This is history screen'),
          Button(title: 'Restart', onButtonClick: onReturn),
          SizedBox(height: 20,),
        ]

      )
    );
  }
}
