// ==== Exercise 3 The products card

import 'package:flutter/material.dart';

//enum for product card information
enum Product {
  dart(title: 'Dart', description: 'the best object language.', image: 'assets/ex3/dart.png'),
  flutter(title: 'Flutter', description: 'the best mobile widget library.', image: 'assets/ex3/flutter.png'),
  firebase(title: 'Firebase', description: 'the best clound database.', image: 'assets/ex3/firebase.png');

  final String title;
  final String description;
  final String image;
  const Product({required this.title, required this.description, required this.image});
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(title: Text('Products')),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProductCard(product: Product.dart),
                ProductCard(product: Product.flutter),
                ProductCard(product: Product.firebase),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

//extracted widget product card

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(alignment: Alignment.centerLeft, child: Image.asset(product.image, height: 100, width: 100)),
            SizedBox(height: 5),
            Text(product.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36)),
            SizedBox(height: 5),
            Text(product.description, style: TextStyle(color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }
}
