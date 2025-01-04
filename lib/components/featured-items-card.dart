import 'package:flutter/material.dart';

class FeaturedItemCard extends StatelessWidget {
  const FeaturedItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
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
            height: 200,
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
              padding: const EdgeInsets.only(
                  top: 16.0, bottom: 8.0, left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Card Title",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Greyhound divisively hello coldly wonder marginally far upon excluding. Greyhound divisively hello coldly wonder marginally far upon excluding.',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      MaterialButton(
                          onPressed: () {
                            print('Ver detalles');
                          },
                          child: Text('Ver Detalles')),
                      MaterialButton(
                          onPressed: () {
                            print('Carrito');
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