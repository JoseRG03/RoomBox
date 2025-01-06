import 'package:flutter/material.dart';

class ItemDescription extends StatelessWidget {
  const ItemDescription({super.key, required this.itemID});
  final String itemID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de Item: ${itemID}'),
      ),
      body: Center(
        child: Text(itemID),
      ),
    );
  }
}
