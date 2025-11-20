import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.blue, title: const Text("Favorite cards")),
      body: Column(
        children: [
          FavoriteCard(title: 'Saturday', description: 'I love saturday'),
          FavoriteCard(title: 'Sunday', description: 'Sunday is the best.'),
        ],
      ),
    ),
  ),
);

// class FavoriteCard extends StatelessWidget {
//   final bool isFavorite;
//   const FavoriteCard({super.key, this.isFavorite = false});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // YOUR CODE
//       decoration: BoxDecoration(
//         border: const Border(bottom: BorderSide(width: 1, color: Colors.grey)),
//       ),
//       padding: EdgeInsets.all(20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'title',
//                   style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 10),
//                 Text('description'),
//               ],
//             ),
//           ),
//           IconButton(
//             onPressed: () => {},
//             icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: isFavorite ? Colors.red : Colors.grey),
//           ),
//         ],
//       ),
//     );
//   }
// }

//====stateful widget

class FavoriteCard extends StatefulWidget {
  final String title;
  final String description;
  const FavoriteCard({super.key, required this.title, required this.description});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorite = false;

  Color get buttonColor => isFavorite ? Colors.red : Colors.grey;
  IconData get iconType => isFavorite ? Icons.favorite : Icons.favorite_border;

  void handleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // YOUR CODE
      decoration: BoxDecoration(
        border: const Border(bottom: BorderSide(width: 1, color: Colors.grey)),
      ),
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(widget.description),
              ],
            ),
          ),
          IconButton(
            onPressed: handleFavorite,
            icon: Icon(iconType, color: buttonColor),
          ),
        ],
      ),
    );
  }
}
