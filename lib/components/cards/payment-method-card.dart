import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:room_box_app/api/database-service.dart';
import 'package:room_box_app/const.dart';

import '../../models/storage/payment-method.dart';
import '../../pages/app/user/payments/user-payment.dart';

class SelectedPaymentMethodCard extends StatelessWidget {
  const SelectedPaymentMethodCard({
    super.key,
    required this.isEditable, this.paymentMethod,
  });

  final bool isEditable;
  final PaymentMethod? paymentMethod;

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
                    paymentMethod?.alias ?? '',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text('Termina en ${(paymentMethod?.number.toString() ?? "    ").substring((paymentMethod?.number.toString() ?? "    ").length - 4)}'),
                      SizedBox(width: 10),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  paymentMethod?.image ?? baseImageURL),
                              fit: BoxFit.fitWidth),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          isEditable
              ? IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const UserPayment()));
                  },
                  icon: Icon(Icons.edit))
              : SizedBox()
        ],
      ),
    );
  }
}

class PaymentMethodOptionCard extends StatefulWidget {
  const PaymentMethodOptionCard(
      {super.key,
      required this.isSelected,
      required this.onSelect,
      required this.alias,
      required this.cardNumber,
      required this.image,
      required this.id,
      required this.handleDelete});

  final String id;
  final bool isSelected;
  final String alias;
  final String cardNumber;
  final String image;
  final VoidCallback onSelect;
  final Function handleDelete;

  @override
  State<PaymentMethodOptionCard> createState() =>
      _PaymentMethodOptionCardState();
}

class _PaymentMethodOptionCardState extends State<PaymentMethodOptionCard> {

  void onDelete (BuildContext context) {
    widget.handleDelete(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: onDelete,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          )
        ],
      ),
      child: Container(
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
                      widget.alias,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                            'Termina en ${widget.cardNumber.substring(widget.cardNumber.length - 4)}'),
                        SizedBox(width: 10),
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.image),
                                fit: BoxFit.fitWidth),
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
      ),
    );
  }
}
