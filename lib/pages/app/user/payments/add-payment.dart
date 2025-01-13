import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../components/FormInput.dart';

class AddPayment extends StatelessWidget {
  AddPayment({super.key});

  final TextEditingController _controller = TextEditingController();

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
                  controller: _controller,
                ),
                SizedBox(
                  height: 20,
                ),
                FormInput(
                  title: 'Número de Tarjeta',
                  hintText: '#### #### #### ####',
                  controller: _controller,
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
                        controller: _controller,
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: FormInput(
                        title: 'CVV',
                        hintText: '###',
                        controller: _controller,
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
                  controller: _controller,
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
