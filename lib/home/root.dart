import 'package:ezinore_app/home/accountscreen.dart';
import 'package:ezinore_app/home/contactscreen.dart';
import 'package:ezinore_app/home/homescreen.dart';
import 'package:flutter/material.dart';

class HomeRoot extends StatefulWidget {
  const HomeRoot({super.key});

  @override
  State<HomeRoot> createState() => _HomeRootState();
}

class _HomeRootState extends State<HomeRoot> {
  final _pages = [
    const HomeScreen(),
    const ContactScreen(),
    const AccountScreen()
  ];
  final _pageController = PageController();
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
          _pageController.animateToPage(value,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
        },
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: "Contact",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
