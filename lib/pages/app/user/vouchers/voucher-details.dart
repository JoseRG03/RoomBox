import 'package:flutter/material.dart';

class ViewVoucher extends StatelessWidget {
  const ViewVoucher({super.key, required this.voucherID});

  final String voucherID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detalles de voucher: ${voucherID}'),
        ),
        body: Center(
          child: Text(voucherID),
        ));
  }
}
