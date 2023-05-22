import 'package:coffee_shop/Components/CoffeeTile.dart';
import 'package:coffee_shop/modules/coffee.dart';
import 'package:coffee_shop/modules/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  void RemoveCart(Coffee coffee) {
    Provider.of<Coffeeshop>(context, listen: false).removeitemCoffee(coffee);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Coffeeshop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Text(
                "Your Cart",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Expanded(
                  child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: value.usercart.length,
                itemBuilder: (context, index) {
                  Coffee eachCoffee = value.usercart[index];
                  return CoffeeTile(
                    icon: const Icon(Icons.delete),
                    coffee: eachCoffee,
                    onPressed: () => RemoveCart(eachCoffee),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
