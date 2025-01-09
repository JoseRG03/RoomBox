import 'package:flutter/material.dart';
import 'package:room_box_app/components/FormInput.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
    required this.changeScreen,
    required this.onLogin,
  });

  final Function changeScreen;
  final VoidCallback onLogin;

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
        const Text('Iniciar Sesión'),
        const SizedBox(
          height: 25,
        ),
        FormInput(title: 'Correo Electrónico', hintText: 'mail@mail.com'),
        const SizedBox(
          height: 25,
        ),
        FormInput(title: 'Contraseña', hintText: '******'),
        const SizedBox(
          height: 25,
        ),
        MaterialButton(
          onPressed: onLogin,
          child: Text('Iniciar Sesión'),
          color: Colors.yellow,
        ),
      ],
    );
  }
}
