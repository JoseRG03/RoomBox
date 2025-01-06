import 'package:flutter/material.dart';

class UserPayment extends StatelessWidget {
  const UserPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User Payments"),
        ),
        body: const Center(
          child: Text('User'),
        ));
  }
}
