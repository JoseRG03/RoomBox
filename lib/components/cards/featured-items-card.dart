import 'package:flutter/material.dart';

import '../../api/database-service.dart';
import '../../pages/app/store/item-description.dart';
import '../snack-bar.dart';

class FeaturedItemCard extends StatelessWidget {
  const FeaturedItemCard({
    super.key,
    required this.itemID,
    required this.title,
    required this.description,
    required this.cost,
    required this.image,
  });
  final String itemID;
  final String title;
  final String description;
  final String cost;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
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
              height: 200,
              width: double.infinity,
              child: Stack(children: [
                Image.network(
                  image ?? '',
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
                ),
              ]),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, bottom: 8.0, left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                          color: Colors.grey,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    ItemDescription(itemID: itemID)));
                          },
                          child: Text('Ver Detalles')),
                      MaterialButton(
                          color: Colors.yellow,
                          onPressed: () async {
                            DatabaseService db = DatabaseService.instance;
                            await db.addToShoppingCart(
                                itemID ?? '',
                                title ?? '',
                                double.tryParse(cost ?? '') ?? 0,
                                image ??
                                    'assets/template-images-images/base-image.jpg');

                            ScaffoldMessenger.of(context)
                                .showSnackBar(addToCartSnackBar);
                          },
                          child: Text('Agregar al Carrito')),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}