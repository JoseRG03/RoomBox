import 'package:flutter/material.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({
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
          aspectRatio: 3 / 1,
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
        const Text('Crear Cuenta'),
      ],
    );
  }
}
