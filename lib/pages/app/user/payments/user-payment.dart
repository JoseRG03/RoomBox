import 'package:flutter/material.dart';
import 'package:room_box_app/components/cards/payment-method-card.dart';
import 'package:room_box_app/pages/app/user/payments/add-payment.dart';

class UserPayment extends StatefulWidget {
  const UserPayment({super.key});

  @override
  State<UserPayment> createState() => _UserPaymentState();
}

class _UserPaymentState extends State<UserPayment> {

  int selectedPaymentMethod = 5;

  void changeSelectedPaymentMethod(int index) {
    setState(() {
      selectedPaymentMethod = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Métodos de Pago"),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                    itemBuilder: (context, index) {
                  return PaymentMethodOptionCard(isSelected: index == selectedPaymentMethod, onSelect: () {
                    changeSelectedPaymentMethod(index);
                  },);
                }),
              ),
              TextButton(
                child: const Text('Agregar Método de Pago'),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddPayment()));
                },
              ),
            ],
          ),
        ));
  }
}
