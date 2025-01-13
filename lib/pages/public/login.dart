import 'package:flutter/material.dart';
import 'package:room_box_app/api/networking.dart';
import 'package:room_box_app/components/FormInput.dart';
import 'package:room_box_app/models/error.dart';
import 'package:room_box_app/models/requests/login-form.dart';
import 'package:room_box_app/models/responses/login-response.dart';

import '../../api/auth-service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    required this.changeScreen,
    required this.onLogin,
  });

  final Function changeScreen;
  final VoidCallback onLogin;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void handleLogin() async {
    setState(() {
      isLoading = true;
    });
    LoginForm loginRequest = new LoginForm(
        userName: _emailController.text, password: _passwordController.text);

    int responseCode = await login(loginRequest);

    if (responseCode == 200) {
      widget.onLogin();
      return;
    }

    if (responseCode == 401) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Credenciales Inválidas'),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Ha ocurrido un error. Intente de nuevo más tarde'),
      ));
    }
    _emailController.clear();
    _passwordController.clear();

    setState(() {
      isLoading = false;
    });
  }

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
        FormInput(
            title: 'Correo Electrónico',
            hintText: 'mail@mail.com',
            controller: _emailController),
        const SizedBox(
          height: 25,
        ),
        FormInput(
            title: 'Contraseña',
            hintText: '******',
            controller: _passwordController),
        const SizedBox(
          height: 25,
        ),
        isLoading
            ? CircularProgressIndicator()
            : MaterialButton(
                onPressed: handleLogin,
                child: Text('Iniciar Sesión'),
                color: Colors.yellow,
              ),
      ],
    );
  }
}
