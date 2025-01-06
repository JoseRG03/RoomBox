import 'package:flutter/material.dart';

import '../user/vouchers/voucher-details.dart';

class PaymentComplete extends StatelessWidget {
  const PaymentComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Expanded(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('¡Éxito!'),
                const Text('Tu compra se ha realizado con éxito.'),
                MaterialButton(
                    child: const Text('Ver Voucher'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ViewVoucher(voucherID: '14')));
                    }),
                MaterialButton(
                    child: const Text('Volver'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ],
            ),
        ),
      ),
    );
  }
}
