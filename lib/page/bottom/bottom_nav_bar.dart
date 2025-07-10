import 'package:flutter/material.dart';
import 'package:flutter_flash_coffe/constant/color_constant.dart';
import 'package:flutter_flash_coffe/page/home/home_page.dart';
import 'package:flutter_flash_coffe/page/home/menu_page.dart';

class BottomNavScaffold extends StatefulWidget {
  const BottomNavScaffold({super.key});

  @override
  State<BottomNavScaffold> createState() => _BottomNavScaffoldState();
}

class _BottomNavScaffoldState extends State<BottomNavScaffold> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(isDelivery: false),
    const MenuPage(),
    Center(child: Text("Promo")),
    Center(child: Text("Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: ColorConstant.primary,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: "Promo",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
