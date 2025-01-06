import 'package:flutter/material.dart';
import 'package:room_box_app/pages/app/user/payments/add-payment.dart';

class UserPayment extends StatelessWidget {
  const UserPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Métodos de Pago"),
        ),
        body: Center(
          child: TextButton(
            child: const Text('Agregar Método de Pago'),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AddPayment()));
            },
          ),
        ));
  }
}
