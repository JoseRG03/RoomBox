import 'package:flutter/material.dart';
import 'package:room_box_app/api/database-service.dart';
import 'package:room_box_app/components/cards/payment-method-card.dart';
import 'package:room_box_app/models/storage/payment-method.dart';
import 'package:room_box_app/pages/app/user/payments/add-payment.dart';

class UserPayment extends StatefulWidget {
  const UserPayment({super.key});

  @override
  State<UserPayment> createState() => _UserPaymentState();
}

class _UserPaymentState extends State<UserPayment> {
  PaymentMethod? selectedPaymentMethod;
  bool isLoading = false;
  List<PaymentMethod> paymentMethodList = [];

  @override
  void initState() {
    super.initState();

    getInitialData();
  }

  void getInitialData() async {
    setState(() {
      isLoading = true;
    });
    DatabaseService db = DatabaseService.instance;

    List<PaymentMethod> paymentMethods = await db.getAllPaymentMethods();

    PaymentMethod currentMethod = await db.getCurrentPaymentMethod();

    setState(() {
      selectedPaymentMethod = currentMethod;
      paymentMethodList = paymentMethods;
      isLoading = false;
    });
  }

  void handleDelete(String id) async {
    DatabaseService db = DatabaseService.instance;

    List<PaymentMethod>? newList = await db.deletePaymentMethod(id);

    if (newList != null) {
      setState(() {
        paymentMethodList = newList;
      });
    }
  }

  void changeSelectedPaymentMethod(int index) async {
    DatabaseService db = DatabaseService.instance;

    for (int i = 0; i < paymentMethodList.length; i++) {
      bool isCurrent = (i == index) ? true : false;

      if (isCurrent) {
        await db.updatePaymentMethodStatus(paymentMethodList[i].id);
      }
    }

    List<PaymentMethod> updatedMethods = await db.getAllPaymentMethods();

    setState(() {
      paymentMethodList = updatedMethods;
      selectedPaymentMethod = updatedMethods[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Métodos de Pago"),
          leading: IconButton(
              onPressed: () {
                print("Exiting...");
                Navigator.of(context).pop(true);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: paymentMethodList.length,
                    itemBuilder: (context, index) {
                      PaymentMethod currentMethod = paymentMethodList[index];
                      print("Image: ${currentMethod.image}");
                      return PaymentMethodOptionCard(
                        handleDelete: handleDelete,
                        id: currentMethod.id,
                        isSelected: currentMethod.isCurrent == 1,
                        alias: currentMethod.alias,
                        cardNumber: currentMethod.number.toString(),
                        image: currentMethod.image,
                        onSelect: () {
                          changeSelectedPaymentMethod(index);
                        },
                      );
                    }),
              ),
              TextButton(
                child: const Text('Agregar Método de Pago'),
                onPressed: () async {
                  List<PaymentMethod>? newList = await Navigator.of(context)
                      .push(MaterialPageRoute(
                          builder: (context) => AddPayment()));

                  if (newList != null) {
                    setState(() {
                      paymentMethodList = newList;
                    });
                  }
                },
              ),
            ],
          ),
        ));
  }
}
