import 'package:flutter/material.dart';

import '../../components/snack-bar.dart';

class Login extends StatelessWidget {
  const Login({super.key, required this.onPressed});
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
          onPressed: onPressed,
          child: const Text('Iniciar Sesión'),
        ),
        MaterialButton(
          onPressed: onPressed,
          child: const Text('Crear Cuenta'),
        ),
      ],
    )));
  }
}
