import 'package:flutter/material.dart';
import 'package:room_box_app/pages/app/store/item-description.dart';

import '../snack-bar.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.itemID,
  });
  final String itemID;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ItemDescription(itemID: itemID)));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 400,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              child: Stack(children: [
                Positioned(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('\$499.99 DOP'),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  top: 20,
                  right: 20,
                )
              ]),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: const DecorationImage(
                    image: AssetImage(
                        'assets/sample-furniture-images/work_chair.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Card Title",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Center(
                      child: Expanded(
                        flex: 1,
                        child: MaterialButton(
                          color: Colors.yellow,
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(addToCartSnackBar);
                          },
                          child: Text('Agregar al Carrito'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
