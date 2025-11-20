import 'package:flutter/material.dart';

List<String> images = ["assets/w4-s2/bird.jpg", "assets/w4-s2/bird2.jpg", "assets/w4-s2/insect.jpg", "assets/w4-s2/girl.jpg", "assets/w4-s2/man.jpg"];

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
    home: ImageGallery(images: images),
  ),
);

class ImageGallery extends StatefulWidget {
  final List<String> images;
  const ImageGallery({super.key, required this.images});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  int currentImage = 0;

  void handleNext() {
    setState(() {
      currentImage = (currentImage + 1) % widget.images.length;
    });
  }

  void handlePrevious() {
    setState(() {
      currentImage = (currentImage - 1 + widget.images.length) % widget.images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.navigate_before), tooltip: 'Go to the previous image', onPressed: handleNext),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(icon: const Icon(Icons.navigate_next), tooltip: 'Go to the next image', onPressed: handlePrevious),
          ),
        ],
      ),
      body: Center(child: Image.asset(widget.images[currentImage])),
    );
  }
}
