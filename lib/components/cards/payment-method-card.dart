import 'package:flutter/material.dart';

import '../../pages/app/user/payments/user-payment.dart';

class SelectedPaymentMethodCard extends StatelessWidget {
  const SelectedPaymentMethodCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text('Termina en 1335'),
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UserPayment()));
              },
              icon: Icon(Icons.edit))
        ],
      ),
    );
  }
}

class PaymentMethodOptionCard extends StatefulWidget {
  const PaymentMethodOptionCard(
      {super.key, required this.isSelected, required this.onSelect});

  final bool isSelected;
  final VoidCallback onSelect;

  @override
  State<PaymentMethodOptionCard> createState() =>
      _PaymentMethodOptionCardState();
}

class _PaymentMethodOptionCardState extends State<PaymentMethodOptionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text('Termina en 1335'),
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
              onPressed: widget.onSelect,
              icon: widget.isSelected
                  ? Icon(Icons.check_box_rounded)
                  : Icon(Icons.check_box_outline_blank))
        ],
      ),
    );
  }
}
