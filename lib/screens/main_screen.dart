import 'package:flutter/material.dart';
import 'package:resturent_app/screens/cart_screen.dart';
import 'package:resturent_app/screens/home_screen.dart';
import 'package:resturent_app/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

var selectedIndex = 0;

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: seclectedtap(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xffA7BBDB),
        unselectedItemColor: const Color(0xffD3D8E0),
        currentIndex: selectedIndex,
        iconSize: 33,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          )
        ],
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
      ),
      backgroundColor: Colors.white,
      appBar: appBarCoustomm(),
    );
  }

  AppBar appBarCoustomm() {
    return AppBar(
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
              color: const Color(0xffD3D8E0),
              iconSize: 30)
        ],
        backgroundColor: const Color(0xffFCFCFC),
        centerTitle: true,
        title: const Text("Jusbar",
            style: TextStyle(
                fontSize: 14,
                color: Color(0xffA4A4A4),
                fontWeight: FontWeight.bold)));
  }

  Widget seclectedtap() {
    if (selectedIndex == 0) {
      return const HomeScreen();
    } else if (selectedIndex == 1) {
      return CartScreen(
        productCart: [],
      );
    } else
      return ProfileScreen();
  }
}
