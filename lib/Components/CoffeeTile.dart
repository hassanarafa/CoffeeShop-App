import 'package:coffee_shop/modules/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  CoffeeTile(
      {super.key,
      required this.coffee,
      required this.icon,
      required this.onPressed});
  void Function()? onPressed;
  Icon icon;
  Coffee coffee;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListTile(
            trailing: IconButton(onPressed: onPressed, icon: icon),
            title: Text(coffee.name),
            subtitle: Text(coffee.price),
            leading: Image.asset(coffee.imagePath),
          ),
        ),
      ),
    );
  }
}
