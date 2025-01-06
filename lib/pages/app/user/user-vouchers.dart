import 'package:flutter/material.dart';

class UserVouchers extends StatelessWidget {
  const UserVouchers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User Vouchers"),
        ),
        body: const Center(
          child: Text('User'),
        ));
  }
}
