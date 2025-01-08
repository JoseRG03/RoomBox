import 'package:flutter/material.dart';

import '../../pages/app/user/payments/user-payment.dart';
import '../../pages/app/user/vouchers/voucher-details.dart';

class VoucherCard extends StatelessWidget {
  const VoucherCard({
    super.key, required this.voucherID,
  });

  final String voucherID;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              color: Colors.grey,
              offset: Offset(2.5, 2.5),
              blurRadius: 10.0,
              spreadRadius: 3.0)
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '25 Dic 2024',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Personal',
                    style: TextStyle(fontSize: 16),
                  ),
                  Row(
                    children: [
                      Text('Personal (Termina en 1335)'),
                      SizedBox(width: 10),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage(
                                  'assets/template-images/master-card-logo.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ViewVoucher(voucherID: voucherID)));
              },
              icon: Icon(Icons.remove_red_eye_outlined, size: 50,)),
          SizedBox(width: 15),
        ],
      ),
    );
  }
}