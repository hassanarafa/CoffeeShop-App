import 'package:coffee_shop/Components/CoffeeTile.dart';
import 'package:coffee_shop/constants.dart';
import 'package:coffee_shop/modules/coffee.dart';
import 'package:coffee_shop/modules/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  final snackBar = SnackBar(
    content: const Text(
      'Added Successfully',
      style: TextStyle(color: Colors.black),
    ),
    backgroundColor: backgroundColor,
  );
  void addToCart(Coffee coffee) {
    Provider.of<Coffeeshop>(context, listen: false).additemCoffee(coffee);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Coffeeshop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: Column(
            children: [
              const Text(
                "Menu",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Expanded(
                  child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: value.coffeeshop.length,
                itemBuilder: (context, index) {
                  Coffee eachCoffee = value.coffeeshop[index];
                  return CoffeeTile(
                    icon: const Icon(Icons.add),
                    coffee: eachCoffee,
                    onPressed: () => addToCart(eachCoffee),
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
