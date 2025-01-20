import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    super.key,
    required this.changeScreen,
  });

  final Function changeScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: 1 / 1,
          child: Container(
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: const DecorationImage(
                  image: AssetImage(
                      'assets/template-images/imagotipo.png'),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        MaterialButton(
          onPressed: () {
            changeScreen(1);
          },
          color: Color.fromRGBO(83, 24, 125, 1.0),
          child: const Text(
            'Iniciar Sesión',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        MaterialButton(
          onPressed: () {
            changeScreen(2);
          },
          color: Color.fromRGBO(83, 24, 125, 1.0),
          child: const Text(
            'Crear Cuenta',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
    );
  }
}