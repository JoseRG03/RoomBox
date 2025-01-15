import 'package:flutter/material.dart';
import 'package:room_box_app/api/database-service.dart';
import 'package:room_box_app/models/storage/shopping_cart_item.dart';
import 'package:room_box_app/pages/app/cart/payment-complete.dart';

import '../../../components/cards/cart-item-card.dart';
import '../../../components/cards/payment-method-card.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<ShoppingCartItem> itemList = [];
  bool isLoading = false;

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getInitialData();
    });
  }

  Future<void> _getInitialData() async {
    DatabaseService db = DatabaseService.instance;

    List<ShoppingCartItem> items = await db.getShoppingCart();

    setState(() {
      itemList = items;
    });
  }

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
            ItemList(items: itemList),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Subtotal:',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('\$149.94',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Impuestos:',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('\$26.98',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total:',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('\$176.92',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 5),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Método de pago:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    )),
                SelectedPaymentMethodCard(
                  isEditable: true,
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

class ItemList extends StatelessWidget {
  const ItemList({
    super.key,
    required this.items,
  });
  final List<ShoppingCartItem> items;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        ShoppingCartItem currentItem = items[index];

        return CartItemCard(
            title: currentItem.shoppingCartItemName,
            cost: currentItem.shoppingCartUnitPrice,
            units: currentItem.shoppingCartItemAmount,
            imageUrl: currentItem.shoppingCartItemImage);
      },
    ));
  }
}
