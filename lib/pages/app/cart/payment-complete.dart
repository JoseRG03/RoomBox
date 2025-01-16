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
                const Icon(Icons.check, size: 100),
                const Text('¡Éxito!', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                const SizedBox(height: 15),
                const Text('Tu compra se ha realizado exitosamente.'),
                const SizedBox(height: 30),
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
