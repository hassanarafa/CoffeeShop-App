import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Button_Nav_Bar extends StatelessWidget {
  Button_Nav_Bar({super.key, required this.onchange});
  void Function(int)? onchange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GNav(
          onTabChange: (value) => onchange!(value),
          color: Colors.grey[400],
          activeColor: Colors.grey[700],
          tabBackgroundColor: Colors.white,
          tabActiveBorder: Border.all(color: Colors.black),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "Shop",
            ),
            GButton(
              icon: Icons.shopping_bag,
              text: "Cart",
            )
          ]),
    );
  }
}
