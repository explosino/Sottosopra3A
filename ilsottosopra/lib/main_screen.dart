import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ilsottosopra/account_page.dart';
import 'package:ilsottosopra/assets/home_page.dart';
import 'package:ilsottosopra/assets/setting_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  List<Widget> screens = const [
    HomePage(),
    SettingsPage(),
    AccountPage(),
  ];

  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Center(
          child: Image.asset(
            "lib/assets/logo.png",
            width: 200,
          ),
        ),
        actions: const [
          SizedBox(
            width: 50,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeIndex,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: (Icon(Icons.settings)), label: "Settings"),
          BottomNavigationBarItem(icon: (Icon(Icons.info)), label: "Info"),
        ],
      ),
      body: screens.elementAt(selectedIndex),
    );
  }
}
