import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Components/Button_Nav_Bar.dart';
import '../constants.dart';
import 'Cart.dart';
import 'Shop.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  void navigationBar(int indexx) {
    setState(() {
      _currentIndex = indexx;
    });
  }

  final List<Widget> pages = [const Shop(), const Cart()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: backgroundColor,
            statusBarIconBrightness: Brightness.dark),
      ),
      bottomNavigationBar: Button_Nav_Bar(
        onchange: (p0) => navigationBar(p0),
      ),
      backgroundColor: backgroundColor,
      body: pages[_currentIndex],
    );
  }
}
