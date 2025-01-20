import 'package:flutter/material.dart';
import 'package:room_box_app/api/database-service.dart';
import 'package:room_box_app/api/orders-service.dart';
import 'package:room_box_app/models/storage/payment-method.dart';
import 'package:room_box_app/models/storage/shopping-cart-data.dart';
import 'package:room_box_app/models/storage/shopping_cart_item.dart';
import 'package:room_box_app/pages/app/cart/payment-complete.dart';
import 'package:room_box_app/pages/app/store/total-costs.dart';

import '../../../components/cards/cart-item-card.dart';
import '../../../components/cards/payment-method-card.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<ShoppingCartItem> itemList = [];
  TotalCosts cartCosts = TotalCosts();
  PaymentMethod? selectedPaymentMethod;
  bool isLoading = false;
  bool isSending = false;
  DatabaseService db = DatabaseService.instance;

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getInitialData();
    });
  }

  Future<void> _getInitialData() async {
    ShoppingCartData data = await db.getShoppingCart();
    PaymentMethod currentPaymentMethod = await db.getCurrentPaymentMethod();

    setState(() {
      itemList = data.items;
      cartCosts = data.totalCosts;
      selectedPaymentMethod = currentPaymentMethod;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: itemList.length == 0
          ? Center(
              child: isLoading
                  ? CircularProgressIndicator()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Comprate algo'),
                        MaterialButton(
                            child: Text("Ir a tienda", style: TextStyle(color: Colors.white),),
                            color: Color.fromRGBO(83, 24, 125, 1.0),
                            onPressed: () {
                              print('Change Screen');
                            })
                      ],
                    ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text('Carrito',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ),
                    MaterialButton(
                      child: Text('Vaciar Carrito', style: TextStyle(color: Colors.white),),
                      onPressed: () async {
                        ShoppingCartData newData = await db.clearShoppingCart();
                        setState(() {
                          itemList = newData.items;
                          cartCosts = newData.totalCosts;
                        });
                      },
                      color: Color.fromRGBO(83, 24, 125, 1.0),
                    )
                  ],
                ),
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
                        Text('\$${cartCosts.subTotal} DOP',
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
                        Text('\$${cartCosts.taxes} DOP',
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
                        Text('\$${cartCosts.total} DOP',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 5),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Método de pago:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        )),
                    SelectedPaymentMethodCard(
                      isEditable: true,
                      paymentMethod: selectedPaymentMethod,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: isSending
                          ? CircularProgressIndicator()
                          : MaterialButton(
                        onPressed: () async {
                          OrdersService ordersService = OrdersService();
                          setState(() {
                            isSending = true;
                          });
                          try {
                            final response = await ordersService.placeOrder(
                                selectedPaymentMethod,
                                cartCosts.subTotal,
                                cartCosts.taxes,
                                cartCosts.total);

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PaymentComplete(voucherID: (response ?? 0).toString())));
                            db.clearShoppingCart();
                            setState(() {
                              itemList = [];
                            });
                          } catch (err) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'Ha ocurrido un error. Favor intente más tarde')));
                          }

                          setState(() {
                            isSending = false;
                          });
                        },
                        color: Color.fromRGBO(83, 24, 125, 1.0),
                        child: Text('Realizar Pago', style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ]),
                )
              ],
            ),
      // ),
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
              isEditable: true,
              itemId: currentItem.shoppingCartItemId.toString(),
              title: currentItem.shoppingCartItemName,
              cost: currentItem.shoppingCartUnitPrice,
              units: currentItem.shoppingCartItemAmount,
              imageUrl: currentItem.shoppingCartItemImage);
        },
      ),
    );
  }
}
