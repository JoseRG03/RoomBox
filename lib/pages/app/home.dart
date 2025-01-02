import 'package:flutter/material.dart';

import 'app-router.dart';

class Home extends StatefulWidget {
  Home({super.key});
  // final handleLogOut;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RoomBox"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.account_circle_rounded))
        ],
      ),
      body: AppRouter(),
    );
  }
}
