import 'package:flutter/material.dart';
import '../../model/joke_model.dart';
import '../theme/theme.dart';

class JokeList extends StatefulWidget {
  final List<Joke> jokes;
  const JokeList({super.key, required this.jokes});

  @override
  State<JokeList> createState() => _JokeListState();
}

class _JokeListState extends State<JokeList> {
  int? selectedFavoriteIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: AppColors.primary, title: const Text("Favorite Jokes")),
      body: ListView.builder(
        itemCount: widget.jokes.length,
        itemBuilder: (context, index) {
          final joke = widget.jokes[index];

          return JokeCard(
            joke: joke,
            isFavorite: selectedFavoriteIndex == index,
            onFavoriteClick: () {
              setState(() {
                selectedFavoriteIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}

class JokeCard extends StatelessWidget {
  final Joke joke;
  final bool isFavorite;
  final VoidCallback onFavoriteClick;

  const JokeCard({super.key, required this.joke, required this.onFavoriteClick, this.isFavorite = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joke.title,
                  style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(joke.description),
              ],
            ),
          ),
          IconButton(
            onPressed: onFavoriteClick,
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: isFavorite ? Colors.red : Colors.grey),
          ),
        ],
      ),
    );
  }
}
