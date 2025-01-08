import 'package:flutter/material.dart';
import 'package:room_box_app/pages/app/user/vouchers/voucher-details.dart';

import '../../../../components/cards/voucher-card.dart';

class UserVouchers extends StatelessWidget {
  const UserVouchers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Historial de Vouchers"),
        ),
        body: Center(
          child: Expanded(
                child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return VoucherCard(voucherID: (index + 1).toString());
                    }),
              ),
        ));
  }
}
