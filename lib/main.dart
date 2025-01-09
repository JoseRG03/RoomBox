import 'package:flutter/material.dart';
import 'package:room_box_app/pages/public/landing-page-wrapper.dart';

import 'pages/app/home.dart';

void main() => runApp(RoomBox());

class RoomBox extends StatefulWidget {
  @override
  State<RoomBox> createState() => _RoomBoxState();
}

class _RoomBoxState extends State<RoomBox> {

  bool loggedIn = false;

  void handleLogin() {
    setState(() {
      loggedIn = !loggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Room Box';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home:  loggedIn ? Home(onLogOut: handleLogin) : LandingPageWrapper(onLogin: handleLogin));
  }
}
