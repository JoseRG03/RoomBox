import 'package:flutter/material.dart';
import 'package:room_box_app/pages/public/landing-page-wrapper.dart';

import 'pages/app/home.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: ".env");
    print('Env file loaded successfully');
  } catch (e) {
    throw Exception('Error loading .env file: $e');
  }
  runApp(RoomBox());
}

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
