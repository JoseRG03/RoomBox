import 'package:flutter/material.dart';
import 'package:room_box_app/pages/app/store/item-description.dart';

import '../../api/database-service.dart';
import '../snack-bar.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.itemID,
    required this.imageURL,
    required this.cost,
    required this.title,
  });
  final String? itemID;
  final String? imageURL;
  final String? cost;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ItemDescription(itemID: itemID ?? '')));
      },
      child: Container(
        margin: EdgeInsets.all(10),
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
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              child: Container(
                height: 100,
                width: double.infinity,
                child: Stack(children: [
                  Image.network(
                    imageURL ?? '',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/template-images/base-image.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      );
                    },
                  ),
                  Positioned(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('\$${cost} DOP'),
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
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 16.0, left: 16.0, right: 16.0, top: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        (title ?? '').toUpperCase(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        color: Colors.yellow,
                        onPressed: () async {
                          DatabaseService db = DatabaseService.instance;
                          await db.addToShoppingCart(
                              itemID ?? '',
                              title ?? '',
                              double.tryParse(cost ?? '') ?? 0,
                              imageURL ??
                                  'assets/template-images-images/base-image.jpg');

                          ScaffoldMessenger.of(context)
                              .showSnackBar(addToCartSnackBar);
                        },
                        child: Text('Agregar al Carrito'),
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
