import 'package:flutter/material.dart';
import 'package:room_box_app/pages/app/cart/payment-complete.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Carrito',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  CartItemCard(),
                  CartItemCard(),
                  CartItemCard(),
                  CartItemCard(),
                  CartItemCard(),
                  CartItemCard(),
                  CartItemCard(),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Column(
                  children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Subtotal:',
                        style:
                            TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                    Text('\$149.94',
                        style:
                            TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Impuestos:',
                        style:
                            TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                    Text('\$26.98',
                        style:
                            TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total:',
                        style:
                            TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                    Text('\$176.92',
                        style:
                            TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const PaymentComplete()));
                    },
                    color: Colors.yellow,
                    child: Text('Realizar Pago'),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
  });

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
                      'Sillas Marrones',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text('\$9.99'),
                    Text('5 unidades'),
                  ],
                ),
              ),
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: const DecorationImage(
                    image: AssetImage(
                        'assets/sample-furniture-images/work_chair.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
          ],
        ));
  }
}
