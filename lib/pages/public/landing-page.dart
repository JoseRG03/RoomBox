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
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: const DecorationImage(
                  image: AssetImage(
                      'assets/sample-furniture-images/work_chair.jpg'),
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
          color: Colors.yellow,
          child: const Text(
            'Iniciar Sesión',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        MaterialButton(
          onPressed: () {
            changeScreen(2);
          },
          color: Colors.yellow,
          child: const Text(
            'Crear Cuenta',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}