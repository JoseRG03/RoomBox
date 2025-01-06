import 'package:flutter/material.dart';
import 'scan/scan-page.dart';
import 'store/home-page.dart';
import 'cart/cart-page.dart';

class AppRouter extends StatefulWidget {
  const AppRouter.AppWrapper({super.key});

  @override
  State<AppRouter> createState() => AppWrapper();
}

class AppWrapper extends State<AppRouter> {
  int currentScreen = 0;
  List<Widget> screens = [
    HomePage(),
    ScanPage(),
    CartPage(),
  ];

  void changeScreen(int index) {
    setState(() {
      currentScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentScreen,
        onTap: (value) {
          changeScreen(value);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_rounded), label: 'Tienda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_rounded), label: 'Escanear'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Carrito'),
        ],
      ),
      body: screens[currentScreen],
    );
  }
}
