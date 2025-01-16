import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.title,
    required this.cost,
    required this.units,
    required this.imageUrl,
  });
  final String title;
  final double cost;
  final int units;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              color: Colors.grey,
              offset: Offset(2.5, 2.5),
              blurRadius: 10.0,
              spreadRadius: 3.0)
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.toUpperCase(),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text('\$${cost} DOP'),
                  Text('${units} unidad${units > 1 ? 'es' : ''}'),
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(25)),
            child: Container(
                height: 100,
                width: 100,
                child: Image.network(
                  imageUrl,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/template-images/base-image.jpg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
