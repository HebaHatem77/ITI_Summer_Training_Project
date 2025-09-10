import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'category_screen.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int currentIndex = 0;

  List<Widget> screens = [ContentScreen(), CategoryScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: screens[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: const Color.fromARGB(255, 248, 239, 236),
        selectedItemColor: Color.fromARGB(255, 251, 154, 131),
        unselectedItemColor: Color.fromARGB(255, 157, 122, 114),
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity_outlined),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
