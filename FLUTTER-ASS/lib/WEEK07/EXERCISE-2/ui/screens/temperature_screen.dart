import 'package:flutter/material.dart';

// class TemperatureScreen extends StatelessWidget {
//   final VoidCallback toHome;
//   TemperatureScreen({super.key, required this.toHome});

//   final InputDecoration inputDecoration = InputDecoration(
//     enabledBorder: OutlineInputBorder(
//       borderSide: const BorderSide(color: Colors.white, width: 1.0),
//       borderRadius: BorderRadius.circular(12),
//     ),
//     hintText: 'Enter a temperature',
//     hintStyle: const TextStyle(color: Colors.white),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(40.0),
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const Icon(Icons.thermostat_outlined, size: 120, color: Colors.white),
//             const Center(
//               child: Text("Converter", style: TextStyle(color: Colors.white, fontSize: 45)),
//             ),
//             const SizedBox(height: 50),
//             const Text("Temperature in Degrees:"),
//             const SizedBox(height: 10),
//             TextField(
//               decoration: inputDecoration,
//               style: const TextStyle(color: Colors.white),
//             ),
//             const SizedBox(height: 30),
//             const Text("Temperature in Fahrenheit:"),
//             const SizedBox(height: 10),
//             Container(
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
//               child: const Text('test'),
//             ),
//             const SizedBox(height: 15),
//             Center(
//               child: OutlinedButton(
//               onPressed: toHome,
//               style: OutlinedButton.styleFrom(side: const BorderSide(width: 1.0, color: Colors.white)),
//               child: const Text('Back to home', style: TextStyle(color: Colors.white, fontSize: 15)),
//             ),
//             )

//           ],
//         ),
//       ),
//     );
//   }
// }

//convert into stateful screen
class TemperatureScreen extends StatefulWidget {
  final VoidCallback toHome;
  const TemperatureScreen({super.key, required this.toHome});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

final InputDecoration inputDecoration = InputDecoration(
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.white, width: 1.0),
    borderRadius: BorderRadius.circular(12),
  ),
  hintText: 'Enter a temperature',
  hintStyle: const TextStyle(color: Colors.white),
);

class _TemperatureScreenState extends State<TemperatureScreen> {
  late TextEditingController textController;
  String tempInFahrenheit = '';

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void convertTemp() {
    final input = double.tryParse(textController.text);

    if (input != null) {
      setState(() {
        tempInFahrenheit = ((input * 9 / 5) + 32).toStringAsFixed(2);
      });
    } else {
      setState(() => tempInFahrenheit = "Invalid input");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.thermostat_outlined, size: 120, color: Colors.white),
            const Center(
              child: Text("Converter", style: TextStyle(color: Colors.white, fontSize: 45)),
            ),
            const SizedBox(height: 50),
            const Text("Temperature in Degrees:"),
            const SizedBox(height: 10),
            TextField(
              controller: textController,
              onSubmitted: (_) => convertTemp(),
              decoration: inputDecoration,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 30),
            const Text("Temperature in Fahrenheit:"),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Text(tempInFahrenheit),
            ),
            const SizedBox(height: 15),
            Center(
              child: OutlinedButton(
                onPressed: widget.toHome,
                style: OutlinedButton.styleFrom(side: const BorderSide(width: 1.0, color: Colors.white)),
                child: const Text('Back to home', style: TextStyle(color: Colors.white, fontSize: 15)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
