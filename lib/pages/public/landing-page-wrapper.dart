import 'package:flutter/material.dart';
import 'package:room_box_app/pages/public/create-account.dart';
import 'package:room_box_app/pages/public/login.dart';

import 'landing-page.dart';

class LandingPageWrapper extends StatefulWidget {
  const LandingPageWrapper({super.key, required this.onLogin});
  final onLogin;

  @override
  State<LandingPageWrapper> createState() => _LandingPageWrapperState();
}

class _LandingPageWrapperState extends State<LandingPageWrapper> {
  int currentScreen = 0;

  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [
      LandingPage(
        changeScreen: changeScreen,
      ),
      LoginPage(changeScreen: changeScreen, onLogin: widget.onLogin,),
      CreateAccountPage(changeScreen: changeScreen),
    ];
  }

  void changeScreen(int value) {
    setState(() {
      currentScreen = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: currentScreen != 0
            ? IconButton(
                onPressed: () {
                  changeScreen(0);
                },
                icon: Icon(Icons.arrow_back_sharp))
            : SizedBox(),
      ),
      body: screens[currentScreen],
    );
  }
}
