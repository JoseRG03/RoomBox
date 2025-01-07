import 'package:flutter/material.dart';
import 'package:room_box_app/pages/app/user/payments/user-payment.dart';
import 'package:room_box_app/pages/app/user/vouchers/user-vouchers.dart';

import 'app-wrapper.dart';

class Home extends StatefulWidget {
  Home({super.key, required this.onLogOut});
  final VoidCallback onLogOut;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RoomBox"),
        centerTitle: true,
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.account_circle_rounded),
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text('Vouchers'),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const UserVouchers()));
                      },
                    ),
                    PopupMenuItem(
                      child: Text('Métodos de Pago'),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const UserPayment()));
                      },
                    ),
                    PopupMenuItem(
                      child: Text('Cerrar Sesión'),
                      onTap: widget.onLogOut,
                    ),
                  ]),
        ],
      ),
      body: AppRouter.AppWrapper(),
    );
  }
}
