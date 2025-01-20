import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:room_box_app/api/database-service.dart';
import 'package:room_box_app/models/storage/payment-method.dart';

import '../../../../components/FormInput.dart';

class AddPayment extends StatelessWidget {
  AddPayment({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _expiredateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _aliasController = TextEditingController();

  Future<List<PaymentMethod>?> validateAndSubmit() async {
    DatabaseService db = DatabaseService.instance;

    List<PaymentMethod>? newList = await db.addPaymentMethod(_aliasController.text, _numberController.text);

    return newList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Agregar Método de Pago"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                FormInput(
                  title: 'Nombre Completo',
                  hintText: 'Agrega el nombre del dueño de la tarjeta',
                  controller: _nameController,
                ),
                SizedBox(
                  height: 20,
                ),
                FormInput(
                  title: 'Número de Tarjeta',
                  hintText: '#### #### #### ####',
                  controller: _numberController,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: FormInput(
                        title: 'Fecha de Vencimiento',
                        hintText: 'mm/yyyy',
                        controller: _expiredateController,
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: FormInput(
                        title: 'CVV',
                        hintText: '###',
                        controller: _cvvController,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: FormInput(
                  title: 'Alias',
                  hintText: 'Agrégale un nombre para recordar tu tarjeta!',
                  controller: _aliasController,
                )),
                Align(
                    alignment: Alignment.centerRight,
                    child: MaterialButton(
                      color: Colors.yellow,
                      onPressed: () async {

                        List<PaymentMethod>? paymentMethods = await validateAndSubmit();

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Método de Pago Agregado Exitosamente!'),
                        ));

                        Navigator.of(context).pop(paymentMethods);
                      },
                      child: Text('Registrar'),
                    ))
              ],
            ),
          ),
        ));
  }
}
