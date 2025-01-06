import 'package:flutter/material.dart';

class AddPayment extends StatelessWidget {
  const AddPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Agregar Método de Pago"),
        ),
        body: Center(
          child: const Text('Agregando...'),
    ));
  }
}
