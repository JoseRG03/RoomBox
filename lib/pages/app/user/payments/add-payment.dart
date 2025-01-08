import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddPayment extends StatelessWidget {
  const AddPayment({super.key});

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
                  hintText: 'José Ramírez',
                ),
                SizedBox(
                  height: 20,
                ),
                FormInput(
                  title: 'Número de Tarjeta',
                  hintText: '#### #### #### ####',
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
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: FormInput(
                        title: 'CVV',
                        hintText: '###',
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
                )),
                Align(
                    alignment: Alignment.centerRight,
                    child: MaterialButton(
                      color: Colors.yellow,
                      onPressed: () {},
                      child: Text('Registrar'),
                    ))
              ],
            ),
          ),
        ));
  }
}

class FormInput extends StatelessWidget {
  const FormInput({
    super.key,
    required this.title,
    required this.hintText,
  });
  final String title;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        TextField(
          decoration: InputDecoration(hintText: hintText),
        ),
      ],
    );
  }
}
