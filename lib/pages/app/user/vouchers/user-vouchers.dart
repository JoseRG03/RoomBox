import 'package:flutter/material.dart';
import 'package:room_box_app/pages/app/user/vouchers/voucher-details.dart';

class UserVouchers extends StatelessWidget {
  const UserVouchers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Historial de Vouchers"),
        ),
        body: Center(
          child: TextButton(
            child: const Text('Ver Voucher'),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ViewVoucher(voucherID: '14')));
            },
          ),
        ));
  }
}
