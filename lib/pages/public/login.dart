import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key, required this.onPressed});
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: InkWell(onTap: onPressed, child: const Text('Iniciar Sesión'))));
  }
}
