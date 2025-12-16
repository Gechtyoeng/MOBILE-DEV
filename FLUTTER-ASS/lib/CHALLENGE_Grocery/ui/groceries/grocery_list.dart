import 'package:flutter/material.dart';
import '../../models/grocery.dart';
import '../../data/mock_grocery_repository.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  void onCreate() {
    // TODO-4 - Navigate to the form screen using the Navigator push
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (dummyGroceryItems.isNotEmpty) {
      //Display groceries with an Item builder and  LIst Tile
      content = ListView.builder(
        itemCount: dummyGroceryItems.length,
        itemBuilder: (content, index) {
          return GroceryCard(myGrocery: dummyGroceryItems[index],);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: () => {}, icon: const Icon(Icons.add))],
      ),
      body: content,
    );
  }
}

class GroceryCard extends StatelessWidget {
  final Grocery myGrocery;
  const GroceryCard({super.key, required this.myGrocery});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: ListTile(
        leading: Container(width: 16, height: 16, decoration: BoxDecoration(color: myGrocery.category.color)),
        title: Text(myGrocery.name),
        trailing: Text('Quantity ${myGrocery.quantity.toString()}'),
      ),
    );
  }
}
